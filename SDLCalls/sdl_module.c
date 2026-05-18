#ifdef __EMSCRIPTEN__
#include <SDL.h>
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

#if defined(__EMSCRIPTEN__) && !defined(SC_HOST_MAIN)
/* Stub main for legacy builds without host.c; framework web links host.c with -DSC_HOST_MAIN */
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

/* uint64_t handles: Julia wasm uses i64 for Ptr at the FFI boundary */
static uint64_t g_window = 0;
static uint64_t g_renderer = 0;
static int32_t g_frames_rendered = 0;

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void sc_set_window(uint64_t window) {
    g_window = window;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
uint64_t sc_get_window(void) {
    return g_window;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void sc_set_renderer(uint64_t renderer) {
    g_renderer = renderer;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
uint64_t sc_get_renderer(void) {
    return g_renderer;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
int32_t sc_get_frames_rendered(void) {
    return g_frames_rendered;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_KEEPALIVE
#endif
void sc_note_frame_rendered(void) {
    g_frames_rendered += 1;
}