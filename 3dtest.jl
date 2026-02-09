# combined_game_working.jl
using StaticTools

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl") 
include("llvm_bindings.jl")
include("wallocstring.jl")


# ============================================================================
# CONSTANTS
# ============================================================================
const NUM_STARS::Int32 = Int32(250)
const NUM_TIES::Int32 = Int32(10)

# 3D engine CONSTANTS
const NEAR_Z::Int32 = Int32(10)
const FAR_Z::Int32 = Int32(2000)
const VIEW_DISTANCE::Int32 = Int32(320)


# Player CONSTANTS
const CROSS_VEL::Int32 = Int32(8)
const PLAYER_Z_VEL::Int32 = Int32(8)

# tie fighter model constants
const NUM_TIE_VERTS::Int32 = Int32(10)
const NUM_TIE_EDGES::Int32 = Int32(8)

# explosion constants
const NUM_EXPLOSIONS::Int32 = Int32(NUM_TIES)

# game states
const GAME_RUNNING::Int32 = Int32(1)
const GAME_OVER::Int32 = Int32(0)

struct Point3D
    color::UInt32
    x::Float32
    y::Float32
    z::Float32
end

struct GameState
    player_x::Float64
    player_y::Float64
    player_vel_x::Float64
    player_vel_y::Float64
    on_ground::Int32
    coyote_time::Float64
    jump_buffer::Float64
    is_jumping::Int32
    keys_up::Ptr{KeyState_up}   
    keys_down::Ptr{KeyState_down}
    keys_pressed::Ptr{KeyState_pressed}
    last_frame_time::UInt64
    quit::Bool
    player_sprite::Ptr{Sprite}
    background_sprite::Ptr{Sprite}
    player::Ptr{Player}
    fullscreen::Bool
    camera_x::Float64
    camera_y::Float64
    left_btn_pressed::Bool
    right_btn_pressed::Bool
    jump_btn_pressed::Bool
    jump_sound::Ptr{Mix_Chunk}
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    f === :player_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_x))))
    f === :player_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_y))))
    f === :player_vel_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_x))))
    f === :player_vel_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_y))))
    f === :on_ground && return unsafe_load(Ptr{Int32}(x + offsetof(GameState, Val(:on_ground))))
    f === :coyote_time && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:coyote_time))))
    f === :jump_buffer && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:jump_buffer))))
    f === :is_jumping && return unsafe_load(Ptr{Int32}(x + offsetof(GameState, Val(:is_jumping))))
    f === :keys_up && return unsafe_load(Ptr{Ptr{KeyState_up}}(x + offsetof(GameState, Val(:keys_up))))
    f === :keys_down && return unsafe_load(Ptr{Ptr{KeyState_down}}(x + offsetof(GameState, Val(:keys_down))))
    f === :keys_pressed && return unsafe_load(Ptr{Ptr{KeyState_pressed}}(x + offsetof(GameState, Val(:keys_pressed))))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))))
    f === :quit && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:quit))))
    f === :player_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:player_sprite))))
    f === :background_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:background_sprite))))
    f === :player && return unsafe_load(Ptr{Ptr{Player}}(x + offsetof(GameState, Val(:player))))
    f === :fullscreen && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:fullscreen))))
    f === :camera_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_x))))
    f === :camera_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_y))))
    f === :left_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:left_btn_pressed))))
    f === :right_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:right_btn_pressed))))
    f === :jump_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:jump_btn_pressed))))
    f === :jump_sound && return unsafe_load(Ptr{Ptr{Mix_Chunk}}(x + offsetof(GameState, Val(:jump_sound))))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    f === :player_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_x))), v)
    f === :player_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_y))), v)
    f === :player_vel_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_x))), v)
    f === :player_vel_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_y))), v)
    f === :on_ground && return unsafe_store!(Ptr{Int32}(x + offsetof(GameState, Val(:on_ground))), v)
    f === :coyote_time && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:coyote_time))), v)
    f === :jump_buffer && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:jump_buffer))), v)
    f === :is_jumping && return unsafe_store!(Ptr{Int32}(x + offsetof(GameState, Val(:is_jumping))), v)
    f === :keys_up && return unsafe_store!(Ptr{Ptr{KeyState_up}}(x + offsetof(GameState, Val(:keys_up))), v)
    f === :keys_down && return unsafe_store!(Ptr{Ptr{KeyState_down}}(x + offsetof(GameState, Val(:keys_down))), v)
    f === :keys_pressed && return unsafe_store!(Ptr{Ptr{KeyState_pressed}}(x + offsetof(GameState, Val(:keys_pressed))), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:quit))), v)
    f === :player_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:player_sprite))), v)
    f === :background_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:background_sprite))), v)
    f === :player && return unsafe_store!(Ptr{Ptr{Player}}(x + offsetof(GameState, Val(:player))), v)
    f === :fullscreen && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:fullscreen))), v)
    f === :camera_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_x))), v)
    f === :camera_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_y))), v)
    f === :left_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:left_btn_pressed))), v)
    f === :right_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:right_btn_pressed))), v)
    f === :jump_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:jump_btn_pressed))), v)
    f === :jump_sound && return unsafe_store!(Ptr{Ptr{Mix_Chunk}}(x + offsetof(GameState, Val(:jump_sound))), v)
