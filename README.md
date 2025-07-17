# StaticCompilerGame.jl

Creating a game using Julia with SDL. Compiled with StaticCompiler.jl into llvm -> wasm for web builds. 

Find the latest build here: https://kyjor.itch.io/julia-web-platformer

---

## Build & Run Instructions

### Prerequisites
- Julia (recommended: 1.10 or below)
- [StaticCompiler.jl](https://github.com/tshort/StaticCompiler.jl) and [StaticTools.jl](https://github.com/tshort/StaticTools.jl) Julia packages
- C compiler (e.g., gcc)
- SDL2 development libraries (for desktop build)
- Emscripten SDK (for web build)

### 1. Install Julia dependencies
```julia
using Pkg
Pkg.add(["StaticCompiler", "StaticTools"])
```

### 2. Build for Web (WASM)
- Make sure Emscripten is installed and `emcc` is in your PATH. Instructions here: https://emscripten.org/docs/getting_started/downloads.html
- Run:
```bash
# Remember, julia 1.10 or below
julia compile_game.jl web
```
- Output will be in the `game_wasm/` directory:
  - `game.js`, `game.wasm`
- You can serve this directory with any static web server (e.g., `python3 -m http.server`)

### 3. Build for Desktop (Linux, macOS, Windows)
- Make sure SDL2 shared libraries are available in `SDLCalls/lib` or `libs` (see below).
- Run:
```bash
# Remember, julia 1.10 or below
julia compile_game.jl desktop
```
- Output will be in the `game_desktop/` directory:
  - Linux/macOS: `game`
  - Windows: `game.exe`

#### Local SDL2 Libraries
- Place your SDL2 `.so`/`.dylib`/`.dll` files in `SDLCalls/lib` or `libs`.
- On Linux, ensure you have both `libSDL2.so` and `libSDL2-2.0.so.0` (symlink if needed):
  ```bash
  ln -sf libSDL2-2.0.so.0 SDLCalls/lib/libSDL2.so
  ```

#### Running the Desktop Build
- On Linux/macOS, you can run:
  ```bash
  ./game_desktop/game
  ```
- If you encounter missing library errors, ensure the libraries are present and rpath is set. You can also try:
  ```bash
  LD_LIBRARY_PATH=SDLCalls/lib:libs ./game_desktop/game
  ```

---

For troubleshooting or more details, see comments in `compile_game.jl`.