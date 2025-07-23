# combined_game_working.jl
using StaticTools
using StaticCompiler

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl") 
include("llvm_bindings.jl")

macro str_ptr_with_len(len_expr, str_expr)
    quote
        ptr::Ptr{Cvoid} = wasm_malloc(UInt32($len_expr + 1))
        for i = 1:$len_expr
            unsafe_store!(Ptr{UInt8}(ptr + i - 1), codeunit($str_expr, i))
        end
        unsafe_store!(Ptr{UInt8}(ptr + $len_expr), 0x00)
        Ptr{UInt8}(ptr)
    end
end

function j_init_window()::Ptr{SDL_Window}
    window_name::Ptr{UInt8} = @str_ptr_with_len 4 m"Game"
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(0), Int32(0), UInt32(1))
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

# Helper to allocate and initialize an Animation
function init_animation(frames::Vector{AnimationFrame})::Ptr{Animation}
    frame_count::Int32 = Int32(length(frames))
    frames_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(wasm_malloc(UInt32(sizeof(AnimationFrame) * frame_count)))
    for i in 1:frame_count
        unsafe_store!(frames_ptr + (i-1), frames[i])
    end
    anim_ptr::Ptr{Animation} = Ptr{Animation}(wasm_malloc(UInt32(sizeof(Animation))))
    unsafe_store!(anim_ptr, Animation(frames_ptr, frame_count, 0, 0.0))
    return anim_ptr
end

# Example: define animation frames for idle, run, jump (assume 64x64 frames in a horizontal spritesheet)
const IDLE_FRAMES = [AnimationFrame(0, 0, 64, 64, 0.2)]
const RUN_FRAMES = [AnimationFrame(64*i, 0, 64, 64, 0.1) for i in 0:3]
const JUMP_FRAMES = [AnimationFrame(256, 0, 64, 64, 0.3)]

# Helper to select animation by state
function j_select_animation(state::Int32)::Ptr{Animation}
    if state == ANIM_IDLE
        return init_animation(IDLE_FRAMES)
    elseif state == ANIM_RUN
        return init_animation(RUN_FRAMES)
    elseif state == ANIM_JUMP
        return init_animation(JUMP_FRAMES)
    else
        return init_animation(IDLE_FRAMES)
    end
end

# Update animation timer and frame
function update_animation(anim::Ptr{Animation}, delta::Float64)::Cvoid
    if anim == Ptr{Animation}(C_NULL)
        return
    end
    anim.timer += delta
    frame::AnimationFrame = unsafe_load(anim.frames + anim.current_frame)
    if anim.timer >= frame.duration
        anim.timer -= frame.duration
        anim.current_frame = (anim.current_frame + 1) % anim.frame_count
    end
end

# In j_init_game_state, initialize animation state
function j_init_game_state()::Ptr{GameState}
    printf(c"Initializing game state\n")
    keys_up::Ptr{KeyState_up} = Ptr{KeyState_up}(wasm_malloc(UInt32(sizeof(KeyState_up))))
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false))
    keys_down::Ptr{KeyState_down} = Ptr{KeyState_down}(wasm_malloc(UInt32(sizeof(KeyState_down))))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false))

    # sprite_init_result::Int32 = init_sprite_system()
    # if sprite_init_result != 0
    #     printf(c"Failed to initialize sprite system\n")
    # end

    #anim_ptr::Ptr{Animation} = init_animation(IDLE_FRAMES)
    game_state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    unsafe_store!(Ptr{GameState}(game_state_ptr), GameState(Float64(300), Float64(220), Float64(0), Float64(0), Int32(0), Float64(0), Float64(0), Int32(0), keys_down, keys_up, UInt64(0), false, Ptr{Sprite}(C_NULL), Ptr{Player}(C_NULL), true, Float64(300), Float64(220), false, false, false))
    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false
    return game_state_ptr
end

