using StaticTools
using StaticCompiler

# SDL2 Constants
const SDL_INIT_VIDEO = 0x00000020
const SDL_WINDOWPOS_CENTERED = 0x2FFF0000
const SDL_WINDOW_SHOWN = 0x00000004
const SDL_QUIT = 0x100
const SDL_KEYDOWN = 0x300
const SDL_KEYUP = 0x301

# Key codes
const SDLK_LEFT = 0x40000050
const SDLK_RIGHT = 0x4000004F
const SDLK_SPACE = 0x20
const SDLK_ESCAPE = 0x1B

# Game constants
const SCREEN_WIDTH = 800
const SCREEN_HEIGHT = 600
const PLAYER_WIDTH = 32
const PLAYER_HEIGHT = 48
const GRAVITY = 0.5
const JUMP_STRENGTH = -12.0
const PLAYER_SPEED = 4.0

# Simple fixed-size arrays to avoid malloc
const MAX_PLATFORMS = 5

# Global game state (avoiding complex structures)
player_x = 100.0
player_y = 300.0
player_vel_x = 0.0
player_vel_y = 0.0
player_on_ground = false

# Platform data - fixed arrays
platform_x = (200, 500, 50, 650, 350)
platform_y = (500, 400, 350, 300, 250)
platform_w = (200, 150, 100, 100, 120)
platform_h = (20, 20, 20, 20, 20)

# Input state
input_left = false
input_right = false
input_jump = false
input_quit = false

# SDL2 External Functions
function SDL_Init(flags::UInt32)::Int32
    @ccall "libs/libSDL2.so".SDL_Init(flags::UInt32)::Int32
end

function SDL_CreateWindow(title::Ptr{UInt8}, x::Int32, y::Int32, w::Int32, h::Int32, flags::UInt32)::Ptr{Cvoid}
    @ccall "libs/libSDL2.so".SDL_CreateWindow(title::Ptr{UInt8}, x::Int32, y::Int32, w::Int32, h::Int32, flags::UInt32)::Ptr{Cvoid}
end

function SDL_CreateRenderer(window::Ptr{Cvoid}, index::Int32, flags::UInt32)::Ptr{Cvoid}
    @ccall "libs/libSDL2.so".SDL_CreateRenderer(window::Ptr{Cvoid}, index::Int32, flags::UInt32)::Ptr{Cvoid}
end

function SDL_SetRenderDrawColor(renderer::Ptr{Cvoid}, r::UInt8, g::UInt8, b::UInt8, a::UInt8)::Int32
    @ccall "libs/libSDL2.so".SDL_SetRenderDrawColor(renderer::Ptr{Cvoid}, r::UInt8, g::UInt8, b::UInt8, a::UInt8)::Int32
end

function SDL_RenderClear(renderer::Ptr{Cvoid})::Int32
    @ccall "libs/libSDL2.so".SDL_RenderClear(renderer::Ptr{Cvoid})::Int32
end

function SDL_RenderPresent(renderer::Ptr{Cvoid})::Cvoid
    @ccall "libs/libSDL2.so".SDL_RenderPresent(renderer::Ptr{Cvoid})::Cvoid
end

function SDL_RenderFillRect(renderer::Ptr{Cvoid}, rect::Ptr{Cvoid})::Int32
    @ccall "libs/libSDL2.so".SDL_RenderFillRect(renderer::Ptr{Cvoid}, rect::Ptr{Cvoid})::Int32
end

function SDL_PollEvent(event::Ptr{UInt8})::Int32
    @ccall "libs/libSDL2.so".SDL_PollEvent(event::Ptr{UInt8})::Int32
end

function SDL_Delay(ms::UInt32)::Cvoid
    @ccall "libs/libSDL2.so".SDL_Delay(ms::UInt32)::Cvoid
end

function SDL_DestroyRenderer(renderer::Ptr{Cvoid})::Cvoid
    @ccall "libs/libSDL2.so".SDL_DestroyRenderer(renderer::Ptr{Cvoid})::Cvoid
