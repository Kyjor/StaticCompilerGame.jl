#include <stdio.h>
#include <stdint.h>
#include "lib_desktop/sc_game.h"

static int g_running = 1;

void game_load(void)
{
    g_running = 1;
}

void game_update(void)
{
}

void game_draw(void)
{
    j_fill_rect(100, 0, 128, 128, 255, 255, 255, 255);
    printf("game_draw\n");
}

int32_t game_should_continue(void)
{
    return g_running ? 1 : 0;
}

void game_shutdown(void)
{
}

int main(void)
{
    int32_t code = sc_run();
    if (code != 0)
        fprintf(stderr, "sc_run failed (%d)\n", code);
    return code;
}