# In game_loop, update animation state and frame
function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    delta_time::Float64 = Float64(current_time - game_state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    game_state.last_frame_time = current_time
    # Use persistent key state from GameState
    keys_down_ptr::Ptr{KeyState_down} = game_state.keys_down
    keys_up_ptr::Ptr{KeyState_up} = game_state.keys_up
    handle_input(keys_down_ptr, keys_up_ptr, game_state, window)
    
    # --- Platformer Physics ---
    gravity::Float64 = Float64(800.0)             # Much stronger gravity
    jump_velocity::Float64 = Float64(-400.0)      # Much stronger jump
    ground_y::Float64 = Float64(400.0)           # Closer ground level
    move_accel::Float64 = Float64(2000.0)        
    ground_decel::Float64 = Float64(4000.0)      
    air_decel::Float64 = Float64(1200.0)         
    max_speed::Float64 = Float64(400.0)          
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
    if keys_down_ptr.space  # Jump button pressed
        game_state.jump_buffer = jump_buffer_duration
    else
        game_state.jump_buffer -= delta_time
    end
    
    # --- Horizontal movement (simplified) ---
    target_vel_x::Float64 = Float64(0)
    if keys_down_ptr.a     # A
        target_vel_x = -max_speed
    elseif keys_down_ptr.d  # D
        target_vel_x = max_speed
    end
    
    # Apply movement (simplified logic)
    if game_state.on_ground == Int32(1)
        game_state.player_vel_x = move_toward(game_state.player_vel_x, target_vel_x, Float64(move_accel * delta_time))
    else
        game_state.player_vel_x = move_toward(game_state.player_vel_x, target_vel_x, Float64(air_decel * delta_time))
    end
    
    # --- Jumping ---
    # Simple jump: if on ground and space pressed, jump
    if game_state.on_ground == Int32(1) && keys_down_ptr.space
        game_state.player_vel_y = jump_velocity
        game_state.on_ground = Int32(0)
        game_state.is_jumping = Int32(1)
    end
    
    # # Variable jump height (cancel jump when button released)
    if game_state.is_jumping == Int32(1) && game_state.player_vel_y < Float64(0) && keys_up_ptr.space
        game_state.player_vel_y *= jump_cancel_gravity_scale
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
    
    # --- Ground Collision ---
    if game_state.player_y >= ground_y
        game_state.player_y = ground_y
        game_state.player_vel_y = Float64(0)
        game_state.on_ground = Int32(1)
    else
        game_state.on_ground = Int32(0)
    end
    
    # --- Load sprite if not loaded ---
    # if game_state.player_sprite == Ptr{Sprite}(C_NULL)
    #     printf(c"Loading player sprite\n")
    #     sprite_path::Ptr{UInt8} = @str_ptr_with_len 12 m"skeleton.png"
    #     game_state.player_sprite = load_sprite(renderer, sprite_path)
    #     wasm_free(Ptr{Cvoid}(sprite_path))
        
    #     if game_state.player_sprite == Ptr{Sprite}(C_NULL)
    #         printf(c"Failed to load sprite, falling back to rectangle\n")
    #     end
    # end
    
    # --- Animation state selection (example logic) ---
    # if game_state.on_ground == Int32(0)
    #     if game_state.player_anim_state != ANIM_JUMP
    #         game_state.player_anim_state = ANIM_JUMP
    #         #free_animation(game_state.player_anim)
    #         game_state.player_anim = j_select_animation(ANIM_JUMP)
    #     end
    # elseif abs(game_state.player_vel_x) > 1.0
    #     if game_state.player_anim_state != ANIM_RUN
    #         game_state.player_anim_state = ANIM_RUN
    #         #free_animation(game_state.player_anim)
    #         game_state.player_anim = j_select_animation(ANIM_RUN)
    #     end
    # else
    #     if game_state.player_anim_state != ANIM_IDLE
    #         game_state.player_anim_state = ANIM_IDLE
    #         #free_animation(game_state.player_anim)
    #         game_state.player_anim = j_select_animation(ANIM_IDLE)
    #     end
    # end
    # Update animation frame
   # update_animation(game_state.player_anim, delta_time)
    
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

    # Draw ground rectangle
    ground_rect::SDL_FRect = SDL_FRect(
        Float32(0.0 - game_state.camera_x),
        Float32(ground_y - 32.0 - game_state.camera_y),  # 32px thick ground
        Float32(win_w),
        32.0f0
    )
    rect_ptr = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), ground_rect)
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(80), UInt8(80), UInt8(80), UInt8(255))
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))

    # Render sprite if available, otherwise render rectangle
    if game_state.player_sprite != Ptr{Sprite}(C_NULL)
        if game_state.player_sprite.is_flipped && keys_down_ptr.d
            game_state.player_sprite.is_flipped = false
            printf(c"Player is facing right\n")
        elseif !game_state.player_sprite.is_flipped && keys_down_ptr.a
            game_state.player_sprite.is_flipped = true
            printf(c"Player is facing left\n")
        end
        render_sprite(renderer, game_state.player_sprite, Float32(game_state.player_x - game_state.camera_x), Float32(game_state.player_y - game_state.camera_y))
        #render_result::Int32 = j_render_sprite(renderer, game_state.player_sprite, game_state.player_anim, Float32(game_state.player_x - game_state.camera_x), Float32(game_state.player_y - game_state.camera_y))
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