end

function SDL_DestroyWindow(window::Ptr{Cvoid})::Cvoid
    @ccall "libs/libSDL2.so".SDL_DestroyWindow(window::Ptr{Cvoid})::Cvoid
end

function SDL_Quit()::Cvoid
    @ccall "libs/libSDL2.so".SDL_Quit()::Cvoid
end

function SDL_GetTicks()::UInt32
    @ccall "libs/libSDL2.so".SDL_GetTicks()::UInt32
end

# Simple collision detection
function check_collision(x1::Float64, y1::Float64, w1::Int32, h1::Int32,
                        x2::Int32, y2::Int32, w2::Int32, h2::Int32)::Bool
    return (x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2)
end

# Update player physics
function update_player()::Cvoid
    global player_x, player_y, player_vel_x, player_vel_y, player_on_ground
    global input_left, input_right, input_jump
    
    # Apply gravity
    player_vel_y += GRAVITY
    
    # Handle horizontal movement
    if input_left
        player_vel_x = -PLAYER_SPEED
    elseif input_right
        player_vel_x = PLAYER_SPEED
    else
        player_vel_x = 0.0
    end
    
    # Handle jumping
    if input_jump && player_on_ground
        player_vel_y = JUMP_STRENGTH
        player_on_ground = false
    end
    
    # Update position
    player_x += player_vel_x
    player_y += player_vel_y
    
    # Check platform collisions
    player_on_ground = false
    
    # Check collision with platform 1
    if check_collision(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT,
                      platform_x[1], platform_y[1], platform_w[1], platform_h[1])
        if player_vel_y > 0 && player_y < platform_y[1]
            player_y = platform_y[1] - PLAYER_HEIGHT
            player_vel_y = 0.0
            player_on_ground = true
        end
    end
    
    # Check collision with platform 2
    if check_collision(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT,
                      platform_x[2], platform_y[2], platform_w[2], platform_h[2])
        if player_vel_y > 0 && player_y < platform_y[2]
            player_y = platform_y[2] - PLAYER_HEIGHT
            player_vel_y = 0.0
            player_on_ground = true
        end
    end
    
    # Check collision with platform 3
    if check_collision(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT,
                      platform_x[3], platform_y[3], platform_w[3], platform_h[3])
        if player_vel_y > 0 && player_y < platform_y[3]
            player_y = platform_y[3] - PLAYER_HEIGHT
            player_vel_y = 0.0
            player_on_ground = true
        end
    end
    
    # Check collision with platform 4
    if check_collision(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT,
                      platform_x[4], platform_y[4], platform_w[4], platform_h[4])
        if player_vel_y > 0 && player_y < platform_y[4]
            player_y = platform_y[4] - PLAYER_HEIGHT
            player_vel_y = 0.0
            player_on_ground = true
        end
    end
    
    # Check collision with platform 5
    if check_collision(player_x, player_y, PLAYER_WIDTH, PLAYER_HEIGHT,
                      platform_x[5], platform_y[5], platform_w[5], platform_h[5])
        if player_vel_y > 0 && player_y < platform_y[5]
            player_y = platform_y[5] - PLAYER_HEIGHT
            player_vel_y = 0.0
            player_on_ground = true
        end
    end
    
    # Keep player on screen
    if player_x < 0
        player_x = 0.0
    elseif player_x > SCREEN_WIDTH - PLAYER_WIDTH
        player_x = Float64(SCREEN_WIDTH - PLAYER_WIDTH)
    end
    
    # Ground collision
    if player_y >= SCREEN_HEIGHT - PLAYER_HEIGHT
        player_y = Float64(SCREEN_HEIGHT - PLAYER_HEIGHT)
        player_vel_y = 0.0
        player_on_ground = true
    end
    
    return nothing
end

