# puzzle_system.jl - Puzzle level system for curling game
# Grid format: Each character represents a cell
# ' ' = normal ice
# 'R' = rough ice (high friction)
# 'P' = polished ice (low friction)
# '#' = obstacle/wall
# 'S' = start position (player stone spawn)
# 'B' = blocker stone (stationary)
# 'T' = target (goal)
# '\n' = new row

using StaticTools

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl")
include("llvm_bindings.jl")
include("wallocstring.jl")

# ============================================================================
# CONSTANTS
# ============================================================================
const STONE_RADIUS::Float64 = Float64(20.0)
const MAX_POWER::Float64 = Float64(800.0)
const MIN_VELOCITY::Float64 = Float64(5.0)
const GRID_CELL_SIZE::Float64 = Float64(40.0)  # Each grid cell is 40x40 pixels

# Ice type friction multipliers
const FRICTION_NORMAL::Float64 = Float64(0.98)   # Standard ice
const FRICTION_ROUGH::Float64 = Float64(0.92)    # Rough ice (slows down more)
const FRICTION_POLISHED::Float64 = Float64(0.995) # Polished ice (slides further)
const SWEEP_FRICTION_REDUCTION::Float64 = Float64(0.03) # Sweeping reduces friction by this amount

# ============================================================================
# ICE TYPE ENUM
# ============================================================================
const ICE_NORMAL::Int32 = Int32(0)
const ICE_ROUGH::Int32 = Int32(1)
const ICE_POLISHED::Int32 = Int32(2)
const ICE_WALL::Int32 = Int32(3)

# ============================================================================
# STRUCTS
# ============================================================================

# Stone struct - represents a curling stone
struct Stone
    x::Float64
    y::Float64
    vel_x::Float64
    vel_y::Float64
    angle::Float64
    spin::Float64
    is_player::Bool      # true for player stone, false for blocker
    is_active::Bool      # false when stone has stopped
end

# Target struct - goal area
struct Target
    x::Float64
    y::Float64
    radius::Float64
    is_hit::Bool
end

# Obstacle struct - wall/barrier
struct Obstacle
    x::Float64
    y::Float64
    width::Float64
    height::Float64
end

# Ice cell - represents one grid cell
struct IceCell
    ice_type::Int32      # ICE_NORMAL, ICE_ROUGH, ICE_POLISHED, ICE_WALL
    x::Float64           # World position (center of cell)
    y::Float64
end

# Puzzle level - contains all level data
struct PuzzleLevel
    grid_width::Int32
    grid_height::Int32
    ice_cells::Ptr{IceCell}      # Array of ice cells
    stones::Ptr{Stone}            # Array of stones (player + blockers)
    stone_count::Int32
    targets::Ptr{Target}          # Array of targets
    target_count::Int32
    obstacles::Ptr{Obstacle}      # Array of obstacles
    obstacle_count::Int32
    start_x::Float64              # Player stone start position
    start_y::Float64
end

# Puzzle game state - extends basic game state
struct GameState
    level::Ptr{PuzzleLevel}
    player_stone::Stone
    is_charging::Bool
    charge_power::Float64
    drag_start_x::Float64
    drag_start_y::Float64
    drag_current_x::Float64
    drag_current_y::Float64
    is_sweeping::Bool             # Is player currently sweeping?
    sweep_timer::Float64          # How long has player been sweeping?
    camera_zoom::Float64          # Camera zoom (1.0 = normal, <1.0 = zoomed out)
    camera_offset_x::Float64      # Camera offset X
    camera_offset_y::Float64      # Camera offset Y
    last_frame_time::UInt64
    quit::Bool
    level_complete::Bool
end

# ============================================================================
# POINTER ACCESSORS
# ============================================================================

function Base.getproperty(x::Ptr{Stone}, f::Symbol)
    f === :x && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:x))))
    f === :y && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:y))))
    f === :vel_x && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:vel_x))))
    f === :vel_y && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:vel_y))))
    f === :angle && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:angle))))
    f === :spin && return unsafe_load(Ptr{Float64}(x + offsetof(Stone, Val(:spin))))
    f === :is_player && return unsafe_load(Ptr{Bool}(x + offsetof(Stone, Val(:is_player))))
    f === :is_active && return unsafe_load(Ptr{Bool}(x + offsetof(Stone, Val(:is_active))))
end

function Base.setproperty!(x::Ptr{Stone}, f::Symbol, v::Any)
    f === :x && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:x))), v)
    f === :y && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:y))), v)
    f === :vel_x && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:vel_x))), v)
    f === :vel_y && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:vel_y))), v)
    f === :angle && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:angle))), v)
    f === :spin && return unsafe_store!(Ptr{Float64}(x + offsetof(Stone, Val(:spin))), v)
    f === :is_player && return unsafe_store!(Ptr{Bool}(x + offsetof(Stone, Val(:is_player))), v)
    f === :is_active && return unsafe_store!(Ptr{Bool}(x + offsetof(Stone, Val(:is_active))), v)
end

