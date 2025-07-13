#include <SDL2/SDL.h>

// Global SDL state
static SDL_Window* g_window = NULL;
static SDL_Renderer* g_renderer = NULL;
static int g_initialized = 0;

// Initialize SDL and create window
int init_sdl_drawing() {
    if (g_initialized) return 0;
    
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return -1;
    }
    
    g_window = SDL_CreateWindow(
        "Julia SDL Game",
        SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
        800, 600,
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
    
    g_initialized = 1;
    return 0;
}

// Clear screen with color (0=black, 1=white, 2=red, 3=green, 4=blue)
void clear_screen(int color) {
    if (!g_renderer) return;
    
    switch(color) {
        case 1: // White
            SDL_SetRenderDrawColor(g_renderer, 255, 255, 255, 255);
            break;
        case 2: // Red
            SDL_SetRenderDrawColor(g_renderer, 255, 0, 0, 255);
            break;
        case 3: // Green
            SDL_SetRenderDrawColor(g_renderer, 0, 255, 0, 255);
            break;
        case 4: // Blue
            SDL_SetRenderDrawColor(g_renderer, 0, 0, 255, 255);
            break;
        default: // Black
            SDL_SetRenderDrawColor(g_renderer, 0, 0, 0, 255);
            break;
    }
    
    SDL_RenderClear(g_renderer);
}

// Draw a rectangle
void draw_rect(int x, int y, int w, int h, int color) {
    if (!g_renderer) return;
    
    // Set color
    switch(color) {
        case 1: // White
            SDL_SetRenderDrawColor(g_renderer, 255, 255, 255, 255);
            break;
        case 2: // Red
            SDL_SetRenderDrawColor(g_renderer, 255, 0, 0, 255);
            break;
        case 3: // Green
            SDL_SetRenderDrawColor(g_renderer, 0, 255, 0, 255);
            break;
        case 4: // Blue
            SDL_SetRenderDrawColor(g_renderer, 0, 0, 255, 255);
            break;
        default: // Yellow
            SDL_SetRenderDrawColor(g_renderer, 255, 255, 0, 255);
            break;
    }
    
    SDL_Rect rect = {x, y, w, h};
    SDL_RenderFillRect(g_renderer, &rect);
}

// Present the frame
void present_frame() {
    if (!g_renderer) return;
    SDL_RenderPresent(g_renderer);
}

// Handle SDL events (returns 1 if quit requested)
int handle_events() {
    if (!g_window) return 0;
    
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            return 1;
        }
        if (event.type == SDL_KEYDOWN) {
            if (event.key.keysym.sym == SDLK_ESCAPE) {
                return 1;
            }
        }
    }
    return 0;
}

// Cleanup SDL
void cleanup_sdl() {
    if (g_renderer) {
        SDL_DestroyRenderer(g_renderer);
        g_renderer = NULL;
    }
    if (g_window) {
        SDL_DestroyWindow(g_window);
        g_window = NULL;
    }
    SDL_Quit();
    g_initialized = 0;
}

// Get current time in milliseconds
unsigned int get_time() {
    return SDL_GetTicks();
}

// Simple drawing test function
int draw_test_square() {
    if (init_sdl_drawing() != 0) {
        return -1;
    }
    
    // Clear screen to black
    clear_screen(0);
    
    // Draw a yellow square
    draw_rect(100, 100, 50, 50, 5); // Yellow square
    
    // Present the frame
    present_frame();
    
    return 0;
} 