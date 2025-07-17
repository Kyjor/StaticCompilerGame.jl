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

function call_get_delta_time()::Float32
    Base.llvmcall(("""
    declare float @get_delta_time() nounwind
    define float @main() {
    entry:
       %result = call float @get_delta_time()
       ret float %result
    }
    """, "main"), Float32, Tuple{}, ())
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

    wasm_free(ptr)
    return Int32(0)
end

const SDL_WINDOWPOS_UNDEFINED = Cint(0x1FFF0000)
const SDL_WINDOW_OPENGL = Cint(0x00000002)

# function SDL_CreateWindow()::Int32
#     title::String = c"SDL2 + Emscripten"
#     title_bytes::Base.CodeUnits{UInt8, String} = codeunits(title)
#     title_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(length(title_bytes) + 1))

#     # Write bytes and null-terminate
#     unsafe_copyto!(title_ptr, pointer(title_bytes), length(title_bytes))
#     #unsafe_store!(Ptr{UInt8}(title_ptr + length(title_bytes)), 0x00)

# #     window_ptr = Base.llvmcall(("""
# #     declare ptr @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32)
# #     define ptr @main(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags) {
# #     entry:
# #         %win = call ptr @SDL_CreateWindow(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags)
# #         ret ptr %win
# #     }
# # """, "main"), Ptr{Cvoid}, Tuple{Ptr{UInt8}, Cint, Cint, Cint, Cint, Cint},
# #     title_ptr, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_OPENGL)

# #     wasm_free(title_ptr)
#     return Int32(0)
# end

mutable struct SDL_Window end

function SDL_CreateWindow()::Ptr{SDL_Window}
    printf(c"SDL_CreateWindoadafssadfsfew\n")
        result = Base.llvmcall(("""
            %SDL_Window = type opaque
            declare %SDL_Window* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32)
    
            @title_str = private unnamed_addr constant [20 x i8] c"New Window\\00"
    
            define %SDL_Window* @main() {
            entry:
                %title_ptr = getelementptr [20 x i8], [20 x i8]* @title_str, i32 0, i32 0
                %win = call %SDL_Window* @SDL_CreateWindow(
                    i8* %title_ptr,
                    i32 0x1FFF0000, ; SDL_WINDOWPOS_UNDEFINED
                    i32 0x1FFF0000, ; SDL_WINDOWPOS_UNDEFINED
                    i32 640,
                    i32 480,
                    i32 0x00000002 ; SDL_WINDOW_OPENGL
                )
                ret %SDL_Window* %win
            }
        """, "main"), Ptr{SDL_Window}, Tuple{})
        return result
    end


    function call_create_window_hardcoded()::Int32
        Base.llvmcall(("""
            declare i32 @create_window_hardcoded() nounwind
            define i32 @main() {
            entry:
                %result = call i32 @create_window_hardcoded()
                ret i32 %result
            }
        """, "main"), Int32, Tuple{}, ())

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
    
    function llvm_create_window()::Ptr{SDL_Window}
        Base.llvmcall(("""
            @title = private unnamed_addr constant [6 x i8] c"It me\\00", align 1
    
            declare i8* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32) nounwind
    
            define i8* @main() {
            entry:
                %title_ptr = getelementptr inbounds [6 x i8], [6 x i8]* @title, i32 0, i32 0
                %win = call i8* @SDL_CreateWindow(i8* %title_ptr, i32 100, i32 100, i32 640, i32 480, i32 2)
                ret i8* %win
            }
        """, "main"), Ptr{Cvoid}, Tuple{}, ())
    end
    