# Handle input events
function handle_input(event_data::Ptr{UInt8})::Cvoid
    global input_left, input_right, input_jump, input_quit
    
    # Read event type from first 4 bytes
    event_type = unsafe_load(event_data, 1) |
                (unsafe_load(event_data, 2) << 8) |
                (unsafe_load(event_data, 3) << 16) |
                (unsafe_load(event_data, 4) << 24)
    
    if event_type == SDL_QUIT
        input_quit = true
    elseif event_type == SDL_KEYDOWN || event_type == SDL_KEYUP
        # Extract key code (at offset 16 in SDL_KeyboardEvent)
        key_code = unsafe_load(event_data, 17) |
                  (unsafe_load(event_data, 18) << 8) |
                  (unsafe_load(event_data, 19) << 16) |
                  (unsafe_load(event_data, 20) << 24)
        
        pressed = (event_type == SDL_KEYDOWN)
        
        if key_code == SDLK_LEFT
            input_left = pressed
        elseif key_code == SDLK_RIGHT
            input_right = pressed
        elseif key_code == SDLK_SPACE
            input_jump = pressed
        elseif key_code == SDLK_ESCAPE
            input_quit = true
        end
    end
    
    return nothing
end

# Draw a filled rectangle
function draw_rect(renderer::Ptr{Cvoid}, x::Int32, y::Int32, w::Int32, h::Int32)::Cvoid
    # Create a simple SDL_Rect on the stack
    rect_data = (x, y, w, h)
    
    # Convert to bytes for SDL
    rect_bytes = Ptr{UInt8}(pointer_from_objref(rect_data))
    
    SDL_RenderFillRect(renderer, rect_bytes)
    
    return nothing
end

# Main game function
function main()::Int32
    global player_x, player_y, player_vel_x, player_vel_y, player_on_ground
    global input_left, input_right, input_jump, input_quit
    
    # Initialize SDL2
    if SDL_Init(SDL_INIT_VIDEO) != 0
        return Int32(-1)
    end
    
    # Create window
    title = StaticTools.c"Simple Platformer - Julia"
    window = SDL_CreateWindow(pointer(title), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                             SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN)
    
    if window == C_NULL
        SDL_Quit()
        return Int32(-1)
    end
    
    # Create renderer
    renderer = SDL_CreateRenderer(window, Int32(-1), UInt32(0))
    if renderer == C_NULL
        SDL_DestroyWindow(window)
        SDL_Quit()
        return Int32(-1)
    end
    
    # Allocate event buffer
    event_buffer = StaticTools.MallocArray{UInt8}(undef, 64)
    
    # Game loop
    last_time = SDL_GetTicks()
    
    while !input_quit
        current_time = SDL_GetTicks()
        
        # Handle events
        while SDL_PollEvent(pointer(event_buffer)) != 0
            handle_input(pointer(event_buffer))
        end
        
        # Update game state
        update_player()
        
        # Clear screen (sky blue)
        SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255)
        SDL_RenderClear(renderer)
        
        # Draw platforms (brown)
        SDL_SetRenderDrawColor(renderer, 139, 69, 19, 255)
        draw_rect(renderer, platform_x[1], platform_y[1], platform_w[1], platform_h[1])
        draw_rect(renderer, platform_x[2], platform_y[2], platform_w[2], platform_h[2])
        draw_rect(renderer, platform_x[3], platform_y[3], platform_w[3], platform_h[3])
        draw_rect(renderer, platform_x[4], platform_y[4], platform_w[4], platform_h[4])
        draw_rect(renderer, platform_x[5], platform_y[5], platform_w[5], platform_h[5])
        
        # Draw player (red)
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)
        draw_rect(renderer, Int32(round(player_x)), Int32(round(player_y)), PLAYER_WIDTH, PLAYER_HEIGHT)
        
        # Present the frame
        SDL_RenderPresent(renderer)
        
        # Cap to ~60 FPS
        delta_time = current_time - last_time
        if delta_time < 16
            SDL_Delay(16 - delta_time)
        end
        
        last_time = current_time
    end
    
    # Cleanup
    StaticTools.free(event_buffer)
    
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(window)
    SDL_Quit()
    
    return Int32(0)
end

# Compile the game
compile_executable(main, (), "simple_platformer") 