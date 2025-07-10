# SDL2 Guessing Game

A simple number guessing game built with Julia and SDL2, compiled to a native executable.

## Game Rules
- Goal: Guess the number 7
- Controls: Press number keys 0-9 to guess, ESC to quit
- Visual feedback:
  - Blue background: Normal state
  - Red background: Wrong guess
  - Green background: Correct guess (game will exit after 2 seconds)

## Running the Game

### Option 1: Use the run script (Recommended)
```bash
./run_game.sh
```

### Option 2: Run directly
```bash
export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"
./guessing_game
```

### Option 3: Run the alternative version
```bash
export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"
./complete_guess_game
```

## System Requirements

### Minimum Requirements
- Linux x86_64 system
- Basic graphics support (X11 or Wayland)
- GLIBC 2.17+ (most modern Linux distributions)

### If you get library errors
The game comes with bundled SDL2 libraries, but if you encounter issues, install SDL2:

**Ubuntu/Debian:**
```bash
sudo apt-get install libsdl2-2.0-0
```

**Fedora/RHEL:**
```bash
sudo dnf install SDL2
```

**Arch Linux:**
```bash
sudo pacman -S sdl2
```

## Executables

- `guessing_game`: Main game with Julia-implemented game logic
- `complete_guess_game`: Alternative version with C-implemented game logic
- `run_game.sh`: Convenience script that sets up environment

## Technical Details

This game was compiled using Julia's StaticCompiler.jl, which creates native executables that don't require the Julia runtime. The graphics are handled through SDL2 via a C wrapper.

## Troubleshooting

### "Library not found" errors
1. Make sure you're running from the game directory
2. Try running `./run_game.sh` instead of the executable directly
3. Install SDL2 development packages on your system
4. Check that the `libs/` directory contains the SDL2 libraries

### "Permission denied" errors
```bash
chmod +x guessing_game
chmod +x complete_guess_game
chmod +x run_game.sh
```

### Game window doesn't appear
1. Ensure you have working graphics (X11 or Wayland)
2. Check that SDL2 video drivers are available
3. Try running with `SDL_VIDEODRIVER=x11` or `SDL_VIDEODRIVER=wayland`

### Still having issues?
Check the dependency list:
```bash
ldd guessing_game
```

## Files

- `guessing_game`, `complete_guess_game`: Game executables
- `libs/`: Directory containing SDL2 and dependency libraries
- `sdl_wrapper.c`: C wrapper code (for reference)
- `run_game.sh`: Convenience runner script
- `README.md`: This file
