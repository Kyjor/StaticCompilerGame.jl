# combined_game_working.jl
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
const NUM_STARS::Int32 = Int32(250)
const NUM_TIES::Int32 = Int32(10)

# 3D engine CONSTANTS
const NEAR_Z::Int32 = Int32(10)
const FAR_Z::Int32 = Int32(2000)
const VIEW_DISTANCE::Int32 = Int32(320)


# Player CONSTANTS
const CROSS_VEL::Int32 = Int32(8)
const PLAYER_Z_VEL::Int32 = Int32(8)

# tie fighter model constants
const NUM_TIE_VERTS::Int32 = Int32(10)
const NUM_TIE_EDGES::Int32 = Int32(8)

# explosion constants
const NUM_EXPLOSIONS::Int32 = Int32(NUM_TIES)

# game states
const GAME_RUNNING::Int32 = Int32(1)
const GAME_OVER::Int32 = Int32(0)

struct Point3D
    color::UInt32
    x::Float32
    y::Float32
    z::Float32
end

struct Line3D
    color::UInt32
    v1::Int32  # index to vertex 1
    v2::Int32  # index to vertex 2
end

struct Vec3D
    x::Float32
    y::Float32
    z::Float32
end

struct Tie
    state::Int32      # 0=dead, 1=alive
    x::Float32
    y::Float32
    z::Float32
    xv::Float32       # velocity
    yv::Float32
    zv::Float32
end

struct Expl
    state::Int32
    counter::Int32
    color::UInt32
    p1::Ptr{Point3D}  # pointer to array of start points
    p2::Ptr{Point3D}  # pointer to array of end points
    vel::Ptr{Vec3D}   # pointer to array of velocities
end

function Base.getproperty(x::Ptr{Expl}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(Expl, f)}(x + offsetof(Expl, Val(f))))
end

function Base.setproperty!(x::Ptr{Expl}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(Expl, f)}(x + offsetof(Expl, Val(f))), v)
end

# Pointer accessors for 3D structs
function Base.getproperty(x::Ptr{Line3D}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(Line3D, f)}(x + offsetof(Line3D, Val(f))))
end

function Base.setproperty!(x::Ptr{Line3D}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(Line3D, f)}(x + offsetof(Line3D, Val(f))), v)
end

function Base.getproperty(x::Ptr{Vec3D}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(Vec3D, f)}(x + offsetof(Vec3D, Val(f))))
end

function Base.setproperty!(x::Ptr{Vec3D}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(Vec3D, f)}(x + offsetof(Vec3D, Val(f))), v)
end

function Base.getproperty(x::Ptr{Tie}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(Tie, f)}(x + offsetof(Tie, Val(f))))
end

function Base.setproperty!(x::Ptr{Tie}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(Tie, f)}(x + offsetof(Tie, Val(f))), v)
end

function Base.getproperty(x::Ptr{Point3D}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(Point3D, f)}(x + offsetof(Point3D, Val(f))))
end

function Base.setproperty!(x::Ptr{Point3D}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(Point3D, f)}(x + offsetof(Point3D, Val(f))), v)
end


struct GameState
    player_x::Float64
    player_y::Float64
    player_vel_x::Float64
    player_vel_y::Float64
    on_ground::Int32
    coyote_time::Float64
    jump_buffer::Float64
    is_jumping::Int32
    keys_up::Ptr{KeyState_up}   
    keys_down::Ptr{KeyState_down}
    keys_pressed::Ptr{KeyState_pressed}
    last_frame_time::UInt64
    quit::Bool
    player_sprite::Ptr{Sprite}
    background_sprite::Ptr{Sprite}
    player::Ptr{Player}
    fullscreen::Bool
    camera_x::Float64
    camera_y::Float64
    left_btn_pressed::Bool
    right_btn_pressed::Bool
    jump_btn_pressed::Bool
    jump_sound::Ptr{Mix_Chunk}
    # 3D game globals
    tie_vlist::Ptr{Point3D}      # vertex list for tie fighter model
    tie_shape::Ptr{Line3D}       # edge list for tie fighter model
    ties::Ptr{Tie}               # tie fighters array
    stars::Ptr{Point3D}          # starfield array
    explosions::Ptr{Expl}        # explosions array
    rgb_green::UInt16
    rgb_white::UInt16
    rgb_red::UInt16
    rgb_blue::UInt16
    cross_x::Float32             # crosshair coordinates
    cross_y::Float32
    cross_x_screen::Int32        # screen crosshair coordinates
    cross_y_screen::Int32
    target_x_screen::Int32       # targeter screen coordinates
    target_y_screen::Int32
    player_z_vel::Int32          # virtual speed of viewpoint/ship
    cannon_state::Int32          # state of laser cannon
    cannon_count::Int32           # laser cannon counter
    misses::Int32                # tracks number of missed ships
    hits::Int32                  # tracks number of hits
    score::Int32                 # player score
    main_track_id::Int32         # main music track id
    laser_id::Int32              # sound of laser pulse
    explosion_id::Int32          # sound of explosion
    flyby_id::Int32              # sound of tie fighter flying by
    game_state_var::Int32        # state of game (GAME_RUNNING/GAME_OVER)
    rng_state::UInt32            # random number generator state
    frame_count::UInt32           # frame counter for FPS calculation
    fps_last_time::UInt64        # last time FPS was printed
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(GameState, f)}(x + offsetof(GameState, Val(f))))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(GameState, f)}(x + offsetof(GameState, Val(f))), v)
end

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"3d test")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(480), UInt32(0))
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

# Utility helpers for manual pointer arithmetic without Julia runtime conversions
@inline function byte_ptr(ptr::Ptr{T}) where {T}
    return Ptr{UInt8}(ptr)
end

@inline function ptr_at(ptr::Ptr{T}, offset::Int64, ::Type{R}) where {T,R}
    return Ptr{R}(byte_ptr(ptr) + offset)
