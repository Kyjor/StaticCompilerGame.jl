#include "SDL2-2.30.11/include/SDL.h"
#include <stdio.h>
#include <emscripten.h>
#include <stdint.h>
#include <string.h>

#define MAX_ENTITIES 100
#define UNIT_SIZE 64  // Each entity's "1.0" unit corresponds to 64 pixels
#define MAX_GAME_STATE_KEYS 100  // Maximum number of game state keys

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

// Game state storage structure
typedef struct {
    char key[64];  // Key name (max 63 chars + null terminator)
    int value;     // Integer value
    int is_used;   // Flag to indicate if this slot is used
} GameStateEntry;

// Global variables
EntityPosition entities[MAX_ENTITIES]; // Storage for entities
int entity_count = 0;
SDL_Window *window;
SDL_Renderer *renderer;
int game_is_still_running = 1;
int square_x = 375, square_y = 275; // Initial position of the red square
int test_value = 1;

Uint64 NOW = 0;
Uint64 LAST = 0;
float delta_time = 0.0f; // in seconds  

// Game state storage
GameStateEntry game_state[MAX_GAME_STATE_KEYS] = {0};  // Zero-initialize the entire array
int game_state_count = 0;

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
        SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);  // Blue color
        SDL_RenderFillRect(renderer, &rect);
    }

    return 1110;
}

EMSCRIPTEN_KEEPALIVE
int create_entities_if_needed() {
    // Create enemies at random positions within the visible screen area
    for (int i = 0; i < 10; i++) {  // Reduced to 10 entities for testing
        if (entity_count < MAX_ENTITIES) {
            // printf("Creating entity %d\n", entity_count);
            entities[entity_count].x = (float)(i * 1);  // Spread horizontally
            entities[entity_count].y = 6.0f;  // Position within screen bounds
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
int update_input(int x) {
    SDL_Event e;
    int result = 0; // 0 = no input, 1 = A, 2 = D, 3 = W, 4 = S, 5 = SPACE

    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT) {
            emscripten_cancel_main_loop();
        } else if (e.type == SDL_KEYDOWN || e.type == SDL_KEYUP) {
            uint8_t pressed = (e.type == SDL_KEYDOWN) ? 1 : 0;

            switch (e.key.keysym.sym) {
                case SDLK_a:
                    input_state.key_A = pressed;
                    if (pressed) result = 1;
                    break;
                case SDLK_d:
                    input_state.key_D = pressed;
                    if (pressed) result = 2;
                    break;
                case SDLK_w:
                    if (pressed) result = 3;
                    break;
                case SDLK_s:
                    if (pressed) result = 4;
                    break;
                case SDLK_SPACE:
                    input_state.key_Space = pressed;
                    if (pressed) result = 5;
                    break;
            }
        }
    }
    return result;
}

// Function to get key state as a pointer
EMSCRIPTEN_KEEPALIVE
InputState* get_input_state() {
    return &input_state;
}

EMSCRIPTEN_KEEPALIVE
float get_delta_time() {
    //printf("delta_time2: %f\n", delta_time);
    return delta_time;
}

EMSCRIPTEN_KEEPALIVE
void main_loop() {
    NOW = SDL_GetPerformanceCounter();
    delta_time = (float)(NOW - LAST) / (float)SDL_GetPerformanceFrequency();
    LAST = NOW;
    //printf("delta_time1: %f\n", delta_time);
    // Create entities if we don't have any yet
    if (entity_count == 0) {
        create_entities_if_needed();
    }

    // Draw other entities
    draw_entities(); // Draw all entity positions

    // Present the renderer 
    SDL_RenderPresent(renderer);
    
    // Debug output (only print occasionally to avoid spam)
    static int frame_count = 0;
    frame_count++;
    if (frame_count % 60 == 0) {
        //printf("Frame %d: Drawing %d entities\n", frame_count, entity_count);
    }
    
    // Handle SDL events (e.g., input)
    //update_input(1);
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

// ===== GAME STATE MANAGEMENT FUNCTIONS =====

// Initialize game state storage
EMSCRIPTEN_KEEPALIVE
int init_game_state() {
    printf("Initializing game state\n");
    
    // Safety check - ensure the array is accessible
    if (sizeof(game_state) == 0) {
        printf("Error: game_state array is not properly declared\n");
        return 0;
    }
    
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        game_state[i].is_used = 0;
        game_state[i].key[0] = '\0';
        game_state[i].value = 0;
    }
    game_state_count = 0;
    printf("Game state initialized with %d slots (array size: %zu)\n", MAX_GAME_STATE_KEYS, sizeof(game_state));
    return 1;
}

// Set a game state value by key
EMSCRIPTEN_KEEPALIVE
int set_game_state(const char* key, int value) {
    printf("Setting game state: %s = %d\n", key, value);
    if (!key) {
        printf("Error: NULL key provided to set_game_state\n");
        return 0;
    }
    
    // Safety check - ensure game_state array is accessible
    if (game_state_count < 0 || game_state_count > MAX_GAME_STATE_KEYS) {
        printf("Error: Invalid game_state_count: %d\n", game_state_count);
        return 0;
    }
    
    // First, try to find existing key
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (game_state[i].is_used && strcmp(game_state[i].key, key) == 0) {
            game_state[i].value = value;
            printf("Updated game state: %s = %d\n", key, value);
            return 1;
        }
    }
    
    // If not found, find first unused slot
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (!game_state[i].is_used) {
            strncpy(game_state[i].key, key, 63);
            game_state[i].key[63] = '\0';  // Ensure null termination
            game_state[i].value = value;
            game_state[i].is_used = 1;
            game_state_count++;
            printf("Set game state: %s = %d (slot %d)\n", key, value, i);
            return 1;
        }
    }
    
    printf("Error: No free slots for game state key: %s\n", key);
    return 0;
}

