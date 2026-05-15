function begin_frame(renderer::Ptr{SDL_Renderer})
    llvm_sc_set_renderer(renderer)
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(40), UInt8(44), UInt8(52), UInt8(255))
    llvm_SDL_RenderClear(renderer)
end

function end_frame(renderer::Ptr{SDL_Renderer})
    llvm_SDL_RenderPresent(renderer)
end
