# game2.jl - Sand Simulation
# adapted from https://github.com/autoselff/sandbox/blob/main/src/main.c
using StaticTools
using StaticCompiler

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl") 
include("llvm_bindings.jl")
include("wallocstring.jl")

# ============================================================================
# CONSTANTS
# ============================================================================
const CELL_SIZE::Int32 = Int32(4)
const GRID_WIDTH::Int32 = Int32(160)   # 640 / 4
const GRID_HEIGHT::Int32 = Int32(160)  # 640 / 4
const GRID_SIZE::Int32 = GRID_WIDTH * GRID_HEIGHT  # 25600 cells
const GRID_ALLOCATED_SIZE::Int32 = GRID_SIZE + Int32(1024)  # Allocated size with padding

const PHYSICS_FPS::Float64 = Float64(50.0)
const PHYSICS_TIMESTEP::Float64 = Float64(1.0) / PHYSICS_FPS

const BRUSH_SIZE::Int32 = Int32(4)

# Cell types
const CELL_EMPTY::UInt8 = UInt8(0)
const CELL_SAND::UInt8 = UInt8(1)
const CELL_WATER::UInt8 = UInt8(2)
const CELL_STONE::UInt8 = UInt8(3)

# ============================================================================
# SIMULATION STATE STRUCT
# ============================================================================
# Field order matters! Put fixed-size fields first to avoid pointer size mismatch
# between 64-bit compilation host and 32-bit WASM target.
# Using manual offsets to ensure WASM32 compatibility.
struct SandSimState
    physics_accumulator::Float64  # offset 0, size 8
    last_frame_time::UInt64       # offset 8, size 8
    rng_state::UInt32             # offset 16, size 4
    cell_count::UInt32            # offset 20, size 4 - DEBUG: track cell placements
    selected_type::UInt8          # offset 24, size 1
    quit::Bool                    # offset 25, size 1
    # 2 bytes padding
    grid::Ptr{UInt8}              # offset 28, size 4 (WASM32)
    scratch_arena::Ptr{UInt8}     # offset 32, size 4 (WASM32)
    texture::Ptr{SDL_Texture}     # offset 36, size 4 (WASM32) - for efficient rendering
    pixel_buffer::Ptr{UInt32}     # offset 40, size 4 (WASM32) - RGBA pixel buffer
end
# Total size: 44 bytes on WASM32

# Manual offsets for WASM32 compatibility
const SANDSIM_OFF_PHYSICS_ACC::Int64 = Int64(0)
const SANDSIM_OFF_LAST_FRAME::Int64 = Int64(8)
const SANDSIM_OFF_RNG::Int64 = Int64(16)
const SANDSIM_OFF_CELL_COUNT::Int64 = Int64(20)
const SANDSIM_OFF_SELECTED::Int64 = Int64(24)
const SANDSIM_OFF_QUIT::Int64 = Int64(25)
const SANDSIM_OFF_GRID::Int64 = Int64(28)
const SANDSIM_OFF_SCRATCH::Int64 = Int64(32)
const SANDSIM_OFF_TEXTURE::Int64 = Int64(36)
const SANDSIM_OFF_PIXBUF::Int64 = Int64(40)

# Scratch arena layout (offsets from scratch_arena base)
const SCRATCH_EVENT::Int64 = Int64(0)      # SDL_Event: 128 bytes (increased for safety)
const SCRATCH_MX::Int64 = Int64(128)       # Int32: 4 bytes (aligned)
const SCRATCH_MY::Int64 = Int64(132)       # Int32: 4 bytes
const SCRATCH_RECT::Int64 = Int64(136)     # SDL_Rect: 16 bytes (aligned)
const SCRATCH_TOTAL_SIZE::UInt32 = UInt32(512)  # Total scratch space needed (increased for safety)

