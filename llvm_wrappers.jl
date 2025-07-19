function call_print_string(ptr::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    declare i32 @print_string(i8*) nounwind
    define i32 @main(i8*) {
    entry:
       %result = call i32 @print_string(i8* %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}}, ptr)
end

function call_set_game_state_simple(key_id::Int32, value::Float32)::Int32
    Base.llvmcall(("""
    declare i32 @set_game_state_simple_float(i32, float) nounwind
    define i32 @main(i32, float) {
    entry:
       %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32, Float32}, key_id, value)
end

function call_get_game_state_simple_float(key_id::Int32)::Float32
    Base.llvmcall(("""
    declare float @get_game_state_simple_float(i32) nounwind
    define float @main(i32) {
    entry:
       %result = call float @get_game_state_simple_float(i32 %0)
       ret float %result
    }
    """, "main"), Float32, Tuple{Int32}, key_id)
end

function call_update_input(x::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the update_input function
    declare i32 @update_input(i32) nounwind
    define i32 @main(i32) {
    entry:
       %result = call i32 @update_input(i32 %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32}, x)
end

# Game state management functions
function call_init_game_state()::Int32
    Base.llvmcall(("""
    ; External declaration of the init_game_state function
    declare i32 @init_game_state() nounwind
    define i32 @main() {
    entry:
       %result = call i32 @init_game_state()
       ret i32 %result
    }
    """, "main"), Int32, Tuple{}, ())
end

function call_set_game_state(key::Ptr{UInt8}, value::Int32)::Int32
    Base.llvmcall(("""
    declare i32 @set_game_state(i8*, i32) nounwind
    define i32 @main(i8* %0, i32 %1) {
    entry:
        %result = call i32 @set_game_state(i8* %0, i32 %1)
        ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}, Int32}, key, value)
end

function call_get_game_state(key::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    ; External declaration of the get_game_state function
    declare i32 @get_game_state(i8*) nounwind
    define i32 @main(i8*) {
    entry:
       %result = call i32 @get_game_state(i8* %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}}, key)
end

function call_has_game_state(key::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    ; External declaration of the has_game_state function
    declare i32 @has_game_state(i8*) nounwind
    define i32 @main(i8*) {
    entry:
       %result = call i32 @has_game_state(i8* %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}}, key)
end

function call_remove_game_state(key::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    ; External declaration of the remove_game_state function
    declare i32 @remove_game_state(i8*) nounwind
    define i32 @main(i8*) {
    entry:
       %result = call i32 @remove_game_state(i8* %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}}, key)
end

# Simplified game state LLVM calls (using integer keys instead of strings)
function call_set_game_state_simple(key_id::Int32, value::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the set_game_state_simple function
    declare i32 @set_game_state_simple(i32, i32) nounwind
    define i32 @main(i32, i32) {
    entry:
       %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32, Int32}, key_id, value)
end

