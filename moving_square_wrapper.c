#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdbool.h>

// Game constants
#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define SQUARE_SIZE 32
#define MOVE_SPEED 5

// Square position
static float square_x = 100.0f;
static float square_y = 300.0f;
static float square_vel_x = 0.0f;
static float square_vel_y = 0.0f;

// Input state
static bool key_left = false;
static bool key_right = false;
static bool key_up = false;
static bool key_down = false;
static bool key_space = false;

// Simple gravity and jumping
static bool on_ground = false;
static const float GRAVITY = 0.5f;
static const float JUMP_STRENGTH = -12.0f;

// Handle input events
void handle_input(SDL_Event* event) {
    if (event->type == SDL_KEYDOWN || event->type == SDL_KEYUP) {
        bool pressed = (event->type == SDL_KEYDOWN);
        
        switch (event->key.keysym.sym) {
            case SDLK_LEFT:
                key_left = pressed;
                break;
            case SDLK_RIGHT:
                key_right = pressed;
                break;
            case SDLK_UP:
                key_up = pressed;
                break;
            case SDLK_DOWN:
                key_down = pressed;
                break;
            case SDLK_SPACE:
                key_space = pressed;
                break;
        }
    }
}

// Update square physics
void update_square() {
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
    
    // Handle vertical movement (simple flying for now)
    if (key_up) {
        square_vel_y = -MOVE_SPEED;
    } else if (key_down) {
        square_vel_y = MOVE_SPEED;
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
    if (square_y >= SCREEN_HEIGHT - SQUARE_SIZE) {
        square_y = SCREEN_HEIGHT - SQUARE_SIZE;
        square_vel_y = 0.0f;
        on_ground = true;
    }
}

// Draw the square
void draw_square(SDL_Renderer* renderer) {
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
}

// Main game function
int run_moving_square_game() {
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return -1;
    }
    
    // Create window
    SDL_Window* window = SDL_CreateWindow("Moving Square Game - Julia",
                                         SDL_WINDOWPOS_CENTERED,
                                         SDL_WINDOWPOS_CENTERED,
                                         SCREEN_WIDTH, SCREEN_HEIGHT,
                                         SDL_WINDOW_SHOWN);
    if (window == NULL) {
        fprintf(stderr, "Window could not be created! SDL_Error: %s\n", SDL_GetError());
        SDL_Quit();
        return -1;
    }
    
    // Create renderer
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == NULL) {
        fprintf(stderr, "Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }
    
    // Game loop
    bool quit = false;
    SDL_Event event;
    Uint32 last_time = SDL_GetTicks();
    
    printf("Moving Square Game Started!\n");
    printf("Controls:\n");
    printf("  Arrow Keys: Move square\n");
    printf("  Spacebar: Jump\n");
    printf("  ESC: Quit\n");
    
    while (!quit) {
        Uint32 current_time = SDL_GetTicks();
        
        // Handle events
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                quit = true;
            } else if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE) {
                quit = true;
            } else {
                handle_input(&event);
            }
        }
        
        // Update game state
        update_square();
        
        // Clear screen (sky blue)
        SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255);
        SDL_RenderClear(renderer);
        
        // Draw ground (brown)
        SDL_SetRenderDrawColor(renderer, 139, 69, 19, 255);
        SDL_Rect ground = {0, SCREEN_HEIGHT - 20, SCREEN_WIDTH, 20};
        SDL_RenderFillRect(renderer, &ground);
        
        // Draw square
        draw_square(renderer);
        
        // Present the frame
        SDL_RenderPresent(renderer);
        
        // Cap to ~60 FPS
        Uint32 delta_time = current_time - last_time;
        if (delta_time < 16) {
            SDL_Delay(16 - delta_time);
        }
        last_time = current_time;
    }
    
    // Cleanup
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    printf("Moving Square Game Ended!\n");
    return 0;
} 