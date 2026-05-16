# Julia game layer (same role as host.c). Does not modify engine sources.
#
# Prerequisite:
#   julia +1.10 compile_library.jl desktop
#
# Run:
#   julia host.jl
#   # or: ./host_jl   (after: gcc -o host_jl host_shim.c)

using Libdl

const ROOT = @__DIR__
const LIB = joinpath(ROOT, "lib_desktop", "libsc_game.so")

function sdl_lib_path()::String
    vendored = joinpath(ROOT, "deps", "sdl2", "prefix", "lib64", "libSDL2.so")
    if isfile(vendored)
        return vendored
    end
    vendored = joinpath(ROOT, "deps", "sdl2", "prefix", "lib", "libSDL2.so")
    if isfile(vendored)
        return vendored
    end
    return "libSDL2-2.0.so.0"
end

# Path to SDL shared lib for ccall (must be String — not a dlopen handle).
const SDL_SO = Ref{Union{Nothing,String}}(nothing)

function load_libs!()
    if SDL_SO[] !== nothing
        return
    end
    isfile(LIB) || error("Missing $LIB — run: julia +1.10 compile_library.jl desktop")
    h_engine = dlopen(LIB, RTLD_LAZY | RTLD_GLOBAL)
    h_engine == C_NULL && error("dlopen failed: $LIB")
    sp = sdl_lib_path()
    h_sdl = dlopen(sp, RTLD_LAZY | RTLD_GLOBAL)
    h_sdl == C_NULL && error("dlopen SDL failed: $sp (install SDL2 or run deps/build_sdl2.sh)")
    SDL_SO[] = sp
    return
end

# --- Engine API (from libsc_game.so) ------------------------------------------

const Cint = Int32

j_sdl_init() = ccall((:j_sdl_init, LIB), Cint, ())
j_init_window() = ccall((:j_init_window, LIB), Ptr{Cvoid}, ())
j_init_renderer(window::Ptr{Cvoid}) = ccall((:j_init_renderer, LIB), Ptr{Cvoid}, (Ptr{Cvoid},), window)
sc_set_renderer(renderer::Ptr{Cvoid}) = ccall((:sc_set_renderer, LIB), Cvoid, (Ptr{Cvoid},), renderer)
j_fill_rect(x, y, w, h, r, g, b, a) =
    ccall((:j_fill_rect, LIB), Cint, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), x, y, w, h, r, g, b, a)

const SDL_QUIT_EVENT = UInt32(256)
const SDL_KEYDOWN = UInt32(768)
const SDL_KEYUP = UInt32(769)
const SDL_EVENT_SIZE = 56

function sdl_poll_event!(event::Vector{UInt8})::Bool
    return ccall((:SDL_PollEvent, SDL_SO[]::String), Cint, (Ptr{UInt8},), event) != 0
end

function event_type(event::Vector{UInt8})::UInt32
    return unsafe_load(Ptr{UInt32}(pointer(event)))
end

function event_keysym(event::Vector{UInt8})::Int32
    # SDL_KeyboardEvent: keysym @ 16, sym @ +4 within SDL_Keysym
    return unsafe_load(Ptr{Int32}(pointer(event) + 20))
end

function poll_events!(on_keydown, on_keyup)::Bool
    event = zeros(UInt8, SDL_EVENT_SIZE)
    quit = false
    while sdl_poll_event!(event)
        t = event_type(event)
        if t == SDL_QUIT_EVENT
            quit = true
        elseif t == SDL_KEYDOWN
            on_keydown(event_keysym(event))
        elseif t == SDL_KEYUP
            on_keyup(event_keysym(event))
        end
    end
    return quit
end

# SDL_RenderClear / Present via engine lib internals — use sc_fill_rect + manual present
# Export present/clear from lib if missing: call through fill + we need begin/end frame.
# sc_fill_rect only fills; use SDL directly for clear/present in runtime host.

function sdl_set_draw_color(r, g, b, a)
    ren = sc_get_renderer()
    ccall((:SDL_SetRenderDrawColor, SDL_SO[]::String), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt8), ren, r, g, b, a)
end

function sdl_render_clear()
    ren = sc_get_renderer()
    ccall((:SDL_RenderClear, SDL_SO[]::String), Cint, (Ptr{Cvoid},), ren)
end

function sdl_render_present()
    ren = sc_get_renderer()
    ccall((:SDL_RenderPresent, SDL_SO[]::String), Cvoid, (Ptr{Cvoid},), ren)
end

sc_get_renderer() = ccall((:sc_get_renderer, LIB), Ptr{Cvoid}, ())

# --- Game (love-style hooks) --------------------------------------------------

mutable struct Game
    running::Bool
    square_x::Int32
    square_y::Int32
end

const GAME = Ref(Game(true, 100, 0))

function game_load()
    GAME[] = Game(true, 100, 0)
end

function game_update()
end

function game_draw()
    g = GAME[]
    if j_fill_rect(g.square_x, g.square_y, 128, 128, 200, 80, 80, 255) != 0
        @warn "j_fill_rect failed"
    end
end

function game_key_pressed(key::Int32)
    g = GAME[]
    if key == Int32('q')
        println("pressed q")
    elseif key == 27  # SC_KEY_ESCAPE
        g.running = false
    elseif key == Int32('a')
        g.square_x -= 10
    elseif key == Int32('d')
        g.square_x += 10
    elseif key == Int32('w')
        g.square_y -= 10
    elseif key == Int32('s')
        g.square_y += 10
    end
    GAME[] = g
end

function game_key_released(key::Int32)
    if key == Int32('z')
        println("released z")
    end
end

function game_should_continue()::Bool
    GAME[].running
end

function game_shutdown()
end

# --- Loop (engine owns order; Julia game hooks) --------------------------------

function begin_frame()
    sdl_set_draw_color(40, 44, 52, 255)
    sdl_render_clear()
end

function end_frame()
    sdl_render_present()
end

function host_run()::Int32
    load_libs!()
    if j_sdl_init() != 0
        @error "j_sdl_init failed"
        return 1
    end
    window = j_init_window()
    if window == C_NULL
        @error "j_init_window failed"
        return 1
    end
    renderer = j_init_renderer(window)
    if renderer == C_NULL
        @error "j_init_renderer failed"
        return 1
    end
    sc_set_renderer(renderer)

    game_load()
    while game_should_continue()
        if poll_events!(game_key_pressed, game_key_released)
            break
        end
        begin_frame()
        game_update()
        game_draw()
        end_frame()
    end
    game_shutdown()
    return 0
end

if abspath(PROGRAM_FILE) == abspath(@__FILE__)
    exit(host_run())
end
