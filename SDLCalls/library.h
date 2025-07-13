#ifndef SDLCALLS_LIBRARY_H
#define SDLCALLS_LIBRARY_H

void hello(void);
int create_window(void);

// SDL functions
int init_sdl(void);
int main_loop(void);
void* get_input_state(void);
void update_entities(void* entities, int count);
void print_entities(void);

#endif //SDLCALLS_LIBRARY_H