end

# ============================================================================
# RANDOM NUMBER GENERATION (LCG - Linear Congruential Generator)
# ============================================================================
# Simple LCG random number generator (same as glibc)
function rand_next(state::Ptr{GameState})::UInt32
    a::UInt32 = UInt32(1103515245)
    c::UInt32 = UInt32(12345)
    new_state::UInt32 = a * state.rng_state + c
    state.rng_state = new_state
    return new_state
end

# Get random integer in range [0, max)
function rand_int(state::Ptr{GameState}, max::Int32)::Int32
    r::UInt32 = rand_next(state)
    if max <= Int32(0)
        return Int32(0)
    end
    return unsafe_trunc(Int32, r % UInt32(max))
end

# Get random integer in range [min, max)
function rand_range(state::Ptr{GameState}, min::Int32, max::Int32)::Int32
    if max <= min
        return min
    end
    range::Int32 = max - min
    return min + rand_int(state, range)
end

# ============================================================================
# 3D GAME FUNCTIONS
# ============================================================================

# Initialize a tie fighter at a random position
function init_tie(state::Ptr{GameState}, tie_index::Int32)::Cvoid
    if tie_index < Int32(0) || tie_index >= NUM_TIES
        return nothing
    end
    
    tie_ptr::Ptr{Tie} = state.ties + (tie_index * sizeof(Tie))
    tie_ptr.state = Int32(1)
    tie_ptr.x = Float32(rand_range(state, -Int32(640), Int32(640)))
    tie_ptr.y = Float32(rand_range(state, -Int32(480), Int32(480)))
    tie_ptr.z = Float32(Int32(4) * FAR_Z)
    tie_ptr.xv = Float32(rand_range(state, -Int32(4), Int32(4)))
    tie_ptr.yv = Float32(rand_range(state, -Int32(4), Int32(4)))
    tie_ptr.zv = Float32(-Int32(4) - rand_int(state, Int32(64)))
    
    return nothing
end

# Reset a tie fighter to a new random position
function reset_tie(state::Ptr{GameState}, tie_index::Int32)::Cvoid
    if tie_index < Int32(0) || tie_index >= NUM_TIES
        return nothing
    end
    
    tie_ptr::Ptr{Tie} = state.ties + (tie_index * sizeof(Tie))
    tie_ptr.state = Int32(1)
    tie_ptr.x = Float32(rand_range(state, -Int32(640), Int32(640)))
    tie_ptr.y = Float32(rand_range(state, -Int32(480), Int32(480)))
    tie_ptr.z = Float32(Int32(4) * FAR_Z)
    tie_ptr.xv = Float32(rand_range(state, -Int32(4), Int32(4)))
    tie_ptr.yv = Float32(rand_range(state, -Int32(4), Int32(4)))
    tie_ptr.zv = Float32(-Int32(4) - rand_int(state, Int32(64)))
    
    return nothing
end

# Process all tie fighters - update positions
function process_ties(state::Ptr{GameState})::Cvoid
    i::Int32 = Int32(0)
    while i < NUM_TIES
        tie_ptr::Ptr{Tie} = state.ties + (i * sizeof(Tie))
        
        if tie_ptr.state == Int32(0)
            i += Int32(1)
            continue
        end
        
        tie_ptr.z += tie_ptr.zv
        tie_ptr.x += tie_ptr.xv
        tie_ptr.y += tie_ptr.yv
        
        if tie_ptr.z <= Float32(NEAR_Z)
            init_tie(state, i)
            state.misses += Int32(1)
        end
        
        i += Int32(1)
    end
    
    return nothing
end

# Move starfield - update star positions
function move_starfield(state::Ptr{GameState})::Cvoid
    i::Int32 = Int32(0)
    while i < NUM_STARS
        star_ptr::Ptr{Point3D} = state.stars + (i * sizeof(Point3D))
        star_ptr.z -= Float32(state.player_z_vel)
        
        if star_ptr.z <= Float32(NEAR_Z)
            star_ptr.z = Float32(FAR_Z)
        end
        
        i += Int32(1)
    end
    
    return nothing
end

