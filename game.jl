# combined_game_working.jl
using StaticTools
using StaticCompiler

include("structs.jl")
include("llvm_wrappers.jl") 

# Julia functions that will call C functions
# These are just stubs - the actual implementation is in C
function init_sdl_drawing()::Int32
    # This will be linked to the C function init_sdl_drawing()
    return Int32(0)  # Placeholder return
end

# Convenient Julia wrapper functions for game state management
function j_init_game_state()::Int32
    printf(c"Initializing game state\n")
    call_init_game_state()
    
    # Initialize default game state values (use Float32 for position/velocity)
    result = set_game_state_simple(Int32(1), Float32(5.0))  # player_x
    result = set_game_state_simple(Int32(2), Float32(5.0))  # player_y
    result = set_game_state_simple(Int32(3), Float32(0.0))  # player_vel_x
    result = set_game_state_simple(Int32(4), Float32(0.0))  # player_vel_y
    result = set_game_state_simple(Int32(5), Int32(1))      # on_ground
    result = set_game_state_simple(Int32(6), Float32(0.0))  # coyote_time
    result = set_game_state_simple(Int32(7), Float32(0.0))  # jump_buffer
    result = set_game_state_simple(Int32(8), Int32(0))      # is_jumping
    printf(c"SDL_CreateWindow\n")
    #call_create_window_hardcoded()
    #window = SDL_CreateWindow()
    llvm_create_window()
    printf(c"SDL_CreateWindow done\n")

    return result
end

# Simplified game state functions that avoid Julia runtime dependencies
function set_game_state_simple(key_id::Int32, value::Union{Int32, Float32})::Int32
    # Use numeric keys instead of strings to avoid Julia runtime
    return call_set_game_state_simple(key_id, value)
end

function get_game_state_simple(key_id::Int32)::Int32
    return call_get_game_state_simple(key_id)
end

function has_game_state_simple(key_id::Int32)::Int32
    return call_has_game_state_simple(key_id)
end

function remove_game_state_simple(key_id::Int32)::Int32
    return call_remove_game_state_simple(key_id)
end

function get_delta_time()::Float64
    return call_get_delta_time()
end 

function get_game_state_simple_float(key_id::Int32)::Float64
    return call_get_game_state_simple_float(key_id)
end

function print_string(str::StaticString)::Int32
    # No idea why this is needed twice. TODO: figure out why.
    call_print_string(pointer(str))
    call_print_string(pointer(str))

    return Int32(0)
end

