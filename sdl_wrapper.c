#include <SDL2/SDL.h>

// Simple C function that creates an SDL window and returns 0 on success
int create_sdl_window_wrapper() {
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return -1;
    }
    
    // Create window
    SDL_Window* window = SDL_CreateWindow(
        "SDL Window from C",
        100, 100,
        640, 480,
        0
    );
    
    if (!window) {
        SDL_Quit();
        return -2;
    }
    
    // Create renderer
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, 0);
    if (!renderer) {
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -3;
    }
    
    // Show window briefly
    SDL_Delay(1000);
    
    // Cleanup
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    return 0;
}

// Complete guessing game that handles everything in C
// Returns: 1 for correct guess, 0 for quit, -1 for error
int complete_guessing_game() {
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return -1;
    }
    
    // Create window
    SDL_Window* window = SDL_CreateWindow(
        "Guessing Game - Guess the number 7! Press 0-9 or ESC to quit",
        100, 100,
        640, 480,
        SDL_WINDOW_SHOWN
    );
    
    if (!window) {
        SDL_Quit();
        return -1;
    }
    
    // Create renderer
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }
    
    // Game variables
    int target = 7;  // The number to guess
    int running = 1;
    int won = 0;
    int background_color = 0;  // 0 = blue, 1 = green (correct), 2 = red (wrong)
    Uint32 color_change_time = 0;  // Timer for color changes
    
    // Main game loop
    SDL_Event event;
    while (running) {
        Uint32 current_time = SDL_GetTicks();
        
        // Handle events
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
            else if (event.type == SDL_KEYDOWN) {
                SDL_Keycode key = event.key.keysym.sym;
                
                // Handle ESC key to quit
                if (key == SDLK_ESCAPE) {
                    running = 0;
                }
                // Handle number keys 0-9
                else if (key >= SDLK_0 && key <= SDLK_9) {
                    int guess = key - SDLK_0;  // Convert to 0-9
                    
                    if (guess == target) {
                        // Correct guess!
                        background_color = 1;  // Green
                        color_change_time = current_time + 2000;  // Show green for 2 seconds
                        won = 1;
                    } else {
                        // Wrong guess
                        background_color = 2;  // Red
                        color_change_time = current_time + 1000;  // Show red for 1 second
                    }
                }
            }
        }
        
        // Check if we need to change color back or exit
        if (color_change_time > 0 && current_time >= color_change_time) {
            if (won) {
                // Game won, exit after showing green
                running = 0;
            } else {
                // Wrong guess, go back to blue
                background_color = 0;
                color_change_time = 0;
            }
        }
        
        // Set background color based on game state
        if (background_color == 1) {
            // Green for correct
            SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        } else if (background_color == 2) {
            // Red for wrong
            SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        } else {
            // Blue for normal
            SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
        }
        
        SDL_RenderClear(renderer);
        
        // Draw a white rectangle to show the window is active
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_Rect rect = {220, 200, 200, 100};
        SDL_RenderFillRect(renderer, &rect);
        
        // Present the frame
        SDL_RenderPresent(renderer);
        
        // Small delay to prevent excessive CPU usage
        SDL_Delay(16);  // ~60 FPS
    }
    
    // Cleanup
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    return won ? 1 : 0;  // 1 if they guessed correctly, 0 if they quit
} 