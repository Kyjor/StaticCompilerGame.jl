using StaticTools
using StaticCompiler

function complete_guess_game()::Int32
    # Complete guessing game that keeps window open
    result::Int32 = @symbolcall complete_guessing_game()::Int32
    return result
end

# Compile to native binary (run with Julia 1.10.x)
compile_executable(complete_guess_game, (), ".", "complete_guess_game", cflags=`-L./libs -lSDL2 -lSDL2main sdl_wrapper.c`)
