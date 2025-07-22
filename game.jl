# combined_game_working.jl
using StaticTools
using StaticCompiler

include("structs.jl")
include("game_structs.jl")
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

function j_init_game_state()::Ptr{GameState}
    printf(c"Initializing game state\n")
    keys_up::Ptr{KeyState_up} = Ptr{KeyState_up}(wasm_malloc(UInt32(sizeof(KeyState_up))))
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false))
    keys_down::Ptr{KeyState_down} = Ptr{KeyState_down}(wasm_malloc(UInt32(sizeof(KeyState_down))))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false))

    # Initialize sprite system
    sprite_init_result::Int32 = j_init_sprite_system()
    if sprite_init_result != 0
        printf(c"Failed to initialize sprite system\n")
    end

    game_state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    unsafe_store!(Ptr{GameState}(game_state_ptr), GameState(Float64(300), Float64(220), Float64(0), Float64(0), Int32(0), Float64(0), Float64(0), Int32(0), keys_down, keys_up, UInt64(0), false, Ptr{Sprite}(C_NULL)))
    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false

    return game_state_ptr
end

function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Ptr{GameState}
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    delta_time::Float64 = Float64(current_time - game_state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    game_state.last_frame_time = current_time
    # Use persistent key state from GameState
    keys_down_ptr::Ptr{KeyState_down} = game_state.keys_down
    keys_up_ptr::Ptr{KeyState_up} = game_state.keys_up
    handle_input(keys_down_ptr, keys_up_ptr, game_state)
    
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
    if game_state.player_sprite == Ptr{Sprite}(C_NULL)
        printf(c"Loading player sprite\n")
        sprite_path::Ptr{UInt8} = @str_ptr_with_len 28 m"./assets/images/skeleton.png"
        game_state.player_sprite = j_load_sprite_from_png(renderer, sprite_path)
        wasm_free(Ptr{Cvoid}(sprite_path))
        
        if game_state.player_sprite == Ptr{Sprite}(C_NULL)
            printf(c"Failed to load sprite, falling back to rectangle\n")
        end
    end
    
    # --- Render ---
    # Clear screen to black before drawing
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(0), UInt8(0), UInt8(0), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Render sprite if available, otherwise render rectangle
    if game_state.player_sprite != Ptr{Sprite}(C_NULL)
        render_result::Int32 = j_render_sprite(renderer, game_state.player_sprite, Float32(game_state.player_x), Float32(game_state.player_y))
    else
        # Fallback to rectangle
        rect::SDL_FRect = SDL_FRect(Float32(game_state.player_x), Float32(game_state.player_y), Float32(64), Float32(64))
        rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
        unsafe_store!(Ptr{SDL_FRect}(rect_ptr), rect)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(0), UInt8(0), UInt8(255))
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

# Sprite loading functions
function j_init_sprite_system()::Int32
    printf(c"Initializing sprite system\n")
    # Initialize SDL2_image with PNG support
    init_result::Int32 = llvm_IMG_Init(Int32(2))  # IMG_INIT_PNG = 2
    if init_result == 0
        printf(c"Failed to initialize SDL2_image\n")
        return Int32(-1)
    end
    printf(c"Sprite system initialized\n")
    return Int32(0)
end

function j_load_sprite_from_file(renderer::Ptr{SDL_Renderer}, file_path::Ptr{UInt8})::Ptr{Sprite}
    printf(c"Loading sprite from file\n")
    
    # Load texture directly using SDL2_image
    texture::Ptr{SDL_Texture} = llvm_IMG_LoadTexture(renderer, file_path)
    if texture == Ptr{SDL_Texture}(C_NULL)
        printf(c"Failed to load texture\n")
        return Ptr{Sprite}(C_NULL)
    end
    
    # Get texture dimensions (we'll use default values for now)
    # In a full implementation, you'd query the texture for actual dimensions
    width::Int32 = Int32(64)  # Default width
    height::Int32 = Int32(64) # Default height
    
    # Create sprite structure
    sprite_ptr::Ptr{Sprite} = Ptr{Sprite}(wasm_malloc(UInt32(sizeof(Sprite))))
    unsafe_store!(Ptr{Sprite}(sprite_ptr), Sprite(texture, width, height, true))
    
    printf(c"Sprite loaded successfully\n")
    return sprite_ptr
