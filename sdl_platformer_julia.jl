using StaticTools

# SDL2 Drawing Commands - Julia generates these for SDL to execute
mutable struct DrawCommand
    type::Int32      # 1=rect, 2=filled_rect, 3=circle, etc.
    x::Int32
    y::Int32  
    w::Int32
    h::Int32
    r::Int32         # color red
    g::Int32         # color green  
    b::Int32         # color blue
    a::Int32         # color alpha
end

# Platformer game state
mutable struct GameState
    square_x::Float32
    square_y::Float32
    square_vel_x::Float32
    square_vel_y::Float32
    on_ground::Bool
    jump_pressed::Bool
end

# Global game state
global game_state = GameState(100.0f0, 300.0f0, 0.0f0, 0.0f0, false, false)

# Game constants
const SCREEN_WIDTH = Int32(800)
const SCREEN_HEIGHT = Int32(600) 
const SQUARE_SIZE = Int32(32)
const MOVE_SPEED = 5.0f0
const GRAVITY = 0.5f0
const JUMP_STRENGTH = -12.0f0
const GROUND_HEIGHT = Int32(20)

# Initialize game (called from JavaScript)
function julia_init_game()::Int32
    global game_state
    game_state.square_x = 100.0f0
    game_state.square_y = 300.0f0
    game_state.square_vel_x = 0.0f0
    game_state.square_vel_y = 0.0f0
    game_state.on_ground = false
    game_state.jump_pressed = false
    return Int32(1)  # Success
end

# Update physics (called each frame from JavaScript)
function julia_update_physics(
    key_a::Int32,      # Left key (A)
    key_d::Int32,      # Right key (D) 
    key_space::Int32   # Jump key (Space)
)::Int32
    global game_state
    
    # Convert input to booleans
    key_left = key_a != Int32(0)
    key_right = key_d != Int32(0)
    key_jump = key_space != Int32(0)
    
    # Apply gravity
    game_state.square_vel_y += GRAVITY
    
    # Handle horizontal movement
    if key_left
        game_state.square_vel_x = -MOVE_SPEED
    elseif key_right
        game_state.square_vel_x = MOVE_SPEED
    else
        game_state.square_vel_x = 0.0f0
    end
    
    # Handle jumping
    if key_jump && game_state.on_ground && !game_state.jump_pressed
        game_state.square_vel_y = JUMP_STRENGTH
        game_state.on_ground = false
    end
    game_state.jump_pressed = key_jump
    
    # Update position
    game_state.square_x += game_state.square_vel_x
    game_state.square_y += game_state.square_vel_y
    
    # Keep square on screen
    if game_state.square_x < 0.0f0
        game_state.square_x = 0.0f0
    elseif game_state.square_x > Float32(SCREEN_WIDTH - SQUARE_SIZE)
        game_state.square_x = Float32(SCREEN_WIDTH - SQUARE_SIZE)
    end
    
    # Ground collision
    ground_y = Float32(SCREEN_HEIGHT - SQUARE_SIZE - GROUND_HEIGHT)
    if game_state.square_y >= ground_y
        game_state.square_y = ground_y
        game_state.square_vel_y = 0.0f0
        game_state.on_ground = true
    end
    
    return Int32(1)  # Success
end

# Generate drawing commands for SDL2 (called each frame)
function julia_get_draw_commands(
    commands_ptr::Int32,  # Pointer to DrawCommand array in WASM memory
    max_commands::Int32   # Maximum number of commands
)::Int32
    global game_state
    
    # For now, return number of commands we want to draw
    # The actual commands will be written to the memory pointer
    
    # We want to draw:
    # 1. Background (sky blue rectangle)
    # 2. Ground (brown rectangle) 
    # 3. Square (colored based on state)
    
    return Int32(3)  # Number of draw commands
end

# Get individual draw command (called from JavaScript for each command)
function julia_get_draw_command(
    command_index::Int32,
    type_ptr::Int32,      # Pointer to write command type
    x_ptr::Int32,         # Pointer to write x
    y_ptr::Int32,         # Pointer to write y  
    w_ptr::Int32,         # Pointer to write width
    h_ptr::Int32,         # Pointer to write height
    r_ptr::Int32,         # Pointer to write red
    g_ptr::Int32,         # Pointer to write green
    b_ptr::Int32,         # Pointer to write blue
    a_ptr::Int32          # Pointer to write alpha
)::Int32
    global game_state
    
    if command_index == Int32(0)
        # Background - sky blue
        # Note: In real implementation, these would write to the pointers
        # For now, return the values that JavaScript will read
        return Int32(2)  # Filled rectangle type
    elseif command_index == Int32(1)
        # Ground - brown  
        return Int32(2)  # Filled rectangle type
    elseif command_index == Int32(2)
        # Square - color based on state
        return Int32(2)  # Filled rectangle type
    end
    
    return Int32(0)  # Invalid command
end

# Simplified interface - get square position for SDL rendering
function julia_get_square_x()::Int32
    global game_state
    return Int32(round(game_state.square_x))
end

function julia_get_square_y()::Int32
    global game_state
    return Int32(round(game_state.square_y))
end

function julia_get_square_state()::Int32
    global game_state
    if game_state.jump_pressed
        return Int32(2)  # Yellow - jumping
    elseif game_state.on_ground
        return Int32(1)  # Green - on ground
    else
        return Int32(0)  # Red - in air
    end
end

# Get square velocity for effects
function julia_get_velocity_x()::Int32
    global game_state
    return Int32(round(game_state.square_vel_x))
end

function julia_get_velocity_y()::Int32
    global game_state
    return Int32(round(game_state.square_vel_y))
end 