# Pointer accessors for SandSimState using manual offsets
function Base.getproperty(x::Ptr{SandSimState}, f::Symbol)
    f === :physics_accumulator && return unsafe_load(Ptr{Float64}(x + SANDSIM_OFF_PHYSICS_ACC))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + SANDSIM_OFF_LAST_FRAME))
    f === :rng_state && return unsafe_load(Ptr{UInt32}(x + SANDSIM_OFF_RNG))
    f === :cell_count && return unsafe_load(Ptr{UInt32}(x + SANDSIM_OFF_CELL_COUNT))
    f === :selected_type && return unsafe_load(Ptr{UInt8}(x + SANDSIM_OFF_SELECTED))
    f === :quit && return unsafe_load(Ptr{Bool}(x + SANDSIM_OFF_QUIT))
    f === :grid && return unsafe_load(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_GRID))
    f === :scratch_arena && return unsafe_load(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_SCRATCH))
    f === :texture && return unsafe_load(Ptr{Ptr{SDL_Texture}}(x + SANDSIM_OFF_TEXTURE))
    f === :pixel_buffer && return unsafe_load(Ptr{Ptr{UInt32}}(x + SANDSIM_OFF_PIXBUF))
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{SandSimState}, f::Symbol, v)
    f === :physics_accumulator && return unsafe_store!(Ptr{Float64}(x + SANDSIM_OFF_PHYSICS_ACC), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + SANDSIM_OFF_LAST_FRAME), v)
    f === :rng_state && return unsafe_store!(Ptr{UInt32}(x + SANDSIM_OFF_RNG), v)
    f === :cell_count && return unsafe_store!(Ptr{UInt32}(x + SANDSIM_OFF_CELL_COUNT), v)
    f === :selected_type && return unsafe_store!(Ptr{UInt8}(x + SANDSIM_OFF_SELECTED), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + SANDSIM_OFF_QUIT), v)
    f === :grid && return unsafe_store!(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_GRID), v)
    f === :scratch_arena && return unsafe_store!(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_SCRATCH), v)
    f === :texture && return unsafe_store!(Ptr{Ptr{SDL_Texture}}(x + SANDSIM_OFF_TEXTURE), v)
    f === :pixel_buffer && return unsafe_store!(Ptr{Ptr{UInt32}}(x + SANDSIM_OFF_PIXBUF), v)
    return nothing
end

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

# Simple LCG random number generator
function rand_next(state::Ptr{SandSimState})::UInt32
    # LCG parameters (same as glibc)
    a::UInt32 = UInt32(1103515245)
    c::UInt32 = UInt32(12345)
    new_state::UInt32 = a * state.rng_state + c
    state.rng_state = new_state
    return new_state
end

# Get random 0 or 1
function rand_bool(state::Ptr{SandSimState})::Int32
    r::UInt32 = rand_next(state)
    return unsafe_trunc(Int32, r & UInt32(1))
end

# Grid index helper
@inline function grid_index(x::Int32, y::Int32)::Int32
    return x + y * GRID_WIDTH
end

# Get cell at position
function get_cell(grid::Ptr{UInt8}, x::Int32, y::Int32)::UInt8
    # Bounds check - return empty for out of bounds
    if x < Int32(0) || x >= GRID_WIDTH || y < Int32(0) || y >= GRID_HEIGHT
        return CELL_EMPTY
    end
    # Calculate offset and use pointer arithmetic
    # Convert to Int for pointer arithmetic (works for both 32-bit and 64-bit)
    offset::Int = Int(x) + Int(y) * Int(GRID_WIDTH)
    cell_ptr::Ptr{UInt8} = grid + offset
    return unsafe_load(cell_ptr)
end

# Set cell at position
function set_cell(grid::Ptr{UInt8}, x::Int32, y::Int32, value::UInt8)::Cvoid
    # Bounds check - ignore out of bounds
    if x < Int32(0) || x >= GRID_WIDTH || y < Int32(0) || y >= GRID_HEIGHT
        return nothing
    end
    # Calculate offset and use pointer arithmetic
    # Convert to Int for pointer arithmetic (works for both 32-bit and 64-bit)
    offset::Int = Int(x) + Int(y) * Int(GRID_WIDTH)
    cell_ptr::Ptr{UInt8} = grid + offset
    unsafe_store!(cell_ptr, value)
    return nothing