# Draw starfield with perspective projection
function draw_starfield(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Cvoid
    i::Int32 = Int32(0)
    while i < NUM_STARS
        star_ptr::Ptr{Point3D} = state.stars + (i * sizeof(Point3D))
        
        # Step 1: perspective transform
        x_per::Float32 = Float32(VIEW_DISTANCE) * star_ptr.x / star_ptr.z
        y_per::Float32 = Float32(VIEW_DISTANCE) * star_ptr.y / star_ptr.z
        
        # Step 2: compute screen coords
        x_screen::Float32 = Float32(320) + x_per  # WINDOW_WIDTH/2 = 320
        y_screen::Float32 = Float32(240) - y_per  # WINDOW_HEIGHT/2 = 240
        
        # Clip to screen coords
        if x_screen >= Float32(0) && x_screen < Float32(640) && y_screen >= Float32(0) && y_screen < Float32(480)
            # Extract color from star
            color_val::UInt32 = star_ptr.color
            r::UInt8 = UInt8((color_val >> 16) & UInt32(0xFF))
            g::UInt8 = UInt8((color_val >> 8) & UInt32(0xFF))
            b::UInt8 = UInt8(color_val & UInt32(0xFF))
            llvm_SDL_SetRenderDrawColor(renderer, r, g, b, UInt8(255))
            
            x_int::Int32 = unsafe_trunc(Int32, x_screen)
            y_int::Int32 = unsafe_trunc(Int32, y_screen)
            llvm_SDL_RenderDrawPoint(renderer, x_int, y_int)
        end
        
        i += Int32(1)
    end
    
    return nothing
end

# Draw tie fighters with perspective projection and collision detection
function draw_ties(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Cvoid
    i::Int32 = Int32(0)
    while i < NUM_TIES
        tie_ptr::Ptr{Tie} = state.ties + (i * sizeof(Tie))
        
        if tie_ptr.state == Int32(0)
            i += Int32(1)
            continue
        end
        
        # Reset bounding box to impossible values
        bmin_x::Int32 = Int32(100000)
        bmax_x::Int32 = Int32(-100000)
        bmin_y::Int32 = Int32(100000)
        bmax_y::Int32 = Int32(-100000)
        
        # Based on z-distance shade tie fighter
        # Normalize the distance from 0 to max_z then scale it to 31, so the closer the brighter
        # Formula: RGB16Bit(0,(31-31*(ties[index].z/(4*FAR_Z))),0)
        # For SDL, we'll use 0-255 range instead of 0-31
        z_normalized::Float32 = tie_ptr.z / Float32(Int32(4) * FAR_Z)
        green_intensity::Float32 = Float32(255) * (Float32(1.0) - z_normalized)
        if green_intensity < Float32(0.0)
            green_intensity = Float32(0.0)
        elseif green_intensity > Float32(255.0)
            green_intensity = Float32(255.0)
        end
        tie_green::UInt8 = unsafe_trunc(UInt8, green_intensity)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), tie_green, UInt8(0), UInt8(255))
        
        # Draw each edge of the tie fighter
        edge_idx::Int32 = Int32(0)
        while edge_idx < NUM_TIE_EDGES
            edge_ptr::Ptr{Line3D} = state.tie_shape + (edge_idx * sizeof(Line3D))
            
            # Get vertices
            v1_idx::Int32 = edge_ptr.v1
            v2_idx::Int32 = edge_ptr.v2
            v1_ptr::Ptr{Point3D} = state.tie_vlist + (v1_idx * sizeof(Point3D))
            v2_ptr::Ptr{Point3D} = state.tie_vlist + (v2_idx * sizeof(Point3D))
            
            # Step 1: perspective transform each end point
            # Note: translation of each point to the position of the tie fighter
            p1_per_x::Float32 = Float32(VIEW_DISTANCE) * (tie_ptr.x + v1_ptr.x) / (v1_ptr.z + tie_ptr.z)
            p1_per_y::Float32 = Float32(VIEW_DISTANCE) * (tie_ptr.y + v1_ptr.y) / (v1_ptr.z + tie_ptr.z)
            p2_per_x::Float32 = Float32(VIEW_DISTANCE) * (tie_ptr.x + v2_ptr.x) / (v2_ptr.z + tie_ptr.z)
            p2_per_y::Float32 = Float32(VIEW_DISTANCE) * (tie_ptr.y + v2_ptr.y) / (v2_ptr.z + tie_ptr.z)
            
            # Step 2: compute screen coords
            p1_screen_x::Int32 = Int32(320) + unsafe_trunc(Int32, p1_per_x)  # WINDOW_WIDTH/2
            p1_screen_y::Int32 = Int32(240) - unsafe_trunc(Int32, p1_per_y)  # WINDOW_HEIGHT/2
            p2_screen_x::Int32 = Int32(320) + unsafe_trunc(Int32, p2_per_x)
            p2_screen_y::Int32 = Int32(240) - unsafe_trunc(Int32, p2_per_y)
            
            # Step 3: draw the edge
            llvm_SDL_RenderDrawLine(renderer, p1_screen_x, p1_screen_y, p2_screen_x, p2_screen_y)
            
            # Update bounding box using min/max
            min_x::Int32 = p1_screen_x < p2_screen_x ? p1_screen_x : p2_screen_x
            max_x::Int32 = p1_screen_x > p2_screen_x ? p1_screen_x : p2_screen_x
            min_y::Int32 = p1_screen_y < p2_screen_y ? p1_screen_y : p2_screen_y
            max_y::Int32 = p1_screen_y > p2_screen_y ? p1_screen_y : p2_screen_y
            
            if min_x < bmin_x
                bmin_x = min_x
            end
            if max_x > bmax_x
                bmax_x = max_x
            end
            if min_y < bmin_y
                bmin_y = min_y
            end
            if max_y > bmax_y
                bmax_y = max_y
            end
            
            edge_idx += Int32(1)
        end
        
        # Test if this tie has been hit by lasers
        if state.cannon_state == Int32(1)
            target_x::Int32 = state.target_x_screen
            target_y::Int32 = state.target_y_screen
            
            # Simple test: screen coords of bounding box contain laser target
            if target_x > bmin_x && target_x < bmax_x && target_y > bmin_y && target_y < bmax_y
                # This tie is dead meat!
                start_explosion(state, i)
                # TODO: play sound - DSound_Play(explosion_id)
                # Increase score
                state.score += unsafe_trunc(Int32, tie_ptr.z)
                # Add one more hit
                state.hits += Int32(1)
                # Finally reset this tie fighter
                init_tie(state, i)
            end
        end
        
        i += Int32(1)
    end
    
    return nothing
end

