# combined_game_working.jl
using StaticTools
using StaticCompiler

# Function to call the C draw_rect function using llvmcall
function call_draw_rect(x::Int32)::Int32
    Base.llvmcall(("""
    ; External declaration of the draw_rect function
    declare i32 @draw_rect(i32) nounwind

    define i32 @main(i32) {
    entry:
       %result = call i32 (i32) @draw_rect(i32 %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Int32}, x)
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

function call_test_game_state()::Int32
    Base.llvmcall(("""
    ; External declaration of the test_game_state function
    declare i32 @test_game_state() nounwind
    define i32 @main() {
    entry:
       %result = call i32 @test_game_state()
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
    result = set_game_state_simple(Int32(1), Int32(320))  # player_x
    result = set_game_state_simple(Int32(2), Int32(448))  # player_y
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

function test_game_state()::Int32
    return call_test_game_state()
end

function create_entities_if_needed()::Int32
    return Int32(3)
end

# Your Julia physics engine
function update_physics(x::Int32, y::Int32, vel_x::Int32, vel_y::Int32, 
                       key_left::Int32, key_right::Int32, key_space::Int32, on_ground::Int32)::Int32
    # Apply gravity
    new_vel_y = vel_y + 1
    
    # Handle jumping
    if key_space != 0 && on_ground != 0
        new_vel_y = -12
    end
    
    # Handle horizontal movement
    new_vel_x = 0
    if key_left != 0
        new_vel_x = -5
    elseif key_right != 0
        new_vel_x = 5
    end
    
    # Update position
    new_x = x + new_vel_x
    new_y = y + new_vel_y
    
    # Ground collision
    if new_y > 548
        new_y = 548
        new_vel_y = 0
        on_ground = 1
    else
        on_ground = 0
    end
    
    # Keep on screen
    if new_x < 0
        new_x = 0
    elseif new_x > 768
        new_x = 768
    end
    
    return new_x
end

# Simple drawing function - calls C draw_rect function using llvmcall
function draw_game_frame(x::Int32, y::Int32, on_ground::Int32)::Int32
    # Call the C draw_rect function using llvmcall
    result = call_draw_rect(x)
    input = call_update_input(x)
    # Use simple integer keys: 1=player_x, 2=player_y, 3=player_vel_x, 4=player_vel_y, 5=on_ground
    player_x = get_game_state_simple(Int32(1))
    player_y = get_game_state_simple(Int32(2))
    player_vel_x = get_game_state_simple(Int32(3))
    player_vel_y = get_game_state_simple(Int32(4))
    on_ground = get_game_state_simple(Int32(5))
    printf(c"Player x: %d, y: %d, vel_x: %d, vel_y: %d, on_ground: %d\n", player_x, player_y, player_vel_x, player_vel_y, on_ground)
    # if input == Int32(1)
    #     set_game_state_simple(Int32(1), Int32(player_x - 1))
    # elseif input == Int32(2)
    #     set_game_state_simple(Int32(1), Int32(player_x + 1))
    # elseif input == Int32(3)
    #     set_game_state_simple(Int32(2), Int32(player_y - 1))
    # elseif input == Int32(4)
    #     set_game_state_simple(Int32(2), Int32(player_y + 1))
    # elseif input == Int32(5)
    #     set_game_state_simple(Int32(5), Int32(1))
    # end
    if input != 0
        printf(c"Input: %d\n", result)
    end
    return Int32(0)
end

function create_entities()::Int32
    return create_entities_if_needed()
end

# Initialize SDL (simple wrapper)
function init_sdl()::Int32
    return init_sdl_drawing()
end