end

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"Platformer")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(480), UInt32(0))
    if window == Ptr{SDL_Window}(C_NULL)
        printf(c"Failed to create window\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
    end
    wasm_free(Ptr{Cvoid}(window_name))
    return window
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), UInt32(2))
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to create renderer\n")
    end
    return renderer
end

# Utility helpers for manual pointer arithmetic without Julia runtime conversions
@inline function byte_ptr(ptr::Ptr{T}) where {T}
    return Ptr{UInt8}(ptr)
end

@inline function ptr_at(ptr::Ptr{T}, offset::Int64, ::Type{R}) where {T,R}
    return Ptr{R}(byte_ptr(ptr) + offset)
end


# In j_init_game_state, initialize game state
function j_init_game_state(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    printf(c"Initializing game state\n")
    @static if Sys.iswindows()
        printf(c"Windows\n")
    elseif Sys.isapple()
        printf(c"macOS\n")
        platform = llvm_SDL_GetPlatform()
        printf(c"Platform: %s\n", platform)
    else
        printf(c"Linux\n")
    end
    keys_up::Ptr{KeyState_up} = Ptr{KeyState_up}(wasm_malloc(UInt32(sizeof(KeyState_up))))
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false))
    keys_down::Ptr{KeyState_down} = Ptr{KeyState_down}(wasm_malloc(UInt32(sizeof(KeyState_down))))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false))
    keys_pressed::Ptr{KeyState_pressed} = Ptr{KeyState_pressed}(wasm_malloc(UInt32(sizeof(KeyState_pressed))))
    unsafe_store!(Ptr{KeyState_pressed}(keys_pressed), KeyState_pressed(false, false, false, false, false))

    sprite_init_result::Int32 = init_sprite_system()
    if sprite_init_result != 0
        printf(c"Failed to initialize sprite system\n")
    end

    # Initialize audio system
    printf(c"Initializing audio system\n")
    # Mix_Init returns the flags that were successfully initialized
    # MIX_INIT_OGG = 16 (from structs.jl)
    audio_init_result::Int32 = llvm_Mix_Init(Int32(16))  # MIX_INIT_OGG
    
    # # Check if OGG flag was successfully initialized
    if (audio_init_result & Int32(16)) == Int32(0)
        printf(c"Failed to initialize SDL_mixer - OGG support not available\n")
        error_msg_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(256))
        error_msg::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(error_msg_ptr, Int32(256))
        printf(c"SDL Error: %s\n", error_msg)
        wasm_free(Ptr{Cvoid}(error_msg_ptr))
    else
        printf(c"SDL_mixer initialized successfully with OGG support\n")
    end
    
    # Open audio device
    audio_ready::Bool = false
    open_result::Int32 = llvm_Mix_OpenAudio(Int32(44100), UInt16(0x8010), Int32(2), Int32(2048))
    if open_result != Int32(0)
        printf(c"Failed to open audio device, error code: %d\n", open_result)
        # Try to get SDL error message
        error_msg_ptr1::Ptr{Cvoid} = wasm_malloc(UInt32(256))
        error_msg1::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(error_msg_ptr1, Int32(256))
        printf(c"SDL Error: %s\n", error_msg1)
        wasm_free(Ptr{Cvoid}(error_msg_ptr1))
        audio_ready = false
    else
        printf(c"Audio device opened successfully\n")
        audio_ready = true
    end

    # Load jump sound only if audio device is ready
    jump_sound::Ptr{Mix_Chunk} = Ptr{Mix_Chunk}(C_NULL)
    if audio_ready
        # TODO: Fix Mix_LoadWAV crash - might be file path or memory allocation issue
        # In Emscripten, preloaded files are mounted at root with --preload-file
        # So /assets/Jump.wav should be the correct path

        jump_sound_path::Ptr{UInt8} = str_ptr(w"/assets/Jump.wav")
        jump_sound = llvm_Mix_LoadWAV(jump_sound_path)
        
        printf(c"Jump sound loaded\n")
        wasm_free(Ptr{Cvoid}(jump_sound_path))
    else
        printf(c"Skipping sound loading - audio device not ready\n")
    end
    
    game_state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    # Initialize player at ground level (732.0) minus player height (64)
    unsafe_store!(
        Ptr{GameState}(game_state_ptr), 
        GameState(
            Float64(500), 
            Float64(668), 
            Float64(0), 
            Float64(0), 
            Int32(1), 
            Float64(0), 
            Float64(0), 
            Int32(0), 
            keys_down, 
            keys_up, 
            keys_pressed, 
            UInt64(0), 
            false, 
            Ptr{Sprite}(C_NULL), 
            Ptr{Sprite}(C_NULL), 
            Ptr{Player}(C_NULL), 
            true, 
            Float64(300), 
            Float64(220), 
            false, 
            false, 
            false, 
            jump_sound
        )
    )

    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false

    # # --- Load sprite if not loaded ---
    if game_state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading player sprite\n")
        sprite_path::Ptr{UInt8} = str_ptr(w"assets/game.png")
        game_state_ptr.player_sprite = load_sprite(renderer, sprite_path, Int32(120), Int32(360), Int32(8), Int32(8), Int32(64), Int32(64))
        wasm_free(Ptr{Cvoid}(sprite_path))
        
        if game_state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
            error_ptr = wasm_malloc(UInt32(100))
            error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
            printf(c"Error: %s\n", error)
            wasm_free(Ptr{Cvoid}(error_ptr))
        end
    end

    if game_state_ptr.background_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading background sprite\n")
        sprite_path_1::Ptr{UInt8} = str_ptr(w"assets/map.png")
        game_state_ptr.background_sprite = load_sprite(renderer, sprite_path_1, Int32(0), Int32(0), Int32(640), Int32(640), Int32(640), Int32(640))
        wasm_free(Ptr{Cvoid}(sprite_path_1))

        if game_state_ptr.background_sprite == Ptr{Sprite}(C_NULL)
            error_ptr = wasm_malloc(UInt32(100))
            error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
            printf(c"Error: %s\n", error)
            wasm_free(Ptr{Cvoid}(error_ptr))
        end
    end

    return game_state_ptr