function Base.getproperty(x::Ptr{Target}, f::Symbol)
    f === :x && return unsafe_load(Ptr{Float64}(x + offsetof(Target, Val(:x))))
    f === :y && return unsafe_load(Ptr{Float64}(x + offsetof(Target, Val(:y))))
    f === :radius && return unsafe_load(Ptr{Float64}(x + offsetof(Target, Val(:radius))))
    f === :is_hit && return unsafe_load(Ptr{Bool}(x + offsetof(Target, Val(:is_hit))))
end

function Base.setproperty!(x::Ptr{Target}, f::Symbol, v::Any)
    f === :x && return unsafe_store!(Ptr{Float64}(x + offsetof(Target, Val(:x))), v)
    f === :y && return unsafe_store!(Ptr{Float64}(x + offsetof(Target, Val(:y))), v)
    f === :radius && return unsafe_store!(Ptr{Float64}(x + offsetof(Target, Val(:radius))), v)
    f === :is_hit && return unsafe_store!(Ptr{Bool}(x + offsetof(Target, Val(:is_hit))), v)
end

function Base.getproperty(x::Ptr{Obstacle}, f::Symbol)
    f === :x && return unsafe_load(Ptr{Float64}(x + offsetof(Obstacle, Val(:x))))
    f === :y && return unsafe_load(Ptr{Float64}(x + offsetof(Obstacle, Val(:y))))
    f === :width && return unsafe_load(Ptr{Float64}(x + offsetof(Obstacle, Val(:width))))
    f === :height && return unsafe_load(Ptr{Float64}(x + offsetof(Obstacle, Val(:height))))
end

function Base.setproperty!(x::Ptr{Obstacle}, f::Symbol, v::Any)
    f === :x && return unsafe_store!(Ptr{Float64}(x + offsetof(Obstacle, Val(:x))), v)
    f === :y && return unsafe_store!(Ptr{Float64}(x + offsetof(Obstacle, Val(:y))), v)
    f === :width && return unsafe_store!(Ptr{Float64}(x + offsetof(Obstacle, Val(:width))), v)
    f === :height && return unsafe_store!(Ptr{Float64}(x + offsetof(Obstacle, Val(:height))), v)
end

function Base.getproperty(x::Ptr{IceCell}, f::Symbol)
    f === :ice_type && return unsafe_load(Ptr{Int32}(x + offsetof(IceCell, Val(:ice_type))))
    f === :x && return unsafe_load(Ptr{Float64}(x + offsetof(IceCell, Val(:x))))
    f === :y && return unsafe_load(Ptr{Float64}(x + offsetof(IceCell, Val(:y))))
end

function Base.setproperty!(x::Ptr{IceCell}, f::Symbol, v::Any)
    f === :ice_type && return unsafe_store!(Ptr{Int32}(x + offsetof(IceCell, Val(:ice_type))), v)
    f === :x && return unsafe_store!(Ptr{Float64}(x + offsetof(IceCell, Val(:x))), v)
    f === :y && return unsafe_store!(Ptr{Float64}(x + offsetof(IceCell, Val(:y))), v)
end

function Base.getproperty(x::Ptr{PuzzleLevel}, f::Symbol)
    f === :grid_width && return unsafe_load(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:grid_width))))
    f === :grid_height && return unsafe_load(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:grid_height))))
    f === :ice_cells && return unsafe_load(Ptr{Ptr{IceCell}}(x + offsetof(PuzzleLevel, Val(:ice_cells))))
    f === :stones && return unsafe_load(Ptr{Ptr{Stone}}(x + offsetof(PuzzleLevel, Val(:stones))))
    f === :stone_count && return unsafe_load(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:stone_count))))
    f === :targets && return unsafe_load(Ptr{Ptr{Target}}(x + offsetof(PuzzleLevel, Val(:targets))))
    f === :target_count && return unsafe_load(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:target_count))))
    f === :obstacles && return unsafe_load(Ptr{Ptr{Obstacle}}(x + offsetof(PuzzleLevel, Val(:obstacles))))
    f === :obstacle_count && return unsafe_load(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:obstacle_count))))
    f === :start_x && return unsafe_load(Ptr{Float64}(x + offsetof(PuzzleLevel, Val(:start_x))))
    f === :start_y && return unsafe_load(Ptr{Float64}(x + offsetof(PuzzleLevel, Val(:start_y))))
end

