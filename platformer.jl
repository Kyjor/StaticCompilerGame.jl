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
const PLATFORM_HEIGHT = 20
const GRAVITY = 0.5
const JUMP_STRENGTH = -12.0
const PLAYER_SPEED = 4.0

# Player structure
mutable struct Player
    x::Float64
    y::Float64
    vel_x::Float64
    vel_y::Float64
    on_ground::Bool
    width::Int32
    height::Int32
end

# Platform structure
struct Platform
    x::Int32
    y::Int32
    width::Int32
    height::Int32
end

# Input state
mutable struct InputState
    left::Bool
    right::Bool
    jump::Bool
    quit::Bool
end

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

# Helper function to create SDL_Rect
function create_rect(x::Int32, y::Int32, w::Int32, h::Int32)::StaticTools.MallocArray{UInt8}
    rect = StaticTools.MallocArray{UInt8}(undef, 16)  # SDL_Rect is 16 bytes
    
    # Pack the rectangle data (x, y, w, h as 32-bit integers)
    rect[1] = UInt8(x & 0xFF)
    rect[2] = UInt8((x >> 8) & 0xFF)
    rect[3] = UInt8((x >> 16) & 0xFF)
    rect[4] = UInt8((x >> 24) & 0xFF)
    
    rect[5] = UInt8(y & 0xFF)
    rect[6] = UInt8((y >> 8) & 0xFF)
    rect[7] = UInt8((y >> 16) & 0xFF)
    rect[8] = UInt8((y >> 24) & 0xFF)
    
    rect[9] = UInt8(w & 0xFF)
    rect[10] = UInt8((w >> 8) & 0xFF)
    rect[11] = UInt8((w >> 16) & 0xFF)
    rect[12] = UInt8((w >> 24) & 0xFF)
    
    rect[13] = UInt8(h & 0xFF)
    rect[14] = UInt8((h >> 8) & 0xFF)
    rect[15] = UInt8((h >> 16) & 0xFF)
    rect[16] = UInt8((h >> 24) & 0xFF)
    
    return rect
end

# Collision detection
function rect_collision(x1::Float64, y1::Float64, w1::Int32, h1::Int32,
                       x2::Int32, y2::Int32, w2::Int32, h2::Int32)::Bool
    return (x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2)
end

# Update player physics
function update_player(player::Player, platforms::StaticTools.MallocArray{Platform}, input::InputState)::Cvoid
    # Apply gravity
    player.vel_y += GRAVITY
    
    # Handle horizontal movement
    if input.left
        player.vel_x = -PLAYER_SPEED
    elseif input.right
        player.vel_x = PLAYER_SPEED
    else
        player.vel_x = 0.0
    end
    
    # Handle jumping
    if input.jump && player.on_ground
        player.vel_y = JUMP_STRENGTH
        player.on_ground = false
    end
    
    # Update position
    player.x += player.vel_x
    player.y += player.vel_y
    
    # Check platform collisions
    player.on_ground = false
    
    for i in 1:length(platforms)
        platform = platforms[i]
        
        # Check collision with platform
        if rect_collision(player.x, player.y, player.width, player.height,
                         platform.x, platform.y, platform.width, platform.height)
            
            # Landing on top of platform
            if player.vel_y > 0 && player.y < platform.y
                player.y = platform.y - player.height
                player.vel_y = 0.0
                player.on_ground = true
            # Hitting platform from below
            elseif player.vel_y < 0 && player.y > platform.y
                player.y = platform.y + platform.height
                player.vel_y = 0.0
            # Hitting platform from the side
            else
                if player.vel_x > 0
                    player.x = platform.x - player.width
                elseif player.vel_x < 0
                    player.x = platform.x + platform.width
                end
                player.vel_x = 0.0
            end
        end
    end
    
    # Keep player on screen
    if player.x < 0
        player.x = 0.0
    elseif player.x > SCREEN_WIDTH - player.width
        player.x = Float64(SCREEN_WIDTH - player.width)
    end
    
    # Ground collision
    if player.y >= SCREEN_HEIGHT - player.height
        player.y = Float64(SCREEN_HEIGHT - player.height)
        player.vel_y = 0.0
        player.on_ground = true
    end
    
    return nothing
