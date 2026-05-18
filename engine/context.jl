function llvm_sc_set_renderer(renderer::Ptr{SDL_Renderer})
    handle::UInt64 = reinterpret(UInt64, renderer)
    Base.llvmcall(("""
    declare void @sc_set_renderer(i64) nounwind

    define void @main(i64 %renderer) {
    entry:
        call void @sc_set_renderer(i64 %renderer)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt64}, handle)
end

function llvm_sc_get_renderer()::Ptr{SDL_Renderer}
    handle::UInt64 = Base.llvmcall(("""
    declare i64 @sc_get_renderer() nounwind

    define i64 @main() {
    entry:
        %r = call i64 @sc_get_renderer()
        ret i64 %r
    }
    """, "main"), UInt64, Tuple{},)
    return reinterpret(Ptr{SDL_Renderer}, handle)
end

function llvm_sc_set_window(window::Ptr{SDL_Window})
    handle::UInt64 = reinterpret(UInt64, window)
    Base.llvmcall(("""
    declare void @sc_set_window(i64) nounwind

    define void @main(i64 %window) {
    entry:
        call void @sc_set_window(i64 %window)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt64}, handle)
end

function llvm_sc_get_window()::Ptr{SDL_Window}
    handle::UInt64 = Base.llvmcall(("""
    declare i64 @sc_get_window() nounwind

    define i64 @main() {
    entry:
        %r = call i64 @sc_get_window()
        ret i64 %r
    }
    """, "main"), UInt64, Tuple{},)
    return reinterpret(Ptr{SDL_Window}, handle)
end

function llvm_sc_get_frames_rendered()::Int32
    return Base.llvmcall(("""
    declare i32 @sc_get_frames_rendered() nounwind

    define i32 @main() {
    entry:
        %r = call i32 @sc_get_frames_rendered()
        ret i32 %r
    }
    """, "main"), Int32, Tuple{},)
end

function llvm_sc_note_frame_rendered()
    Base.llvmcall(("""
    declare void @sc_note_frame_rendered() nounwind

    define void @main() {
    entry:
        call void @sc_note_frame_rendered()
        ret void
    }
    """, "main"), Cvoid, Tuple{},)
end
