#include "SDL2-2.30.11/include/SDL.h"
#include <stdio.h>
#include <stdint.h>
#include <string.h>

// Emscripten-specific includes and macros
#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

// Global variables
#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
int print_string(const char* str) {
    // don't print null or empty strings
    if (str && str[0] != '\0' && str[0] != '\n' && str[0] != '\r' && str[0] != '\t' && str[0] != ' ' && str[0] != '\v' && str[0] != '\f' && str[0] != '\b') {
        printf("%s\n", str);
    }
    return 1;
}

#ifdef __EMSCRIPTEN__
// Original main function - kept for compatibility but not used
// Renamed to avoid conflict with pc_main.c
int main(void) {

    return 0;
}
#endif

int get_error() {
    printf("SDL_GetError: %s\n", SDL_GetError());
    return 1;
}