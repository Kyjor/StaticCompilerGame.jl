using StaticTools
using StaticCompiler

# SDL Drawing Functions - these will be compiled to WebAssembly
# and called from JavaScript

# Initialize SDL drawing
function init_sdl_drawing()::Int32
    # This will call the C function init_sdl_drawing()
    return Int32(0)
end

# Clear screen with color
function clear_screen(color::Int32)::Nothing
    # This will call the C function clear_screen(color)
    return nothing
end

# Draw a rectangle
function draw_rect(x::Int32, y::Int32, w::Int32, h::Int32, color::Int32)::Nothing
    # This will call the C function draw_rect(x, y, w, h, color)
    return nothing
end

# Present the frame
function present_frame()::Nothing
    # This will call the C function present_frame()
    return nothing
end

# Handle SDL events
function handle_events()::Int32
    # This will call the C function handle_events()
    return Int32(0)
end

# Get current time
function get_time()::UInt32
    # This will call the C function get_time()
    return UInt32(0)
end

# Game state variables
square_x = 100.0
square_y = 100.0
square_vel_x = 0.0
square_vel_y = 0.0
on_ground = false

# Initialize game
function init_game()::Int32
    global square_x, square_y, square_vel_x, square_vel_y, on_ground
    
    # Initialize SDL
    if init_sdl_drawing() != Int32(0)
        return Int32(-1)
    end
    
    # Reset game state
    square_x = 100.0
    square_y = 100.0
    square_vel_x = 0.0
    square_vel_y = 0.0
    on_ground = false
    
    return Int32(0)
end

# Update game physics
function update_physics()::Nothing
    global square_x, square_y, square_vel_x, square_vel_y, on_ground
    
    # Simple physics
    square_vel_y += 0.5  # Gravity
    square_x += square_vel_x
    square_y += square_vel_y
    
    # Ground collision
    if square_y > 500.0
        square_y = 500.0
        square_vel_y = 0.0
        on_ground = true
    else
        on_ground = false
    end
    
    # Keep square on screen
    if square_x < 0.0
        square_x = 0.0
    elseif square_x > 750.0
        square_x = 750.0
    end
    
    return nothing
end

# Draw the game frame
function draw_frame()::Nothing
    # Clear screen to black
    clear_screen(Int32(0))
    
    # Draw the square
    x = Int32(round(square_x))
    y = Int32(round(square_y))
    
    if on_ground
        draw_rect(x, y, Int32(32), Int32(32), Int32(3))  # Green when on ground
    else
        draw_rect(x, y, Int32(32), Int32(32), Int32(2))  # Red when in air
    end
    
    # Present the frame
    present_frame()
    
    return nothing
end

# Main game loop function (called from JavaScript)
function run_game_frame()::Int32
    # Update physics
    update_physics()
    
    # Draw frame
    draw_frame()
    
    # Handle events
    if handle_events() != Int32(0)
        return Int32(-1)  # Quit requested
    end
    
    return Int32(0)  # Continue
end

# Get square position for JavaScript
function get_square_x()::Int32
    return Int32(round(square_x))
end

function get_square_y()::Int32
    return Int32(round(square_y))
end

function get_square_state()::Int32
    if on_ground
        return Int32(1)  # On ground
    else
        return Int32(0)  # In air
    end
end

# Test function
function test_sdl_drawing()::Int32
    if init_sdl_drawing() != Int32(0)
        return Int32(-1)
    end
    
    # Clear screen
    clear_screen(Int32(0))
    
    # Draw a test square
    draw_rect(Int32(100), Int32(100), Int32(50), Int32(50), Int32(5))
    
    # Present frame
    present_frame()
    
    return Int32(0)
end 