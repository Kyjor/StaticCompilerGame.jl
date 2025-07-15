# combined_game_working.jl
using StaticTools
using StaticCompiler

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

function print_game_state()
    call_print_game_state()
end

function get_game_state_count()::Int32
    return call_get_game_state_count()
end

function get_delta_time()::Float64
    return call_get_delta_time()
end 

function get_game_state_simple_float(key_id::Int32)::Float64
    return call_get_game_state_simple_float(key_id)
end

function draw_game_frame(x::Int32, y::Int32, on_ground::Int32)::Int32
    delta_time::Float64 = get_delta_time()
    #printf(c"delta_time: %f\n", delta_time)
    input = call_update_input(x)
    # # Use simple integer keys: 1=player_x, 2=player_y, 3=player_vel_x, 4=player_vel_y, 5=on_ground
    player_x = get_game_state_simple_float(Int32(1))
    player_y = get_game_state_simple_float(Int32(2))
    player_vel_x = get_game_state_simple_float(Int32(3))
    player_vel_y = get_game_state_simple_float(Int32(4))
    on_ground = get_game_state_simple(Int32(5))
    
    # --- Platformer Physics ---
    gravity = 8.0f0  # Gravity strength (positive is down)
    jump_velocity = -10.0f0  # Negative is up (since positive y is down)
    ground_y = 5.0f0
    move_speed = 100.0f0  # Units per second

    # Horizontal movement
    if input == Int32(1) # A
        player_vel_x = -move_speed
    elseif input == Int32(2) # D
        player_vel_x = move_speed
    else
        player_vel_x = 0.0f0
    end
    set_game_state_simple(Int32(3), Float32(player_vel_x))

    # Jumping
    if input == Int32(5) && on_ground == Int32(1)
        player_vel_y = jump_velocity
        set_game_state_simple(Int32(4), Float32(player_vel_y))
        set_game_state_simple(Int32(5), Int32(0))  # Not on ground after jump
    end

    # Apply gravity if not on ground
    if on_ground == Int32(0)
        player_vel_y = player_vel_y + gravity * delta_time
        set_game_state_simple(Int32(4), Float32(player_vel_y))
    end

    # Update positions by velocity * delta_time
    player_x = player_x + player_vel_x * delta_time
    player_y = player_y + player_vel_y * delta_time

    # Ground collision
    if player_y >= ground_y
        player_y = ground_y
        player_vel_y = 0.0f0
        set_game_state_simple(Int32(5), Int32(1))  # On ground
        set_game_state_simple(Int32(4), Float32(player_vel_y))
    else
        set_game_state_simple(Int32(5), Int32(0))  # In air
    end

    set_game_state_simple(Int32(1), Float32(player_x))
    set_game_state_simple(Int32(2), Float32(player_y))

    printf(c"player_x: %f, player_y: %f\n", player_x, player_y)
    val = call_render_rect(Int32(255), Int32(0), Int32(0), Int32(255), Float32(player_x), Float32(player_y), Int32(64), Int32(64))
    #if input != 0
    #    printf(c"Input: %d\n", input)
    #end
    return Int32(0)
end

# Initialize SDL (simple wrapper)
function init_sdl()::Int32
    return init_sdl_drawing()
end