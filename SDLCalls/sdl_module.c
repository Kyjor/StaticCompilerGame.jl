#include "SDL2-2.30.11/include/SDL.h"
#include <stdio.h>
#include <emscripten.h>
#include <stdint.h>

#define MAX_ENTITIES 100
#define UNIT_SIZE 64  // Each entity's "1.0" unit corresponds to 64 pixels

typedef struct {
    uint8_t key_A;
    uint8_t key_D;
    uint8_t key_Space;
} InputState;
InputState input_state = {0, 0, 0};  // Initialize all keys to "not pressed"

typedef struct {
    float x;
    float y;
} EntityPosition;


// Global variables
EntityPosition entities[MAX_ENTITIES]; // Storage for entities
int entity_count = 0;
SDL_Window *window;
SDL_Renderer *renderer;
int game_is_still_running = 1;
int square_x = 375, square_y = 275; // Initial position of the red square
int test_value = 1;

// Function to test rendering by drawing a simple rectangle
EMSCRIPTEN_KEEPALIVE
int test_rendering() {
    if (!renderer) {
        printf("Renderer is NULL in test_rendering!\n");
        return 0;
    }
    
    // Clear to blue background
    SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
    SDL_RenderClear(renderer);
    
    // Draw a red rectangle
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    SDL_Rect rect = { 100, 100, 200, 200 };
    SDL_RenderFillRect(renderer, &rect);
    
    // Present the renderer
    SDL_RenderPresent(renderer);
    
    printf("Test rendering completed!\n");
    return 1;
}

// Function to test if SDL is working
EMSCRIPTEN_KEEPALIVE
int test_sdl_working() {
    printf("Testing SDL...\n");
    if (!window) {
        printf("Window is NULL!\n");
        return 0;
    }
    if (!renderer) {
        printf("Renderer is NULL!\n");
        return 0;
    }
    printf("SDL window and renderer are valid!\n");
    return 1;
}

// Separate initialization function that doesn't set up main loop
EMSCRIPTEN_KEEPALIVE
int init_sdl_drawing() {
    printf("Initializing SDL...\n");
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    // In Emscripten, we need to use SDL_CreateWindow with SDL_WINDOW_OPENGL flag
    // and let SDL use the existing HTML canvas
    window = SDL_CreateWindow("SDL2 + Emscripten", 
                             SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
                             640, 480, SDL_WINDOW_OPENGL);
    if (!window) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 0;
    }
    
    printf("SDL initialized successfully!\n");
    return 1; // Success
}

// Function to receive and update entity positions from JavaScript
EMSCRIPTEN_KEEPALIVE
void update_entities(EntityPosition *data, int count) {
    if (count > MAX_ENTITIES) count = MAX_ENTITIES; // Limit entities stored
    for (int i = 0; i < count; i++) {
        entities[i] = data[i];  // Copy data from JS to our array
    }
    entity_count = count;
    printf("Updated %d entities.\n", entity_count);
}

// Function to print entity positions (for debugging)
EMSCRIPTEN_KEEPALIVE
void print_entities() {
    for (int i = 0; i < entity_count; i++) {
        printf("Entity %d: x = %f, y = %f\n", i, entities[i].x, entities[i].y);
    }
}

// Draw all entity squares
int draw_entities() {
    for (int i = 0; i < entity_count; i++) {
        int screen_x = (int)(entities[i].x * UNIT_SIZE);
        int screen_y = (int)(entities[i].y * UNIT_SIZE);

        SDL_Rect rect = { screen_x, screen_y, UNIT_SIZE, UNIT_SIZE };
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);  // Red color
        SDL_RenderFillRect(renderer, &rect);
    }

    return 1110;
}

EMSCRIPTEN_KEEPALIVE
int create_entities_if_needed() {
    // Create enemies at random positions
    for (int i = 0; i < 10; i++) {
        if (entity_count < 10) {
            printf("Creating entity %d\n", entity_count);
            entities[entity_count].x = 10.0f;
            entities[entity_count].y = 10.0f;
            entity_count++;
        }
    }
    
    return 2;
}



EMSCRIPTEN_KEEPALIVE
void deinitialize_the_game() {
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

EMSCRIPTEN_KEEPALIVE
void update_input() {
    SDL_Event e;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT) {
            emscripten_cancel_main_loop();
        } else if (e.type == SDL_KEYDOWN || e.type == SDL_KEYUP) {
            uint8_t pressed = (e.type == SDL_KEYDOWN) ? 1 : 0;

            switch (e.key.keysym.sym) {
                case SDLK_a:
                    input_state.key_A = pressed;
                    break;
                case SDLK_d:
                    input_state.key_D = pressed;
                    break;
                case SDLK_SPACE:
                    input_state.key_Space = pressed;
                    break;
                case SDLK_ESCAPE:
                    deinitialize_the_game();
                    break;
            }
        }
    }
}

// Function to get key state as a pointer
EMSCRIPTEN_KEEPALIVE
InputState* get_input_state() {
    return &input_state;
}

EMSCRIPTEN_KEEPALIVE
void main_loop() {
    // Clear the screen
    SDL_SetRenderDrawColor(renderer, 255, 255, 0, 255);
    SDL_RenderClear(renderer);

    // Draw or update your game/app here
     // Draw a red square
    // SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255); // Red
    // SDL_Rect rect = { square_x, square_y, 50, 50 };
    // SDL_RenderFillRect(renderer, &rect);
    draw_entities(); // Draw all entity positions

    // Present the renderer 
    SDL_RenderPresent(renderer);
    
    // Debug output (only print occasionally to avoid spam)
    static int frame_count = 0;
    frame_count++;
    if (frame_count % 60 == 0) {
        printf("Frame %d: Drawing %d entities\n", frame_count, entity_count);
    }
    
    // Handle SDL events (e.g., input)
    update_input();
}

EMSCRIPTEN_KEEPALIVE
void update_square_position(int x, int y) {
    test_value = x;
}


EMSCRIPTEN_KEEPALIVE
const char* get_square_position() {
    static char position[64]; // Buffer to store the position string
    snprintf(position, sizeof(position), "{\"x\": %d, \"y\": %d}", square_x, square_y);
    return position;
}

// Original main function - kept for compatibility but not used
int main(void) {
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
    
    // Create window with proper flags for Emscripten
    window = SDL_CreateWindow("SDL2 + Emscripten", 
                             SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
                             640, 480, SDL_WINDOW_OPENGL);
    if (!window) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
    
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    printf("SDL initialized successfully in main!\n");
    
    // Set up the main loop using requestAnimationFrame
    emscripten_set_main_loop(main_loop, 0, 1);

    return 0;
}