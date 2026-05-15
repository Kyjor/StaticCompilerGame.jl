function j_init_window()::Ptr{Main.SDL_Window}
    window_name = Main.str_ptr(w"sc-game")
    window::Ptr{Main.SDL_Window} = Main.llvm_SDL_CreateWindow(
        window_name,
        Int32(0), Int32(0),
        Int32(640), Int32(480),
        UInt32(Main.SDL_WINDOW_SHOWN),
    )
    if window == Ptr{Main.SDL_Window}(C_NULL)
        printf(c"Failed to create window\n")
        msg_ptr = Main.wasm_malloc(UInt32(100))
        msg = Main.llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"Error: %s\n", msg)
        Main.wasm_free(Ptr{Cvoid}(msg_ptr))
        Main.wasm_free(Ptr{Cvoid}(window_name))
        return Ptr{Main.SDL_Window}(C_NULL)
    end

    Main.wasm_free(Ptr{Cvoid}(window_name))
    return window
end