end

# Set cell with state tracking (for counting)
function set_cell_counted(state::Ptr{SandSimState}, x::Int32, y::Int32, value::UInt8)::Cvoid
    old_value::UInt8 = get_cell(state.grid, x, y)
    set_cell(state.grid, x, y, value)
    # Only count if we're placing a new cell (not replacing empty with empty)
    if old_value == CELL_EMPTY && value != CELL_EMPTY
        state.cell_count = state.cell_count + UInt32(1)
    end
    return nothing
end

# ============================================================================
# WINDOW/RENDERER INIT
# ============================================================================

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"Sand simulations")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(640), UInt32(0))
    if window == Ptr{SDL_Window}(C_NULL)
        printf(c"Failed to create window\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
    end
    wasm_free(Ptr{Cvoid}(window_name))
    return window
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    # Use accelerated renderer (WebGL in Emscripten)
    # SDL_RENDERER_ACCELERATED = 2
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), UInt32(2))
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to create renderer\n")
    end
    return renderer
end

# ============================================================================
# SIMULATION INIT
# ============================================================================

function j_init_game_state(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{SandSimState}
    printf(c"Initializing sand simulation\n")
    
    # Allocate grid with generous padding for WASM safety
    # GRID_SIZE = 25600, but allocate extra to avoid any boundary issues
    # Adding 1024 bytes padding to ensure we never hit bounds issues
    grid_bytes::UInt32 = UInt32(GRID_SIZE) + UInt32(1024)
    grid::Ptr{UInt8} = Ptr{UInt8}(wasm_malloc(grid_bytes))
    printf(c"Grid allocated: %d bytes (cells: %d + padding)\n", grid_bytes, GRID_SIZE)
    
    # Initialize all allocated bytes to empty (including padding)
    # Use pointer arithmetic to avoid indexing confusion
    i::UInt32 = UInt32(0)
    while i < grid_bytes
        cell_ptr::Ptr{UInt8} = grid + Int(i)
        unsafe_store!(cell_ptr, CELL_EMPTY)
        i += UInt32(1)
    end
    printf(c"Grid initialized: %d cells\n", GRID_SIZE)
    
    # Allocate scratch arena for per-frame allocations (prevents fragmentation)
    scratch_arena::Ptr{UInt8} = Ptr{UInt8}(wasm_malloc(SCRATCH_TOTAL_SIZE))
    printf(c"Scratch arena allocated: %d bytes\n", SCRATCH_TOTAL_SIZE)
    
    # Initialize scratch arena to zero to prevent uninitialized memory issues
    i = UInt32(0)
    while i < SCRATCH_TOTAL_SIZE
        cell_ptr::Ptr{UInt8} = scratch_arena + Int(i)
        unsafe_store!(cell_ptr, UInt8(0))
        i += UInt32(1)
    end
    
    # Create streaming texture for efficient rendering (1 draw call instead of thousands)
    # SDL_PIXELFORMAT_ABGR8888 = 376840196 (works better with WebGL byte order)
    # SDL_TEXTUREACCESS_STREAMING = 1
    texture::Ptr{SDL_Texture} = llvm_SDL_CreateTexture(
        renderer, 
        UInt32(376840196),  # SDL_PIXELFORMAT_ABGR8888
        Int32(1),           # SDL_TEXTUREACCESS_STREAMING
        GRID_WIDTH, 
        GRID_HEIGHT
    )
    if texture == Ptr{SDL_Texture}(C_NULL)
        printf(c"Failed to create texture\n")
    else
        printf(c"Texture created: %dx%d\n", GRID_WIDTH, GRID_HEIGHT)
    end
    
    # Allocate pixel buffer (RGBA = 4 bytes per pixel)
    pixel_buf_size::UInt32 = UInt32(GRID_WIDTH) * UInt32(GRID_HEIGHT) * UInt32(4)
    pixel_buffer::Ptr{UInt32} = Ptr{UInt32}(wasm_malloc(pixel_buf_size))
    printf(c"Pixel buffer allocated: %d bytes\n", pixel_buf_size)
    
    # Initialize pixel buffer to background color (dark blue-gray)
    bg_color::UInt32 = UInt32(0xFF403232)  # ABGR: alpha=FF, blue=40, green=32, red=32
    i = UInt32(0)
    pixel_count::UInt32 = UInt32(GRID_WIDTH) * UInt32(GRID_HEIGHT)
    while i < pixel_count
        unsafe_store!(pixel_buffer + Int(i), bg_color)
        i += UInt32(1)
    end
    
    # Allocate state - use fixed size for WASM32 compatibility (48 bytes with texture + pixel_buffer)
    state_ptr::Ptr{SandSimState} = Ptr{SandSimState}(wasm_malloc(UInt32(48)))
    
    # Initialize state (order doesn't matter, using accessors)
    state_ptr.physics_accumulator = Float64(0.0)
    state_ptr.last_frame_time = UInt64(0)
    state_ptr.rng_state = UInt32(12345)  # Seed
    state_ptr.cell_count = UInt32(0)  # DEBUG: track cell placements
    state_ptr.selected_type = CELL_SAND
    state_ptr.quit = false
    state_ptr.grid = grid
    state_ptr.scratch_arena = scratch_arena
    state_ptr.texture = texture
    state_ptr.pixel_buffer = pixel_buffer
    
    printf(c"Sand simulation ready\n")
    printf(c"Controls: 1=Sand, 2=Water, 3=Stone, 0=Erase\n")
    printf(c"Click/touch to place cells\n")
    
    return state_ptr
end

# ============================================================================
# INPUT HANDLING
# ============================================================================

function place_cells(grid::Ptr{UInt8}, cell_x::Int32, cell_y::Int32, size::Int32, cell_type::UInt8)::Cvoid
    half_size::Int32 = div(size, Int32(2))
    dx::Int32 = -half_size
    while dx < half_size
        dy::Int32 = -half_size
        while dy < half_size
            x::Int32 = cell_x + dx
            y::Int32 = cell_y + dy
            if x >= Int32(0) && x < GRID_WIDTH && y >= Int32(0) && y < GRID_HEIGHT
                set_cell(grid, x, y, cell_type)
            end
            dy += Int32(1)
        end
        dx += Int32(1)
    end
    return nothing
end

function place_cells_counted(state::Ptr{SandSimState}, cell_x::Int32, cell_y::Int32, size::Int32, cell_type::UInt8)::Cvoid
    half_size::Int32 = div(size, Int32(2))
    dx::Int32 = -half_size
    while dx < half_size
        dy::Int32 = -half_size
        while dy < half_size
            x::Int32 = cell_x + dx
            y::Int32 = cell_y + dy
            if x >= Int32(0) && x < GRID_WIDTH && y >= Int32(0) && y < GRID_HEIGHT
                set_cell_counted(state, x, y, cell_type)
            end
            dy += Int32(1)
        end
        dx += Int32(1)
    end
    return nothing
end

function handle_input(state::Ptr{SandSimState}, window::Ptr{SDL_Window})::Cvoid
    # Pump events before polling to ensure SDL's internal queue is updated
    llvm_SDL_PumpEvents()
    
    # Use pre-allocated scratch arena instead of malloc/free every frame
    scratch::Ptr{UInt8} = state.scratch_arena
    event_ptr::Ptr{SDL_Event} = Ptr{SDL_Event}(scratch + SCRATCH_EVENT)
    mx_ptr::Ptr{Int32} = Ptr{Int32}(scratch + SCRATCH_MX)
    my_ptr::Ptr{Int32} = Ptr{Int32}(scratch + SCRATCH_MY)
    
    # Zero out event buffer before polling to prevent uninitialized data
    i::UInt32 = UInt32(0)
    while i < UInt32(128)  # Zero out the 128-byte event buffer
        cell_ptr::Ptr{UInt8} = Ptr{UInt8}(event_ptr) + Int(i)
        unsafe_store!(cell_ptr, UInt8(0))
        i += UInt32(1)
    end
    
    cell_x::Int32 = Int32(0)
    cell_y::Int32 = Int32(0)

    while llvm_SDL_PollEvent(event_ptr) != Int32(0)
        event_type::UInt32 = event_ptr.type
        
        if event_type == SDL_QUIT
            state.quit = true
        elseif event_type == SDL_KEYDOWN
            key::Int32 = event_ptr.key.keysym.sym
            if key == SDLK_1
                state.selected_type = CELL_SAND
            elseif key == SDLK_2
                state.selected_type = CELL_WATER
            elseif key == SDLK_3
                state.selected_type = CELL_STONE
            elseif key == SDLK_0
                state.selected_type = CELL_EMPTY
            elseif key == SDLK_ESCAPE
                state.quit = true
            elseif key == Int32(32)  # SDLK_SPACE
                # DEBUG: Place single cell at center (no printf to avoid walloc fragmentation)
                center_x::Int32 = div(GRID_WIDTH, Int32(2))
                center_y::Int32 = div(GRID_HEIGHT, Int32(2))
                set_cell_counted(state, center_x, center_y, state.selected_type)
            end
        elseif event_type == SDL_MOUSEBUTTONDOWN || event_type == SDL_MOUSEMOTION
            # Check if mouse button is held
            mouse_state::UInt32 = llvm_SDL_GetMouseState(Ptr{Int32}(C_NULL), Ptr{Int32}(C_NULL))
            if (mouse_state & UInt32(1)) != UInt32(0)  # Left button
                # Get mouse position using scratch arena pointers
                llvm_SDL_GetMouseState(mx_ptr, my_ptr)
                mx::Int32 = unsafe_load(mx_ptr)
                my::Int32 = unsafe_load(my_ptr)
                
                cell_x = div(mx, CELL_SIZE)
                cell_y = div(my, CELL_SIZE)
                place_cells_counted(state, cell_x, cell_y, BRUSH_SIZE, state.selected_type)
            end
        end
    end
    
    return nothing
end

# ============================================================================
# PHYSICS UPDATE
# ============================================================================

function update_physics(state::Ptr{SandSimState}, delta_time::Float64)::Cvoid
    state.physics_accumulator = state.physics_accumulator + delta_time
    
    if state.physics_accumulator < PHYSICS_TIMESTEP
        return nothing
    end
    
    state.physics_accumulator = state.physics_accumulator - PHYSICS_TIMESTEP
    
    grid::Ptr{UInt8} = state.grid
    
    # Iterate from bottom to top, skip bottom row since it can't fall further
    y::Int32 = GRID_HEIGHT - Int32(2)  # Start one above bottom
    while y >= Int32(0)
        x::Int32 = Int32(0)
        while x < GRID_WIDTH
            cell::UInt8 = get_cell(grid, x, y)
            dir::Int32 = Int32(0)
            # SAND PHYSICS
            if cell == CELL_SAND
                # y+1 is always valid here since we start at GRID_HEIGHT-2
                below::UInt8 = get_cell(grid, x, y + Int32(1))
                
                if below == CELL_EMPTY
                    # Fall straight down
                    set_cell(grid, x, y + Int32(1), CELL_SAND)
                    set_cell(grid, x, y, CELL_EMPTY)
                elseif below == CELL_WATER
                    # Displace water
                    set_cell(grid, x, y + Int32(1), CELL_SAND)
                    set_cell(grid, x, y, CELL_WATER)
                elseif below != CELL_STONE
                    # Try diagonal
                    can_left::Bool = (x - Int32(1) >= Int32(0)) && (get_cell(grid, x - Int32(1), y + Int32(1)) == CELL_EMPTY)
                    can_right::Bool = (x + Int32(1) < GRID_WIDTH) && (get_cell(grid, x + Int32(1), y + Int32(1)) == CELL_EMPTY)
                    
                    if can_left && can_right
                        dir = rand_bool(state) == Int32(0) ? Int32(-1) : Int32(1)
                        set_cell(grid, x + dir, y + Int32(1), CELL_SAND)
                        set_cell(grid, x, y, CELL_EMPTY)
                    elseif can_left
                        set_cell(grid, x - Int32(1), y + Int32(1), CELL_SAND)
                        set_cell(grid, x, y, CELL_EMPTY)
                    elseif can_right
                        set_cell(grid, x + Int32(1), y + Int32(1), CELL_SAND)
                        set_cell(grid, x, y, CELL_EMPTY)
                    end
                end
            end
            
            # WATER PHYSICS
            if cell == CELL_WATER
                # Try fall down first
                if y + Int32(1) < GRID_HEIGHT && get_cell(grid, x, y + Int32(1)) == CELL_EMPTY
                    set_cell(grid, x, y + Int32(1), CELL_WATER)
                    set_cell(grid, x, y, CELL_EMPTY)
                else
                    # Try diagonal down
                    can_left_d::Bool = (x - Int32(1) >= Int32(0)) && (y + Int32(1) < GRID_HEIGHT) && (get_cell(grid, x - Int32(1), y + Int32(1)) == CELL_EMPTY)
                    can_right_d::Bool = (x + Int32(1) < GRID_WIDTH) && (y + Int32(1) < GRID_HEIGHT) && (get_cell(grid, x + Int32(1), y + Int32(1)) == CELL_EMPTY)
                    
                    if can_left_d && can_right_d
                        dir = rand_bool(state) == Int32(0) ? Int32(-1) : Int32(1)
                        set_cell(grid, x + dir, y + Int32(1), CELL_WATER)
                        set_cell(grid, x, y, CELL_EMPTY)
                    elseif can_left_d
                        set_cell(grid, x - Int32(1), y + Int32(1), CELL_WATER)
                        set_cell(grid, x, y, CELL_EMPTY)
                    elseif can_right_d
                        set_cell(grid, x + Int32(1), y + Int32(1), CELL_WATER)
                        set_cell(grid, x, y, CELL_EMPTY)
                    else
                        # Try horizontal spread
                        can_left_h::Bool = (x - Int32(1) >= Int32(0)) && (get_cell(grid, x - Int32(1), y) == CELL_EMPTY)
                        can_right_h::Bool = (x + Int32(1) < GRID_WIDTH) && (get_cell(grid, x + Int32(1), y) == CELL_EMPTY)
                        
                        if can_left_h && can_right_h
                            dir = rand_bool(state) == Int32(0) ? Int32(-1) : Int32(1)
                            set_cell(grid, x + dir, y, CELL_WATER)
                            set_cell(grid, x, y, CELL_EMPTY)
                        elseif can_left_h
                            set_cell(grid, x - Int32(1), y, CELL_WATER)
                            set_cell(grid, x, y, CELL_EMPTY)
                        elseif can_right_h
                            set_cell(grid, x + Int32(1), y, CELL_WATER)
                            set_cell(grid, x, y, CELL_EMPTY)
                        end
                    end
                end
            end
            
            x += Int32(1)
        end
        y -= Int32(1)
    end
    
    return nothing
end

# ============================================================================
# RENDERING
# ============================================================================

function render_simulation(state::Ptr{SandSimState}, renderer::Ptr{SDL_Renderer})::Cvoid
    grid::Ptr{UInt8} = state.grid
    pixel_buffer::Ptr{UInt32} = state.pixel_buffer
    texture::Ptr{SDL_Texture} = state.texture
    
    # Colors in ABGR format (for SDL_PIXELFORMAT_ABGR8888)
    # Format: 0xAABBGGRR
    bg_color::UInt32 = UInt32(0xFF403232)      # Dark background (R=50, G=50, B=64)
    sand_color::UInt32 = UInt32(0xFF00A5FF)    # Orange sand (R=255, G=165, B=0)
    water_color::UInt32 = UInt32(0xFFF17900)   # Blue water (R=0, G=121, B=241)
    stone_color::UInt32 = UInt32(0xFF828282)   # Gray stone (R=130, G=130, B=130)
    
    # Build pixel buffer from grid
    y::Int32 = Int32(0)
    while y < GRID_HEIGHT
        x::Int32 = Int32(0)
        while x < GRID_WIDTH
            cell::UInt8 = get_cell(grid, x, y)
            pixel_idx::Int32 = y * GRID_WIDTH + x
            
            color::UInt32 = bg_color
            if cell == CELL_SAND
                color = sand_color
            elseif cell == CELL_WATER
                color = water_color
            elseif cell == CELL_STONE
                color = stone_color
            end
            
            unsafe_store!(pixel_buffer + Int(pixel_idx), color)
            x += Int32(1)
        end
        y += Int32(1)
    end
    
    # Update texture with pixel data
    # pitch = bytes per row = GRID_WIDTH * 4 (RGBA)
    pitch::Int32 = GRID_WIDTH * Int32(4)
    llvm_SDL_UpdateTexture(texture, Ptr{SDL_Rect}(C_NULL), Ptr{Cvoid}(pixel_buffer), pitch)
    
    # Clear and render texture scaled to window
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Render texture to fill entire window (NULL src and dst = full texture to full window)
    llvm_SDL_RenderCopy(renderer, texture, Ptr{SDL_Rect}(C_NULL), Ptr{SDL_Rect}(C_NULL))
    
    llvm_SDL_RenderPresent(renderer)
    return nothing
end

# ============================================================================
# MAIN GAME LOOP
# ============================================================================

function game_loop(state::Ptr{SandSimState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{SandSimState}
    # Calculate delta time
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    delta_time::Float64 = Float64(current_time - state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    state.last_frame_time = current_time
    
    # Clamp delta time to avoid spiral of death
    if delta_time > Float64(0.1)
        delta_time = Float64(0.1)
    end
    
    handle_input(state, window)
    update_physics(state, delta_time)
    render_simulation(state, renderer)
    
    llvm_SDL_Delay(UInt32(16))  # ~60 FPS cap
    
    return state
end

# ============================================================================
# ENTRY POINTS
# ============================================================================

function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))  # SDL_INIT_VIDEO
    
    window::Ptr{SDL_Window} = j_init_window()
    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    state_ptr::Ptr{SandSimState} = j_init_game_state(renderer, window)
    
    while !state_ptr.quit
        game_loop(state_ptr, renderer, window)
    end
    
    cleanup(state_ptr, renderer, window)
    return Int32(0)
end

function cleanup(state_ptr::Ptr{SandSimState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Cvoid
    # Free texture
    if state_ptr.texture != Ptr{SDL_Texture}(C_NULL)
        llvm_SDL_DestroyTexture(state_ptr.texture)
    end
    
    # Free pixel buffer
    if state_ptr.pixel_buffer != Ptr{UInt32}(C_NULL)
        wasm_free(Ptr{Cvoid}(state_ptr.pixel_buffer))
    end
    
    # Free grid
    if state_ptr.grid != Ptr{UInt8}(C_NULL)
        wasm_free(Ptr{Cvoid}(state_ptr.grid))
    end
    
    # Free scratch arena
    if state_ptr.scratch_arena != Ptr{UInt8}(C_NULL)
        wasm_free(Ptr{Cvoid}(state_ptr.scratch_arena))
    end
    
    # Free state
    wasm_free(Ptr{Cvoid}(state_ptr))
    
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    llvm_SDL_Quit()
    
    return nothing
end