end

# In game_loop, update game state
function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    delta_time::Float64 = Float64(current_time - game_state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    game_state.last_frame_time = current_time
    # Use persistent key state from GameState
    keys_down_ptr::Ptr{KeyState_down} = game_state.keys_down  
    keys_up_ptr::Ptr{KeyState_up} = game_state.keys_up
    keys_pressed_ptr::Ptr{KeyState_pressed} = game_state.keys_pressed
    handle_input(keys_down_ptr, keys_up_ptr, keys_pressed_ptr, game_state, window)
    
    # --- Platformer Physics ---
    gravity::Float64 = Float64(1500.0)           # Gravity acceleration
    jump_velocity::Float64 = Float64(-500.0)     # Jump velocity (negative = up)
    min_x::Float64 = Float64(364)
    max_x::Float64 = Float64(812)
    min_y::Float64 = Float64(284)
    max_y::Float64 = Float64(732.0)              # Ground level
    move_speed::Float64 = Float64(300.0)         # Horizontal movement speed
    move_accel::Float64 = Float64(2000.0)        
    ground_decel::Float64 = Float64(4000.0)      
    air_decel::Float64 = Float64(1200.0)         
    max_speed::Float64 = Float64(300.0)          
    coyote_duration::Float64 = Float64(0.1)      # Time window for coyote time
    jump_buffer_duration::Float64 = Float64(0.1) # Time window for jump buffering
    jump_cancel_gravity_scale::Float64 = Float64(0.5) # Reduce gravity when jump button released

    # --- Coyote Time Update ---
    if game_state.on_ground == Int32(1)
        game_state.coyote_time = coyote_duration
    else
        game_state.coyote_time -= delta_time
    end
    
    # --- Jump Buffering Update ---
    if keys_pressed_ptr.space  # Jump button pressed this frame
        game_state.jump_buffer = jump_buffer_duration
    else
        game_state.jump_buffer -= delta_time
    end
    
    # --- Horizontal movement (smooth platformer style) ---
    target_vel_x::Float64 = Float64(0)
    if keys_down_ptr.a && game_state.player_x > min_x    # A - move left
        target_vel_x = -move_speed
    elseif keys_down_ptr.d && game_state.player_x < max_x  # D - move right
        target_vel_x = move_speed
    end
    
    # Apply acceleration/deceleration
    if game_state.on_ground == Int32(1)
        game_state.player_vel_x = move_toward(game_state.player_vel_x, target_vel_x, Float64(move_accel * delta_time))
    else
        game_state.player_vel_x = move_toward(game_state.player_vel_x, target_vel_x, Float64(air_decel * delta_time))
    end
    
    # Clamp horizontal velocity
    if game_state.player_vel_x > max_speed
        game_state.player_vel_x = max_speed
    elseif game_state.player_vel_x < -max_speed
        game_state.player_vel_x = -max_speed
    end
    
    # --- Jumping ---
    # Jump with coyote time (allows jumping shortly after leaving ground)
    # and jump buffering (allows pressing jump slightly before landing)
    if game_state.coyote_time > Float64(0) && game_state.jump_buffer > Float64(0)
        game_state.player_vel_y = jump_velocity
        game_state.on_ground = Int32(0)
        game_state.is_jumping = Int32(1)
        game_state.coyote_time = Float64(0)  # Consume coyote time
        game_state.jump_buffer = Float64(0)   # Consume jump buffer
        
        # Play jump sound (only if sound is loaded and valid)
        if game_state.jump_sound != Ptr{Mix_Chunk}(C_NULL)
            play_result::Int32 = llvm_Mix_PlayChannel(Int32(-1), game_state.jump_sound, Int32(0))
            if play_result < Int32(0)
                printf(c"Failed to play jump sound, channel: %d\n", play_result)
            end
        end
    end
    
    # Variable jump height (cancel jump when button released)
    if game_state.is_jumping == Int32(1) && game_state.player_vel_y < Float64(0) && keys_up_ptr.space
        game_state.player_vel_y *= jump_cancel_gravity_scale
        game_state.is_jumping = Int32(0)  # Cancel jump
    end
    
    # --- Gravity ---
    if game_state.on_ground == Int32(0)
        game_state.player_vel_y += Float64(gravity * delta_time)
    else
        game_state.is_jumping = Int32(0)  # Reset jump state only when landing
    end
    
    # --- Update Position ---
    game_state.player_x += Float64(game_state.player_vel_x * delta_time)
    game_state.player_y += Float64(game_state.player_vel_y * delta_time)
    
    # Clamp horizontal position to bounds
    if game_state.player_x < min_x
        game_state.player_x = min_x
        game_state.player_vel_x = Float64(0)
    elseif game_state.player_x > max_x
        game_state.player_x = max_x
        game_state.player_vel_x = Float64(0)
    end
    
    # --- Ground Collision ---
    if game_state.player_y >= max_y
        game_state.player_y = max_y
        game_state.player_vel_y = Float64(0)
        game_state.on_ground = Int32(1)
    else
        game_state.on_ground = Int32(0)
    end
    
    # --- Camera: Query window size and compute camera offset ---
    win_w::Int32 = Int32(0)
    win_h::Int32 = Int32(0)
    win_w_ptr = Ref{Int32}(0)
    win_h_ptr = Ref{Int32}(0)
    llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
    win_w = win_w_ptr[]
    win_h = win_h_ptr[]
    player_width::Float64 = 64.0
    player_height::Float64 = 64.0
    target_camera_x::Float64 = game_state.player_x - Float64(win_w) / 2.0 + player_width / 2.0
    target_camera_y::Float64 = game_state.player_y - Float64(win_h) / 2.0 + player_height / 2.0
    camera_speed::Float64 = 0.15  # Adjust for smoothness
    game_state.camera_x += (target_camera_x - game_state.camera_x) * camera_speed
    game_state.camera_y += (target_camera_y - game_state.camera_y) * camera_speed

    # --- Mobile Controls: Define button areas (bottom 25% of screen) ---
    btn_area_h = win_h / Int32(4)
    btn_area_y = win_h - btn_area_h
    btn_w = win_w / Int32(3)
    left_btn_rect = SDL_FRect(0.0f0, Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    right_btn_rect = SDL_FRect(Float32(2 * btn_w), Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    jump_btn_rect = SDL_FRect(Float32(btn_w), Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    # Store pressed state for visual feedback (optional, could be in GameState)
    game_state.left_btn_pressed = false
    game_state.right_btn_pressed = false
    game_state.jump_btn_pressed = false
    
    # --- Render ---
    # Clear screen to black before drawing
    
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)

    # Draw ground rectangle (from ground level to bottom of screen)
    ground_rect::SDL_FRect = SDL_FRect(
        Float32(0.0 - game_state.camera_x),
        Float32(max_y - game_state.camera_y),  # Start at ground level
        Float32(win_w),
        Float32(win_h - max_y)  # Extend to bottom of screen
    )
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), ground_rect)
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(70), UInt8(50), UInt8(255))  # Brown ground color
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))

    # Render background sprite as a world item (affected by camera)
    if game_state.background_sprite != Ptr{Sprite}(C_NULL)
        render_sprite(renderer, game_state.background_sprite, Float32(0.0 - game_state.camera_x), Float32(0.0 - game_state.camera_y))
    end
    if game_state.player_sprite != Ptr{Sprite}(C_NULL)
        if game_state.player_sprite.is_flipped && keys_down_ptr.d
            game_state.player_sprite.is_flipped = false
            printf(c"Player is facing right\n")
        elseif !game_state.player_sprite.is_flipped && keys_down_ptr.a
            game_state.player_sprite.is_flipped = true
            printf(c"Player is facing left\n")
        end
    else
        # Fallback to rectangle
        rect::SDL_FRect = SDL_FRect(Float32(game_state.player_x - game_state.camera_x), Float32(game_state.player_y - game_state.camera_y), Float32(64), Float32(64))
        rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
        unsafe_store!(Ptr{SDL_FRect}(rect_ptr), rect)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
        llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
        wasm_free(Ptr{Cvoid}(rect_ptr))
    end
    # --- Draw mobile controls (rectangles) ---
    # Left button
    llvm_SDL_SetRenderDrawColor(renderer, game_state.left_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), left_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    # Right button
    llvm_SDL_SetRenderDrawColor(renderer, game_state.right_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), right_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    # Jump button
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(200), game_state.jump_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), jump_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    llvm_SDL_RenderPresent(renderer)
    llvm_SDL_Delay(UInt32(16)) # ~60 FPS

    return game_state
