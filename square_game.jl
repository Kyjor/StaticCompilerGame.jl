using StaticTools
using StaticCompiler

function square_game()::Int32
    # Initialize window
    init_result::Int32 = @symbolcall init_square_game()::Int32
    if init_result != 0
        return Int32(-1)  # Failed to initialize
    end
    
    # Game variables
    running::Bool = true
    
    # Main game loop implemented in Julia!
    while running
        # Get input
        key::Int32 = @symbolcall poll_square_input()::Int32
        
        # Handle input
        if key == -2 || key == 27  # Quit or ESC
            running = false
        end
        
        # Update game state (done in C)
        @symbolcall update_square_game()::Nothing
        
        # Render frame
        @symbolcall render_square_frame()::Nothing
    end
    
    # Cleanup
    @symbolcall cleanup_square_game()::Nothing
    
    return Int32(0)
end

# Portable compilation options
portable_flags = `-L./libs -lSDL2 -lSDL2main -Wl,-rpath,\$ORIGIN/libs -Wl,-rpath,\$ORIGIN`

# Compile using the same pattern as the working guessing game
compile_executable(square_game, (), ".", "square_game", cflags=`$(portable_flags) square_wrapper.c`, demangle=false) 