# Start explosion when tie fighter is hit
function start_explosion(state::Ptr{GameState}, tie_index::Int32)::Cvoid
    # Find a free explosion slot
    index::Int32 = Int32(0)
    while index < NUM_EXPLOSIONS
        expl_ptr::Ptr{Expl} = state.explosions + (index * sizeof(Expl))
        if expl_ptr.state == Int32(0)
            # Found free slot, initialize explosion
            expl_ptr.state = Int32(1)
            expl_ptr.counter = Int32(0)
            expl_ptr.color = state.rgb_green
            
            # Get the tie fighter that was hit
            tie_ptr::Ptr{Tie} = state.ties + (tie_index * sizeof(Tie))
            
            # Copy edge list to explosion, creating shrapnel
            edge_idx::Int32 = Int32(0)
            while edge_idx < NUM_TIE_EDGES
                edge_ptr::Ptr{Line3D} = state.tie_shape + (edge_idx * sizeof(Line3D))
                
                # Get vertices from tie model
                v1_idx::Int32 = edge_ptr.v1
                v2_idx::Int32 = edge_ptr.v2
                v1_ptr::Ptr{Point3D} = state.tie_vlist + (v1_idx * sizeof(Point3D))
                v2_ptr::Ptr{Point3D} = state.tie_vlist + (v2_idx * sizeof(Point3D))
                
                # Start point of edge (world position)
                p1_ptr::Ptr{Point3D} = expl_ptr.p1 + (edge_idx * sizeof(Point3D))
                unsafe_store!(p1_ptr, Point3D(
                    UInt32(0),
                    tie_ptr.x + v1_ptr.x,
                    tie_ptr.y + v1_ptr.y,
                    tie_ptr.z + v1_ptr.z
                ))
                
                # End point of edge (world position)
                p2_ptr::Ptr{Point3D} = expl_ptr.p2 + (edge_idx * sizeof(Point3D))
                unsafe_store!(p2_ptr, Point3D(
                    UInt32(0),
                    tie_ptr.x + v2_ptr.x,
                    tie_ptr.y + v2_ptr.y,
                    tie_ptr.z + v2_ptr.z
                ))
                
                # Compute trajectory vector for edges (random velocity)
                vel_ptr::Ptr{Vec3D} = expl_ptr.vel + (edge_idx * sizeof(Vec3D))
                vel_x::Float32 = tie_ptr.xv - Float32(8) + Float32(rand_int(state, Int32(16)))
                vel_y::Float32 = tie_ptr.yv - Float32(8) + Float32(rand_int(state, Int32(16)))
                vel_z::Float32 = Float32(-3) + Float32(rand_int(state, Int32(4)))
                unsafe_store!(vel_ptr, Vec3D(vel_x, vel_y, vel_z))
                
                edge_idx += Int32(1)
            end
            
            # Done initializing this explosion
            return nothing
        end
        index += Int32(1)
    end
    
    # No free explosion slot found
    return nothing
end

# Process all explosions - update positions
function process_explosions(state::Ptr{GameState})::Cvoid
    index::Int32 = Int32(0)
    while index < NUM_EXPLOSIONS
        expl_ptr::Ptr{Expl} = state.explosions + (index * sizeof(Expl))
        
        # Test if this explosion is active
        if expl_ptr.state == Int32(1)
            # Update all edges (shrapnel)
            edge_idx::Int32 = Int32(0)
            while edge_idx < NUM_TIE_EDGES
                # Update start point
                p1_ptr::Ptr{Point3D} = expl_ptr.p1 + (edge_idx * sizeof(Point3D))
                vel_ptr::Ptr{Vec3D} = expl_ptr.vel + (edge_idx * sizeof(Vec3D))
                p1_ptr.x += vel_ptr.x
                p1_ptr.y += vel_ptr.y
                p1_ptr.z += vel_ptr.z
                
                # Update end point
                p2_ptr::Ptr{Point3D} = expl_ptr.p2 + (edge_idx * sizeof(Point3D))
                p2_ptr.x += vel_ptr.x
                p2_ptr.y += vel_ptr.y
                p2_ptr.z += vel_ptr.z
                
                edge_idx += Int32(1)
            end
            
            # Test for termination of explosion
            expl_ptr.counter += Int32(1)
            if expl_ptr.counter > Int32(100)
                expl_ptr.state = Int32(0)
                expl_ptr.counter = Int32(0)
            end
        end
        
        index += Int32(1)
    end
    
    return nothing
end

