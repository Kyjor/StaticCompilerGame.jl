# combined_game_working.jl
using StaticTools
using StaticCompiler

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl") 
include("llvm_bindings.jl")
include("wallocstring.jl")

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"Game test")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(640), UInt32(0))
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
# function init_animation(frames::MallocArray{AnimationFrame})::Ptr{Animation}
#     # frame_count::Int32 = Int32(4)
#     # frames_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(wasm_malloc(UInt32(sizeof(AnimationFrame) * frame_count)))
#     # str = m"Test"
#     # test = MallocArray{Int64}(undef, 4)
#     # test[1] = 1
#     # test[2] = 2
#     # test[3] = 3
#     # test[4] = 4
#     # for i in 1:frame_count
#     #     printf(c"%d\n", i)
#     #     printf(c"%d\n", test[i])
#     #     #unsafe_store!(frames_ptr + (i-1), frames[i])
#     # end
#     # anim_ptr::Ptr{Animation} = Ptr{Animation}(wasm_malloc(UInt32(sizeof(Animation))))
#     # unsafe_store!(anim_ptr, Animation(frames_ptr, frame_count, 0, 0.0))
#     # return anim_ptr
#     return Ptr{Animation}(C_NULL)
# end

# ============================================================================
# ANIMATION SYSTEM
# ============================================================================

# Utility helpers for manual pointer arithmetic without Julia runtime conversions
@inline function byte_ptr(ptr::Ptr{T}) where {T}
    return Ptr{UInt8}(ptr)
end

@inline function ptr_at(ptr::Ptr{T}, offset::Int64, ::Type{R}) where {T,R}
    return Ptr{R}(byte_ptr(ptr) + offset)
end

# Create an animation from an array of frames
# fps: frames per second for the animation
# loop: should the animation loop?
function create_animation(frames::Ptr{AnimationFrame}, frame_count::Int32, fps::Float64, loop::Bool)::Ptr{Animation}
    anim_ptr::Ptr{Animation} = Ptr{Animation}(wasm_malloc(UInt32(sizeof(Animation))))
    # Manually store each field to avoid struct constructor runtime checks
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:frames))), Ptr{AnimationFrame}), frames)
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:frame_count))), Int32), frame_count)
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:fps))), Float64), fps)
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:loop))), Bool), loop)
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:current_frame))), Int32), Int32(0))
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:timer))), Float64), Float64(0))
    unsafe_store!(ptr_at(anim_ptr, Int64(offsetof(Animation, Val(:finished))), Bool), false)
    return anim_ptr
end

# Update animation timer and advance frames based on delta time
function update_animation(anim::Ptr{Animation}, delta_time::Float64)::Cvoid
    if anim == Ptr{Animation}(C_NULL)
        return
    end
    
    # Don't update if animation is finished and not looping
    if anim.finished && !anim.loop
        return
    end
    
    # Accumulate time
    anim.timer += delta_time
    
    # Calculate frame duration based on fps
    frame_duration::Float64 = Float64(1.0) / anim.fps
    
    # Check if we should advance to next frame
    if anim.timer >= frame_duration
        anim.timer -= frame_duration
        
        # Advance frame
        next_frame::Int32 = anim.current_frame + Int32(1)
        
        if next_frame >= anim.frame_count
            if anim.loop
                # Loop back to start
                anim.current_frame = Int32(0)
            else
                # Stay on last frame and mark as finished
                anim.current_frame = anim.frame_count - Int32(1)
                anim.finished = true
            end
        else
            anim.current_frame = next_frame
        end
    end
end

# Reset animation to first frame
function reset_animation(anim::Ptr{Animation})::Cvoid
    if anim == Ptr{Animation}(C_NULL)
        return
    end
    anim.current_frame = Int32(0)
    anim.timer = Float64(0)
    anim.finished = false
end

# Get the current frame's crop data
function get_current_frame(anim::Ptr{Animation})::AnimationFrame
    # Return a zero frame by manually constructing it field-by-field
    # This avoids the AnimationFrame constructor which triggers Julia runtime
    if anim == Ptr{Animation}(C_NULL)
        # Create a temporary location to build the zero frame
        temp_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(wasm_malloc(UInt32(16)))
        temp_bytes::Ptr{UInt8} = byte_ptr(temp_ptr)
        unsafe_store!(Ptr{Int32}(temp_bytes + Int64(0)), Int32(0))    # crop_x
        unsafe_store!(Ptr{Int32}(temp_bytes + Int64(4)), Int32(0))    # crop_y
        unsafe_store!(Ptr{Int32}(temp_bytes + Int64(8)), Int32(0))    # crop_w
        unsafe_store!(Ptr{Int32}(temp_bytes + Int64(12)), Int32(0))   # crop_h
        result::AnimationFrame = unsafe_load(temp_ptr)
        wasm_free(Ptr{Cvoid}(temp_ptr))
        return result
    end
    
    offset::Int64 = Int64(anim.current_frame) * Int64(16)  # 16 = size of AnimationFrame (4 Int32s)
    # Use direct pointer arithmetic - pointers can be added to integers
    frame_ptr_bytes::Ptr{UInt8} = byte_ptr(anim.frames)
    frame_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(frame_ptr_bytes + offset)
    return unsafe_load(frame_ptr)
