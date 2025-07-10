#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdbool.h>

// Game constants
#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define SQUARE_SIZE 32
#define MOVE_SPEED 5

// Global variables
static SDL_Window* window = NULL;
static SDL_Renderer* renderer = NULL;
static bool initialized = false;

// Square state
static float square_x = 100.0f;
static float square_y = 300.0f;
static float square_vel_x = 0.0f;
static float square_vel_y = 0.0f;
static bool on_ground = false;

// Input state
static bool key_left = false;
static bool key_right = false;
static bool key_up = false;
static bool key_down = false;
static bool key_space = false;

// Physics constants
static const float GRAVITY = 0.5f;
static const float JUMP_STRENGTH = -12.0f;

// Initialize the game
int init_square_game() {
    if (initialized) {
        return 0;  // Already initialized
    }
    
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return -1;
    }
    
    // Create window
    window = SDL_CreateWindow("Moving Square - Julia",
                             SDL_WINDOWPOS_CENTERED,
                             SDL_WINDOWPOS_CENTERED,
                             SCREEN_WIDTH, SCREEN_HEIGHT,
                             SDL_WINDOW_SHOWN);
    if (window == NULL) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        SDL_Quit();
        return -1;
    }
    
    // Create renderer
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == NULL) {
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }
    
    initialized = true;
    printf("Square game initialized successfully!\n");
    printf("Controls: Arrow keys to move, Space to jump, ESC to quit\n");
    
    return 0;
}

// Poll for input, return key code or special values
int poll_square_input() {
    SDL_Event event;
    
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            return -2;  // Quit requested
        } else if (event.type == SDL_KEYDOWN || event.type == SDL_KEYUP) {
            bool pressed = (event.type == SDL_KEYDOWN);
            
            switch (event.key.keysym.sym) {
                case SDLK_LEFT:
                    key_left = pressed;
                    return pressed ? SDLK_LEFT : -1;
                case SDLK_RIGHT:
                    key_right = pressed;
                    return pressed ? SDLK_RIGHT : -1;
                case SDLK_UP:
                    key_up = pressed;
                    return pressed ? SDLK_UP : -1;
                case SDLK_DOWN:
                    key_down = pressed;
                    return pressed ? SDLK_DOWN : -1;
                case SDLK_SPACE:
                    key_space = pressed;
                    return pressed ? SDLK_SPACE : -1;
                case SDLK_ESCAPE:
                    return 27;  // ESC
                default:
                    break;
            }
        }
    }
    
    return -1;  // No relevant input
}

// Update game state
void update_square_game() {
    // Apply gravity
    square_vel_y += GRAVITY;
    
    // Handle horizontal movement
    if (key_left) {
        square_vel_x = -MOVE_SPEED;
    } else if (key_right) {
        square_vel_x = MOVE_SPEED;
    } else {
        square_vel_x = 0.0f;
    }
    
    // Handle jumping
    if (key_space && on_ground) {
        square_vel_y = JUMP_STRENGTH;
        on_ground = false;
    }
    
    // Update position
    square_x += square_vel_x;
    square_y += square_vel_y;
    
    // Keep square on screen
    if (square_x < 0) {
        square_x = 0;
    } else if (square_x > SCREEN_WIDTH - SQUARE_SIZE) {
        square_x = SCREEN_WIDTH - SQUARE_SIZE;
    }
    
    // Ground collision
    if (square_y >= SCREEN_HEIGHT - SQUARE_SIZE - 20) {  // 20 pixels for ground
        square_y = SCREEN_HEIGHT - SQUARE_SIZE - 20;
        square_vel_y = 0.0f;
        on_ground = true;
    }
}

// Render the game frame
void render_square_frame() {
    if (!initialized || renderer == NULL) {
        return;
    }
    
    // Clear screen (sky blue)
    SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255);
    SDL_RenderClear(renderer);
    
    // Draw ground (brown)
    SDL_SetRenderDrawColor(renderer, 139, 69, 19, 255);
    SDL_Rect ground = {0, SCREEN_HEIGHT - 20, SCREEN_WIDTH, 20};
    SDL_RenderFillRect(renderer, &ground);
    
    // Draw square
    SDL_Rect square_rect = {
        (int)square_x,
        (int)square_y,
        SQUARE_SIZE,
        SQUARE_SIZE
    };
    
    // Set color based on state
    if (key_space) {
        SDL_SetRenderDrawColor(renderer, 255, 255, 0, 255);  // Yellow when jumping
    } else if (on_ground) {
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);    // Green when on ground
    } else {
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);    // Red when in air
    }
    
    SDL_RenderFillRect(renderer, &square_rect);
    
    // Present the frame
    SDL_RenderPresent(renderer);
    
    // Small delay for frame rate
    SDL_Delay(16);  // ~60 FPS
}

// Cleanup
void cleanup_square_game() {
    if (initialized) {
        if (renderer) {
            SDL_DestroyRenderer(renderer);
            renderer = NULL;
        }
        if (window) {
            SDL_DestroyWindow(window);
            window = NULL;
        }
        SDL_Quit();
        initialized = false;
        printf("Square game cleaned up.\n");
    }
} 