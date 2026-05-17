#include <stdio.h>
#include <stdint.h>
#include "lib_desktop/sc_game.h"

static int g_running = 1;
int square_x = 100;
int square_y = 0;
SDL_Texture *texture = NULL;
Mix_Chunk *sound = NULL;

void game_load(void)
{
    g_running = 1;
    texture = j_load_image("assets/images/fly.png");
    sound = j_load_sound("assets/Jump.wav");
}

void game_update(void)
{
   
}

void game_draw(void)
{
   
    if (texture != NULL)
    {
        j_draw(texture, square_x, square_y, 64, 64);
    }
    else
    {
        fprintf(stderr, "texture is NULL\n");
    }
}

void game_key_pressed(int32_t key)
{
    if (key == 'q')
        fprintf(stderr, "pressed q\n");
    if (key == SC_KEY_ESCAPE)
        g_running = 0;
    if (key == 'a')
        square_x -= 10;
    if (key == 'd')
        square_x += 10;
    if (key == 'w')
        square_y -= 10;
    if (key == 's')
        square_y += 10;
    if (key == SC_KEY_SPACE)
        j_play_sound(sound);
}

void game_key_released(int32_t key)
{
    if (key == 'z')
        fprintf(stderr, "released z\n");
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
