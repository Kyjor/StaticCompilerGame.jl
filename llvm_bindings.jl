# Auto-generated SDL bindings using llvmcall
# Source: SDLCalls/sdl_module.c
# Headers: SDLCalls/SDL2-2.30.11/include



   # Original C signature: SDL_Renderer * SDL_CreateRenderer(SDL_Window * window, int index, Uint32 flags)
   function llvm_SDL_CreateRenderer(window::Ptr{SDL_Window}, index::Int32, flags::Int32)::Ptr{SDL_Renderer}
    Base.llvmcall(("""
        declare i8* @SDL_CreateRenderer(i8*, i32, i32) nounwind

        define i8* @main(i8* %window, i32 %index, i32 %flags) {
        entry:
            %result = call i8* @SDL_CreateRenderer(i8* %window, i32 %index, i32 %flags)
            ret i8* %result
        }
    """, "main"), Ptr{SDL_Renderer}, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, index, flags)
    end

    # Original C signature: SDL_Window * SDL_CreateWindow(const char * title, int x, int y, int w, int h, Uint32 flags)
    function llvm_SDL_CreateWindow(ptr::Ptr{Cvoid}, x::Int32, y::Int32, w::Int32, h::Int32, flags::Int32)::Ptr{SDL_Window}
        result = Base.llvmcall(("""
        declare i8* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32) nounwind

        define i8* @main(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags) {
        entry:
            %result = call i8* @SDL_CreateWindow(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{Ptr{Cvoid}, Int32, Int32, Int32, Int32, Int32}, ptr, x, y, w, h, flags)
        return result
    end

    # Original C signature: void SDL_DestroyRenderer(SDL_Renderer * renderer)
    function llvm_SDL_DestroyRenderer(renderer::Ptr{SDL_Renderer})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyRenderer(i8*) nounwind

        define void @main(i8* %renderer) {
        entry:
            call void @SDL_DestroyRenderer(i8* %renderer)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: void SDL_DestroyWindow(SDL_Window * window)
    function llvm_SDL_DestroyWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_DestroyWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: Uint64 SDL_GetPerformanceCounter()
    function llvm_SDL_GetPerformanceCounter()::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GetPerformanceCounter() nounwind

        define i64 @main() {
        entry:
            %result = call i64 @SDL_GetPerformanceCounter()
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{}, )
    end

    # Original C signature: Uint64 SDL_GetPerformanceFrequency()
    function llvm_SDL_GetPerformanceFrequency()::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GetPerformanceFrequency() nounwind

        define i64 @main() {
        entry:
            %result = call i64 @SDL_GetPerformanceFrequency()
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{}, )
    end

    # Original C signature: int SDL_GetRenderDrawColor(SDL_Renderer * renderer, Uint8 * r, Uint8 * g, Uint8 * b, Uint8 * a)
    function llvm_SDL_GetRenderDrawColor(renderer::Ptr{SDL_Renderer}, r::Ptr{UInt8}, g::Ptr{UInt8}, b::Ptr{UInt8}, a::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRenderDrawColor(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %r, i8* %g, i8* %b, i8* %a) {
        entry:
            %result = call i32 @SDL_GetRenderDrawColor(i8* %renderer, i8* %r, i8* %g, i8* %b, i8* %a)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}}, renderer, r, g, b, a)
    end

    # Original C signature: void SDL_GetWindowSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GetWindowSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GetWindowSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: int SDL_Init(Uint32 flags)
    function llvm_SDL_Init(flags::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_Init(i32) nounwind

        define i32 @main(i32 %flags) {
        entry:
            %result = call i32 @SDL_Init(i32 %flags)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, flags)
    end

    # Original C signature: int SDL_PollEvent(SDL_Event * event)
    function llvm_SDL_PollEvent(event::Ptr{SDL_Event})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_PollEvent(i8*) nounwind

        define i32 @main(i8* %event) {
        entry:
            %result = call i32 @SDL_PollEvent(i8* %event)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}}, event)
    end

    # Original C signature: void SDL_Quit()
    function llvm_SDL_Quit()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Quit() nounwind

        define void @main() {
        entry:
            call void @SDL_Quit()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_RenderFillRect(SDL_Renderer * renderer, const SDL_Rect * rect)
    function llvm_SDL_RenderFillRect(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFillRect(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderFillRect(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: void SDL_RenderPresent(SDL_Renderer * renderer)
    function llvm_SDL_RenderPresent(renderer::Ptr{SDL_Renderer})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderPresent(i8*) nounwind

        define void @main(i8* %renderer) {
        entry:
            call void @SDL_RenderPresent(i8* %renderer)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: int SDL_SetRenderDrawColor(SDL_Renderer * renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
    function llvm_SDL_SetRenderDrawColor(renderer::Ptr{SDL_Renderer}, r::UInt8, g::UInt8, b::UInt8, a::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetRenderDrawColor(i8*, i8, i8, i8, i8) nounwind

        define i32 @main(i8* %renderer, i8 %r, i8 %g, i8 %b, i8 %a) {
        entry:
            %result = call i32 @SDL_SetRenderDrawColor(i8* %renderer, i8 %r, i8 %g, i8 %b, i8 %a)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, UInt8, UInt8, UInt8, UInt8}, renderer, r, g, b, a)
    end