# Draw all explosions
function draw_explosions(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Cvoid
    index::Int32 = Int32(0)
    while index < NUM_EXPLOSIONS
        expl_ptr::Ptr{Expl} = state.explosions + (index * sizeof(Expl))
        
        # Test if this explosion is active
        if expl_ptr.state == Int32(0)
            index += Int32(1)
            continue
        end
        
        # Set color for this explosion
        color_val::UInt32 = expl_ptr.color
        r::UInt8 = UInt8((color_val >> 16) & UInt32(0xFF))
        g::UInt8 = UInt8((color_val >> 8) & UInt32(0xFF))
        b::UInt8 = UInt8(color_val & UInt32(0xFF))
        llvm_SDL_SetRenderDrawColor(renderer, r, g, b, UInt8(255))
        
        # Render each edge of the explosion
        edge_idx::Int32 = Int32(0)
        while edge_idx < NUM_TIE_EDGES
            p1_ptr::Ptr{Point3D} = expl_ptr.p1 + (edge_idx * sizeof(Point3D))
            p2_ptr::Ptr{Point3D} = expl_ptr.p2 + (edge_idx * sizeof(Point3D))
            
            # Test if edge is beyond near clipping plane
            if p1_ptr.z < Float32(NEAR_Z) && p2_ptr.z < Float32(NEAR_Z)
                edge_idx += Int32(1)
                continue
            end
            
            # Step 1: perspective transform each end point
            p1_per_x::Float32 = Float32(VIEW_DISTANCE) * p1_ptr.x / p1_ptr.z
            p1_per_y::Float32 = Float32(VIEW_DISTANCE) * p1_ptr.y / p1_ptr.z
            p2_per_x::Float32 = Float32(VIEW_DISTANCE) * p2_ptr.x / p2_ptr.z
            p2_per_y::Float32 = Float32(VIEW_DISTANCE) * p2_ptr.y / p2_ptr.z
            
            # Step 2: compute screen coords
            p1_screen_x::Int32 = Int32(320) + unsafe_trunc(Int32, p1_per_x)  # WINDOW_WIDTH/2
            p1_screen_y::Int32 = Int32(240) - unsafe_trunc(Int32, p1_per_y)  # WINDOW_HEIGHT/2
            p2_screen_x::Int32 = Int32(320) + unsafe_trunc(Int32, p2_per_x)
            p2_screen_y::Int32 = Int32(240) - unsafe_trunc(Int32, p2_per_y)
            
            # Step 3: draw the edge
            llvm_SDL_RenderDrawLine(renderer, p1_screen_x, p1_screen_y, p2_screen_x, p2_screen_y)
            
            edge_idx += Int32(1)
        end
        
        index += Int32(1)
    end
    
    return nothing
end

# In j_init_game_state, initialize game state
function j_init_game_state(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    printf(c"Initializing game state\n")
    @static if Sys.iswindows()
        printf(c"Windows\n")
    elseif Sys.isapple()
        printf(c"macOS\n")
        platform = llvm_SDL_GetPlatform()
        printf(c"Platform: %s\n", platform)
    else
        printf(c"Linux\n")
    end
    keys_up::Ptr{KeyState_up} = Ptr{KeyState_up}(wasm_malloc(UInt32(sizeof(KeyState_up))))
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false))
    keys_down::Ptr{KeyState_down} = Ptr{KeyState_down}(wasm_malloc(UInt32(sizeof(KeyState_down))))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false))
    keys_pressed::Ptr{KeyState_pressed} = Ptr{KeyState_pressed}(wasm_malloc(UInt32(sizeof(KeyState_pressed))))
    unsafe_store!(Ptr{KeyState_pressed}(keys_pressed), KeyState_pressed(false, false, false, false, false))

    sprite_init_result::Int32 = init_sprite_system()
    if sprite_init_result != 0
        printf(c"Failed to initialize sprite system\n")
    end

    # Initialize audio system
    printf(c"Initializing audio system\n")
    # Mix_Init returns the flags that were successfully initialized
    # MIX_INIT_OGG = 16 (from structs.jl)
    audio_init_result::Int32 = llvm_Mix_Init(Int32(16))  # MIX_INIT_OGG
    
    # # Check if OGG flag was successfully initialized
    if (audio_init_result & Int32(16)) == Int32(0)
        printf(c"Failed to initialize SDL_mixer - OGG support not available\n")
        error_msg_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(256))
        error_msg::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(error_msg_ptr, Int32(256))
        printf(c"SDL Error: %s\n", error_msg)
        wasm_free(Ptr{Cvoid}(error_msg_ptr))
    else
        printf(c"SDL_mixer initialized successfully with OGG support\n")
    end
    
    # Open audio device
    audio_ready::Bool = false
    open_result::Int32 = llvm_Mix_OpenAudio(Int32(44100), UInt16(0x8010), Int32(2), Int32(2048))
    if open_result != Int32(0)
        printf(c"Failed to open audio device, error code: %d\n", open_result)
        # Try to get SDL error message
        error_msg_ptr1::Ptr{Cvoid} = wasm_malloc(UInt32(256))
        error_msg1::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(error_msg_ptr1, Int32(256))
        printf(c"SDL Error: %s\n", error_msg1)
        wasm_free(Ptr{Cvoid}(error_msg_ptr1))
        audio_ready = false
    else
        printf(c"Audio device opened successfully\n")
        audio_ready = true
    end

    # Load jump sound only if audio device is ready
    jump_sound::Ptr{Mix_Chunk} = Ptr{Mix_Chunk}(C_NULL)
    if audio_ready
        # TODO: Fix Mix_LoadWAV crash - might be file path or memory allocation issue
        # In Emscripten, preloaded files are mounted at root with --preload-file
        # So /assets/Jump.wav should be the correct path

        jump_sound_path::Ptr{UInt8} = str_ptr(w"/assets/Jump.wav")
        jump_sound = llvm_Mix_LoadWAV(jump_sound_path)
        
        printf(c"Jump sound loaded\n")
        wasm_free(Ptr{Cvoid}(jump_sound_path))
    else
        printf(c"Skipping sound loading - audio device not ready\n")
    end
    
    # Allocate 3D game arrays
    tie_vlist::Ptr{Point3D} = Ptr{Point3D}(wasm_malloc(UInt32(sizeof(Point3D) * NUM_TIE_VERTS)))
    tie_shape::Ptr{Line3D} = Ptr{Line3D}(wasm_malloc(UInt32(sizeof(Line3D) * NUM_TIE_EDGES)))
    ties::Ptr{Tie} = Ptr{Tie}(wasm_malloc(UInt32(sizeof(Tie) * NUM_TIES)))
    stars::Ptr{Point3D} = Ptr{Point3D}(wasm_malloc(UInt32(sizeof(Point3D) * NUM_STARS)))
    explosions::Ptr{Expl} = Ptr{Expl}(wasm_malloc(UInt32(sizeof(Expl) * NUM_EXPLOSIONS)))
    
    # Initialize explosions arrays (p1, p2, vel for each explosion)
    for i in 0:(NUM_EXPLOSIONS-1)
        expl_ptr = explosions + (i * sizeof(Expl))
        p1_ptr = Ptr{Point3D}(wasm_malloc(UInt32(sizeof(Point3D) * NUM_TIE_EDGES)))
        p2_ptr = Ptr{Point3D}(wasm_malloc(UInt32(sizeof(Point3D) * NUM_TIE_EDGES)))
        vel_ptr = Ptr{Vec3D}(wasm_malloc(UInt32(sizeof(Vec3D) * NUM_TIE_EDGES)))
        unsafe_store!(Ptr{Expl}(expl_ptr), Expl(Int32(0), Int32(0), UInt32(0), p1_ptr, p2_ptr, vel_ptr))
    end
    
    game_state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    # Initialize player at ground level (732.0) minus player height (64)
    unsafe_store!(
        Ptr{GameState}(game_state_ptr), 
        GameState(
            Float64(500), 
            Float64(668), 
            Float64(0), 
            Float64(0), 
            Int32(1), 
            Float64(0), 
            Float64(0), 
            Int32(0), 
            keys_down, 
            keys_up, 
            keys_pressed, 
            UInt64(0), 
            false, 
            Ptr{Sprite}(C_NULL), 
            Ptr{Sprite}(C_NULL), 
            Ptr{Player}(C_NULL), 
            true, 
            Float64(300), 
            Float64(220), 
            false, 
            false, 
            false, 
            jump_sound,
            # 3D game globals
            tie_vlist,
            tie_shape,
            ties,
            stars,
            explosions,
            UInt16(0),  # rgb_green (will be set when bit depth is known)
            UInt16(0),  # rgb_white
            UInt16(0),  # rgb_red
            UInt16(0),  # rgb_blue
            Float32(0.0),  # cross_x
            Float32(0.0),  # cross_y
            Int32(320),    # cross_x_screen (WINDOW_WIDTH/2)
            Int32(240),    # cross_y_screen (WINDOW_HEIGHT/2)
            Int32(320),    # target_x_screen
            Int32(240),    # target_y_screen
            Int32(4),      # player_z_vel
            Int32(0),      # cannon_state
            Int32(0),      # cannon_count
            Int32(0),      # misses
            Int32(0),      # hits
            Int32(0),      # score
            Int32(-1),     # main_track_id
            Int32(-1),     # laser_id
            Int32(-1),     # explosion_id
            Int32(-1),     # flyby_id
            GAME_RUNNING,  # game_state_var
            UInt32(12345),  # rng_state (seed)
            UInt32(0),      # frame_count
            UInt64(0)       # fps_last_time
        )
    )

    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false
    
    # Initialize tie fighter model - vertex list (hardcoded, no arrays)
    v0::Ptr{Point3D} = tie_vlist + (Int32(0) * sizeof(Point3D))
    unsafe_store!(v0, Point3D(UInt32(0), Float32(-40), Float32(40), Float32(0)))
    v1::Ptr{Point3D} = tie_vlist + (Int32(1) * sizeof(Point3D))
    unsafe_store!(v1, Point3D(UInt32(0), Float32(-40), Float32(0), Float32(0)))
    v2::Ptr{Point3D} = tie_vlist + (Int32(2) * sizeof(Point3D))
    unsafe_store!(v2, Point3D(UInt32(0), Float32(-40), Float32(-40), Float32(0)))
    v3::Ptr{Point3D} = tie_vlist + (Int32(3) * sizeof(Point3D))
    unsafe_store!(v3, Point3D(UInt32(0), Float32(-10), Float32(0), Float32(0)))
    v4::Ptr{Point3D} = tie_vlist + (Int32(4) * sizeof(Point3D))
    unsafe_store!(v4, Point3D(UInt32(0), Float32(0), Float32(20), Float32(0)))
    v5::Ptr{Point3D} = tie_vlist + (Int32(5) * sizeof(Point3D))
    unsafe_store!(v5, Point3D(UInt32(0), Float32(10), Float32(0), Float32(0)))
    v6::Ptr{Point3D} = tie_vlist + (Int32(6) * sizeof(Point3D))
    unsafe_store!(v6, Point3D(UInt32(0), Float32(0), Float32(-20), Float32(0)))
    v7::Ptr{Point3D} = tie_vlist + (Int32(7) * sizeof(Point3D))
    unsafe_store!(v7, Point3D(UInt32(0), Float32(40), Float32(40), Float32(0)))
    v8::Ptr{Point3D} = tie_vlist + (Int32(8) * sizeof(Point3D))
    unsafe_store!(v8, Point3D(UInt32(0), Float32(40), Float32(0), Float32(0)))
    v9::Ptr{Point3D} = tie_vlist + (Int32(9) * sizeof(Point3D))
    unsafe_store!(v9, Point3D(UInt32(0), Float32(40), Float32(-40), Float32(0)))
    
    # Initialize tie fighter model - edge list (hardcoded, no arrays)
    e0::Ptr{Line3D} = tie_shape + (Int32(0) * sizeof(Line3D))
    unsafe_store!(e0, Line3D(UInt32(0), Int32(0), Int32(2)))
    e1::Ptr{Line3D} = tie_shape + (Int32(1) * sizeof(Line3D))
    unsafe_store!(e1, Line3D(UInt32(0), Int32(1), Int32(3)))
    e2::Ptr{Line3D} = tie_shape + (Int32(2) * sizeof(Line3D))
    unsafe_store!(e2, Line3D(UInt32(0), Int32(3), Int32(4)))
    e3::Ptr{Line3D} = tie_shape + (Int32(3) * sizeof(Line3D))
    unsafe_store!(e3, Line3D(UInt32(0), Int32(4), Int32(5)))
    e4::Ptr{Line3D} = tie_shape + (Int32(4) * sizeof(Line3D))
    unsafe_store!(e4, Line3D(UInt32(0), Int32(5), Int32(6)))
    e5::Ptr{Line3D} = tie_shape + (Int32(5) * sizeof(Line3D))
    unsafe_store!(e5, Line3D(UInt32(0), Int32(6), Int32(3)))
    e6::Ptr{Line3D} = tie_shape + (Int32(6) * sizeof(Line3D))
    unsafe_store!(e6, Line3D(UInt32(0), Int32(5), Int32(8)))
    e7::Ptr{Line3D} = tie_shape + (Int32(7) * sizeof(Line3D))
    unsafe_store!(e7, Line3D(UInt32(0), Int32(7), Int32(9)))
    
    # Initialize starfield with random positions
    i = Int32(0)
    while i < NUM_STARS
        star_ptr::Ptr{Point3D} = stars + (i * sizeof(Point3D))
        x::Int32 = rand_int(game_state_ptr, Int32(640))
        y::Int32 = rand_int(game_state_ptr, Int32(480))
        z::Int32 = NEAR_Z + rand_int(game_state_ptr, FAR_Z - NEAR_Z)
        unsafe_store!(star_ptr, Point3D(UInt32(0xFFFFFFFF), Float32(x), Float32(y), Float32(z)))
        i += Int32(1)
    end
    
    # Initialize all tie fighters
    i = Int32(0)
    while i < NUM_TIES
        init_tie(game_state_ptr, i)
        i += Int32(1)
    end
    
    printf(c"3D game data initialized\n")

    # # --- Load sprite if not loaded ---
    if game_state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading player sprite\n")
        sprite_path::Ptr{UInt8} = str_ptr(w"assets/game.png")
        game_state_ptr.player_sprite = load_sprite(renderer, sprite_path, Int32(120), Int32(360), Int32(8), Int32(8), Int32(64), Int32(64))
        wasm_free(Ptr{Cvoid}(sprite_path))
        
        if game_state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
            error_ptr = wasm_malloc(UInt32(100))
            error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
            printf(c"Error: %s\n", error)
            wasm_free(Ptr{Cvoid}(error_ptr))
        end
    end

    if game_state_ptr.background_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading background sprite\n")
        sprite_path_1::Ptr{UInt8} = str_ptr(w"assets/map.png")
        game_state_ptr.background_sprite = load_sprite(renderer, sprite_path_1, Int32(0), Int32(0), Int32(640), Int32(640), Int32(640), Int32(640))
        wasm_free(Ptr{Cvoid}(sprite_path_1))

        if game_state_ptr.background_sprite == Ptr{Sprite}(C_NULL)
            error_ptr = wasm_malloc(UInt32(100))
            error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
            printf(c"Error: %s\n", error)
            wasm_free(Ptr{Cvoid}(error_ptr))
        end
    end

    return game_state_ptr