end

# Handle input events
function handle_input(event::StaticTools.MallocArray{UInt8}, input::InputState)::Cvoid
    event_type = Int32(event[1]) | (Int32(event[2]) << 8) | (Int32(event[3]) << 16) | (Int32(event[4]) << 24)
    
    if event_type == SDL_QUIT
        input.quit = true
    elseif event_type == SDL_KEYDOWN || event_type == SDL_KEYUP
        # Extract key code (at offset 16 in SDL_KeyboardEvent)
        key_code = Int32(event[17]) | (Int32(event[18]) << 8) | (Int32(event[19]) << 16) | (Int32(event[20]) << 24)
        pressed = event_type == SDL_KEYDOWN
        
        if key_code == SDLK_LEFT
            input.left = pressed
        elseif key_code == SDLK_RIGHT
            input.right = pressed
        elseif key_code == SDLK_SPACE
            input.jump = pressed
        elseif key_code == SDLK_ESCAPE
            input.quit = true
        end
    end
    
    return nothing
end

# Main game function
function main()::Int32
    # Initialize SDL2
    if SDL_Init(SDL_INIT_VIDEO) != 0
        return Int32(-1)
    end
    
    # Create window
    title = StaticTools.c"SDL2 Platformer - Julia"
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
    
    # Initialize player
    player = Player(100.0, 300.0, 0.0, 0.0, false, PLAYER_WIDTH, PLAYER_HEIGHT)
    
    # Create platforms
    platforms = StaticTools.MallocArray{Platform}(undef, 5)
    platforms[1] = Platform(200, 500, 200, PLATFORM_HEIGHT)
    platforms[2] = Platform(500, 400, 150, PLATFORM_HEIGHT)
    platforms[3] = Platform(50, 350, 100, PLATFORM_HEIGHT)
    platforms[4] = Platform(650, 300, 100, PLATFORM_HEIGHT)
    platforms[5] = Platform(350, 250, 120, PLATFORM_HEIGHT)
    
    # Initialize input state
    input = InputState(false, false, false, false)
    
    # Event buffer
    event = StaticTools.MallocArray{UInt8}(undef, 64)  # SDL_Event is typically 56 bytes
    
    # Game loop
    last_time = SDL_GetTicks()
    
    while !input.quit
        current_time = SDL_GetTicks()
        delta_time = current_time - last_time
        
        # Handle events
        while SDL_PollEvent(pointer(event)) != 0
            handle_input(event, input)
        end
        
        # Update game state
        update_player(player, platforms, input)
        
        # Clear screen (sky blue)
        SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255)
        SDL_RenderClear(renderer)
        
        # Draw platforms (brown)
        SDL_SetRenderDrawColor(renderer, 139, 69, 19, 255)
        for i in 1:length(platforms)
            platform = platforms[i]
            rect = create_rect(platform.x, platform.y, platform.width, platform.height)
            SDL_RenderFillRect(renderer, pointer(rect))
            StaticTools.free(rect)
        end
        
        # Draw player (red)
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)
        player_rect = create_rect(Int32(round(player.x)), Int32(round(player.y)), 
                                 player.width, player.height)
        SDL_RenderFillRect(renderer, pointer(player_rect))
        StaticTools.free(player_rect)
        
        # Present the frame
        SDL_RenderPresent(renderer)
        
        # Cap to ~60 FPS
        if delta_time < 16
            SDL_Delay(16 - delta_time)
        end
        
        last_time = current_time
    end
    
    # Cleanup
    StaticTools.free(platforms)
    StaticTools.free(event)
    
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(window)
    SDL_Quit()
    
    return Int32(0)
end

# Compile the game
compile_executable(main, (), "platformer") 