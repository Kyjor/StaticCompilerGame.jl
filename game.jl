# combined_game_working.jl
using StaticTools
using StaticCompiler

include("structs.jl")
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
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(100), Int32(100), Int32(640), Int32(480), UInt32(0))
    wasm_free(Ptr{Cvoid}(window_name))
    return window
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), UInt32(2))
    return renderer
end

function j_init_game_state()::Ptr{Cvoid}
    printf(c"Initializing game state\n")
    game_state_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(GameState)))
    unsafe_store!(Ptr{GameState}(game_state_ptr), GameState(Float64(300), Float64(220), Float64(0), Float64(0), Int32(0), Float64(0), Float64(0), Int32(0)))
    return game_state_ptr
end

function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Ptr{GameState}
    delta_time::Float64 = Float64(0.016666666666666666)
    keys_down::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(KeyState_down)))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false))
    keys_up::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(KeyState_up)))
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false))
    keys_down_ptr::Ptr{KeyState_down} = Ptr{KeyState_down}(keys_down)
    keys_up_ptr::Ptr{KeyState_up} = Ptr{KeyState_up}(keys_up)
    handle_input(game_state, keys_down_ptr, keys_up_ptr)
    # Game state variables
    player_x::Float64 = game_state.player_x
    player_y::Float64 = game_state.player_y
    player_vel_x::Float64 = game_state.player_vel_x
    player_vel_y::Float64 = game_state.player_vel_y
    on_ground = game_state.on_ground
    coyote_time::Float64 = game_state.coyote_time
    jump_buffer::Float64 = game_state.jump_buffer
    is_jumping::Int32 = game_state.is_jumping
    
    
    # --- Platformer Physics ---
    gravity::Float64 = Float64(15.0)             # Gravity strength
    jump_velocity::Float64 = Float64(-12.0)    # Initial jump velocity
    ground_y::Float64 = Float64(100.0)           # Ground level
    move_accel::Float64 = Float64(800.0)         # Horizontal acceleration
    ground_decel::Float64 = Float64(800.0)       # Ground deceleration
    air_decel::Float64 = Float64(400.0)          # Air deceleration
    max_speed::Float64 = Float64(400.0)          # Max horizontal speed
    coyote_duration::Float64 = Float64(0.1)    # Time window for coyote time
    jump_buffer_duration::Float64 = Float64(0.1) # Time window for jump buffering
    jump_cancel_gravity_scale::Float64 = Float64(0.5) # Reduce gravity when jump button released
    
    # --- Coyote Time Update ---
    if on_ground == Int32(1)
        coyote_time = coyote_duration
    else
        coyote_time -= delta_time
    end
    
    # --- Jump Buffering Update ---
    if keys_down_ptr.space  # Jump button pressed
        jump_buffer = jump_buffer_duration
    else
        jump_buffer -= delta_time
    end
    
    # --- Horizontal movement (simplified) ---
    target_vel_x::Float64 = Float64(0)
    if keys_down_ptr.a     # A
        target_vel_x = -max_speed
    elseif keys_down_ptr.d  # D
        target_vel_x = max_speed
    end
    
    # Apply movement (simplified logic)
    if on_ground == Int32(1)
        player_vel_x = move_toward(player_vel_x, target_vel_x, Float64(move_accel * delta_time))
    else
        player_vel_x = move_toward(player_vel_x, target_vel_x, Float64(air_decel * delta_time))
    end
    
    game_state.player_vel_x = player_vel_x
    
    # --- Jumping ---
    # Check if we can jump (either on ground or in coyote time)
    can_jump = (on_ground == Int32(1) || coyote_time > Float64(0)) && !(is_jumping == Int32(1) && player_vel_y < Float64(0))
    
    # Jump if button pressed and either can jump now or has buffered jump
    if (can_jump && keys_down_ptr.space) || (on_ground == Int32(1) && jump_buffer > Float64(0))
        printf(c"Jumping\n")
        #print_string(ptr)
        player_vel_y = jump_velocity
        game_state.player_vel_y = player_vel_y
        game_state.on_ground = Int32(0)
        game_state.is_jumping = Int32(1)
        game_state.coyote_time = Float64(0)  # Consume coyote time
        game_state.jump_buffer = Float64(0)  # Consume jump buffer
    end
    
    # # Variable jump height (cancel jump when button released)
    if is_jumping == Int32(1) && player_vel_y < Float64(0) && !keys_up_ptr.space
        player_vel_y *= jump_cancel_gravity_scale
        game_state.player_vel_y = player_vel_y
    end
    
    # --- Gravity ---
    if on_ground == Int32(0)
        player_vel_y += Float64(gravity * delta_time)
        game_state.player_vel_y = player_vel_y
    else
        game_state.is_jumping = Int32(0)
    end
    
    # --- Update Position ---
    player_x += Float64(player_vel_x * delta_time)
    player_y += Float64(player_vel_y * delta_time)
    
    # --- Ground Collision ---
    if player_y >= ground_y
        player_y = ground_y
        player_vel_y = Float64(0)
        game_state.on_ground = Int32(1)
        game_state.player_vel_y = player_vel_y
    else
        game_state.on_ground = Int32(0)
    end
    
    # --- Save State ---
    game_state.player_x = player_x
    game_state.player_y = player_y
    game_state.player_vel_x = player_vel_x
    game_state.player_vel_y = player_vel_y
    game_state.on_ground = on_ground
    game_state.coyote_time = coyote_time
    game_state.jump_buffer = jump_buffer
    
    # print the game state
    # print player position
    printf(c"Player Position: %f, %f\n", player_x, player_y)
    #printf(c"Game State: %f, %f, %f, %f, %d, %f, %f, %d\n", player_x, player_y, player_vel_x, player_vel_y, on_ground, coyote_time, jump_buffer, is_jumping)
    # --- Render ---
    rect::SDL_FRect = SDL_FRect(Float32(player_x), Float32(player_y), Float32(64), Float32(64))
    rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(rect_ptr), rect)
    # set color to red
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderFillRectF(renderer, Ptr{SDL_FRect}(rect_ptr))
    wasm_free(Ptr{Cvoid}(rect_ptr))
    llvm_SDL_RenderPresent(renderer)
    llvm_SDL_Delay(UInt32(16)) # ~60 FPS
    

    wasm_free(Ptr{Cvoid}(keys_down))
    wasm_free(Ptr{Cvoid}(keys_up))
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

function handle_input(game_state::Ptr{GameState}, keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up})::Int32
    event::SDL_Event = SDL_Event()
    event_ptr::Ptr{SDL_Event} = wasm_malloc(UInt32(56))

    while llvm_SDL_PollEvent(event_ptr) != 0
        eventType = unsafe_load(Ptr{UInt32}(event_ptr))
        if eventType == SDL_QUIT
            running = Int32(0)
            printf(c"QUIT\n")
            return Int32(0)
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
                printf(c"JUMP\n")
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
        end
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
    max_frames::Int32 = Int32(600)
    frame_count::Int32 = Int32(0)
    game_state_ptr::Ptr{GameState} = j_init_game_state()
    while true
        frame_count += Int32(1)

        game_loop(game_state_ptr, renderer)

        if frame_count > max_frames
            return Int32(0)
        end
    end

    wasm_free(game_state_ptr)
    llvm_SDL_Quit()
    return Int32(0)
end


