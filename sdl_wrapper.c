#include <SDL2/SDL.h>

// Global variables to maintain window state
static SDL_Window* g_window = NULL;
static SDL_Renderer* g_renderer = NULL;

// Initialize SDL and create window
// Returns: 0 on success, negative on error
int init_game_window() {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return -1;
    }
    
    g_window = SDL_CreateWindow(
        "Guessing Game - Press 0-9 or ESC to quit",
        100, 100,
        640, 480,
        SDL_WINDOW_SHOWN
    );
    
    if (!g_window) {
        SDL_Quit();
        return -2;
    }
    
    g_renderer = SDL_CreateRenderer(g_window, -1, SDL_RENDERER_ACCELERATED);
    if (!g_renderer) {
        SDL_DestroyWindow(g_window);
        SDL_Quit();
        return -3;
    }
    
    return 0;
}

// Poll for a single key press
// Returns: 0-9 for number keys, 27 for ESC, -1 for no input, -2 for quit event
int poll_key_input() {
    if (!g_window || !g_renderer) {
        return -2;  // Window not initialized
    }
    
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            return -2;  // Quit requested
        }
        else if (event.type == SDL_KEYDOWN) {
            SDL_Keycode key = event.key.keysym.sym;
            
            if (key == SDLK_ESCAPE) {
                return 27;  // ESC key
            }
            else if (key >= SDLK_0 && key <= SDLK_9) {
                return key - SDLK_0;  // Return digit 0-9
            }
        }
    }
    
    return -1;  // No relevant input this frame
}

// Set background color: 0=blue, 1=green, 2=red
void set_background_color(int color) {
    if (!g_renderer) return;
    
    if (color == 1) {
        // Green for correct
        SDL_SetRenderDrawColor(g_renderer, 0, 255, 0, 255);
    } else if (color == 2) {
        // Red for wrong
        SDL_SetRenderDrawColor(g_renderer, 255, 0, 0, 255);
    } else {
        // Blue for normal
        SDL_SetRenderDrawColor(g_renderer, 0, 0, 255, 255);
    }
}

// Render the current frame
void render_frame() {
    if (!g_renderer) return;
    
    // Clear with current background color
    SDL_RenderClear(g_renderer);
    
    // Draw white rectangle
    SDL_SetRenderDrawColor(g_renderer, 255, 255, 255, 255);
    SDL_Rect rect = {220, 200, 200, 100};
    SDL_RenderFillRect(g_renderer, &rect);
    
    // Present the frame
    SDL_RenderPresent(g_renderer);
}

// Get current time in milliseconds
unsigned int get_current_time() {
    return SDL_GetTicks();
}

// Cleanup and close window
void cleanup_game_window() {
    if (g_renderer) {
        SDL_DestroyRenderer(g_renderer);
        g_renderer = NULL;
    }
    if (g_window) {
        SDL_DestroyWindow(g_window);
        g_window = NULL;
    }
    SDL_Quit();
}

// Legacy function for testing
int create_sdl_window_wrapper() {
    if (init_game_window() != 0) {
        return -1;
    }
    
    SDL_Delay(1000);
    cleanup_game_window();
    return 0;
}

// Legacy complete game function (now we can implement this in Julia!)
int complete_guessing_game() {
    if (init_game_window() != 0) {
        return -1;
    }
    
    int target = 7;
    int running = 1;
    int won = 0;
    int background_color = 0;
    unsigned int color_change_time = 0;
    
    while (running) {
        unsigned int current_time = get_current_time();
        
        int key = poll_key_input();
        if (key == -2) {
            running = 0;  // Quit
        } else if (key == 27) {
            running = 0;  // ESC
        } else if (key >= 0 && key <= 9) {
            if (key == target) {
                background_color = 1;
                color_change_time = current_time + 2000;
                won = 1;
            } else {
                background_color = 2;
                color_change_time = current_time + 1000;
            }
        }
        
        if (color_change_time > 0 && current_time >= color_change_time) {
            if (won) {
                running = 0;
            } else {
                background_color = 0;
                color_change_time = 0;
            }
        }
        
        set_background_color(background_color);
        render_frame();
        SDL_Delay(16);
    }
    
    cleanup_game_window();
    return won ? 1 : 0;
} 