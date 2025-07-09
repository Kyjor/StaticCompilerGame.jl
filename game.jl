using StaticTools
using StaticCompiler

function complete_guess_game()::Int32
    # Complete guessing game that keeps window open
    result::Int32 = @symbolcall complete_guessing_game()::Int32
    return result
end

function guessing_game(argc::Int, argv::Ptr{Ptr{UInt8}})::Int32
    # Initialize window
    init_result::Int32 = @symbolcall init_game_window()::Int32
    if init_result != 0
        return Int32(-1)  # Failed to initialize
    end
    
    # Game variables
    target::Int32 = 7
    running::Bool = true
    won::Bool = false
    background_color::Int32 = 0  # 0=blue, 1=green, 2=red
    color_change_time::UInt32 = UInt32(0)
    
    # Main game loop implemented in Julia!
    while running
        current_time::UInt32 = @symbolcall get_current_time()::UInt32
        
        # Get input
        key::Int32 = @symbolcall poll_key_input()::Int32
        
        # Handle input
        if key == -2
            running = false  # Quit requested
        elseif key == 27
            running = false  # ESC pressed
        elseif key >= 0 && key <= 9
            # Number key pressed
            if key == target
                # Correct guess!
                background_color = Int32(1)  # Green
                color_change_time = current_time + UInt32(2000)  # 2 seconds
                won = true
            else
                # Wrong guess
                background_color = Int32(2)  # Red
                color_change_time = current_time + UInt32(1000)  # 1 second
            end
        end
        
        # Check color timer
        if color_change_time > UInt32(0) && current_time >= color_change_time
            if won
                running = false  # Exit after showing green
            else
                background_color = Int32(0)  # Back to blue
                color_change_time = UInt32(0)
            end
        end
        
        # Render frame
        @symbolcall set_background_color(background_color::Int32)::Nothing
        @symbolcall render_frame()::Nothing
        
        # Small delay for 60 FPS
        #@symbolcall SDL_Delay(16::UInt32)::Nothing
    end
    
    # Cleanup
    @symbolcall cleanup_game_window()::Nothing
    
    return won ? Int32(1) : Int32(0)
end

function simple_input_test(argc::Int, argv::Ptr{Ptr{UInt8}})::Int32
    # Simple test that shows each key press
    init_result::Int32 = @symbolcall init_game_window()::Int32
    if init_result != 0
        return Int32(-1)
    end
    
    @symbolcall set_background_color(0::Int32)::Nothing  # Blue background
    
    while true
        key::Int32 = @symbolcall poll_key_input()::Int32
        
        if key == -2 || key == 27
            break  # Quit or ESC
        elseif key >= 0 && key <= 9
            # Show the pressed key by changing color briefly
            @symbolcall set_background_color(1::Int32)::Nothing  # Green
            @symbolcall render_frame()::Nothing
            
            # Simple delay without arithmetic operations
            counter::Int32 = Int32(0)
            while counter < Int32(2000000)  # Simple busy wait
                counter = counter + Int32(1)
            end
            
            @symbolcall set_background_color(0::Int32)::Nothing  # Back to blue
        end
        
        @symbolcall render_frame()::Nothing
        #@symbolcall SDL_Delay(16::UInt32)::Nothing
    end
    
    @symbolcall cleanup_game_window()::Nothing
    return Int32(0)
end

# Compile to native binary (run with Julia 1.10.x)
compile_executable(complete_guess_game, (), ".", "complete_guess_game", cflags=`-L./libs -lSDL2 -lSDL2main sdl_wrapper.c`, demangle=false)
compile_executable(guessing_game, (Int, Ptr{Ptr{UInt8}}), ".", "guessing_game", cflags=`-L./libs -lSDL2 -lSDL2main sdl_wrapper.c`, demangle=false)
