using StaticTools
using StaticCompiler

# Web-compatible version of the guessing game
function web_guessing_game()::Int32
    # Game variables
    target::Int32 = 7
    running::Bool = true
    won::Bool = false
    background_color::Int32 = 0  # 0=blue, 1=green, 2=red
    
    # For WebAssembly, we need to handle input differently
    # This would need to be connected to JavaScript event handlers
    
    # Simplified game loop for WebAssembly
    guess::Int32 = Int32(0)
    
    # In a real web version, this would be called from JavaScript
    # with the guess passed as a parameter
    if guess == target
        background_color = Int32(1)  # Green - correct
        won = true
    elseif guess >= 0 && guess <= 9
        background_color = Int32(2)  # Red - wrong
    end
    
    return background_color
end

# Function to handle a single guess (called from JavaScript)
function handle_guess(guess::Int32)::Int32
    target::Int32 = 7
    
    if guess == target
        return Int32(1)  # Green - correct
    elseif guess >= 0 && guess <= 9
        return Int32(2)  # Red - wrong
    else
        return Int32(0)  # Blue - invalid
    end
end

# Compile to WebAssembly
# This would require additional setup for WebAssembly compilation
# compile_wasm(handle_guess, Tuple{Int32}, path="web_build", filename="guessing_game") 