end

# 3D Game Loop
function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    perf_freq::UInt64 = llvm_SDL_GetPerformanceFrequency()
    
    # FPS tracking - print every second
    if game_state.fps_last_time == UInt64(0)
        game_state.fps_last_time = current_time
    end
    
    game_state.frame_count += UInt32(1)
    time_elapsed::UInt64 = current_time - game_state.fps_last_time
    time_elapsed_seconds::Float64 = Float64(time_elapsed) / Float64(perf_freq)
    
    if time_elapsed_seconds >= Float64(1.0)
        fps::Float64 = Float64(game_state.frame_count) / time_elapsed_seconds
        printf(c"FPS: %.1f\n", fps)
        game_state.frame_count = UInt32(0)
        game_state.fps_last_time = current_time
    end
    
    # Use persistent key state from GameState
    keys_down_ptr::Ptr{KeyState_down} = game_state.keys_down  
    keys_up_ptr::Ptr{KeyState_up} = game_state.keys_up
    keys_pressed_ptr::Ptr{KeyState_pressed} = game_state.keys_pressed
    handle_input(keys_down_ptr, keys_up_ptr, keys_pressed_ptr, game_state, window)
    
    # Update cannon state
    if game_state.cannon_state == Int32(1)
        game_state.cannon_count += Int32(1)
        if game_state.cannon_count > Int32(10)  # Fire duration
            game_state.cannon_state = Int32(0)
            game_state.cannon_count = Int32(0)
        end
    end
    
    # Update crosshair position based on input
    if keys_down_ptr.w || keys_down_ptr.s
        if keys_down_ptr.w
            game_state.cross_y -= Float32(CROSS_VEL)
        end
        if keys_down_ptr.s
            game_state.cross_y += Float32(CROSS_VEL)
        end
    end
    if keys_down_ptr.a || keys_down_ptr.d
        if keys_down_ptr.a
            game_state.cross_x -= Float32(CROSS_VEL)
        end
        if keys_down_ptr.d
            game_state.cross_x += Float32(CROSS_VEL)
        end
    end
    
    # Update targeter to match crosshair
    game_state.target_x_screen = game_state.cross_x_screen
    game_state.target_y_screen = game_state.cross_y_screen
    
    # Fire cannon on space
    if keys_pressed_ptr.space
        game_state.cannon_state = Int32(1)
        game_state.cannon_count = Int32(0)
    end
    
    # Process game objects
    move_starfield(game_state)
    process_ties(game_state)
    process_explosions(game_state)
    
    # --- Render ---
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Draw starfield
    draw_starfield(game_state, renderer)
    
    # Draw tie fighters
    draw_ties(game_state, renderer)
    
    # Draw explosions
    draw_explosions(game_state, renderer)
    
    # Draw crosshair
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
    cross_x_int::Int32 = game_state.cross_x_screen
    cross_y_int::Int32 = game_state.cross_y_screen
    llvm_SDL_RenderDrawLine(renderer, cross_x_int - Int32(10), cross_y_int, cross_x_int + Int32(10), cross_y_int)
    llvm_SDL_RenderDrawLine(renderer, cross_x_int, cross_y_int - Int32(10), cross_x_int, cross_y_int + Int32(10))
    
    llvm_SDL_RenderPresent(renderer)
    llvm_SDL_Delay(UInt32(5))  # ~60 FPS
    
    return game_state
