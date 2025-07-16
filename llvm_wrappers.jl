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
    printf(c"call_draw_rect wasm_malloc: %d, %d, %d, %d\n", rect.x, rect.y, rect.w, rect.h)
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
    printf(c"call_draw_rect wasm_free")
    return Int32(0)
end


# function call_draw_rect(x::Int32, y::Int32, w::Int32, h::Int32)::Int32
#     printf(c"call_draw_rect: %d, %d, %d, %d\n", x, y, w, h)
#     ptr = ccall(:malloc, Ptr{Cvoid}, (Csize_t,), 16)
#     unsafe_store!(Ptr{Int32}(ptr + 0), x)
#     unsafe_store!(Ptr{Int32}(ptr + 4), y)
#     unsafe_store!(Ptr{Int32}(ptr + 8), w)
#     unsafe_store!(Ptr{Int32}(ptr + 12), h)

#     result = Base.llvmcall(("""
#         %struct.SDL_Rect = type { i32, i32, i32, i32 }
#         declare i32 @draw_rect_1(%struct.SDL_Rect*) nounwind
#         define i32 @main(%struct.SDL_Rect*) {
#         entry:
#             %result = call i32 @draw_rect_1(%struct.SDL_Rect* %0)
#             ret i32 %result
#         }
#     """, "main"), Int32, Tuple{Ptr{Nothing}}, ptr)

#     ccall(:free, Cvoid, (Ptr{Cvoid},), ptr)
#     return result
# end




