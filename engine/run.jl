function sc_game_loop(renderer::Ptr{SDL_Renderer})
    llvm_game_load()
    running::Int32 = Int32(1)
    while running != Int32(0)
        if llvm_game_should_continue() == Int32(0)
            running = Int32(0)
        elseif poll_quit_requested() != Int32(0)
            running = Int32(0)
        else
            begin_frame(renderer)
            llvm_game_update()
            llvm_game_draw()
            end_frame(renderer)
        end
    end
    llvm_game_shutdown()
end

function sc_run()::Int32
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

    llvm_sc_set_renderer(renderer)
    sc_game_loop(renderer)
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    llvm_SDL_Quit()
    return Int32(0)
end
