const SDL_EVENT_BYTES = UInt32(56)
const SDL_EVENT_QUIT = UInt32(256)

function poll_quit_requested()::Int32
    event_ptr::Ptr{SDL_Event} = Ptr{SDL_Event}(wasm_malloc(SDL_EVENT_BYTES))
    quit::Int32 = Int32(0)
    while llvm_SDL_PollEvent(event_ptr) != Int32(0)
        event_type::UInt32 = event_ptr.type
        if event_type == SDL_EVENT_QUIT
            quit = Int32(1)
        end
    end
    wasm_free(Ptr{Cvoid}(event_ptr))
    return quit
end

function begin_frame(renderer::Ptr{SDL_Renderer})
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(40), UInt8(44), UInt8(52), UInt8(255))
    llvm_SDL_RenderClear(renderer)
end

function end_frame(renderer::Ptr{SDL_Renderer})
    llvm_SDL_RenderPresent(renderer)
end
