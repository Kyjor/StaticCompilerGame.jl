# Platformer Game
# A 2D platformer with physics, animations, and mobile touch controls

# Include engine (provides window, renderer, input, animation, sprites)
include("../../engine/engine.jl")

# Include platformer-specific state
include("platformer_state.jl")

# ============================================================================
# GAME INITIALIZATION
# ============================================================================

function game_init(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{PlatformerState}
    printf(c"Initializing platformer game state\n")
    @static if Sys.iswindows()
        printf(c"Windows\n")
    elseif Sys.isapple()
        printf(c"macOS\n")
        platform = llvm_SDL_GetPlatform()
        printf(c"Platform: %s\n", platform)
    else
        printf(c"Linux\n")
    end
    
    # Initialize sprite system
    sprite_init_result::Int32 = init_sprite_system()
    if sprite_init_result != 0
        printf(c"Failed to initialize sprite system\n")
    end
    
    # Initialize audio
    audio_ready::Bool = init_audio()
    
    # Create input state
    input::Ptr{InputState} = create_input_state()
    
    # Load jump sound
    jump_sound::Ptr{Mix_Chunk} = Ptr{Mix_Chunk}(C_NULL)
    if audio_ready
        printf(c"Skipping sound loading - Mix_LoadWAV crashes in browser\n")
        jump_sound_path::Ptr{UInt8} = str_ptr(w"/assets/Jump.wav")
        jump_sound = llvm_Mix_LoadWAV(jump_sound_path)
        wasm_free(Ptr{Cvoid}(jump_sound_path))
    else
        printf(c"Skipping sound loading - audio device not ready\n")
    end
    
    # Create player animations
    printf(c"Creating player animations\n")
    
    # IDLE Animation - 1 frame at (120, 360), looping at 2 FPS
    idle_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
    set_frame(idle_frames, Int32(0), Int32(120), Int32(360), Int32(8), Int32(8))
    idle_anim::Ptr{Animation} = create_animation(idle_frames, Int32(1), Float64(2.0), true)
    
    # RUN Animation - 4 frames at y=368, looping at 8 FPS
    run_frames::Ptr{AnimationFrame} = create_frames_array(Int32(4))
    set_frame(run_frames, Int32(0), Int32(16), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(1), Int32(24), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(2), Int32(32), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(3), Int32(40), Int32(368), Int32(8), Int32(8))
    run_anim::Ptr{Animation} = create_animation(run_frames, Int32(4), Float64(8.0), true)
    
    # JUMP Animation - 1 frame at (8, 368), non-looping
    jump_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
    set_frame(jump_frames, Int32(0), Int32(8), Int32(368), Int32(8), Int32(8))
    jump_anim::Ptr{Animation} = create_animation(jump_frames, Int32(1), Float64(1.0), false)
    
    # Allocate game state
    state_ptr::Ptr{PlatformerState} = Ptr{PlatformerState}(wasm_malloc(UInt32(sizeof(PlatformerState))))
    
    # Initialize required engine fields
    state_ptr.input = input
    state_ptr.last_frame_time = get_time()
    state_ptr.quit = false
    state_ptr.fullscreen = true
    
    # Initialize player at ground level (732.0) minus player height (64)
    state_ptr.player_x = Float64(500)
    state_ptr.player_y = Float64(668)
    state_ptr.player_vel_x = Float64(0)
    state_ptr.player_vel_y = Float64(0)
    state_ptr.on_ground = Int32(1)
    state_ptr.coyote_time = Float64(0)
    state_ptr.jump_buffer = Float64(0)
    state_ptr.is_jumping = Int32(0)
    
    # Camera
    state_ptr.camera_x = Float64(300)
    state_ptr.camera_y = Float64(220)
    
    # Sprites (initialized to null, loaded below)
    state_ptr.player_sprite = Ptr{Sprite}(C_NULL)
    state_ptr.background_sprite = Ptr{Sprite}(C_NULL)
    
    # Animations
    state_ptr.player_idle_anim = idle_anim
    state_ptr.player_run_anim = run_anim
    state_ptr.player_jump_anim = jump_anim
    state_ptr.current_player_anim = idle_anim
    state_ptr.current_anim_state = ANIM_IDLE
    
    # Audio
    state_ptr.jump_sound = jump_sound
    
    # Mobile UI
    state_ptr.left_btn_pressed = false
    state_ptr.right_btn_pressed = false
    state_ptr.jump_btn_pressed = false
    
    # Load sprites
    printf(c"Loading player sprite\n")
    sprite_path::Ptr{UInt8} = str_ptr(w"assets/game.png")
    state_ptr.player_sprite = load_sprite(renderer, sprite_path, Int32(120), Int32(360), Int32(8), Int32(8), Int32(64), Int32(64))
    wasm_free(Ptr{Cvoid}(sprite_path))
    
    if state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
        error_ptr = wasm_malloc(UInt32(100))
        error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
        printf(c"Error loading player sprite: %s\n", error)
        wasm_free(Ptr{Cvoid}(error_ptr))
    end
    
    printf(c"Loading background sprite\n")
    sprite_path_1::Ptr{UInt8} = str_ptr(w"assets/map.png")
    state_ptr.background_sprite = load_sprite(renderer, sprite_path_1, Int32(0), Int32(0), Int32(640), Int32(640), Int32(640), Int32(640))
    wasm_free(Ptr{Cvoid}(sprite_path_1))
    
    if state_ptr.background_sprite == Ptr{Sprite}(C_NULL)
        error_ptr = wasm_malloc(UInt32(100))
        error = llvm_SDL_GetErrorMsg(error_ptr, Int32(100))
        printf(c"Error loading background sprite: %s\n", error)
        wasm_free(Ptr{Cvoid}(error_ptr))
    end
    
    printf(c"Platformer game state initialized\n")
    return state_ptr
end

# ============================================================================
# GAME LOOP
# ============================================================================

function game_loop(state::Ptr{PlatformerState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{PlatformerState}
    # Calculate delta time internally (required when called from JS)
    current_time::UInt64 = get_time()
    delta_time::Float64 = Float64(current_time - state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    state.last_frame_time = current_time
    
    # Poll input
    poll_input(state.input, window)
    
    input::Ptr{InputState} = state.input
    keys_down::Ptr{KeyState_down} = input.keys_down
    keys_up::Ptr{KeyState_up} = input.keys_up
    keys_pressed::Ptr{KeyState_pressed} = input.keys_pressed
    
    # Handle quit/fullscreen
    if input.quit_requested
        state.quit = true
    end
    if input.fullscreen_toggled
        state.fullscreen = !state.fullscreen
        if state.fullscreen
            llvm_SDL_SetWindowFullscreen(window, UInt32(1))
        else
            llvm_SDL_SetWindowFullscreen(window, UInt32(0))
        end
    end
    
    # --- Platformer Physics Constants ---
    gravity::Float64 = Float64(1500.0)
    jump_velocity::Float64 = Float64(-500.0)
    min_x::Float64 = Float64(364)
    max_x::Float64 = Float64(812)
    min_y::Float64 = Float64(284)
    max_y::Float64 = Float64(732.0)  # Ground level
    move_speed::Float64 = Float64(300.0)
    move_accel::Float64 = Float64(2000.0)
    ground_decel::Float64 = Float64(4000.0)
    air_decel::Float64 = Float64(1200.0)
    max_speed::Float64 = Float64(300.0)
    coyote_duration::Float64 = Float64(0.1)
    jump_buffer_duration::Float64 = Float64(0.1)
    jump_cancel_gravity_scale::Float64 = Float64(0.5)
    
    # --- Coyote Time Update ---
    if state.on_ground == Int32(1)
        state.coyote_time = coyote_duration
    else
        state.coyote_time -= delta_time
    end
    
    # --- Jump Buffering Update ---
    if keys_pressed.space
        state.jump_buffer = jump_buffer_duration
    else
        state.jump_buffer -= delta_time
    end
    
    # --- Horizontal movement ---
    target_vel_x::Float64 = Float64(0)
    if keys_down.a && state.player_x > min_x
        target_vel_x = -move_speed
    elseif keys_down.d && state.player_x < max_x
        target_vel_x = move_speed
    end
    
    if state.on_ground == Int32(1)
        state.player_vel_x = move_toward(state.player_vel_x, target_vel_x, Float64(move_accel * delta_time))
    else
        state.player_vel_x = move_toward(state.player_vel_x, target_vel_x, Float64(air_decel * delta_time))
    end
    
    if state.player_vel_x > max_speed
        state.player_vel_x = max_speed
    elseif state.player_vel_x < -max_speed
        state.player_vel_x = -max_speed
    end
    
    # --- Jumping ---
    if state.coyote_time > Float64(0) && state.jump_buffer > Float64(0)
        state.player_vel_y = jump_velocity
        state.on_ground = Int32(0)
        state.is_jumping = Int32(1)
        state.coyote_time = Float64(0)
        state.jump_buffer = Float64(0)
        
        if state.jump_sound != Ptr{Mix_Chunk}(C_NULL)
            play_result::Int32 = llvm_Mix_PlayChannel(Int32(-1), state.jump_sound, Int32(0))
            if play_result < Int32(0)
                printf(c"Failed to play jump sound, channel: %d\n", play_result)
            end
        end
    end
    
    # Variable jump height
    if state.is_jumping == Int32(1) && state.player_vel_y < Float64(0) && keys_up.space
        state.player_vel_y *= jump_cancel_gravity_scale
        state.is_jumping = Int32(0)
    end
    
    # --- Gravity ---
    if state.on_ground == Int32(0)
        state.player_vel_y += Float64(gravity * delta_time)
    else
        state.is_jumping = Int32(0)
    end
    
    # --- Update Position ---
    state.player_x += Float64(state.player_vel_x * delta_time)
    state.player_y += Float64(state.player_vel_y * delta_time)
    
    # Clamp horizontal position
    if state.player_x < min_x
        state.player_x = min_x
        state.player_vel_x = Float64(0)
    elseif state.player_x > max_x
        state.player_x = max_x
        state.player_vel_x = Float64(0)
    end
    
    # --- Ground Collision ---
    if state.player_y >= max_y
        state.player_y = max_y
        state.player_vel_y = Float64(0)
        state.on_ground = Int32(1)
    else
        state.on_ground = Int32(0)
    end
    
    # --- Player Animation Selection ---
    new_anim_state::Int32 = ANIM_IDLE
    if state.on_ground == Int32(0)
        new_anim_state = ANIM_JUMP
    elseif abs(state.player_vel_x) > Float64(1.0)
        new_anim_state = ANIM_RUN
    else
        new_anim_state = ANIM_IDLE
    end
    
    if new_anim_state != state.current_anim_state
        printf(c"Animation state changed to %d\n", new_anim_state)
        state.current_anim_state = new_anim_state
        
        if new_anim_state == ANIM_IDLE
            state.current_player_anim = state.player_idle_anim
        elseif new_anim_state == ANIM_RUN
            state.current_player_anim = state.player_run_anim
        elseif new_anim_state == ANIM_JUMP
            state.current_player_anim = state.player_jump_anim
        end
        reset_animation(state.current_player_anim)
    end
    
    update_animation(state.current_player_anim, delta_time)
    
    # --- Camera ---
    win_w::Int32, win_h::Int32 = get_window_size(window)
    player_width::Float64 = 64.0
    player_height::Float64 = 64.0
    target_camera_x::Float64 = state.player_x - Float64(win_w) / 2.0 + player_width / 2.0
    target_camera_y::Float64 = state.player_y - Float64(win_h) / 2.0 + player_height / 2.0
    camera_speed::Float64 = 0.15
    state.camera_x += (target_camera_x - state.camera_x) * camera_speed
    state.camera_y += (target_camera_y - state.camera_y) * camera_speed
    
    # --- Mobile Controls Button Areas ---
    btn_area_h = win_h / Int32(4)
    btn_area_y = win_h - btn_area_h
    btn_w = win_w / Int32(3)
    left_btn_rect = SDL_FRect(0.0f0, Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    right_btn_rect = SDL_FRect(Float32(2 * btn_w), Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    jump_btn_rect = SDL_FRect(Float32(btn_w), Float32(btn_area_y), Float32(btn_w), Float32(btn_area_h))
    
    state.left_btn_pressed = false
    state.right_btn_pressed = false
    state.jump_btn_pressed = false
    
    # --- RENDER ---
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Draw ground
    ground_rect::SDL_FRect = SDL_FRect(
        Float32(0.0 - state.camera_x),
        Float32(max_y - state.camera_y),
        Float32(win_w),
        Float32(win_h - max_y)
    )
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), ground_rect)
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(70), UInt8(50), UInt8(255))
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    # Draw background
    if state.background_sprite != Ptr{Sprite}(C_NULL)
        render_sprite(renderer, state.background_sprite, Float32(0.0 - state.camera_x), Float32(0.0 - state.camera_y))
    end
    
    # Draw player
    if state.player_sprite != Ptr{Sprite}(C_NULL)
        if state.player_sprite.is_flipped && keys_down.d
            state.player_sprite.is_flipped = false
            printf(c"Player is facing right\n")
        elseif !state.player_sprite.is_flipped && keys_down.a
            state.player_sprite.is_flipped = true
            printf(c"Player is facing left\n")
        end
        render_sprite_animated(renderer, state.player_sprite, state.current_player_anim, Float32(state.player_x - state.camera_x), Float32(state.player_y - state.camera_y))
    else
        rect::SDL_FRect = SDL_FRect(Float32(state.player_x - state.camera_x), Float32(state.player_y - state.camera_y), Float32(64), Float32(64))
        rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
        unsafe_store!(Ptr{SDL_FRect}(rect_ptr), rect)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
        llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
        wasm_free(Ptr{Cvoid}(rect_ptr))
    end
    
    # --- Draw mobile controls ---
    llvm_SDL_SetRenderDrawColor(renderer, state.left_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), left_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    llvm_SDL_SetRenderDrawColor(renderer, state.right_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), right_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(200), state.jump_btn_pressed ? UInt8(100) : UInt8(200), UInt8(200), UInt8(180))
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), jump_btn_rect)
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    
    llvm_SDL_RenderPresent(renderer)
    llvm_SDL_Delay(UInt32(16))
    
    return state
end

# ============================================================================
# GAME CLEANUP
# ============================================================================

function game_cleanup(state::Ptr{PlatformerState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Cvoid
    # Free animations
    free_animation(state.player_idle_anim)
    free_animation(state.player_run_anim)
    free_animation(state.player_jump_anim)
    
    # Free sprites
    if state.player_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(state.player_sprite)
    end
    if state.background_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(state.background_sprite)
    end
    
    # Free input state
    free_input_state(state.input)
    
    # Free game state
    wasm_free(Ptr{Cvoid}(state))
    
    # Cleanup engine
    cleanup_engine(renderer, window)
    
    return
end

# ============================================================================
# ENTRY POINT
# ============================================================================

function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))
    
    window::Ptr{SDL_Window} = init_window()
    renderer::Ptr{SDL_Renderer} = init_renderer(window)
    state::Ptr{PlatformerState} = game_init(renderer, window)
    
    while !state.quit
        state = game_loop(state, renderer, window)
    end
    
    game_cleanup(state, renderer, window)
    
    return Int32(0)
end
