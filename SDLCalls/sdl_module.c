#ifdef __EMSCRIPTEN__
#include "../emsdk/upstream/emscripten/cache/ports/sdl2/SDL-release-2.32.0/include/SDL.h"
#else
#include <SDL2/SDL.h>
#endif
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

// Static global variable storage for Julia
// These persist across function calls and are shared between all Julia functions
static int32_t g_hi = 1;  // Example: hi variable

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
int32_t get_hi(void) {
    return g_hi;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void set_hi(int32_t value) {
    g_hi = value;
}

static void *g_renderer = NULL;

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void sc_set_renderer(void *renderer) {
    g_renderer = renderer;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void *sc_get_renderer(void) {
    return g_renderer;
}

static uint8_t sc_color_byte(int32_t v) {
    return (v < 0) ? (uint8_t)255 : (uint8_t)v;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
int32_t sc_fill_rect(int32_t x, int32_t y, int32_t w, int32_t h,
                     int32_t r, int32_t g, int32_t b, int32_t a) {
    SDL_Renderer *ren;
    SDL_Rect rect;

    if (g_renderer == NULL) {
        return -1;
    }
    ren = (SDL_Renderer *)g_renderer;
    if (SDL_SetRenderDrawColor(ren, sc_color_byte(r), sc_color_byte(g),
                               sc_color_byte(b), sc_color_byte(a)) != 0) {
        return -1;
    }
    rect.x = x;
    rect.y = y;
    rect.w = w;
    rect.h = h;
    return SDL_RenderFillRect(ren, &rect) == 0 ? 0 : -1;
}