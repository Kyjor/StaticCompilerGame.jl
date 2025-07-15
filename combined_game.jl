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
    
    # Initialize default game state values
    result = set_game_state_simple(Int32(1), Int32(5))  # player_x
    result = set_game_state_simple(Int32(2), Int32(5))  # player_y
    result = set_game_state_simple(Int32(3), Int32(0))    # player_vel_x
    result = set_game_state_simple(Int32(4), Int32(0))    # player_vel_y
    result = set_game_state_simple(Int32(5), Int32(1))    # on_ground
    
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

function draw_game_frame(x::Int32, y::Int32, on_ground::Int32)::Int32
    delta_time::Float64 = get_delta_time()
    printf(c"delta_time: %f\n", delta_time)
    input = call_update_input(x)
    # Use simple integer keys: 1=player_x, 2=player_y, 3=player_vel_x, 4=player_vel_y, 5=on_ground
    player_x = get_game_state_simple(Int32(1))
    player_y = get_game_state_simple(Int32(2))
    player_vel_x = get_game_state_simple(Int32(3))
    player_vel_y = get_game_state_simple(Int32(4))
    on_ground = get_game_state_simple(Int32(5))
    set_game_state_simple(Int32(1), Float32(player_x))
    # --- Platformer Physics ---
    gravity = Int32(1)  # Gravity strength (positive is down)
    jump_velocity = Int32(-2)  # Negative is up (since positive y is down)
    ground_y = Int32(5)

    # Horizontal movement
    if input == Int32(1) # A
        set_game_state_simple(Int32(1), Int32(player_x - 1))
    elseif input == Int32(2) # D
        set_game_state_simple(Int32(1), Int32(player_x + 1))
    end

    # Jumping
    if input == Int32(5) && on_ground == Int32(1)
        player_vel_y = jump_velocity
        set_game_state_simple(Int32(4), player_vel_y)
        set_game_state_simple(Int32(5), Int32(0))  # Not on ground after jump
    end

    # Apply gravity if not on ground
    if on_ground == Int32(0)
        player_vel_y = player_vel_y + gravity
        set_game_state_simple(Int32(4), player_vel_y)
    end

    # Update player_y by velocity
    player_y = player_y + player_vel_y

    # Ground collision
    if player_y >= ground_y
        player_y = ground_y
        player_vel_y = Int32(0)
        set_game_state_simple(Int32(5), Int32(1))  # On ground
        set_game_state_simple(Int32(4), player_vel_y)
    else
        set_game_state_simple(Int32(5), Int32(0))  # In air
    end

    set_game_state_simple(Int32(2), player_y)

    val = call_render_rect(Int32(255), Int32(0), Int32(0), Int32(255), player_x, player_y, Int32(64), Int32(64))
    #if input != 0
    #    printf(c"Input: %d\n", input)
    #end
    return Int32(0)
end

# Initialize SDL (simple wrapper)
function init_sdl()::Int32
    return init_sdl_drawing()
end