function Base.setproperty!(x::Ptr{PuzzleLevel}, f::Symbol, v::Any)
    f === :grid_width && return unsafe_store!(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:grid_width))), v)
    f === :grid_height && return unsafe_store!(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:grid_height))), v)
    f === :ice_cells && return unsafe_store!(Ptr{Ptr{IceCell}}(x + offsetof(PuzzleLevel, Val(:ice_cells))), v)
    f === :stones && return unsafe_store!(Ptr{Ptr{Stone}}(x + offsetof(PuzzleLevel, Val(:stones))), v)
    f === :stone_count && return unsafe_store!(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:stone_count))), v)
    f === :targets && return unsafe_store!(Ptr{Ptr{Target}}(x + offsetof(PuzzleLevel, Val(:targets))), v)
    f === :target_count && return unsafe_store!(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:target_count))), v)
    f === :obstacles && return unsafe_store!(Ptr{Ptr{Obstacle}}(x + offsetof(PuzzleLevel, Val(:obstacles))), v)
    f === :obstacle_count && return unsafe_store!(Ptr{Int32}(x + offsetof(PuzzleLevel, Val(:obstacle_count))), v)
    f === :start_x && return unsafe_store!(Ptr{Float64}(x + offsetof(PuzzleLevel, Val(:start_x))), v)
    f === :start_y && return unsafe_store!(Ptr{Float64}(x + offsetof(PuzzleLevel, Val(:start_y))), v)
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    f === :level && return unsafe_load(Ptr{Ptr{PuzzleLevel}}(x + offsetof(GameState, Val(:level))))
    f === :player_stone && return unsafe_load(Ptr{Stone}(x + offsetof(GameState, Val(:player_stone))))
    f === :is_charging && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:is_charging))))
    f === :charge_power && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:charge_power))))
    f === :drag_start_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:drag_start_x))))
    f === :drag_start_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:drag_start_y))))
    f === :drag_current_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:drag_current_x))))
    f === :drag_current_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:drag_current_y))))
    f === :is_sweeping && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:is_sweeping))))
    f === :sweep_timer && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:sweep_timer))))
    f === :camera_zoom && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_zoom))))
    f === :camera_offset_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_offset_x))))
    f === :camera_offset_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_offset_y))))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))))
    f === :quit && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:quit))))
    f === :level_complete && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:level_complete))))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    f === :level && return unsafe_store!(Ptr{Ptr{PuzzleLevel}}(x + offsetof(GameState, Val(:level))), v)
    f === :player_stone && return unsafe_store!(Ptr{Stone}(x + offsetof(GameState, Val(:player_stone))), v)
    f === :is_charging && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:is_charging))), v)
    f === :charge_power && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:charge_power))), v)
    f === :drag_start_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:drag_start_x))), v)
    f === :drag_start_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:drag_start_y))), v)
    f === :drag_current_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:drag_current_x))), v)
    f === :drag_current_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:drag_current_y))), v)
    f === :is_sweeping && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:is_sweeping))), v)
    f === :sweep_timer && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:sweep_timer))), v)
    f === :camera_zoom && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_zoom))), v)
    f === :camera_offset_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_offset_x))), v)
    f === :camera_offset_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_offset_y))), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:quit))), v)
    f === :level_complete && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:level_complete))), v)
end

# ============================================================================
# GRID PARSER
# ============================================================================

