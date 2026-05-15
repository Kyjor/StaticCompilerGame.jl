function llvm_sc_set_renderer(renderer::Ptr{SDL_Renderer})
    Base.llvmcall(("""
    declare void @sc_set_renderer(i8*) nounwind

    define void @main(i8* %renderer) {
    entry:
        call void @sc_set_renderer(i8* %renderer)
        ret void
    }
    """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
end

function llvm_sc_get_renderer()::Ptr{SDL_Renderer}
    Base.llvmcall(("""
    declare i8* @sc_get_renderer() nounwind

    define i8* @main() {
    entry:
        %r = call i8* @sc_get_renderer()
        ret i8* %r
    }
    """, "main"), Ptr{SDL_Renderer}, Tuple{},)
end