end

# Helper function for smooth movement
function move_toward(current::Float64, target::Float64, max_delta::Float64)::Float64
    if target > current
        return min(current + max_delta, target)
    elseif target < current
        return max(current - max_delta, target)
    else
        return target
    end
end

function handle_input(keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up}, keys_pressed::Ptr{KeyState_pressed}, game_state::Ptr{GameState}, window::Ptr{SDL_Window})::Int32
    # Reset key states for this frame
    keys_up.a = false
    keys_up.d = false
    keys_up.w = false
    keys_up.s = false
    keys_up.space = false
    
    # Reset key press states for this frame (these are one-time events)
    keys_pressed.a = false
    keys_pressed.d = false
    keys_pressed.w = false
    keys_pressed.s = false
    keys_pressed.space = false

    event::SDL_Event = SDL_Event()
    event_ptr::Ptr{SDL_Event} = wasm_malloc(UInt32(56))
    while llvm_SDL_PollEvent(event_ptr) != 0
        eventType = event_ptr.type
        if eventType == SDL_QUIT
            game_state.quit = true
        elseif eventType == SDL_KEYDOWN
            key = event_ptr.key.keysym.sym
            if key == SDLK_a
                keys_down.a = true
                keys_pressed.a = true
            elseif key == SDLK_d
                keys_down.d = true
                keys_pressed.d = true
            elseif key == SDLK_w
                keys_down.w = true
                keys_pressed.w = true
            elseif key == SDLK_s
                keys_down.s = true
                keys_pressed.s = true
            elseif key == SDLK_SPACE
                keys_down.space = true
                keys_pressed.space = true
            elseif key == SDLK_ESCAPE
                game_state.quit = true
            elseif key == SDLK_RETURN
                game_state.fullscreen = !game_state.fullscreen
                if game_state.fullscreen
                    llvm_SDL_SetWindowFullscreen(window, UInt32(1))
                else
                    llvm_SDL_SetWindowFullscreen(window, UInt32(0))
                end
            end
        elseif eventType == SDL_KEYUP
            key = event_ptr.key.keysym.sym
            if key == SDLK_a
                keys_up.a = true
            elseif key == SDLK_d
                keys_up.d = true
            elseif key == SDLK_w
                keys_up.w = true
            elseif key == SDLK_s
                keys_up.s = true
            elseif key == SDLK_SPACE
                keys_up.space = true
            end
        # --- Mobile Touch Events ---
        elseif eventType == SDL_FINGERDOWN || eventType == SDL_FINGERMOTION
            # Get window size and button rects (must match render loop)
            win_w_ptr = Ref{Int32}(0)
            win_h_ptr = Ref{Int32}(0)
            llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
            win_w = win_w_ptr[]
            win_h = win_h_ptr[]
            btn_area_h = win_h / Int32(4)
            btn_area_y = win_h - btn_area_h
            btn_w = win_w / Int32(3)
            #Get touch position (normalized 0-1)
            tx = Float64(event_ptr.tfinger.x)
            ty = Float64(event_ptr.tfinger.y)
            px = tx * Float64(win_w)
            py = ty * Float64(win_h)
            game_state.left_btn_pressed = false
            game_state.right_btn_pressed = false
            game_state.jump_btn_pressed = false
            if px >= 0 && px < btn_w && py >= btn_area_y
                keys_down.a = true
                game_state.left_btn_pressed = true
            end
            if px >= 2 * btn_w && px < 3 * btn_w && py >= btn_area_y
                keys_down.d = true
                game_state.right_btn_pressed = true
            end
            if px >= btn_w && px < 2 * btn_w && py >= btn_area_y
                keys_down.space = true
                game_state.jump_btn_pressed = true
            end
        elseif eventType == SDL_FINGERUP
            # On finger up, clear all touch key states and pressed states
            keys_down.a = false
            keys_down.d = false
            keys_down.space = false
            game_state.left_btn_pressed = false
            game_state.right_btn_pressed = false
            game_state.jump_btn_pressed = false
        end
    end

    if keys_up.a
        keys_down.a = false
    end
    if keys_up.d
        keys_down.d = false
    end
    if keys_up.w
        keys_down.w = false
    end
    if keys_up.s
        keys_down.s = false
    end
    if keys_up.space
        keys_down.space = false
    end

    wasm_free(Ptr{Cvoid}(event_ptr))
    return Int32(0)
end

# PC Entry Point - Main function for desktop builds
function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))

    window::Ptr{SDL_Window} = j_init_window()
    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    game_state_ptr::Ptr{GameState} = j_init_game_state(renderer, window)
    while !game_state_ptr.quit
        game_loop(game_state_ptr, renderer, window)
    end

    cleanup(game_state_ptr, renderer, window)
    
    return Int32(0)
end

function cleanup(game_state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})
    # Free sprite resources
    if game_state_ptr.player_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(game_state_ptr.player_sprite)
    end
    
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_pressed))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    #llvm_IMG_Quit()  # Cleanup SDL2_image

    llvm_SDL_Quit()
end

