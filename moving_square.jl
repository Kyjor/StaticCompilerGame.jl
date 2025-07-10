using StaticTools
using StaticCompiler

# Simple wrapper that calls the C implementation
function main()::Int32
    # Call the C wrapper function from the shared library
    result = @ccall "libmoving_square.so".run_moving_square_game()::Int32
    return result
end

# Compile the executable
compile_executable(main, (), "moving_square") 