end

function j_load_sprite_from_png(renderer::Ptr{SDL_Renderer}, file_path::Ptr{UInt8})::Ptr{Sprite}
    printf(c"Loading PNG sprite\n")
    # Load PNG surface
    surface::Ptr{SDL_Surface} = llvm_IMG_Load(file_path)
    printf(c"Surface: %p\n", surface)
    if surface == Ptr{SDL_Surface}(C_NULL)
        printf(c"Failed to load PNG surface\n")
        return Ptr{Sprite}(C_NULL)
    end
    # get sdl error
    msg_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(1024))
    error_msg::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(msg_ptr, Int32(1024))
    printf(c"Error: %s\n", error_msg)
    wasm_free(Ptr{Cvoid}(msg_ptr))
    
    # Convert surface to texture
    texture::Ptr{SDL_Texture} = llvm_SDL_CreateTextureFromSurface(renderer, surface)
    llvm_SDL_FreeSurface(surface)
    
    if texture == Ptr{SDL_Texture}(C_NULL)
        printf(c"Failed to create texture from surface\n")
        return Ptr{Sprite}(C_NULL)
    end
    
    # Get texture dimensions (using surface dimensions)
    surface_width::Int32 = surface.w
    surface_height::Int32 = surface.h
    
    printf(c"Surface width: %d, Surface height: %d\n", surface_width, surface_height)
    # Create sprite structure
    sprite_ptr::Ptr{Sprite} = Ptr{Sprite}(wasm_malloc(UInt32(sizeof(Sprite))))
    unsafe_store!(Ptr{Sprite}(sprite_ptr), Sprite(texture, surface_width, surface_height, true))
    
    printf(c"PNG sprite loaded successfully\n")
    return sprite_ptr
end

function j_render_sprite(renderer::Ptr{SDL_Renderer}, sprite::Ptr{Sprite}, x::Float32, y::Float32)::Int32
    if sprite == Ptr{Sprite}(C_NULL)
        return Int32(-1)
    end
    
    sprite_data::Sprite = unsafe_load(Ptr{Sprite}(sprite))
    if !sprite_data.loaded
        return Int32(-1)
    end
    
    # Create destination rectangle
    dst_rect::SDL_FRect = SDL_FRect(x, y, Float32(sprite_data.width), Float32(sprite_data.height))
    dst_rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(dst_rect_ptr), dst_rect)
    
    # Render the texture
    render_result::Int32 = llvm_SDL_RenderCopyF(renderer, sprite_data.texture, Ptr{SDL_FRect}(C_NULL), Ptr{SDL_FRect}(dst_rect_ptr))
    wasm_free(Ptr{Cvoid}(dst_rect_ptr))
    
    return render_result
end

function j_free_sprite(sprite::Ptr{Sprite})::Cvoid
    if sprite == Ptr{Sprite}(C_NULL)
        return
    end
    
    sprite_data::Sprite = unsafe_load(Ptr{Sprite}(sprite))
    if sprite_data.loaded && sprite_data.texture != Ptr{SDL_Texture}(C_NULL)
        llvm_SDL_DestroyTexture(sprite_data.texture)
    end
    
    wasm_free(Ptr{Cvoid}(sprite))
end

function handle_input(keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up}, game_state::Ptr{GameState})::Int32
    # Reset key states for this frame
    keys_up.a = false
    keys_up.d = false
    keys_up.w = false
    keys_up.s = false
    keys_up.space = false

    event::SDL_Event = SDL_Event()
    event_ptr::Ptr{SDL_Event} = wasm_malloc(UInt32(56))
    while llvm_SDL_PollEvent(event_ptr) != 0
        eventType = unsafe_load(Ptr{UInt32}(event_ptr))
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
        game_loop(game_state_ptr, renderer)
    end

    cleanup(game_state_ptr, renderer, window)
    
    return Int32(0)
end

function cleanup(game_state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})
    # Free sprite resources
    # if game_state_ptr.player_sprite != Ptr{Sprite}(C_NULL)
    #     j_free_sprite(game_state_ptr.player_sprite)
    # end
    
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    #llvm_IMG_Quit()  # Cleanup SDL2_image
    llvm_SDL_Quit()
end


