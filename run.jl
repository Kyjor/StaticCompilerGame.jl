using StaticCompiler
using StaticTools
using SimpleDirectMediaLayer

function guess_game()::Int32
    target::Int32 = 7
    guess::Int32 = 0

    println(c"Welcome to Guess the Number!")
    println(c"I'm thinking of a number between 1 and 10.")

    while guess != target
        print(c"Enter your guess: ")
        
        # Simple input reading - read a single character and convert to number
        # This is more compatible with static compilation
        ch = @symbolcall getchar()::Int32
        
        # Skip newline if present
        if ch == 10  # newline
            ch = @symbolcall getchar()::Int32
        end
        
        # Convert ASCII digit to number (assuming single digit input)
        if ch >= 48 && ch <= 57  # ASCII '0' to '9'
            guess = ch - 48
        else
            guess = 0  # Invalid input, treat as 0
        end

        if guess < target
            println(c"Too low!")
        elseif guess > target
            println(c"Too high!")
        else
            println(c"Correct! You win!")
        end
    end

    return Int32(0)
end

compile_executable(guess_game, (), ".", "guess_game")