# Parse a grid string into a PuzzleLevel
# Grid format: rows separated by '\n', each character is a cell
# Note: This function must work without Julia runtime, so we manually parse
function parse_level_grid(grid_str::Ptr{UInt8}, grid_str_len::Int32)::Ptr{PuzzleLevel}
    # First pass: count dimensions and elements
    grid_width::Int32 = Int32(0)
    grid_height::Int32 = Int32(0)
    max_width::Int32 = Int32(0)
    current_width::Int32 = Int32(0)
    stone_count::Int32 = Int32(0)
    target_count::Int32 = Int32(0)
    obstacle_count::Int32 = Int32(0)
    start_x::Float64 = Float64(-1.0)
    start_y::Float64 = Float64(-1.0)
    
    i::Int32 = Int32(0)
    while i < grid_str_len
        c::UInt8 = unsafe_load(grid_str + i)
        if c == UInt8(10)  # '\n'
            if current_width > max_width
                max_width = current_width
            end
            current_width = Int32(0)
            grid_height += Int32(1)
        elseif c != UInt8(13)  # Not '\r'
            if c == UInt8(83)  # 'S'
                stone_count += Int32(1)
            elseif c == UInt8(66)  # 'B'
                stone_count += Int32(1)
            elseif c == UInt8(84)  # 'T'
                target_count += Int32(1)
            elseif c == UInt8(35)  # '#'
                obstacle_count += Int32(1)
            end
            current_width += Int32(1)
        end
        i += Int32(1)
    end
    
    # Handle last line if no trailing newline
    if current_width > Int32(0)
        if current_width > max_width
            max_width = current_width
        end
        grid_height += Int32(1)
    end
    
    grid_width = max_width
    
    # Allocate level
    level_ptr::Ptr{PuzzleLevel} = Ptr{PuzzleLevel}(wasm_malloc(UInt32(sizeof(PuzzleLevel))))
    
    # Allocate arrays
    ice_cells_ptr::Ptr{IceCell} = Ptr{IceCell}(wasm_malloc(UInt32(sizeof(IceCell)) * UInt32(grid_width * grid_height)))
    stones_ptr::Ptr{Stone} = Ptr{Stone}(wasm_malloc(UInt32(sizeof(Stone)) * UInt32(stone_count)))
    targets_ptr::Ptr{Target} = Ptr{Target}(wasm_malloc(UInt32(sizeof(Target)) * UInt32(target_count)))
    obstacles_ptr::Ptr{Obstacle} = Ptr{Obstacle}(wasm_malloc(UInt32(sizeof(Obstacle)) * UInt32(obstacle_count)))
    
    # Second pass: populate grid
    stone_idx::Int32 = Int32(0)
    target_idx::Int32 = Int32(0)
    obstacle_idx::Int32 = Int32(0)
    row::Int32 = Int32(0)
    col::Int32 = Int32(0)
    i = Int32(0)
    
    while i < grid_str_len
        c = unsafe_load(grid_str + i)
        if c == UInt8(10)  # '\n'
            row += Int32(1)
            col = Int32(0)
        elseif c != UInt8(13)  # Not '\r'
            cell_x::Float64 = Float64(col) * GRID_CELL_SIZE + GRID_CELL_SIZE / Float64(2.0)
            cell_y::Float64 = Float64(row) * GRID_CELL_SIZE + GRID_CELL_SIZE / Float64(2.0)
            cell_idx::Int32 = row * grid_width + col
            
            # Set ice cell
            ice_cell_ptr::Ptr{IceCell} = ice_cells_ptr + Int64(cell_idx * sizeof(IceCell))
            ice_type::Int32 = ICE_NORMAL
            
            if c == UInt8(82)  # 'R' - rough ice
                ice_type = ICE_ROUGH
            elseif c == UInt8(80)  # 'P' - polished ice
                ice_type = ICE_POLISHED
            elseif c == UInt8(35)  # '#' - wall
                ice_type = ICE_WALL
                # Create obstacle
                obstacle_ptr::Ptr{Obstacle} = obstacles_ptr + Int64(obstacle_idx * sizeof(Obstacle))
                obstacle_ptr.x = cell_x - GRID_CELL_SIZE / Float64(2.0)
                obstacle_ptr.y = cell_y - GRID_CELL_SIZE / Float64(2.0)
                obstacle_ptr.width = GRID_CELL_SIZE
                obstacle_ptr.height = GRID_CELL_SIZE
                obstacle_idx += Int32(1)
            elseif c == UInt8(83)  # 'S' - start
                start_x = cell_x
                start_y = cell_y
                # Create BRIGHT RED player stone
                stone_ptr::Ptr{Stone} = stones_ptr + Int64(stone_idx * sizeof(Stone))
                stone_ptr.x = cell_x
                stone_ptr.y = cell_y
                stone_ptr.vel_x = Float64(0.0)
                stone_ptr.vel_y = Float64(0.0)
                stone_ptr.angle = Float64(0.0)
                stone_ptr.spin = Float64(0.0)
                stone_ptr.is_player = true
                stone_ptr.is_active = false
                printf(c"Created BRIGHT RED player stone at world pos: (%.1f, %.1f), row=%d, col=%d\n", cell_x, cell_y, row, col)
                stone_idx += Int32(1)
            elseif c == UInt8(66)  # 'B' - blocker stone
                stone_ptr = stones_ptr + Int64(stone_idx * sizeof(Stone))
                stone_ptr.x = cell_x
                stone_ptr.y = cell_y
                stone_ptr.vel_x = Float64(0.0)
                stone_ptr.vel_y = Float64(0.0)
                stone_ptr.angle = Float64(0.0)
                stone_ptr.spin = Float64(0.0)
                stone_ptr.is_player = false
                stone_ptr.is_active = false
                printf(c"Created BRIGHT YELLOW blocker stone at world pos: (%.1f, %.1f), row=%d, col=%d\n", cell_x, cell_y, row, col)
                stone_idx += Int32(1)
            elseif c == UInt8(84)  # 'T' - target
                target_ptr::Ptr{Target} = targets_ptr + Int64(target_idx * sizeof(Target))
                target_ptr.x = cell_x
                target_ptr.y = cell_y
                target_ptr.radius = GRID_CELL_SIZE * Float64(1.2)
                target_ptr.is_hit = false
                printf(c"Created target at world pos: (%.1f, %.1f), row=%d, col=%d\n", cell_x, cell_y, row, col)
                target_idx += Int32(1)
            end
            
            ice_cell_ptr.ice_type = ice_type
            ice_cell_ptr.x = cell_x
            ice_cell_ptr.y = cell_y
            
            col += Int32(1)
        end
        i += Int32(1)
    end
    
    # Initialize level struct
    level_ptr.grid_width = grid_width
    level_ptr.grid_height = grid_height
    level_ptr.ice_cells = ice_cells_ptr
    level_ptr.stones = stones_ptr
    level_ptr.stone_count = stone_count
    level_ptr.targets = targets_ptr
    level_ptr.target_count = target_count
    level_ptr.obstacles = obstacles_ptr
    level_ptr.obstacle_count = obstacle_count
    level_ptr.start_x = start_x
    level_ptr.start_y = start_y
    
    printf(c"Level parsed: %dx%d grid, %d stones, %d targets\n", grid_width, grid_height, stone_count, target_count)
    
    # Debug: print first stone if it exists
    if stone_count > Int32(0)
        first_stone::Ptr{Stone} = stones_ptr
        printf(c"First stone at: (%.1f, %.1f), is_player=%d\n", first_stone.x, first_stone.y, first_stone.is_player ? Int32(1) : Int32(0))
    end
    
    return level_ptr
end

# Helper: Get ice type at world position
function get_ice_type_at(level::Ptr{PuzzleLevel}, x::Float64, y::Float64)::Int32
    col::Int32 = unsafe_trunc(Int32, llvm_SDL_floor(x / GRID_CELL_SIZE))
    row::Int32 = unsafe_trunc(Int32, llvm_SDL_floor(y / GRID_CELL_SIZE))
    
    if col < Int32(0) || col >= level.grid_width || row < Int32(0) || row >= level.grid_height
        return ICE_WALL  # Out of bounds = wall
    end
    
    cell_idx::Int32 = row * level.grid_width + col
    cell_ptr::Ptr{IceCell} = level.ice_cells + Int64(cell_idx * sizeof(IceCell))
    return cell_ptr.ice_type