end

# Helper function for smooth movement
function move_toward(current::Float64, target::Float64, max_delta::Float64)::Float64
    if target > current
        return min(current + max_delta, target)
    elseif target < current
        return max(current - max_delta, target)
    else
        return target
    end
end

function handle_input(keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up}, keys_pressed::Ptr{KeyState_pressed}, game_state::Ptr{GameState}, window::Ptr{SDL_Window})::Int32
    # Reset key states for this frame
    keys_up.a = false
    keys_up.d = false
    keys_up.w = false
    keys_up.s = false
    keys_up.space = false
    
    # Reset key press states for this frame (these are one-time events)
    keys_pressed.a = false
    keys_pressed.d = false
    keys_pressed.w = false
    keys_pressed.s = false
    keys_pressed.space = false

    event::SDL_Event = SDL_Event()
    event_ptr::Ptr{SDL_Event} = wasm_malloc(UInt32(56))
    while llvm_SDL_PollEvent(event_ptr) != 0
        eventType = event_ptr.type
        if eventType == SDL_QUIT
            game_state.quit = true
        elseif eventType == SDL_KEYDOWN
            key = event_ptr.key.keysym.sym
            if key == SDLK_a
                keys_down.a = true
                keys_pressed.a = true
            elseif key == SDLK_d
                keys_down.d = true
                keys_pressed.d = true
            elseif key == SDLK_w
                keys_down.w = true
                keys_pressed.w = true
            elseif key == SDLK_s
                keys_down.s = true
                keys_pressed.s = true
            elseif key == SDLK_SPACE
                keys_down.space = true
                keys_pressed.space = true
            elseif key == SDLK_ESCAPE
                game_state.quit = true
            elseif key == SDLK_RETURN
                game_state.fullscreen = !game_state.fullscreen
                if game_state.fullscreen
                    llvm_SDL_SetWindowFullscreen(window, UInt32(1))
                else
                    llvm_SDL_SetWindowFullscreen(window, UInt32(0))
                end
            end
        elseif eventType == SDL_KEYUP
            key = event_ptr.key.keysym.sym
            if key == SDLK_a
                keys_up.a = true
            elseif key == SDLK_d
                keys_up.d = true
            elseif key == SDLK_w
                keys_up.w = true
            elseif key == SDLK_s
                keys_up.s = true
            elseif key == SDLK_SPACE
                keys_up.space = true
            end
        # --- Mobile Touch Events ---
        elseif eventType == SDL_FINGERDOWN || eventType == SDL_FINGERMOTION
            # Get window size and button rects (must match render loop)
            win_w_ptr = Ref{Int32}(0)
            win_h_ptr = Ref{Int32}(0)
            llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
            win_w = win_w_ptr[]
            win_h = win_h_ptr[]
            btn_area_h = win_h / Int32(4)
            btn_area_y = win_h - btn_area_h
            btn_w = win_w / Int32(3)
            #Get touch position (normalized 0-1)
            tx = Float64(event_ptr.tfinger.x)
            ty = Float64(event_ptr.tfinger.y)
            px = tx * Float64(win_w)
            py = ty * Float64(win_h)
            game_state.left_btn_pressed = false
            game_state.right_btn_pressed = false
            game_state.jump_btn_pressed = false
            if px >= 0 && px < btn_w && py >= btn_area_y
                keys_down.a = true
                game_state.left_btn_pressed = true
            end
            if px >= 2 * btn_w && px < 3 * btn_w && py >= btn_area_y
                keys_down.d = true
                game_state.right_btn_pressed = true
            end
            if px >= btn_w && px < 2 * btn_w && py >= btn_area_y
                keys_down.space = true
                game_state.jump_btn_pressed = true
            end
        elseif eventType == SDL_FINGERUP
            # On finger up, clear all touch key states and pressed states
            keys_down.a = false
            keys_down.d = false
            keys_down.space = false
            game_state.left_btn_pressed = false
            game_state.right_btn_pressed = false
            game_state.jump_btn_pressed = false
        end
    end

    if keys_up.a
        keys_down.a = false
    end
    if keys_up.d
        keys_down.d = false
    end
    if keys_up.w
        keys_down.w = false
    end
    if keys_up.s
        keys_down.s = false
    end
    if keys_up.space
        keys_down.space = false
    end

    wasm_free(Ptr{Cvoid}(event_ptr))
    return Int32(0)
