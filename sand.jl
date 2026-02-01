# sand.jl - Sand Simulation
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
    selected_type::UInt8          # offset 20, size 1
    quit::Bool                    # offset 21, size 1
    # 2 bytes padding
    grid::Ptr{UInt8}              # offset 24, size 4 (WASM32) or 8 (64-bit)
end
# Total size: 32 bytes on WASM32, 32 bytes on 64-bit (with padding)

# Manual offsets for WASM32 compatibility
const SANDSIM_OFF_PHYSICS_ACC::Int64 = Int64(0)
const SANDSIM_OFF_LAST_FRAME::Int64 = Int64(8)
const SANDSIM_OFF_RNG::Int64 = Int64(16)
const SANDSIM_OFF_SELECTED::Int64 = Int64(20)
const SANDSIM_OFF_QUIT::Int64 = Int64(21)
const SANDSIM_OFF_GRID::Int64 = Int64(24)

# Pointer accessors for SandSimState using manual offsets
function Base.getproperty(x::Ptr{SandSimState}, f::Symbol)
    f === :physics_accumulator && return unsafe_load(Ptr{Float64}(x + SANDSIM_OFF_PHYSICS_ACC))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + SANDSIM_OFF_LAST_FRAME))
    f === :rng_state && return unsafe_load(Ptr{UInt32}(x + SANDSIM_OFF_RNG))
    f === :selected_type && return unsafe_load(Ptr{UInt8}(x + SANDSIM_OFF_SELECTED))
    f === :quit && return unsafe_load(Ptr{Bool}(x + SANDSIM_OFF_QUIT))
    f === :grid && return unsafe_load(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_GRID))
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{SandSimState}, f::Symbol, v)
    f === :physics_accumulator && return unsafe_store!(Ptr{Float64}(x + SANDSIM_OFF_PHYSICS_ACC), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + SANDSIM_OFF_LAST_FRAME), v)
    f === :rng_state && return unsafe_store!(Ptr{UInt32}(x + SANDSIM_OFF_RNG), v)
    f === :selected_type && return unsafe_store!(Ptr{UInt8}(x + SANDSIM_OFF_SELECTED), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + SANDSIM_OFF_QUIT), v)
    f === :grid && return unsafe_store!(Ptr{Ptr{UInt8}}(x + SANDSIM_OFF_GRID), v)
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
@inline function get_cell(grid::Ptr{UInt8}, x::Int32, y::Int32)::UInt8
    return unsafe_load(grid, grid_index(x, y) + Int32(1))  # Julia is 1-indexed for unsafe_load
end

# Set cell at position
@inline function set_cell(grid::Ptr{UInt8}, x::Int32, y::Int32, value::UInt8)::Cvoid
    unsafe_store!(grid, value, grid_index(x, y) + Int32(1))
    return nothing
end

# ============================================================================
# WINDOW/RENDERER INIT
# ============================================================================

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"Sand simulation")
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
    
    # Allocate grid
    grid_bytes::UInt32 = UInt32(GRID_SIZE)
    grid::Ptr{UInt8} = Ptr{UInt8}(wasm_malloc(grid_bytes))
    
    # Initialize grid to empty
    i::Int32 = Int32(0)
    while i < GRID_SIZE
        unsafe_store!(grid, CELL_EMPTY, i + Int32(1))
        i += Int32(1)
    end
    printf(c"Grid initialized: %d cells\n", GRID_SIZE)
    
    # Allocate state - use fixed size for WASM32 compatibility (32 bytes)
    state_ptr::Ptr{SandSimState} = Ptr{SandSimState}(wasm_malloc(UInt32(32)))
    
    # Initialize state (order doesn't matter, using accessors)
    state_ptr.physics_accumulator = Float64(0.0)
    state_ptr.last_frame_time = UInt64(0)
    state_ptr.rng_state = UInt32(12345)  # Seed
    state_ptr.selected_type = CELL_SAND
    state_ptr.quit = false
    state_ptr.grid = grid
    
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

