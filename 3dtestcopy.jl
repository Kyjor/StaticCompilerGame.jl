# combined_game_working.jl
using StaticTools

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl")
include("llvm_bindings.jl")
include("llvm_bindings_opengl.jl")  # Auto-generated OpenGL bindings
include("wallocstring.jl")


# ============================================================================
# CONSTANTS
# ============================================================================
const NUM_STARS::Int32 = Int32(250)

# OpenGL ES 3.0 Constants
const GL_COLOR_BUFFER_BIT::UInt32 = UInt32(0x00004000)
const GL_DEPTH_BUFFER_BIT::UInt32 = UInt32(0x00000100)
const GL_STENCIL_BUFFER_BIT::UInt32 = UInt32(0x00000400)
const GL_DEPTH_TEST::UInt32 = UInt32(0x0B71)
const GL_NO_ERROR::UInt32 = UInt32(0)

struct GameState
    keys_up::Ptr{KeyState_up}
    keys_down::Ptr{KeyState_down}
    keys_pressed::Ptr{KeyState_pressed}
    last_frame_time::UInt64
    frame_count::UInt32
    fps_last_time::UInt64
    quit::Bool
    left_btn_pressed::Bool
    right_btn_pressed::Bool
    jump_btn_pressed::Bool
    # render data
    shader_program::UInt32
    vao::UInt32
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    return unsafe_load(Ptr{fieldtype(GameState, f)}(x + offsetof(GameState, Val(f))))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    return unsafe_store!(Ptr{fieldtype(GameState, f)}(x + offsetof(GameState, Val(f))), v)
end

