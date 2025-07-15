# combined_game_working.jl
using StaticTools
using StaticCompiler



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
    printf(c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\n", key_id, value)
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

# Julia functions that will call C functions
# These are just stubs - the actual implementation is in C
function init_sdl_drawing()::Int32
    # This will be linked to the C function init_sdl_drawing()
    return Int32(0)  # Placeholder return
end

# Convenient Julia wrapper functions for game state management
function j_init_game_state()::Int32
    printf(c"Initializing game state\n")
    call_init_game_state()
    
    # Initialize default game state values
    result = set_game_state_simple(Int32(1), Int32(5))  # player_x
    result = set_game_state_simple(Int32(2), Int32(5))  # player_y
    result = set_game_state_simple(Int32(3), Int32(0))    # player_vel_x
    result = set_game_state_simple(Int32(4), Int32(0))    # player_vel_y
    result = set_game_state_simple(Int32(5), Int32(1))    # on_ground
    
    return result
end

# Simplified game state functions that avoid Julia runtime dependencies
function set_game_state_simple(key_id::Int32, value::Int32)::Int32
    # Use numeric keys instead of strings to avoid Julia runtime
    printf(c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\n", key_id, value)
    return call_set_game_state_simple(key_id, value)
end

function get_game_state_simple(key_id::Int32)::Int32
    return call_get_game_state_simple(key_id)
end

function has_game_state_simple(key_id::Int32)::Int32
    return call_has_game_state_simple(key_id)
end

function remove_game_state_simple(key_id::Int32)::Int32
    return call_remove_game_state_simple(key_id)
end

function print_game_state()
    call_print_game_state()
end

function get_game_state_count()::Int32
    return call_get_game_state_count()
end

function draw_game_frame(x::Int32, y::Int32, on_ground::Int32)::Int32
    input = call_update_input(x)
    # Use simple integer keys: 1=player_x, 2=player_y, 3=player_vel_x, 4=player_vel_y, 5=on_ground
    player_x = get_game_state_simple(Int32(1))
    player_y = get_game_state_simple(Int32(2))
    player_vel_x = get_game_state_simple(Int32(3))
    player_vel_y = get_game_state_simple(Int32(4))
    on_ground = get_game_state_simple(Int32(5))

    # --- Platformer Physics ---
    gravity = Int32(1)  # Gravity strength (positive is down)
    jump_velocity = Int32(-2)  # Negative is up (since positive y is down)
    ground_y = Int32(5)

    # Horizontal movement
    if input == Int32(1) # A
        set_game_state_simple(Int32(1), Int32(player_x - 1))
    elseif input == Int32(2) # D
        set_game_state_simple(Int32(1), Int32(player_x + 1))
    end

    # Jumping
    if input == Int32(5) && on_ground == Int32(1)
        player_vel_y = jump_velocity
        set_game_state_simple(Int32(4), player_vel_y)
        set_game_state_simple(Int32(5), Int32(0))  # Not on ground after jump
    end

    # Apply gravity if not on ground
    if on_ground == Int32(0)
        player_vel_y = player_vel_y + gravity
        set_game_state_simple(Int32(4), player_vel_y)
    end

    # Update player_y by velocity
    player_y = player_y + player_vel_y

    # Ground collision
    if player_y >= ground_y
        player_y = ground_y
        player_vel_y = Int32(0)
        set_game_state_simple(Int32(5), Int32(1))  # On ground
        set_game_state_simple(Int32(4), player_vel_y)
    else
        set_game_state_simple(Int32(5), Int32(0))  # In air
    end

    set_game_state_simple(Int32(2), player_y)

    val = call_render_rect(Int32(255), Int32(0), Int32(0), Int32(255), player_x, player_y, Int32(64), Int32(64))
    printf(c"val: %d\n", val)
    if input != 0
        printf(c"Input: %d\n", input)
    end
    return Int32(0)
end

# Initialize SDL (simple wrapper)
function init_sdl()::Int32
    return init_sdl_drawing()
end