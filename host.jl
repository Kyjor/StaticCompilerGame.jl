# Game layer (Julia) — same role as host.c hooks.
# Built via: julia +1.10 compile_library.jl desktop && ./build_host.sh
# Uses engine APIs: j_fill_rect, SDLK_* from structs / SC_KEY_* when calling from C.

struct HostGame
    running::Int32
    square_x::Int32
    square_y::Int32
end

function game_load()
    p::Ptr{HostGame} = Ptr{HostGame}(wasm_malloc(UInt32(12)))
    unsafe_store!(p, HostGame(Int32(1), Int32(100), Int32(0)))
    llvm_sc_set_game_state(p)
end

function game_state()::Ptr{HostGame}
    return llvm_sc_get_game_state()
end

function game_update()
end

function game_draw()
    s::HostGame = unsafe_load(game_state())
    if j_fill_rect(s.square_x, s.square_y, Int32(128), Int32(128), Int32(200), Int32(80), Int32(80), Int32(255)) != Int32(0)
        printf(c"j_fill_rect failed\n")
    end
end

function game_key_pressed(key::Int32)
    s::HostGame = unsafe_load(game_state())
    if key == Int32(SDLK_q)
        printf(c"pressed q\n")
    end
    if key == Int32(SDLK_ESCAPE)
        unsafe_store!(game_state(), HostGame(Int32(0), s.square_x, s.square_y))
        return
    end
    if key == Int32(SDLK_a)
        unsafe_store!(game_state(), HostGame(s.running, s.square_x - Int32(10), s.square_y))
    elseif key == Int32(SDLK_d)
        unsafe_store!(game_state(), HostGame(s.running, s.square_x + Int32(10), s.square_y))
    elseif key == Int32(SDLK_w)
        unsafe_store!(game_state(), HostGame(s.running, s.square_x, s.square_y - Int32(10)))
    elseif key == Int32(SDLK_s)
        unsafe_store!(game_state(), HostGame(s.running, s.square_x, s.square_y + Int32(10)))
    end
end

function game_key_released(key::Int32)
    if key == Int32(SDLK_z)
        printf(c"released z\n")
    end
end

function game_should_continue()::Int32
    return unsafe_load(game_state()).running
end

function game_shutdown()
    p::Ptr{HostGame} = game_state()
    if p != Ptr{HostGame}(C_NULL)
        wasm_free(Ptr{Cvoid}(p))
        llvm_sc_set_game_state(Ptr{HostGame}(C_NULL))
    end
end
