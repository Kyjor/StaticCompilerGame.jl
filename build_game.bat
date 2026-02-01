@echo off
REM Set up Emscripten environment
call emsdk\\emsdk_env.bat

REM Compile the game using emcc
emcc game_wasm\\game_loop.ll game_wasm\\j_init_game_state.ll game_wasm\\j_init_renderer.ll game_wasm\\j_init_window.ll game_wasm\\pc_main.ll SDLCalls\\sdl_module.c -s USE_SDL=2 -O2 -s WASM=1 -s "EXPORTED_FUNCTIONS=['_game_loop','_j_init_game_state','_j_init_window','_j_init_renderer','_pc_main']" -s "EXPORTED_RUNTIME_METHODS=['cwrap']" -o game_wasm\\game.js