function handle_input(state::Ptr{SandSimState}, window::Ptr{SDL_Window})::Cvoid
    event_ptr::Ptr{SDL_Event} = Ptr{SDL_Event}(wasm_malloc(UInt32(56)))
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
                printf(c"Selected: Sand\n")
            elseif key == SDLK_2
                state.selected_type = CELL_WATER
                printf(c"Selected: Water\n")
            elseif key == SDLK_3
                state.selected_type = CELL_STONE
                printf(c"Selected: Stone\n")
            elseif key == SDLK_0
                state.selected_type = CELL_EMPTY
                printf(c"Selected: Erase\n")
            elseif key == SDLK_ESCAPE
                state.quit = true
            end
        elseif event_type == SDL_MOUSEBUTTONDOWN || event_type == SDL_MOUSEMOTION
            # Check if mouse button is held
            mouse_state::UInt32 = llvm_SDL_GetMouseState(Ptr{Int32}(C_NULL), Ptr{Int32}(C_NULL))
            if (mouse_state & UInt32(1)) != UInt32(0)  # Left button
                # Get mouse position
                mx_ptr::Ptr{Int32} = Ptr{Int32}(wasm_malloc(UInt32(4)))
                my_ptr::Ptr{Int32} = Ptr{Int32}(wasm_malloc(UInt32(4)))
                llvm_SDL_GetMouseState(mx_ptr, my_ptr)
                mx::Int32 = unsafe_load(mx_ptr)
                my::Int32 = unsafe_load(my_ptr)
                wasm_free(Ptr{Cvoid}(mx_ptr))
                wasm_free(Ptr{Cvoid}(my_ptr))
                
                cell_x = div(mx, CELL_SIZE)
                cell_y = div(my, CELL_SIZE)
                place_cells(state.grid, cell_x, cell_y, BRUSH_SIZE, state.selected_type)
            end
        end
    end
    
    wasm_free(Ptr{Cvoid}(event_ptr))
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
    
    # Iterate from bottom to top
    y::Int32 = GRID_HEIGHT - Int32(2)  # Start one above bottom
    while y >= Int32(0)
        x::Int32 = Int32(0)
        while x < GRID_WIDTH
            cell::UInt8 = get_cell(grid, x, y)
            dir::Int32 = Int32(0)
            # SAND PHYSICS
            if cell == CELL_SAND
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
    # Clear to dark background
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(50), UInt8(50), UInt8(64), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    grid::Ptr{UInt8} = state.grid
    
    # Allocate rect once for reuse
    rect_ptr::Ptr{SDL_Rect} = Ptr{SDL_Rect}(wasm_malloc(UInt32(sizeof(SDL_Rect))))
    
    y::Int32 = Int32(0)
    while y < GRID_HEIGHT
        x::Int32 = Int32(0)
        while x < GRID_WIDTH
            cell::UInt8 = get_cell(grid, x, y)
            
            if cell != CELL_EMPTY
                # Set color based on cell type
                if cell == CELL_SAND
                    llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(165), UInt8(0), UInt8(255))  # Orange
                elseif cell == CELL_WATER
                    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(121), UInt8(241), UInt8(255))  # Blue
                elseif cell == CELL_STONE
                    llvm_SDL_SetRenderDrawColor(renderer, UInt8(130), UInt8(130), UInt8(130), UInt8(255))  # Gray
                end
                
                # Set rect position and size
                unsafe_store!(Ptr{Int32}(rect_ptr), x * CELL_SIZE)                    # x
                unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), y * CELL_SIZE)         # y
                unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), CELL_SIZE)             # w
                unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), CELL_SIZE)            # h
                
                llvm_SDL_RenderFillRect(renderer, rect_ptr)
            end
            
            x += Int32(1)
        end
        y += Int32(1)
    end
    
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
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
    # Free grid
    if state_ptr.grid != Ptr{UInt8}(C_NULL)
        wasm_free(Ptr{Cvoid}(state_ptr.grid))
    end
    
    # Free state
    wasm_free(Ptr{Cvoid}(state_ptr))
    
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    llvm_SDL_Quit()
    
    return nothing
end