end

# ============================================================================
# PHYSICS FUNCTIONS
# ============================================================================

# Update stone physics with ice type and sweeping
function update_stone_physics(stone::Ptr{Stone}, level::Ptr{PuzzleLevel}, is_sweeping::Bool, delta_time::Float64)::Cvoid
    if !stone.is_active
        return nothing
    end
    
    # Check if stone has stopped
    if abs(stone.vel_x) < MIN_VELOCITY && abs(stone.vel_y) < MIN_VELOCITY
        stone.vel_x = Float64(0.0)
        stone.vel_y = Float64(0.0)
        stone.is_active = false
        return nothing
    end
    
    # Get ice type at stone position
    ice_type::Int32 = get_ice_type_at(level, stone.x, stone.y)
    
    # Calculate friction based on ice type
    friction::Float64 = FRICTION_NORMAL
    if ice_type == ICE_ROUGH
        friction = FRICTION_ROUGH
    elseif ice_type == ICE_POLISHED
        friction = FRICTION_POLISHED
    end
    
    # Apply sweeping (reduces friction)
    if is_sweeping && stone.is_player
        friction += SWEEP_FRICTION_REDUCTION
        if friction > Float64(1.0)
            friction = Float64(1.0)
        end
    end
    
    # Apply friction
    stone.vel_x *= friction
    stone.vel_y *= friction
    
    # Update position
    stone.x += stone.vel_x * delta_time
    stone.y += stone.vel_y * delta_time
    
    # Update rotation
    if abs(stone.vel_x) > Float64(0.1) || abs(stone.vel_y) > Float64(0.1)
        vel_mag::Float64 = sqrt(stone.vel_x * stone.vel_x + stone.vel_y * stone.vel_y)
        stone.angle += vel_mag * delta_time * Float64(0.1)
    end
    
    # Check wall collisions - stone BOUNCES with energy loss
    if stone.x - STONE_RADIUS < Float64(0.0)
        stone.x = STONE_RADIUS
        stone.vel_x = -stone.vel_x * Float64(0.5)
    elseif stone.x + STONE_RADIUS > Float64(640.0)
        stone.x = Float64(640.0) - STONE_RADIUS
        stone.vel_x = -stone.vel_x * Float64(0.5)
    end
    
    if stone.y - STONE_RADIUS < Float64(0.0)
        stone.y = STONE_RADIUS
        stone.vel_y = -stone.vel_y * Float64(0.5)
    elseif stone.y + STONE_RADIUS > Float64(640.0)
        stone.y = Float64(640.0) - STONE_RADIUS
        stone.vel_y = -stone.vel_y * Float64(0.5)
    end
    
    # Check grid wall tiles - stop completely
    if ice_type == ICE_WALL
        stone.vel_x = Float64(0.0)
        stone.vel_y = Float64(0.0)
        stone.is_active = false
    end
    
    return nothing
end

# Check collision between two stones (simple circle-circle)
function check_stone_collision(stone1::Ptr{Stone}, stone2::Ptr{Stone})::Bool
    dx::Float64 = stone1.x - stone2.x
    dy::Float64 = stone1.y - stone2.y
    dist_sq::Float64 = dx * dx + dy * dy
    min_dist::Float64 = STONE_RADIUS * Float64(2.0)
    min_dist_sq::Float64 = min_dist * min_dist
    
    colliding::Bool = dist_sq < min_dist_sq
    if colliding
        dist::Float64 = sqrt(dist_sq)
        printf(c"COLLISION! stone1:(%.1f,%.1f) stone2:(%.1f,%.1f) dist:%.1f min_dist:%.1f\n", 
               stone1.x, stone1.y, stone2.x, stone2.y, dist, min_dist)
    end
    
    return colliding
end