// Get a game state value by key
EMSCRIPTEN_KEEPALIVE
int get_game_state(const char* key) {
    if (!key) {
        printf("Error: NULL key provided to get_game_state\n");
        return 0;
    }
    
    // Safety check - ensure game_state array is accessible
    if (game_state_count < 0 || game_state_count > MAX_GAME_STATE_KEYS) {
        printf("Error: Invalid game_state_count: %d\n", game_state_count);
        return 0;
    }
    
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (game_state[i].is_used && strcmp(game_state[i].key, key) == 0) {
            printf("Retrieved game state: %s = %d\n", key, game_state[i].value);
            return game_state[i].value;
        }
    }
    
    printf("Warning: Key not found in game state: %s\n", key);
    return 0;
}

// Check if a key exists in game state
EMSCRIPTEN_KEEPALIVE
int has_game_state(const char* key) {
    if (!key) {
        return 0;
    }
    
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (game_state[i].is_used && strcmp(game_state[i].key, key) == 0) {
            return 1;
        }
    }
    return 0;
}

// Remove a key from game state
EMSCRIPTEN_KEEPALIVE
int remove_game_state(const char* key) {
    if (!key) {
        printf("Error: NULL key provided to remove_game_state\n");
        return 0;
    }
    
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (game_state[i].is_used && strcmp(game_state[i].key, key) == 0) {
            game_state[i].is_used = 0;
            game_state[i].key[0] = '\0';
            game_state[i].value = 0;
            game_state_count--;
            printf("Removed game state: %s\n", key);
            return 1;
        }
    }
    
    printf("Warning: Key not found for removal: %s\n", key);
    return 0;
}

// Print all game state keys and values (for debugging)
EMSCRIPTEN_KEEPALIVE
void print_game_state() {
    printf("Game State (%d entries):\n", game_state_count);
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (game_state[i].is_used) {
            printf("  %s = %d\n", game_state[i].key, game_state[i].value);
        }
    }
}

// Get the number of game state entries
EMSCRIPTEN_KEEPALIVE
int get_game_state_count() {
    return game_state_count;
}

// ===== SIMPLIFIED GAME STATE FUNCTIONS (using integer keys) =====

// Simplified game state storage using integer keys
typedef struct {
    int key_id;     // Integer key
    int value;      // Integer value
    int is_used;    // Flag to indicate if this slot is used
} SimpleGameStateEntry;

// Simplified game state storage
SimpleGameStateEntry simple_game_state[MAX_GAME_STATE_KEYS] = {0};
int simple_game_state_count = 0;

