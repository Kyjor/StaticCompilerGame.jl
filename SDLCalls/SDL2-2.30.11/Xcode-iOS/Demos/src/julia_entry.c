//
//  julia_entry.c
//  Demos
//
//  Created by Kyle Conel on 7/23/25.
//
#include "SDL.h"
extern int pc_main(void);

int SDL_main(int argc, char *argv[]) {
    return pc_main();
}