# Resolve collision between two stones
function resolve_stone_collision(stone1::Ptr{Stone}, stone2::Ptr{Stone})::Cvoid
    dx::Float64 = stone2.x - stone1.x
    dy::Float64 = stone2.y - stone1.y
    dist::Float64 = sqrt(dx * dx + dy * dy)
    
    if dist < Float64(0.001)
        return nothing  # Avoid division by zero
    end
    
    # Normalize collision vector
    nx::Float64 = dx / dist
    ny::Float64 = dy / dist
    
    # Separate stones to prevent overlap
    overlap::Float64 = (STONE_RADIUS * Float64(2.0)) - dist
    if overlap > Float64(0.0)
        stone1.x -= nx * overlap * Float64(0.5)
        stone1.y -= ny * overlap * Float64(0.5)
        stone2.x += nx * overlap * Float64(0.5)
        stone2.y += ny * overlap * Float64(0.5)
    end
    
    # If stone2 is a blocker (not player), it's IMMOVABLE
    if !stone2.is_player
        # Stone1 bounces off immovable stone2
        # Project stone1's velocity onto collision normal and reverse it
        vel_along_normal::Float64 = stone1.vel_x * nx + stone1.vel_y * ny
        stone1.vel_x -= nx * vel_along_normal * Float64(1.8)  # Bounce with energy loss
        stone1.vel_y -= ny * vel_along_normal * Float64(1.8)
        # stone2 doesn't move at all
        return nothing
    end
    
    # If stone1 is a blocker, stone2 bounces
    if !stone1.is_player
        vel_along_normal = stone2.vel_x * (-nx) + stone2.vel_y * (-ny)
        stone2.vel_x -= (-nx) * vel_along_normal * Float64(1.8)
        stone2.vel_y -= (-ny) * vel_along_normal * Float64(1.8)
        return nothing
    end
    
    # Both are player stones - elastic collision
    dvx::Float64 = stone2.vel_x - stone1.vel_x
    dvy::Float64 = stone2.vel_y - stone1.vel_y
    dot_product::Float64 = dvx * nx + dvy * ny
    
    if dot_product > Float64(0.0)
        return nothing  # Moving apart
    end
    
    impulse::Float64 = dot_product * Float64(2.0)
    stone1.vel_x += nx * impulse
    stone1.vel_y += ny * impulse
    stone2.vel_x -= nx * impulse
    stone2.vel_y -= ny * impulse
    
    # Separate stones to prevent overlap
    overlap = STONE_RADIUS * Float64(2.0) - dist
    if overlap > Float64(0.0)
        separation::Float64 = overlap / Float64(2.0)
        stone1.x -= nx * separation
        stone1.y -= ny * separation
        stone2.x += nx * separation
        stone2.y += ny * separation
    end
    
    # Mark stones as active
    stone1.is_active = true
    stone2.is_active = true
    
    return nothing
end

# Check if stone is in target
function check_target_hit(stone::Ptr{Stone}, target::Ptr{Target})::Bool
    if !stone.is_player || stone.is_active
        return false
    end
    
    dx::Float64 = stone.x - target.x
    dy::Float64 = stone.y - target.y
    dist::Float64 = sqrt(dx * dx + dy * dy)
    
    return dist < target.radius
end

# ============================================================================
# RENDERING FUNCTIONS
# ============================================================================

# Draw ice cell (visual representation of ice type)
function draw_ice_cell(renderer::Ptr{SDL_Renderer}, cell::Ptr{IceCell})::Cvoid
    cell_size::Int32 = unsafe_trunc(Int32, GRID_CELL_SIZE)
    x::Int32 = unsafe_trunc(Int32, cell.x - GRID_CELL_SIZE / Float64(2.0))
    y::Int32 = unsafe_trunc(Int32, cell.y - GRID_CELL_SIZE / Float64(2.0))
    
    if cell.ice_type == ICE_ROUGH
        # Rough ice - darker blue
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(150), UInt8(180), UInt8(220), UInt8(100))
    elseif cell.ice_type == ICE_POLISHED
        # Polished ice - lighter blue
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(220), UInt8(240), UInt8(255), UInt8(100))
    elseif cell.ice_type == ICE_WALL
        # Wall - gray
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(100), UInt8(100), UInt8(255))
    else
        # Normal ice - standard blue
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(200), UInt8(220), UInt8(255), UInt8(100))
    end
    
    rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    unsafe_store!(Ptr{Int32}(rect_ptr), x)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), y)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), cell_size)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), cell_size)
    
    if cell.ice_type == ICE_WALL
        llvm_SDL_RenderFillRect(renderer, rect_ptr)
    else
        # Just draw outline for ice types
        llvm_SDL_RenderDrawRect(renderer, rect_ptr)
    end
    
    wasm_free(Ptr{Cvoid}(rect_ptr))
    return nothing
end

# Draw stone
function draw_stone(renderer::Ptr{SDL_Renderer}, stone::Ptr{Stone})::Cvoid
    # Always draw stones - make them more visible
    if stone.is_player
        # Player stone - darker gray/blue
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(60), UInt8(60), UInt8(80), UInt8(255))
    else
        # Blocker stone - lighter gray
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(100), UInt8(120), UInt8(255))
    end
    
    # Draw as filled circle (using square approximation)
    radius::Int32 = unsafe_trunc(Int32, STONE_RADIUS)
    center_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(stone.x))
    center_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(stone.y))
    
    rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    unsafe_store!(Ptr{Int32}(rect_ptr), center_x - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), center_y - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), radius * Int32(2))
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), radius * Int32(2))
    llvm_SDL_RenderFillRect(renderer, rect_ptr)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    # Draw direction indicator if moving
    if abs(stone.vel_x) > Float64(0.1) || abs(stone.vel_y) > Float64(0.1)
        vel_mag::Float64 = sqrt(stone.vel_x * stone.vel_x + stone.vel_y * stone.vel_y)
        dir_x::Float64 = stone.vel_x / vel_mag
        dir_y::Float64 = stone.vel_y / vel_mag
        indicator_len::Float64 = STONE_RADIUS * Float64(0.7)
        end_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(stone.x + dir_x * indicator_len))
        end_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(stone.y + dir_y * indicator_len))
        
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(255), UInt8(200))
        llvm_SDL_RenderDrawLine(renderer, center_x, center_y, end_x, end_y)
    end
    
    return nothing
end

