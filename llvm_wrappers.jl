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

function call_print_game_state()
    Base.llvmcall(("""
    ; External declaration of the print_game_state function
    declare void @print_game_state() nounwind
    define void @main() {
    entry:
       call void @print_game_state()
       ret void
    }
    """, "main"), Nothing, Tuple{}, ())
end

function call_get_game_state_count()::Int32
    Base.llvmcall(("""
    ; External declaration of the get_game_state_count function
    declare i32 @get_game_state_count() nounwind
    define i32 @main() {
    entry:
       %result = call i32 @get_game_state_count()
       ret i32 %result
    }
    """, "main"), Int32, Tuple{}, ())
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
function call_render_rect(r::Int32, g::Int32, b::Int32, a::Int32, x::Int32, y::Int32, w::Int32, h::Int32)::Int32
    Base.llvmcall(("""
    declare i32 @render_rect(i32, i32, i32, i32, i32, i32, i32, i32) nounwind
    define i32 @main(i32, i32, i32, i32, i32, i32, i32, i32) {
    entry:
        %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
        ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32}, r,g,b,a,x,y,w,h)
end