function call_get_game_state_simple(key_id::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the get_game_state_simple function
    declare i32 @get_game_state_simple(i32) nounwind
    define i32 @main(i32) {
    entry:
       %result = call i32 @get_game_state_simple(i32 %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32}, key_id)
end

function call_has_game_state_simple(key_id::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the has_game_state_simple function
    declare i32 @has_game_state_simple(i32) nounwind
    define i32 @main(i32) {
    entry:
       %result = call i32 @has_game_state_simple(i32 %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32}, key_id)
end

function call_remove_game_state_simple(key_id::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the remove_game_state_simple function
    declare i32 @remove_game_state_simple(i32) nounwind
    define i32 @main(i32) {
    entry:
       %result = call i32 @remove_game_state_simple(i32 %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32}, key_id)
end

# Function to call the C render_rect function using llvmcall
function call_render_rect(r::Int32, g::Int32, b::Int32, a::Int32, x::Float32, y::Float32, w::Int32, h::Int32)::Int32
    Base.llvmcall(("""
    declare i32 @render_rect(i32, i32, i32, i32, float, float, i32, i32) nounwind
    define i32 @main(i32, i32, i32, i32, float, float, i32, i32) {
    entry:
        %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7)
        ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32,Int32,Int32,Int32,Float32,Float32,Int32,Int32}, r,g,b,a,x,y,w,h)
end

function wasm_malloc(size::UInt32)::Ptr{Cvoid}
    Base.llvmcall(("""
        declare noalias i8* @malloc(i32) nounwind

        define i8* @my_malloc(i32 %size) {
        entry:
            %ptr = call noalias i8* @malloc(i32 %size)
            ret i8* %ptr
        }
    """, "my_malloc"), Ptr{Cvoid}, Tuple{UInt32}, size)
end

function wasm_malloc_string(size::UInt32)::Ptr{UInt8}
    Base.llvmcall(("""
        declare noalias i8* @malloc(i32) nounwind
        define i8* @my_malloc_string(i32 %size) {
            entry:
                %ptr = call noalias i8* @malloc(i32 %size)
                ret i8* %ptr
            }
        """, "my_malloc_string"), Ptr{UInt8}, Tuple{UInt32}, size)
end

function wasm_free_string(ptr::Ptr{UInt8})
    Base.llvmcall(("""
        declare void @free(i8*) nounwind
        define void @my_free_string(i8* %ptr) {
            entry:
                call void @free(i8* %ptr)
                ret void
            }
        """, "my_free_string"), Nothing, Tuple{Ptr{UInt8}}, ptr)
end

function wasm_free(ptr::Ptr{Cvoid})
    Base.llvmcall(("""
        declare void @free(i8*) nounwind

        define void @my_free(i8* %ptr) {
        entry:
            call void @free(i8* %ptr)
            ret void
        }
    """, "my_free"), Nothing, Tuple{Ptr{Cvoid}}, ptr)
end

function call_draw_rect(rect::SDL_Rect)::Int32
    ptr = wasm_malloc(UInt32(16))
    unsafe_store!(Ptr{Int32}(ptr + 0), rect.x)
    unsafe_store!(Ptr{Int32}(ptr + 4), rect.y)
    unsafe_store!(Ptr{Int32}(ptr + 8), rect.w)
    unsafe_store!(Ptr{Int32}(ptr + 12), rect.h)

    result = Base.llvmcall(("""
        %struct.SDL_Rect = type { i32, i32, i32, i32 }
        declare i32 @draw_rect_1(%struct.SDL_Rect*) nounwind
        define i32 @main(%struct.SDL_Rect*) {
        entry:
            %result = call i32 @draw_rect_1(%struct.SDL_Rect* %0)
            ret i32 %result
        }
    """, "main"), Int32, Tuple{Ptr{Nothing}}, ptr)

    printf(c"draw_rect result: %d\n", result)
    wasm_free(ptr)
    return Int32(0)
end


    function llvm_SDL_GetTicks()::Int32
        Base.llvmcall(("""
            declare i32 @SDL_GetTicks() nounwind
            define i32 @main() {
            entry:
                %result = call i32 @SDL_GetTicks()
                ret i32 %result
            }
        """, "main"), Int32, Tuple{}, ())
    end

    function llvm_SDL_Init()::Int32
        Base.llvmcall(("""
            declare i32 @SDL_Init(i32) nounwind
    
            define i32 @main() {
            entry:
                %result = call i32 @SDL_Init(i32 32)
                ret i32 %result
            }
        """, "main"), Int32, Tuple{}, ())
    end
    
    
    function llvm_SDL_CreateWindow()::Ptr{SDL_Window}
        Base.llvmcall(("""
            @title = private unnamed_addr constant [6 x i8] c"Hello\\00", align 1
    
            declare i8* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32) nounwind
    
            define i8* @main() {
            entry:
                %title_ptr = getelementptr inbounds [6 x i8], [6 x i8]* @title, i32 0, i32 0
                %win = call i8* @SDL_CreateWindow(i8* %title_ptr, i32 100, i32 100, i32 640, i32 480, i32 2)
                ret i8* %win
            }
        """, "main"), Ptr{SDL_Window}, Tuple{}, ())
    end

    function llvm_SDL_CreateRenderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
        Base.llvmcall(("""
            declare i8* @SDL_CreateRenderer(i8*, i32, i32) nounwind
    
            define i8* @main(i8* %window) {
            entry:
                %renderer = call i8* @SDL_CreateRenderer(i8* %window, i32 -1, i32 2) ;
                ret i8* %renderer
            }
        """, "main"), Ptr{SDL_Renderer}, Tuple{Ptr{SDL_Window}}, window)
    end

    function llvm_get_error()::Int32
        Base.llvmcall(("""
            declare i32 @get_error() nounwind
            define i32 @main() {
            entry:
                %result = call i32 @get_error()
                ret i32 %result
            }
        """, "main"), Int32, Tuple{}, ())
    end
    
    function llvm_set_renderer(renderer::Ptr{SDL_Renderer})::Int32
        Base.llvmcall(("""
            declare i32 @set_renderer(i8*) nounwind
            define i32 @main(i8* %renderer) {
            entry:
                %result = call i32 @set_renderer(i8* %renderer)
                ret i32 %result
            }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    function llvm_set_window(window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
            declare i32 @set_window(i8*) nounwind
            define i32 @main(i8* %window) {
            entry:
                %result = call i32 @set_window(i8* %window)
                ret i32 %result
            }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}}, window)
    end

    function llvm_SDL_Delay(ms::Int32)
        Base.llvmcall(("""
            declare void @SDL_Delay(i32) nounwind
    
            define void @main(i32 %ms) {
            entry:
                call void @SDL_Delay(i32 %ms)
                ret void
            }
        """, "main"), Cvoid, Tuple{Int32}, ms)
    end

    function llvm_SDL_SetRenderDrawColor(renderer::Ptr{SDL_Renderer}, r::Int32, g::Int32, b::Int32, a::Int32)
        result = Base.llvmcall(("""
            declare i32 @SDL_SetRenderDrawColor(i8*, i32, i32, i32, i32) nounwind
            define i32 @main(i8* %renderer, i32 %r, i32 %g, i32 %b, i32 %a) {
            entry:
                %result = call i32 @SDL_SetRenderDrawColor(i8* %renderer, i32 %r, i32 %g, i32 %b, i32 %a)
                ret i32 %result
            }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Int32, Int32, Int32, Int32}, renderer, r, g, b, a)
    end
    

    function llvm_SDL_RenderPresent(renderer::Ptr{SDL_Renderer})
        Base.llvmcall(("""
            declare void @SDL_RenderPresent(i8*) nounwind
            define void @main(i8* %renderer) {
            entry:
                call void @SDL_RenderPresent(i8* %renderer)
                ret void
            }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
    end