# Draw stone with camera transform
function draw_stone_camera(renderer::Ptr{SDL_Renderer}, stone::Ptr{Stone}, state::Ptr{GameState})::Cvoid
    # Always draw stones - BRIGHT COLORS for visibility
    if stone.is_player
        # Player stone - BRIGHT RED
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
    else
        # Blocker stone - BRIGHT YELLOW
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(0), UInt8(255))
    end
    
    # Transform world coordinates to screen coordinates
    screen_x::Float64 = (stone.x - state.camera_offset_x) * state.camera_zoom + Float64(320.0)
    screen_y::Float64 = (stone.y - state.camera_offset_y) * state.camera_zoom + Float64(320.0)
    screen_radius::Float64 = STONE_RADIUS * state.camera_zoom
    
    center_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_x))
    center_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_y))
    radius::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_radius))
    
    # Skip drawing if off-screen
    if center_x + radius < Int32(0) || center_x - radius > Int32(640) || 
       center_y + radius < Int32(0) || center_y - radius > Int32(640)
        return nothing
    end
    
    rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    unsafe_store!(Ptr{Int32}(rect_ptr), center_x - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), center_y - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), radius * Int32(2))
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), radius * Int32(2))
    llvm_SDL_RenderFillRect(renderer, rect_ptr)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    # Draw direction indicator if moving
    if abs(stone.vel_x) > Float64(0.1) || abs(stone.vel_y) > Float64(0.1)
        vel_mag::Float64 = sqrt(stone.vel_x * stone.vel_x + stone.vel_y * stone.vel_y)
        dir_x::Float64 = stone.vel_x / vel_mag
        dir_y::Float64 = stone.vel_y / vel_mag
        indicator_len::Float64 = screen_radius * Float64(0.7)
        end_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_x + dir_x * indicator_len))
        end_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_y + dir_y * indicator_len))
        
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(255), UInt8(200))
        llvm_SDL_RenderDrawLine(renderer, center_x, center_y, end_x, end_y)
    end
    
    return nothing
end

# Draw target
function draw_target(renderer::Ptr{SDL_Renderer}, target::Ptr{Target})::Cvoid
    if target.is_hit
        # Hit target - green
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(255), UInt8(100), UInt8(200))
    else
        # Unhit target - bright white rings for visibility
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(255), UInt8(255))
    end
    
    # Draw outer ring
    center_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(target.x))
    center_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(target.y))
    radius::Int32 = unsafe_trunc(Int32, target.radius)
    
    # Draw circle outline (approximate with lines)
    num_points::Int32 = Int32(32)
    i::Int32 = Int32(0)
    prev_x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(Float64(0)) * Float64(radius)))
    prev_y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(Float64(0)) * Float64(radius)))
    
    while i < num_points
        angle::Float64 = Float64(i + Int32(1)) * Float64(2.0 * 3.14159265359) / Float64(num_points)
        x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(angle) * Float64(radius)))
        y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(angle) * Float64(radius)))
        
        llvm_SDL_RenderDrawLine(renderer, prev_x, prev_y, x, y)
        prev_x = x
        prev_y = y
        i += Int32(1)
    end
    
    # Draw inner ring
    inner_radius::Int32 = unsafe_trunc(Int32, target.radius * Float64(0.6))
    i = Int32(0)
    prev_x = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(Float64(0)) * Float64(inner_radius)))
    prev_y = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(Float64(0)) * Float64(inner_radius)))
    
    while i < num_points
        angle = Float64(i + Int32(1)) * Float64(2.0 * 3.14159265359) / Float64(num_points)
        x = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(angle) * Float64(inner_radius)))
        y = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(angle) * Float64(inner_radius)))
        
        llvm_SDL_RenderDrawLine(renderer, prev_x, prev_y, x, y)
        prev_x = x
        prev_y = y
        i += Int32(1)
    end
    
    return nothing
end

# Draw target with camera transform
function draw_target_camera(renderer::Ptr{SDL_Renderer}, target::Ptr{Target}, state::Ptr{GameState})::Cvoid
    if target.is_hit
        # Hit target - green
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(255), UInt8(100), UInt8(200))
    else
        # Unhit target - bright white rings for visibility
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(255), UInt8(255))
    end
    
    # Transform world coordinates to screen coordinates
    screen_x::Float64 = (target.x - state.camera_offset_x) * state.camera_zoom + Float64(320.0)
    screen_y::Float64 = (target.y - state.camera_offset_y) * state.camera_zoom + Float64(320.0)
    screen_radius::Float64 = target.radius * state.camera_zoom
    
    center_x::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_x))
    center_y::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_y))
    radius::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_radius))
    
    # Skip drawing if off-screen
    if center_x + radius < Int32(0) || center_x - radius > Int32(640) || 
       center_y + radius < Int32(0) || center_y - radius > Int32(640)
        return nothing
    end
    
    # Draw outer ring
    num_points::Int32 = Int32(32)
    i::Int32 = Int32(0)
    prev_x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(Float64(0)) * Float64(radius)))
    prev_y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(Float64(0)) * Float64(radius)))
    
    while i < num_points
        angle::Float64 = Float64(i + Int32(1)) * Float64(2.0 * 3.14159265359) / Float64(num_points)
        x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(angle) * Float64(radius)))
        y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(angle) * Float64(radius)))
        
        llvm_SDL_RenderDrawLine(renderer, prev_x, prev_y, x, y)
        prev_x = x
        prev_y = y
        i += Int32(1)
    end
    
    # Draw inner ring
    inner_radius::Int32 = unsafe_trunc(Int32, llvm_SDL_round(screen_radius * Float64(0.6)))
    i = Int32(0)
    prev_x = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(Float64(0)) * Float64(inner_radius)))
    prev_y = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(Float64(0)) * Float64(inner_radius)))
    
    while i < num_points
        angle = Float64(i + Int32(1)) * Float64(2.0 * 3.14159265359) / Float64(num_points)
        x = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(angle) * Float64(inner_radius)))
        y = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(angle) * Float64(inner_radius)))
        
        llvm_SDL_RenderDrawLine(renderer, prev_x, prev_y, x, y)
        prev_x = x
        prev_y = y
        i += Int32(1)
    end
    
    return nothing
