using StaticTools

# Simple stateless platformer logic for WebAssembly
# Takes current state as input, returns new state

function web_platformer_update(
    square_x::Int32,
    square_y::Int32,
    square_vel_x::Int32,
    square_vel_y::Int32,
    key_left::Int32,
    key_right::Int32,
    key_space::Int32,
    on_ground::Int32
)::Int32
    # Game constants
    screen_width = Int32(800)
    screen_height = Int32(600)
    square_size = Int32(32)
    move_speed = Int32(5)
    gravity = Int32(1)
    jump_strength = Int32(-12)
    
    # Convert boolean inputs
    key_left_bool = key_left != Int32(0)
    key_right_bool = key_right != Int32(0)
    key_space_bool = key_space != Int32(0)
    on_ground_bool = on_ground != Int32(0)
    
    # Apply gravity
    new_vel_y = square_vel_y + gravity
    
    # Handle horizontal movement
    new_vel_x = if key_left_bool
        -move_speed
    elseif key_right_bool
        move_speed
    else
        Int32(0)
    end
    
    # Handle jumping
    if key_space_bool && on_ground_bool
        new_vel_y = jump_strength
    end
    
    # Update position
    new_x = square_x + new_vel_x
    new_y = square_y + new_vel_y
    
    # Keep square on screen
    if new_x < Int32(0)
        new_x = Int32(0)
    elseif new_x > screen_width - square_size
        new_x = screen_width - square_size
    end
    
    # Ground collision
    ground_y = screen_height - square_size - Int32(20)
    new_on_ground = new_y >= ground_y
    
    if new_on_ground
        new_y = ground_y
        new_vel_y = Int32(0)
    end
    
    # Pack the new state into a single Int32
    # Format: [x(8bits) | y(8bits) | vel_x(4bits) | vel_y(4bits) | on_ground(1bit) | state(3bits)]
    # For simplicity, return a state code for visual feedback
    
    if key_space_bool
        return Int32(2)  # Yellow - jumping
    elseif new_on_ground
        return Int32(1)  # Green - on ground
    else
        return Int32(0)  # Red - in air
    end
end

# Alternative: separate functions for different aspects
function web_platformer_get_x(
    square_x::Int32,
    square_y::Int32,
    square_vel_x::Int32,
    square_vel_y::Int32,
    key_left::Int32,
    key_right::Int32,
    key_space::Int32,
    on_ground::Int32
)::Int32
    screen_width = Int32(800)
    square_size = Int32(32)
    move_speed = Int32(5)
    
    key_left_bool = key_left != Int32(0)
    key_right_bool = key_right != Int32(0)
    
    new_vel_x = if key_left_bool
        -move_speed
    elseif key_right_bool
        move_speed
    else
        Int32(0)
    end
    
    new_x = square_x + new_vel_x
    
    if new_x < Int32(0)
        new_x = Int32(0)
    elseif new_x > screen_width - square_size
        new_x = screen_width - square_size
    end
    
    return new_x
end

function web_platformer_get_y(
    square_x::Int32,
    square_y::Int32,
    square_vel_x::Int32,
    square_vel_y::Int32,
    key_left::Int32,
    key_right::Int32,
    key_space::Int32,
    on_ground::Int32
)::Int32
    screen_height = Int32(600)
    square_size = Int32(32)
    gravity = Int32(1)
    jump_strength = Int32(-12)
    
    key_space_bool = key_space != Int32(0)
    on_ground_bool = on_ground != Int32(0)
    
    new_vel_y = square_vel_y + gravity
    
    if key_space_bool && on_ground_bool
        new_vel_y = jump_strength
    end
    
    new_y = square_y + new_vel_y
    
    ground_y = screen_height - square_size - Int32(20)
    
    if new_y >= ground_y
        new_y = ground_y
    end
    
    return new_y
end 