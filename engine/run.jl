function sc_frame()::Int32
    if llvm_game_should_continue() == Int32(0)
        return Int32(0)
    end
    if poll_events() != Int32(0)
        return Int32(0)
    end
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        return Int32(0)
    end
    begin_frame(renderer)
    llvm_game_update()
    llvm_game_draw()
    end_frame(renderer)
    llvm_sc_note_frame_rendered()
    return Int32(1)
end

function sc_engine_init()::Int32
    if j_sdl_init() != Int32(0)
        return Int32(1)
    end

    window::Ptr{SDL_Window} = j_init_window()
    if window == Ptr{SDL_Window}(C_NULL)
        llvm_SDL_Quit()
        return Int32(1)
    end

    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        llvm_SDL_DestroyWindow(window)
        llvm_SDL_Quit()
        return Int32(1)
    end

    llvm_sc_set_window(window)
    llvm_sc_set_renderer(renderer)
    llvm_game_load()
    return Int32(0)
end

function sc_engine_shutdown()::Int32
    llvm_game_shutdown()
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()
    window::Ptr{SDL_Window} = llvm_sc_get_window()
    if renderer != Ptr{SDL_Renderer}(C_NULL)
        llvm_SDL_DestroyRenderer(renderer)
    end
    if window != Ptr{SDL_Window}(C_NULL)
        llvm_SDL_DestroyWindow(window)
    end
    llvm_SDL_Quit()
    return Int32(0)
end

function sc_run()::Int32
    if sc_engine_init() != Int32(0)
        return Int32(1)
    end
    while sc_frame() != Int32(0)
    end
    sc_engine_shutdown()
    return Int32(0)
end
