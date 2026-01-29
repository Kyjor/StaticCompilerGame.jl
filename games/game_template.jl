# ============================================================================
# GAME TEMPLATE - Entry Point & Game Loop
# ============================================================================
#
# HOW TO USE:
# 1. Copy this file to your game folder: games/mygame/mygame.jl
# 2. Copy game_state_template.jl to: games/mygame/mygame_state.jl
# 3. Update the include path for your state file (line ~20)
# 4. Rename MyGameState references to your state struct name
# 5. Implement game_init, game_loop, and game_cleanup
# 6. Compile with: julia compile_game.jl mygame web (or desktop)
#
# THE ENGINE PROVIDES:
# - Window & renderer initialization (init_window, init_renderer)
# - Input polling (create_input_state, poll_input, free_input_state)
# - Animation system (create_animation, update_animation, etc.)
# - Sprite system (load_sprite, render_sprite, free_sprite)
# - Audio initialization (init_audio)
# - Utility helpers (move_toward, get_delta_time, get_time)
#
# YOUR GAME MUST IMPLEMENT:
# - game_init(renderer, window) -> Ptr{YourGameState}
# - game_loop(state, renderer, window, delta_time) -> Ptr{YourGameState}
# - game_cleanup(state, renderer, window) -> Cvoid
# ============================================================================

# --- Include engine (provides all generic functionality) ---
# Path is relative to YOUR game file location (e.g., games/mygame/mygame.jl)
include("../../engine/engine.jl")

# --- Include your game-specific state struct ---
# This should be in the same directory as your game file
include("mygame_state.jl")

# ============================================================================
# GAME INITIALIZATION
# ============================================================================
# Called once at startup. Create your game state, load assets, etc.
# MUST return a pointer to your game state struct.

function game_init(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{MyGameState}
    printf(c"Initializing game state\n")
    
    # Initialize sprite system (required for loading images)
    sprite_init_result::Int32 = init_sprite_system()
    if sprite_init_result != 0
        printf(c"Failed to initialize sprite system\n")
    end
    
    # Initialize audio (optional)
    audio_ready::Bool = init_audio()
    
    # Create input state (REQUIRED)
    input::Ptr{InputState} = create_input_state()
    
    # Allocate game state
    state_ptr::Ptr{MyGameState} = Ptr{MyGameState}(wasm_malloc(UInt32(sizeof(MyGameState))))
    
    # Initialize required engine fields
    state_ptr.input = input
    state_ptr.last_frame_time = get_time()
    state_ptr.quit = false
    state_ptr.fullscreen = true
    
    # Initialize your game fields
    state_ptr.player_x = Float64(320)
    state_ptr.player_y = Float64(320)
    state_ptr.player_vel_x = Float64(0)
    state_ptr.player_vel_y = Float64(0)
    state_ptr.camera_x = Float64(0)
    state_ptr.camera_y = Float64(0)
    state_ptr.player_sprite = Ptr{Sprite}(C_NULL)
    state_ptr.background_sprite = Ptr{Sprite}(C_NULL)
    
    # --- LOAD YOUR ASSETS HERE ---
    # Example:
    # sprite_path::Ptr{UInt8} = str_ptr(w"assets/player.png")
    # state_ptr.player_sprite = load_sprite(renderer, sprite_path, Int32(0), Int32(0), Int32(32), Int32(32), Int32(64), Int32(64))
    # wasm_free(Ptr{Cvoid}(sprite_path))
    
    printf(c"Game state initialized\n")
    return state_ptr
end

# ============================================================================
# GAME LOOP
# ============================================================================
# Called every frame. Handle input, update game logic, render.
# NOTE: delta_time is calculated internally. Input is polled internally.

function game_loop(state::Ptr{MyGameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{MyGameState}
    # Calculate delta time
    current_time::UInt64 = get_time()
    delta_time::Float64 = Float64(current_time - state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    state.last_frame_time = current_time
    
    # Poll input
    poll_input(state.input, window)
    
    input::Ptr{InputState} = state.input
    keys_down::Ptr{KeyState_down} = input.keys_down
    
    # --- HANDLE INPUT ---
    # Check input.quit_requested for ESC/window close
    if input.quit_requested
        state.quit = true
    end
    
    # Check input.fullscreen_toggled for Enter key
    if input.fullscreen_toggled
        state.fullscreen = !state.fullscreen
        if state.fullscreen
            llvm_SDL_SetWindowFullscreen(window, UInt32(1))
        else
            llvm_SDL_SetWindowFullscreen(window, UInt32(0))
        end
    end
    
    # --- YOUR GAME LOGIC HERE ---
    # Example: move player based on input
    move_speed::Float64 = Float64(200.0)
    
    if keys_down.a
        state.player_x -= move_speed * delta_time
    end
    if keys_down.d
        state.player_x += move_speed * delta_time
    end
    if keys_down.w
        state.player_y -= move_speed * delta_time
    end
    if keys_down.s
        state.player_y += move_speed * delta_time
    end
    
    # --- RENDER ---
    # Clear screen
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Draw background sprite (if loaded)
    if state.background_sprite != Ptr{Sprite}(C_NULL)
        render_sprite(renderer, state.background_sprite, Float32(0), Float32(0))
    end
    
    # Draw player sprite or fallback rectangle
    if state.player_sprite != Ptr{Sprite}(C_NULL)
        render_sprite(renderer, state.player_sprite, Float32(state.player_x), Float32(state.player_y))
    else
        # Fallback: draw a rectangle
        rect::SDL_FRect = SDL_FRect(Float32(state.player_x), Float32(state.player_y), Float32(64), Float32(64))
        rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
        unsafe_store!(Ptr{SDL_FRect}(rect_ptr), rect)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
        llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
        wasm_free(Ptr{Cvoid}(rect_ptr))
    end
    
    # Present rendered frame
    llvm_SDL_RenderPresent(renderer)
    llvm_SDL_Delay(UInt32(16))  # ~60 FPS cap
    
    return state
end

# ============================================================================
# GAME CLEANUP
# ============================================================================
# Called once at shutdown. Free all your allocated resources.

function game_cleanup(state::Ptr{MyGameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Cvoid
    # Free sprites
    if state.player_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(state.player_sprite)
    end
    if state.background_sprite != Ptr{Sprite}(C_NULL)
        free_sprite(state.background_sprite)
    end
    
    # Free animations (if any)
    # free_animation(state.some_anim)
    
    # Free input state (REQUIRED)
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
# This is the main function called by the compiled executable.
# You shouldn't need to modify this much.

function pc_main()::Int32
    # Initialize SDL
    llvm_SDL_Init(UInt32(32))  # SDL_INIT_VIDEO
    
    # Create window and renderer
    window::Ptr{SDL_Window} = init_window()
    renderer::Ptr{SDL_Renderer} = init_renderer(window)
    
    # Initialize game
    state::Ptr{MyGameState} = game_init(renderer, window)
    
    # Main loop (game_loop handles delta_time and input polling internally)
    while !state.quit
        state = game_loop(state, renderer, window)
    end
    
    # Cleanup
    game_cleanup(state, renderer, window)
    
    return Int32(0)
end