function j_init_window()::Ptr{SDL_Window}
    # Set OpenGL context attributes before creating window
    # For desktop: Use full OpenGL 3.0 (better Linux support)
    # For web: Emscripten will use OpenGL ES 3.0 via WebGL2
    @static if Sys.islinux() || Sys.iswindows() || Sys.isapple()
        # Desktop: Use full OpenGL 3.0 Core profile
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_MAJOR_VERSION), Int32(3))
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_MINOR_VERSION), Int32(0))
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_PROFILE_MASK), Int32(SDL_GL_CONTEXT_PROFILE_CORE))
    else
        # Web/Other: Use OpenGL ES 3.0
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_MAJOR_VERSION), Int32(3))
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_MINOR_VERSION), Int32(0))
        llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_CONTEXT_PROFILE_MASK), Int32(SDL_GL_CONTEXT_PROFILE_ES))
    end
    llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_DOUBLEBUFFER), Int32(1))
    llvm_SDL_GL_SetAttribute(UInt32(SDL_GL_DEPTH_SIZE), Int32(24))
    
    window_name = str_ptr(w"OpenGL")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(480), UInt32(SDL_WINDOW_OPENGL))
    if window == Ptr{SDL_Window}(C_NULL)
        printf(c"Failed to create window\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
        wasm_free(Ptr{Cvoid}(window_name))
        return Ptr{SDL_Window}(C_NULL)
    end
    
    context = llvm_SDL_GL_CreateContext(window)
    if context == Ptr{Cvoid}(C_NULL)
        printf(c"Failed to create OpenGL context\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"GL Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
        wasm_free(Ptr{Cvoid}(window_name))
        return window
    end
    
    # CRITICAL: Make the context current (equivalent to glfwMakeContextCurrent)
    make_current_result = llvm_SDL_GL_MakeCurrent(window, context)
    if make_current_result != Int32(0)
        printf(c"Failed to make OpenGL context current\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"MakeCurrent Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
    else
        printf(c"OpenGL 3.0 context created and made current successfully\n")
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

# ============================================================================
# RANDOM NUMBER GENERATION (LCG - Linear Congruential Generator)
# ============================================================================
# Simple LCG random number generator (same as glibc)
function rand_next(state::Ptr{GameState})::UInt32
    a::UInt32 = UInt32(1103515245)
    c::UInt32 = UInt32(12345)
    new_state::UInt32 = a * state.rng_state + c
    state.rng_state = new_state
    return new_state
end

# Get random integer in range [0, max)
function rand_int(state::Ptr{GameState}, max::Int32)::Int32
    r::UInt32 = rand_next(state)
    if max <= Int32(0)
        return Int32(0)
    end
    return unsafe_trunc(Int32, r % UInt32(max))
end

# Get random integer in range [min, max)
function rand_range(state::Ptr{GameState}, min::Int32, max::Int32)::Int32
    if max <= min
        return min
    end
    range::Int32 = max - min
    return min + rand_int(state, range)
end

# ============================================================================
# 3D GAME FUNCTIONS
# ============================================================================
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
    unsafe_store!(Ptr{KeyState_up}(keys_up), KeyState_up(false, false, false, false, false, false, false, false, false))
    keys_down::Ptr{KeyState_down} = Ptr{KeyState_down}(wasm_malloc(UInt32(sizeof(KeyState_down))))
    unsafe_store!(Ptr{KeyState_down}(keys_down), KeyState_down(false, false, false, false, false, false, false, false, false))
    keys_pressed::Ptr{KeyState_pressed} = Ptr{KeyState_pressed}(wasm_malloc(UInt32(sizeof(KeyState_pressed))))
    unsafe_store!(Ptr{KeyState_pressed}(keys_pressed), KeyState_pressed(false, false, false, false, false, false, false, false, false))

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
            keys_up,
            keys_down,
            keys_pressed,
            UInt32(0),
            UInt64(0),
            UInt64(0),
            false,
            false,
            false,
            false,
            UInt32(0),
            UInt32(0),
        )
    )


    printf(c"Game state initialized\n")
    game_state_ptr.last_frame_time = UInt64(0)
    game_state_ptr.quit = false

    printf(c"3D game data initialized\n")
    vertex_shader_source::Ptr{UInt8} = str_ptr(w"
    #version 300 core
    layout(location = 0) in vec3 aPos;\n 
    void main() \n 
    {\n 
    gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n 
    }\0
    ")

    vertex_shader = llvm_glCreateShader(GL_VERTEX_SHADER)
    printf(c"Vertex shader created\n")
    # glShaderSource expects a pointer to an array of string pointers, not a single string pointer
    # Allocate memory for an array of 1 string pointer
    string_array_ptr = wasm_malloc(UInt32(sizeof(Ptr{Cvoid})))
    # Store the string pointer in the array
    unsafe_store!(Ptr{Ptr{Cvoid}}(string_array_ptr), vertex_shader_source, 1)
    # Pass pointer to the array (not the string itself)
    llvm_glShaderSource(vertex_shader, Int32(1), Ptr{Ptr{Cvoid}}(string_array_ptr), Ptr{Int32}(C_NULL))
    # Free the array (the string itself is still valid)
    wasm_free(string_array_ptr)
    printf(c"Vertex shader source set\n")
    llvm_glCompileShader(vertex_shader)
    printf(c"Vertex shader compiled\n")

    fragment_shader_source::Ptr{UInt8} = str_ptr(w"
    #version 300 core \n
    out vec4 FragColor;
    void main() \n 
    {\n 
    FragColor = vec4(1.0f, 0.5f, 0.2f, 1.0f);
    }\0
    ")

    fragment_shader = llvm_glCreateShader(GL_FRAGMENT_SHADER)
    printf(c"Fragment shader created\n")
    string_array_ptr = wasm_malloc(UInt32(sizeof(Ptr{Cvoid})))
    unsafe_store!(Ptr{Ptr{Cvoid}}(string_array_ptr), fragment_shader_source, 1)
    llvm_glShaderSource(fragment_shader, Int32(1), Ptr{Ptr{Cvoid}}(string_array_ptr), Ptr{Int32}(C_NULL))
    llvm_glCompileShader(fragment_shader)
    printf(c"Fragment shader compiled\n")
    wasm_free(string_array_ptr)
    printf(c"Fragment shader source set\n")
    program = llvm_glCreateProgram()
    llvm_glAttachShader(program, vertex_shader)
    llvm_glAttachShader(program, fragment_shader)
    llvm_glLinkProgram(program)
    printf(c"Program linked\n")
    llvm_glUseProgram(program)
    printf(c"Program used\n")
    llvm_glDeleteShader(vertex_shader)
    llvm_glDeleteShader(fragment_shader)
    printf(c"Shaders deleted\n")
    wasm_free(Ptr{Cvoid}(vertex_shader_source))
    wasm_free(Ptr{Cvoid}(fragment_shader_source))
    printf(c"Shader sources freed\n")

    game_state_ptr.shader_program = program
    
    # Create vertex data
    vertices = MallocArray{Float32}(undef, 9)  # 9 floats (3 vertices × 3 coordinates)
    vertices[1] = -0.5f0  # Vertex 1: x
    vertices[2] = -0.5f0  # Vertex 1: y
    vertices[3] =  0.0f0  # Vertex 1: z
    vertices[4] =  0.5f0  # Vertex 2: x
    vertices[5] = -0.5f0  # Vertex 2: y
    vertices[6] =  0.0f0  # Vertex 2: z
    vertices[7] =  0.0f0  # Vertex 3: x
    vertices[8] =  0.5f0  # Vertex 3: y
    vertices[9] =  0.0f0  # Vertex 3: z

    # Generate VAO and VBO
    vbo::Ptr{UInt32} = Ptr{UInt32}(wasm_malloc(UInt32(sizeof(UInt32))))
    vao::Ptr{UInt32} = Ptr{UInt32}(wasm_malloc(UInt32(sizeof(UInt32))))
    llvm_glGenVertexArrays(Int32(1), vao)
    llvm_glGenBuffers(Int32(1), vbo)
    
    # CRITICAL: Bind VAO FIRST, then set up vertex attributes
    # The VAO stores the vertex attribute configuration
    llvm_glBindVertexArray(unsafe_load(vao))
    
    # Bind VBO and upload vertex data
    llvm_glBindBuffer(GL_ARRAY_BUFFER, unsafe_load(vbo))
    llvm_glBufferData(GL_ARRAY_BUFFER, Int64(sizeof(Float32) * 9), Ptr{Cvoid}(vertices.pointer), GL_STATIC_DRAW)
    
    # Set vertex attribute pointer (this is stored in the VAO)
    llvm_glVertexAttribPointer(UInt32(0), Int32(3), GL_FLOAT, GL_FALSE, Int32(3 * sizeof(Float32)), Ptr{Cvoid}(0))
    llvm_glEnableVertexAttribArray(UInt32(0))
    
    # Unbind VBO (VAO remembers the binding)
    llvm_glBindBuffer(GL_ARRAY_BUFFER, UInt32(0))
    
    # Unbind VAO (optional, but good practice)
    llvm_glBindVertexArray(UInt32(0))
    
    printf(c"Vertex attribute array enabled\n")
    
    game_state_ptr.vao = unsafe_load(vao)
    
    # Note: vertices MallocArray is not freed here - it should be freed when no longer needed
    # For now, we keep it alive since the VBO has a copy of the data
    
    return game_state_ptr
end

# 3D Game Loop
function game_loop(game_state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    perf_freq::UInt64 = llvm_SDL_GetPerformanceFrequency()

    # FPS tracking - print every second
    if game_state.fps_last_time == UInt64(0)
        game_state.fps_last_time = current_time
    end

    game_state.frame_count += UInt32(1)
    time_elapsed::UInt64 = current_time - game_state.fps_last_time
    time_elapsed_seconds::Float64 = Float64(time_elapsed) / Float64(perf_freq)

    if time_elapsed_seconds >= Float64(1.0)
        fps::Float64 = Float64(game_state.frame_count) / time_elapsed_seconds
        printf(c"FPS: %.1f\n", fps)
        game_state.frame_count = UInt32(0)
        game_state.fps_last_time = current_time
    end

    # Use persistent key state from GameState
    keys_down_ptr::Ptr{KeyState_down} = game_state.keys_down
    keys_up_ptr::Ptr{KeyState_up} = game_state.keys_up
    keys_pressed_ptr::Ptr{KeyState_pressed} = game_state.keys_pressed
    handle_input(keys_down_ptr, keys_up_ptr, keys_pressed_ptr, game_state, window)

    # --- Render with OpenGL ES 3.0 ---
    # Get window size for viewport
    win_w_ptr = Ptr{Int32}(wasm_malloc(UInt32(sizeof(Int32))))
    win_h_ptr = Ptr{Int32}(wasm_malloc(UInt32(sizeof(Int32))))
    llvm_SDL_GetWindowSize(window, win_w_ptr, win_h_ptr)
    win_w = unsafe_load(win_w_ptr)
    win_h = unsafe_load(win_h_ptr)
    wasm_free(Ptr{Cvoid}(win_w_ptr))
    wasm_free(Ptr{Cvoid}(win_h_ptr))
    
    # Set viewport
    llvm_glViewport(Int32(0), Int32(0), win_w, win_h)
    
    # Clear screen with magenta color
    llvm_glClearColor(Float32(0.0), Float32(0.0), Float32(1.0), Float32(1.0))
    llvm_glClear(GL_COLOR_BUFFER_BIT)

    llvm_glUseProgram(game_state.shader_program)
    llvm_glBindVertexArray(game_state.vao)
    llvm_glDrawArrays(GL_TRIANGLES, Int32(0), Int32(3))

    llvm_SDL_GL_SwapWindow(window)
    #llvm_SDL_Delay(UInt32(5))

    return game_state
end

function handle_input(keys_down::Ptr{KeyState_down}, keys_up::Ptr{KeyState_up}, keys_pressed::Ptr{KeyState_pressed}, game_state::Ptr{GameState}, window::Ptr{SDL_Window})::Int32
    # Reset key states for this frame
    keys_up.a = false
    keys_up.d = false
    keys_up.w = false
    keys_up.s = false
    keys_up.space = false
    keys_up.left = false
    keys_up.right = false
    keys_up.up = false
    keys_up.down = false

    # Reset key press states for this frame (these are one-time events)
    keys_pressed.a = false
    keys_pressed.d = false
    keys_pressed.w = false
    keys_pressed.s = false
    keys_pressed.space = false
    keys_pressed.left = false
    keys_pressed.right = false
    keys_pressed.up = false
    keys_pressed.down = false

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
            elseif key == SDLK_LEFT
                keys_down.left = true
                keys_pressed.left = true
            elseif key == SDLK_RIGHT
                keys_down.right = true
                keys_pressed.right = true
            elseif key == SDLK_UP
                keys_down.up = true
                keys_pressed.up = true
            elseif key == SDLK_DOWN
                keys_down.down = true
                keys_pressed.down = true
            elseif key == SDLK_ESCAPE
                game_state.quit = true
                # elseif key == SDLK_RETURN
                #     game_state.fullscreen = !game_state.fullscreen
                #     if game_state.fullscreen
                #         llvm_SDL_SetWindowFullscreen(window, UInt32(1))
                #     else
                #         llvm_SDL_SetWindowFullscreen(window, UInt32(0))
                #     end
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
            elseif key == SDLK_LEFT
                keys_up.left = true
            elseif key == SDLK_RIGHT
                keys_up.right = true
            elseif key == SDLK_UP
                keys_up.up = true
            elseif key == SDLK_DOWN
                keys_up.down = true
            end
            # --- Mobile Touch Events ---
        elseif eventType == SDL_FINGERDOWN || eventType == SDL_FINGERMOTION
            # Get window size and button rects (must match render loop)
            win_w_ptr = Ptr{Int32}(wasm_malloc(UInt32(sizeof(Int32))))
            win_h_ptr = Ptr{Int32}(wasm_malloc(UInt32(sizeof(Int32))))
            llvm_SDL_GetWindowSize(window, win_w_ptr, win_h_ptr)
            win_w = unsafe_load(win_w_ptr)
            win_h = unsafe_load(win_h_ptr)
            wasm_free(Ptr{Cvoid}(win_w_ptr))
            wasm_free(Ptr{Cvoid}(win_h_ptr))
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
    printf(c"Window created\n")
    renderer::Ptr{SDL_Renderer} = Ptr{SDL_Renderer}(C_NULL)
    printf(c"Renderer created\n")
    game_state_ptr::Ptr{GameState} = j_init_game_state(renderer, window)
    printf(c"Game state created\n")
    while !game_state_ptr.quit
        game_loop(game_state_ptr, renderer, window)
    end

    cleanup(game_state_ptr, renderer, window)

    return Int32(0)
end

function cleanup(game_state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})

    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_down))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_up))
    wasm_free(Ptr{Cvoid}(game_state_ptr.keys_pressed))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    #llvm_IMG_Quit()  # Cleanup SDL2_image

    llvm_SDL_Quit()
end
