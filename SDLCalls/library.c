#include "library.h"

#include <stdint.h>
#include <stdio.h>
#include "SDL2-2.30.11/include/SDL.h"

// Global variables for SDL
SDL_Window *window = NULL;
SDL_Renderer *renderer = NULL;
SDL_Event event;
int running = 0;

// Input state structure
typedef struct {
    uint8_t key_A;
    uint8_t key_D;
    uint8_t key_Space;
} InputState;

InputState input_state = {0, 0, 0};

// Entity structure
typedef struct {
    float x;
    float y;
} Entity;

Entity entities[100];
int entity_count = 0;

void hello(void) {
    printf("Hello, World!\n");
    printf("Hello, World!\n");
}

int create_window(void) {
    uint32_t width = 600;
    uint32_t height = 600;

    SDL_Window *window = SDL_CreateWindow(
         "MyGame",
         SDL_WINDOWPOS_CENTERED,
         SDL_WINDOWPOS_CENTERED,
         width,
         height,
         SDL_WINDOW_OPENGL
     );

    return 1;
}

// Initialize SDL without setting up main loop
int init_sdl(void) {
    printf("Initializing SDL...\n");
    
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    window = SDL_CreateWindow(
        "SDL Game",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        800, 600,
        SDL_WINDOW_SHOWN
    );
    
    if (!window) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    running = 1;
    printf("SDL initialized successfully!\n");
    return 1;
}

// Main loop function to be called from JavaScript
int main_loop(void) {
    if (!running) return 0;
    
    // Handle events
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            running = 0;
        } else if (event.type == SDL_KEYDOWN) {
            switch (event.key.keysym.sym) {
                case SDLK_a: input_state.key_A = 1; break;
                case SDLK_d: input_state.key_D = 1; break;
                case SDLK_SPACE: input_state.key_Space = 1; break;
            }
        } else if (event.type == SDL_KEYUP) {
            switch (event.key.keysym.sym) {
                case SDLK_a: input_state.key_A = 0; break;
                case SDLK_d: input_state.key_D = 0; break;
                case SDLK_SPACE: input_state.key_Space = 0; break;
            }
        }
    }
    
    // Clear screen
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
    
    // Draw entities
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    for (int i = 0; i < entity_count; i++) {
        SDL_Rect rect = {
            (int)entities[i].x * 50,  // Scale up for visibility
            (int)entities[i].y * 50,
            50, 50
        };
        SDL_RenderFillRect(renderer, &rect);
    }
    
    // Present render
    SDL_RenderPresent(renderer);
    
    return running;
}

// Get pointer to input state
void* get_input_state(void) {
    return &input_state;
}

// Update entities from JavaScript
void update_entities(void* new_entities, int count) {
    Entity* ents = (Entity*)new_entities;
    if (count > 100) count = 100; // Prevent buffer overflow
    
    for (int i = 0; i < count; i++) {
        entities[i] = ents[i];
    }
    entity_count = count;
}

// Print entities for debugging
void print_entities(void) {
    printf("Entities (%d):\n", entity_count);
    for (int i = 0; i < entity_count; i++) {
        printf("  Entity %d: x=%.2f, y=%.2f\n", i, entities[i].x, entities[i].y);
    }
}

// cc -fPIC -shared -o libSDLCalls.so library.c -L/usr/lib64 -lSDL2 -- If installed: sudo dnf install SDL2-devel
// cc -fPIC -shared -o libSDLCalls.so library.c -L/home/kyjor/Projects/C/SDLCalls/lib -lSDL2 -- If installed: sudo dnf install SDL2-devel