function draw_game_frame(x::Int32, y::Int32, on_ground::Int32)::Int32
    delta_time::Float64 = get_delta_time()
    input = call_update_input(x)

    test_rect = SDL_Rect(Int32(0), Int32(0), Int32(100), Int32(100))    
    call_draw_rect(test_rect)

    #ticks = llvm_SDL_GetTicks()
    #printf(c"ticks: %d\n", ticks)

    # Game state variables
    player_x::Float32 = get_game_state_simple_float(Int32(1))
    player_y::Float32 = get_game_state_simple_float(Int32(2))
    player_vel_x::Float32 = get_game_state_simple_float(Int32(3))
    player_vel_y::Float32 = get_game_state_simple_float(Int32(4))
    on_ground = get_game_state_simple(Int32(5))
    coyote_time::Float32 = get_game_state_simple_float(Int32(6))  # For coyote time
    jump_buffer::Float32 = get_game_state_simple_float(Int32(7))  # For jump buffering
    is_jumping::Int32 = get_game_state_simple(Int32(8))         # Track jump state

    # --- Platformer Physics ---
    gravity::Float64 = 15.0             # Gravity strength
    jump_velocity::Float32 = -12.0f0    # Initial jump velocity
    ground_y::Float32 = 5.0f0           # Ground level
    move_accel::Float32 = 800.0f0         # Horizontal acceleration
    ground_decel::Float32 = 800.0f0       # Ground deceleration
    air_decel::Float32 = 400.0f0          # Air deceleration
    max_speed::Float32 = 400.0f0          # Max horizontal speed
    coyote_duration::Float32 = 0.1f0    # Time window for coyote time
    jump_buffer_duration::Float32 = 0.1f0 # Time window for jump buffering
    jump_cancel_gravity_scale::Float32 = 0.5f0 # Reduce gravity when jump button released

    # --- Coyote Time Update ---
    if on_ground == Int32(1)
        coyote_time = coyote_duration
    else
        coyote_time -= delta_time
    end

    # --- Jump Buffering Update ---
    if input == Int32(5)  # Jump button pressed
        jump_buffer = jump_buffer_duration
    else
        jump_buffer -= delta_time
    end

    # --- Horizontal movement (simplified) ---
    target_vel_x::Float32 = 0.0f0
    if input == Int32(1)      # A
        target_vel_x = -max_speed
    elseif input == Int32(2)  # D
        target_vel_x = max_speed
    end

    # Apply movement (simplified logic)
    if on_ground == Int32(1)
        player_vel_x = move_toward(player_vel_x, target_vel_x, Float32(move_accel * delta_time))
    else
        player_vel_x = move_toward(player_vel_x, target_vel_x, Float32(air_decel * delta_time))
    end

    set_game_state_simple(Int32(3), Float32(player_vel_x))

    # --- Jumping ---
    # Check if we can jump (either on ground or in coyote time)
    can_jump = (on_ground == Int32(1) || coyote_time > 0.0f0) && !(is_jumping == Int32(1) && player_vel_y < 0.0f0)
    
    # Jump if button pressed and either can jump now or has buffered jump
    if (can_jump && input == Int32(5)) || (on_ground == Int32(1) && jump_buffer > 0.0f0)
        print_string(c"Jumping\n")
        
        #print_string(ptr)
        player_vel_y = jump_velocity
        set_game_state_simple(Int32(4), Float32(player_vel_y))
        set_game_state_simple(Int32(5), Int32(0))  # Not on ground
        set_game_state_simple(Int32(8), Int32(1))   # Is jumping
        coyote_time = 0.0f0  # Consume coyote time
        jump_buffer = 0.0f0  # Consume jump buffer
    end

    # Variable jump height (cancel jump when button released)
    if is_jumping == Int32(1) && player_vel_y < 0.0f0 && input != Int32(5)
        player_vel_y *= jump_cancel_gravity_scale
        set_game_state_simple(Int32(4), Float32(player_vel_y))
    end

    # --- Gravity ---
    if on_ground == Int32(0)
        player_vel_y += Float32(gravity * delta_time)
        set_game_state_simple(Int32(4), Float32(player_vel_y))
    else
        is_jumping = Int32(0)
        set_game_state_simple(Int32(8), Int32(0))
    end

    # --- Update Position ---
    player_x += Float32(player_vel_x * delta_time)
    player_y += Float32(player_vel_y * delta_time)

    # --- Ground Collision ---
    if player_y >= ground_y
        player_y = ground_y
        player_vel_y = 0.0f0
        set_game_state_simple(Int32(5), Int32(1))  # On ground
        set_game_state_simple(Int32(4), Float32(player_vel_y))
    else
        set_game_state_simple(Int32(5), Int32(0))  # In air
    end

    # --- Save State ---
    set_game_state_simple(Int32(1), Float32(player_x))
    set_game_state_simple(Int32(2), Float32(player_y))
    set_game_state_simple(Int32(6), Float32(coyote_time))
    set_game_state_simple(Int32(7), Float32(jump_buffer))
    set_game_state_simple(Int32(8), Int32(is_jumping))

    # --- Render ---
    val = call_render_rect(Int32(255), Int32(0), Int32(0), Int32(255),
                           Float32(player_x), Float32(player_y), Int32(64), Int32(64))

    return Int32(0)
end

# Helper function for smooth movement
function move_toward(current::Float32, target::Float32, max_delta::Float32)::Float32
    if target > current
        return min(current + max_delta, target)
    elseif target < current
        return max(current - max_delta, target)
    else
        return target
    end
end

# Initialize SDL (simple wrapper)
function init_sdl()::Int32
    return init_sdl_drawing()
end