end

# ============================================================================
# PUZZLE LEVEL CREATION HELPERS
# ============================================================================

# Create puzzle level from grid string
# Note: Grid string must be a null-terminated C string
function create_puzzle_level(grid_str::Ptr{UInt8})::Ptr{PuzzleLevel}
    # Calculate string length
    len::Int32 = Int32(0)
    while unsafe_load(grid_str + len) != UInt8(0)
        len += Int32(1)
    end
    
    return parse_level_grid(grid_str, len)
end

# Free puzzle level memory
function free_puzzle_level(level::Ptr{PuzzleLevel})::Cvoid
    if level == Ptr{PuzzleLevel}(C_NULL)
        return nothing
    end
    
    if level.ice_cells != Ptr{IceCell}(C_NULL)
        wasm_free(Ptr{Cvoid}(level.ice_cells))
    end
    if level.stones != Ptr{Stone}(C_NULL)
        wasm_free(Ptr{Cvoid}(level.stones))
    end
    if level.targets != Ptr{Target}(C_NULL)
        wasm_free(Ptr{Cvoid}(level.targets))
    end
    if level.obstacles != Ptr{Obstacle}(C_NULL)
        wasm_free(Ptr{Cvoid}(level.obstacles))
    end
    
    wasm_free(Ptr{Cvoid}(level))
    return nothing
end

# ============================================================================
# PUZZLE LEVEL CREATION FUNCTIONS
# ============================================================================

# Create Puzzle 1: "The Long Glide"
# Simple straight shot - target just out of normal reach, requires sweeping
function create_puzzle_1()::Ptr{PuzzleLevel}
    # Grid: 16x16, target at top center, start at bottom center
    # Added a blocker stone 'B' in the middle to test collisions
    # Format: ' ' = normal ice, 'S' = start, 'T' = target, 'B' = blocker
    grid_data::Ptr{UInt8} = str_ptr(w"        T       \n                \n                \n                \n                \n                \n                \n        B       \n                \n                \n                \n                \n                \n                \n        S       \n")
    level::Ptr{PuzzleLevel} = create_puzzle_level(grid_data)
    wasm_free(Ptr{Cvoid}(grid_data))
    
    return level
end

# Create Puzzle 2: "Split Ice"
# Mixed ice types - normal -> rough -> polished -> target
function create_puzzle_2()::Ptr{PuzzleLevel}
    grid_data::Ptr{UInt8} = str_ptr(w"                T\n                \n                \n            PPPP\n            RRRR\n            RRRR\n                \n                \n                \n                \n                \n                \n                \n                \nS               \n")
    level::Ptr{PuzzleLevel} = create_puzzle_level(grid_data)
    wasm_free(Ptr{Cvoid}(grid_data))
    return level
end

# Create Puzzle 3: "The Blocker"
# Stone blocking the target - must knock it away first
function create_puzzle_3()::Ptr{PuzzleLevel}
    grid_data::Ptr{UInt8} = str_ptr(w"                T\n                \n                \n                \n                \n                \n                \n                \n                \n                \n                \n                \n                \n                \nS       B       \n")
    level::Ptr{PuzzleLevel} = create_puzzle_level(grid_data)
    wasm_free(Ptr{Cvoid}(grid_data))
    return level
end

# ============================================================================
# USAGE NOTES
# ============================================================================
# 
# To use the puzzle system:
# 
# 1. Create a puzzle level:
#    level = create_puzzle_1()  # or create_puzzle_2(), create_puzzle_3()
# 
# 2. Initialize game state with the level
# 
# 3. In game loop:
#    - Update stone physics: update_stone_physics(stone, level, is_sweeping, delta_time)
#    - Check collisions: resolve_stone_collision(stone1, stone2)
#    - Check targets: check_target_hit(stone, target)
#    - Render: draw_ice_cell(), draw_stone(), draw_target()
# 
# 4. Clean up: free_puzzle_level(level)
# 
# Grid format for custom levels:
# - ' ' = normal ice
# - 'R' = rough ice (high friction)
# - 'P' = polished ice (low friction)
# - '#' = obstacle/wall
# - 'S' = start position (player stone)
# - 'B' = blocker stone
# - 'T' = target (goal)
# - '\n' = new row
# 
# Example custom level:
# grid = "                T\n                \n                \n            ####\n                \n                \n                \n                \n                \n                \n                \n                \n                \n                \nS               \n"
# level = create_puzzle_level(str_ptr(w"..."))
#