function handle_input(keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up}, game_state::Ptr{GameState}, window::Ptr{SDL_Window})::Int32
    # Reset key states for this frame
    keys_up.a = false
    keys_up.d = false
    keys_up.w = false
    keys_up.s = false
    keys_up.space = false

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
            elseif key == SDLK_d
                keys_down.d = true
            elseif key == SDLK_w
                keys_down.w = true
            elseif key == SDLK_s
                keys_down.s = true
            elseif key == SDLK_SPACE
                keys_down.space = true
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

macro static_string(str_expr)
    str = eval(str_expr)
    bytes = [UInt8(c) for c in str]
    push!(bytes, 0x00)  # null-terminate

    N = length(bytes)
    quote
        NTuple{$N, UInt8}($(Expr(:tuple, bytes...)))
    end
end

# pass to C function expecting char*
function str_ptr(str::MallocString)::Ptr{UInt8}
    #get the length of the string
    len = 0
    while str[len + 1] != 0x00
        len += 1
    end
    #allocate memory for the string
    tes = str.length
    tes1 = str.length-1
    ptr::Ptr{Cvoid} = wasm_malloc(UInt32(tes))
    #copy the string to the allocated memory
    for i = 1:8
        unsafe_store!(Ptr{UInt8}(ptr + i - 1), codeunit(str, i))
    end
    unsafe_store!(Ptr{UInt8}(ptr + tes), 0x00)
    return ptr
end

# PC Entry Point - Main function for desktop builds
function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))

    window::Ptr{SDL_Window} = j_init_window()
    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    game_state_ptr::Ptr{GameState} = j_init_game_state()
    while !game_state_ptr.quit
        game_loop(game_state_ptr, renderer, window)
    end

    cleanup(game_state_ptr, renderer, window)
    
    return Int32(0)
end

function cleanup(game_state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})
    # Free sprite resources
    # if game_state_ptr.player_sprite != Ptr{Sprite}(C_NULL)
    #     free_sprite(game_state_ptr.player_sprite)
    # end
    
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    #llvm_IMG_Quit()  # Cleanup SDL2_image
    llvm_SDL_Quit()
end

# Render sprite with animation frame cropping
function j_render_sprite(renderer::Ptr{SDL_Renderer}, sprite::Ptr{Sprite}, anim::Ptr{Animation}, x::Float32, y::Float32)::Int32
    if sprite == Ptr{Sprite}(C_NULL) || anim == Ptr{Animation}(C_NULL)
        return Int32(-1)
    end
    sprite_data::Sprite = unsafe_load(Ptr{Sprite}(sprite))
    if !sprite_data.loaded
        return Int32(-1)
    end
    frame::AnimationFrame = unsafe_load(anim.frames + anim.current_frame)
    src_rect::SDL_Rect = SDL_Rect(frame.x, frame.y, frame.w, frame.h)
    dst_rect::SDL_FRect = SDL_FRect(x, y, Float32(frame.w), Float32(frame.h))
    src_rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    dst_rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_Rect}(src_rect_ptr), src_rect)
    unsafe_store!(Ptr{SDL_FRect}(dst_rect_ptr), dst_rect)
    render_result::Int32 = llvm_SDL_RenderCopyF(renderer, sprite_data.texture, Ptr{SDL_Rect}(src_rect_ptr), Ptr{SDL_FRect}(dst_rect_ptr))
    wasm_free(Ptr{Cvoid}(src_rect_ptr))
    wasm_free(Ptr{Cvoid}(dst_rect_ptr))
    return render_result
end

# Free animation resources
function free_animation(anim::Ptr{Animation})::Cvoid
    if anim == Ptr{Animation}(C_NULL)
        return
    end
    if anim.frames != Ptr{AnimationFrame}(C_NULL)
        wasm_free(Ptr{Cvoid}(anim.frames))
    end
    wasm_free(Ptr{Cvoid}(anim))
end