end

# PC Entry Point - Main function for desktop builds
function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))

    window::Ptr{SDL_Window} = j_init_window()
    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    game_state_ptr::Ptr{GameState} = j_init_game_state(renderer, window)
    while !game_state_ptr.quit
        game_loop(game_state_ptr, renderer, window)
    end

    cleanup(game_state_ptr, renderer, window)
    
    return Int32(0)
end

function cleanup(game_state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})
    # Free sprite resources
    if game_state_ptr.player_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(game_state_ptr.player_sprite)
    end
    
    # Free 3D game arrays
    if game_state_ptr.explosions != Ptr{Expl}(C_NULL)
        # Free explosion sub-arrays (p1, p2, vel for each explosion)
        for i in 0:(NUM_EXPLOSIONS-1)
            expl_ptr = game_state_ptr.explosions + (i * sizeof(Expl))
            expl = unsafe_load(Ptr{Expl}(expl_ptr))
            if expl.p1 != Ptr{Point3D}(C_NULL)
                wasm_free(Ptr{Cvoid}(expl.p1))
            end
            if expl.p2 != Ptr{Point3D}(C_NULL)
                wasm_free(Ptr{Cvoid}(expl.p2))
            end
            if expl.vel != Ptr{Vec3D}(C_NULL)
                wasm_free(Ptr{Cvoid}(expl.vel))
            end
        end
        wasm_free(Ptr{Cvoid}(game_state_ptr.explosions))
    end
    
    if game_state_ptr.stars != Ptr{Point3D}(C_NULL)
        wasm_free(Ptr{Cvoid}(game_state_ptr.stars))
    end
    
    if game_state_ptr.ties != Ptr{Tie}(C_NULL)
        wasm_free(Ptr{Cvoid}(game_state_ptr.ties))
    end
    
    if game_state_ptr.tie_shape != Ptr{Line3D}(C_NULL)
        wasm_free(Ptr{Cvoid}(game_state_ptr.tie_shape))
    end
    
    if game_state_ptr.tie_vlist != Ptr{Point3D}(C_NULL)
        wasm_free(Ptr{Cvoid}(game_state_ptr.tie_vlist))
    end
    
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_pressed))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    #llvm_IMG_Quit()  # Cleanup SDL2_image

    llvm_SDL_Quit()
end

