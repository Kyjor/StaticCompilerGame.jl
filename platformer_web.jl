using StaticTools
using StaticCompiler

# Game constants
const SCREEN_WIDTH = 800
const SCREEN_HEIGHT = 600
const SQUARE_SIZE = 32
const MOVE_SPEED = 5.0
const GRAVITY = 0.5
const JUMP_STRENGTH = -12.0

# Global game state (avoiding complex structures)
square_x = 100.0
square_y = 300.0
square_vel_x = 0.0
square_vel_y = 0.0
on_ground = false
key_left = false
key_right = false
key_space = false

# Initialize game
function init_platformer_game()::Int32
    global square_x, square_y, square_vel_x, square_vel_y, on_ground
    global key_left, key_right, key_space
    
    square_x = 100.0
    square_y = 300.0
    square_vel_x = 0.0
    square_vel_y = 0.0
    on_ground = false
    key_left = false
    key_right = false
    key_space = false
    return Int32(0)  # Success
end

# Handle key input (called from JavaScript)
function handle_key_input(key::Int32, pressed::Int32)::Nothing
    global key_left, key_right, key_space
    
    is_pressed = pressed != Int32(0)
    
    if key == Int32(37)  # Left arrow
        key_left = is_pressed
    elseif key == Int32(39)  # Right arrow
        key_right = is_pressed
    elseif key == Int32(32)  # Spacebar
        key_space = is_pressed
    end
    
    return nothing
end

# Update game physics (called from JavaScript each frame)
function update_platformer_physics()::Nothing
    global square_x, square_y, square_vel_x, square_vel_y, on_ground
    global key_left, key_right, key_space
    
    # Apply gravity
    square_vel_y += GRAVITY
    
    # Handle horizontal movement
    if key_left
        square_vel_x = -MOVE_SPEED
    elseif key_right
        square_vel_x = MOVE_SPEED
    else
        square_vel_x = 0.0
    end
    
    # Handle jumping
    if key_space && on_ground
        square_vel_y = JUMP_STRENGTH
        on_ground = false
    end
    
    # Update position
    square_x += square_vel_x
    square_y += square_vel_y
    
    # Keep square on screen
    if square_x < 0.0
        square_x = 0.0
    elseif square_x > Float64(SCREEN_WIDTH - SQUARE_SIZE)
        square_x = Float64(SCREEN_WIDTH - SQUARE_SIZE)
    end
    
    # Ground collision
    ground_y = Float64(SCREEN_HEIGHT - SQUARE_SIZE - 20)  # 20 pixels for ground
    if square_y >= ground_y
        square_y = ground_y
        square_vel_y = 0.0
        on_ground = true
    end
    
    return nothing
end

# Get square position (called from JavaScript for rendering)
function get_square_x()::Int32
    global square_x
    return Int32(round(square_x))
end

function get_square_y()::Int32
    global square_y
    return Int32(round(square_y))
end

# Get square state for visual feedback
function get_square_state()::Int32
    global key_space, on_ground
    if key_space
        return Int32(2)  # Yellow - jumping
    elseif on_ground
        return Int32(1)  # Green - on ground
    else
        return Int32(0)  # Red - in air
    end
end

# Simple game loop for testing
function run_platformer_frame()::Int32
    update_platformer_physics()
    return get_square_state()
end 