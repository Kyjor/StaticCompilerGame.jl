#include <stdio.h>
#include <stdbool.h>
#include <SDL2/SDL.h>
#include "lib_desktop/sc_game.h"

int main(void)
{
    if (j_sdl_init() != 0) {
        fprintf(stderr, "j_sdl_init failed\n");
        return 1;
    }

    SDL_Window *window = j_init_window();
    if (!window) {
        fprintf(stderr, "j_init_window failed\n");
        SDL_Quit();
        return 1;
    }

    SDL_Renderer *renderer = j_init_renderer(window);
    if (!renderer) {
        fprintf(stderr, "j_init_renderer failed\n");
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }

    bool running = true;
    while (running) {
        SDL_Event e;
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT)
                running = false;
        }

        SDL_SetRenderDrawColor(renderer, 40, 44, 52, 255);
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
