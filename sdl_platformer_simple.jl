using StaticTools

# Simple stateless Julia functions for SDL2 integration
# All state is managed in JavaScript, Julia just handles calculations

# Update physics and return new state values
function julia_update_physics(
    square_x::Int32,
    square_y::Int32, 
    square_vel_x::Int32,
    square_vel_y::Int32,
    on_ground::Int32,
    key_a::Int32,        # Left key
    key_d::Int32,        # Right key  
    key_space::Int32     # Jump key
)::Int32
    # Game constants
    screen_width = Int32(800)
    screen_height = Int32(600)
    square_size = Int32(32)
    move_speed = Int32(5)
    gravity = Int32(1)
    jump_strength = Int32(-12)
    ground_height = Int32(20)
    
    # Convert inputs to booleans
    key_left = key_a != Int32(0)
    key_right = key_d != Int32(0)
    key_jump = key_space != Int32(0)
    is_on_ground = on_ground != Int32(0)
    
    # Apply gravity
    new_vel_y = square_vel_y + gravity
    
    # Handle horizontal movement
    new_vel_x = if key_left
        -move_speed
    elseif key_right
        move_speed
    else
        Int32(0)
    end
    
    # Handle jumping
    if key_jump && is_on_ground
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
    ground_y = screen_height - square_size - ground_height
    new_on_ground = new_y >= ground_y
    
    if new_on_ground
        new_y = ground_y
        new_vel_y = Int32(0)
    end
    
    # Return state as encoded integer (for now, just return visual state)
    if key_jump
        return Int32(2)  # Yellow - jumping
    elseif new_on_ground
        return Int32(1)  # Green - on ground  
    else
        return Int32(0)  # Red - in air
    end
end

# Get updated X position after physics
function julia_get_new_x(
    square_x::Int32,
    square_vel_x::Int32,
    key_a::Int32,
    key_d::Int32
)::Int32
    move_speed = Int32(5)
    screen_width = Int32(800)
    square_size = Int32(32)
    
    key_left = key_a != Int32(0)
    key_right = key_d != Int32(0)
    
    new_vel_x = if key_left
        -move_speed
    elseif key_right
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

# Get updated Y position after physics  
function julia_get_new_y(
    square_y::Int32,
    square_vel_y::Int32,
    on_ground::Int32,
    key_space::Int32
)::Int32
    screen_height = Int32(600)
    square_size = Int32(32)
    gravity = Int32(1)
    jump_strength = Int32(-12)
    ground_height = Int32(20)
    
    key_jump = key_space != Int32(0)
    is_on_ground = on_ground != Int32(0)
    
    new_vel_y = square_vel_y + gravity
    
    if key_jump && is_on_ground
        new_vel_y = jump_strength
    end
    
    new_y = square_y + new_vel_y
    
    ground_y = screen_height - square_size - ground_height
    if new_y >= ground_y
        new_y = ground_y
    end
    
    return new_y
end

# Get updated Y velocity after physics
function julia_get_new_vel_y(
    square_y::Int32,
    square_vel_y::Int32,
    on_ground::Int32,
    key_space::Int32  
)::Int32
    screen_height = Int32(600)
    square_size = Int32(32)
    gravity = Int32(1)
    jump_strength = Int32(-12)
    ground_height = Int32(20)
    
    key_jump = key_space != Int32(0)
    is_on_ground = on_ground != Int32(0)
    
    new_vel_y = square_vel_y + gravity
    
    if key_jump && is_on_ground
        new_vel_y = jump_strength
    end
    
    new_y = square_y + new_vel_y
    ground_y = screen_height - square_size - ground_height
    
    if new_y >= ground_y
        new_vel_y = Int32(0)
    end
    
    return new_vel_y
end

# Check if on ground after physics
function julia_check_on_ground(
    square_y::Int32,
    square_vel_y::Int32
)::Int32
    screen_height = Int32(600)
    square_size = Int32(32)
    gravity = Int32(1)
    ground_height = Int32(20)
    
    new_vel_y = square_vel_y + gravity
    new_y = square_y + new_vel_y
    
    ground_y = screen_height - square_size - ground_height
    
    if new_y >= ground_y
        return Int32(1)  # On ground
    else
        return Int32(0)  # In air
    end
end

# Get square color based on state
function julia_get_square_color(
    on_ground::Int32,
    key_space::Int32
)::Int32
    key_jump = key_space != Int32(0)
    is_on_ground = on_ground != Int32(0)
    
    if key_jump
        return Int32(2)  # Yellow - jumping
    elseif is_on_ground
        return Int32(1)  # Green - on ground
    else
        return Int32(0)  # Red - in air
    end
end 