end

# Free animation memory
function free_animation(anim::Ptr{Animation})::Cvoid
    if anim == Ptr{Animation}(C_NULL)
        return
    end
    if anim.frames != Ptr{AnimationFrame}(C_NULL)
        wasm_free(Ptr{Cvoid}(anim.frames))
    end
    wasm_free(Ptr{Cvoid}(anim))
end

# Helper function to create frames array manually
function create_frames_array(count::Int32)::Ptr{AnimationFrame}
    size::UInt32 = UInt32(16) * UInt32(count)  # 16 = size of AnimationFrame
    frames_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(wasm_malloc(size))
    return frames_ptr
end

# Helper to set a specific frame in a frames array
function set_frame(frames::Ptr{AnimationFrame}, index::Int32, crop_x::Int32, crop_y::Int32, crop_w::Int32, crop_h::Int32)::Cvoid
    offset::Int64 = Int64(index) * Int64(16)  # 16 = size of AnimationFrame
    # Use direct pointer arithmetic - pointers can be added to integers
    frame_ptr_bytes::Ptr{UInt8} = byte_ptr(frames)
    frame_ptr::Ptr{AnimationFrame} = Ptr{AnimationFrame}(frame_ptr_bytes + offset)
    # Manually store each field to avoid struct constructor runtime checks
    frame_bytes::Ptr{UInt8} = byte_ptr(frame_ptr)
    unsafe_store!(Ptr{Int32}(frame_bytes + Int64(0)), crop_x)    # crop_x at offset 0
    unsafe_store!(Ptr{Int32}(frame_bytes + Int64(4)), crop_y)    # crop_y at offset 4
    unsafe_store!(Ptr{Int32}(frame_bytes + Int64(8)), crop_w)    # crop_w at offset 8
    unsafe_store!(Ptr{Int32}(frame_bytes + Int64(12)), crop_h)   # crop_h at offset 12
end
 
# In j_init_game_state, initialize animation state
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
    
    printf(c"Animations created\n")
    
    game_state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    # Initialize player at ground level (732.0) minus player height (64)
    unsafe_store!(Ptr{GameState}(game_state_ptr), GameState(Float64(500), Float64(668), Float64(0), Float64(0), Int32(1), Float64(0), Float64(0), Int32(0), keys_down, keys_up, keys_pressed, UInt64(0), false, Ptr{Sprite}(C_NULL), Ptr{Sprite}(C_NULL), Ptr{Player}(C_NULL), true, Float64(300), Float64(220), false, false, false, idle_anim, run_anim, jump_anim, idle_anim, ANIM_IDLE))
    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false

    # --- Load sprite if not loaded ---
    if game_state_ptr.player_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading player sprite\n")
        sprite_path::Ptr{UInt8} = str_ptr(w"assets/images/game.png")
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
        sprite_path_1::Ptr{UInt8} = str_ptr(w"assets/images/map.png")
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

# In game_loop, update animation state and frame
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
    
    # --- Player Animation Selection ---
    new_anim_state::Int32 = ANIM_IDLE
    
    if game_state.on_ground == Int32(0)
        new_anim_state = ANIM_JUMP
    elseif abs(game_state.player_vel_x) > Float64(1.0)
        new_anim_state = ANIM_RUN
    else
        new_anim_state = ANIM_IDLE
    end
    
    # Switch animation if state changed
    if new_anim_state != game_state.current_anim_state
        game_state.current_anim_state = new_anim_state
        
        if new_anim_state == ANIM_IDLE
            game_state.current_player_anim = game_state.player_idle_anim
        elseif new_anim_state == ANIM_RUN
            game_state.current_player_anim = game_state.player_run_anim
        elseif new_anim_state == ANIM_JUMP
            game_state.current_player_anim = game_state.player_jump_anim
        end
        
        reset_animation(game_state.current_player_anim)
    end
    
    # Update current animation
    update_animation(game_state.current_player_anim, delta_time)
    
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
        render_sprite_animated(renderer, game_state.player_sprite, game_state.current_player_anim, Float32(game_state.player_x - game_state.camera_x), Float32(game_state.player_y - game_state.camera_y))
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
    @static if Sys.isapple()
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
    end
    
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
    # Free animations
    free_animation(game_state_ptr.player_idle_anim)
    free_animation(game_state_ptr.player_run_anim)
    free_animation(game_state_ptr.player_jump_anim)
    
    # Free sprite resources
    # if game_state_ptr.player_sprite != Ptr{Sprite}(C_NULL)
    #     free_sprite(game_state_ptr.player_sprite)
    # end
    
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_pressed))
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