// Set a game state value by integer key
EMSCRIPTEN_KEEPALIVE
int set_game_state_simple(int key_id, int value) {
    //printf("=== C set_game_state_simple called: key_id=%d, value=%d ===\n", key_id, value);
    
    // First, try to find existing key
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state[i].is_used && simple_game_state[i].key_id == key_id) {
            simple_game_state[i].value = value;
            // printf("Updated simple game state: key_id=%d, value=%d\n", key_id, value);
            return 1;
        }
    }
    
    // If not found, find first unused slot
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (!simple_game_state[i].is_used) {
            simple_game_state[i].key_id = key_id;
            simple_game_state[i].value = value;
            simple_game_state[i].is_used = 1;
            simple_game_state_count++;
            // printf("Set simple game state: key_id=%d, value=%d (slot %d)\n", key_id, value, i);
            return 1;
        }
    }
    
    printf("Error: No free slots for simple game state key_id: %d\n", key_id);
    return 0;
}

// Get a game state value by integer key
EMSCRIPTEN_KEEPALIVE
int get_game_state_simple(int key_id) {
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state[i].is_used && simple_game_state[i].key_id == key_id) {
            // printf("Retrieved simple game state: key_id=%d, value=%d\n", key_id, simple_game_state[i].value);
            return simple_game_state[i].value;
        }
    }
    
    //printf("Warning: Key_id not found in simple game state: %d\n", key_id);
    return 0;
}

// Check if a key exists in simple game state
EMSCRIPTEN_KEEPALIVE
int has_game_state_simple(int key_id) {
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state[i].is_used && simple_game_state[i].key_id == key_id) {
            return 1;
        }
    }
    return 0;
}

// Remove a key from simple game state
EMSCRIPTEN_KEEPALIVE
int remove_game_state_simple(int key_id) {
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state[i].is_used && simple_game_state[i].key_id == key_id) {
            simple_game_state[i].is_used = 0;
            simple_game_state[i].key_id = 0;
            simple_game_state[i].value = 0;
            simple_game_state_count--;
            printf("Removed simple game state: key_id=%d\n", key_id);
            return 1;
        }
    }
    
    printf("Warning: Key_id not found for removal: %d\n", key_id);
    return 0;
}

// ===== FLOAT GAME STATE FUNCTIONS (using integer keys) =====
typedef struct {
    int key_id;
    float value;
    int is_used;
} SimpleGameStateFloatEntry;

SimpleGameStateFloatEntry simple_game_state_float[MAX_GAME_STATE_KEYS] = {0};
int simple_game_state_float_count = 0;

EMSCRIPTEN_KEEPALIVE
int set_game_state_simple_float(int key_id, float value) {
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state_float[i].is_used && simple_game_state_float[i].key_id == key_id) {
            simple_game_state_float[i].value = value;
            return 1;
        }
    }
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (!simple_game_state_float[i].is_used) {
            simple_game_state_float[i].key_id = key_id;
            simple_game_state_float[i].value = value;
            simple_game_state_float[i].is_used = 1;
            simple_game_state_float_count++;
            return 1;
        }
    }

    return 0;
}

EMSCRIPTEN_KEEPALIVE
float get_game_state_simple_float(int key_id) {
    for (int i = 0; i < MAX_GAME_STATE_KEYS; i++) {
        if (simple_game_state_float[i].is_used && simple_game_state_float[i].key_id == key_id) {
            return simple_game_state_float[i].value;
        }
    }
    return 0.0f;
}

// Generic rectangle rendering function
EMSCRIPTEN_KEEPALIVE
int render_rect(int r, int g, int b, int a, float x, float y, int w, int h) {
    if (!renderer) {
        printf("Renderer is NULL in render_rect!\n");
        return 0;
    }
    //printf("position: %d, %d, %d, %d\n", x, y, w, h);
    SDL_Color current_render_color;
    SDL_GetRenderDrawColor(renderer, &current_render_color.r, &current_render_color.g, &current_render_color.b, &current_render_color.a);
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_Rect rect = { (int)(x * UNIT_SIZE), (int)(y * UNIT_SIZE), w, h };
    SDL_RenderFillRect(renderer, &rect);
    SDL_SetRenderDrawColor(renderer, current_render_color.r, current_render_color.g, current_render_color.b, current_render_color.a);
    return 1;
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
    // emscripten_set_main_loop(main_loop, 0, 1);

    return 0;
}