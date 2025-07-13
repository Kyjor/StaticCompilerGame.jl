# Game Loop System for SDL2 WebAssembly

This directory contains the game loop system for running SDL2 WebAssembly games with Julia integration.

## Files

- `sdl2.html` - Main game page with SDL2 WebAssembly integration
- `sdl2.js` - SDL2 WebAssembly module (compiled from C/C++)
- `sdl2.wasm` - WebAssembly binary
- `game_loop.js` - JavaScript game loop controller
- `test_game_loop.html` - Test page for the game loop system
- `sdl2.jl` - Julia source code for the game

## How to Run the Game Loop

### Method 1: Using the Main Game Page

1. Start a local HTTP server in the `sdlweb` directory:
   ```bash
   python3 -m http.server 8000
   # or
   python3 cors_http_server.py
   ```

2. Open `sdl2.html` in your browser:
   ```
   http://localhost:8000/sdl2.html
   ```

3. Use the game controls to start/stop the game loop:
   - **Start Game Loop** - Begins the game loop
   - **Stop Game Loop** - Stops the game loop
   - **Pause** - Pauses the game loop
   - **Resume** - Resumes the game loop

### Method 2: Testing the Game Loop

1. Open `test_game_loop.html` in your browser to test the game loop without the full SDL2 module
2. This page includes a mock Module for testing the JavaScript game loop functionality

## Game Loop Features

### Automatic Features
- **FPS Control** - Maintains consistent frame rate (default 60 FPS)
- **Delta Time** - Calculates proper time intervals between frames
- **Julia Integration** - Calls Julia game functions when available
- **Event Handling** - Listens for game data updates from Julia

### Manual Controls
- Start/Stop the game loop
- Pause/Resume functionality
- FPS display
- Game data display

## JavaScript API

### Global Functions
```javascript
// Control the game loop
startGameLoop()    // Start the game loop
stopGameLoop()     // Stop the game loop
pauseGameLoop()    // Pause the game loop
resumeGameLoop()   // Resume the game loop
```

### GameLoop Class
```javascript
// Access the game loop instance
const gameLoop = window.gameLoop;

// Set FPS
gameLoop.setFPS(30);  // Set to 30 FPS

// Get current game data
const data = gameLoop.getGameData();

// Check if running
if (gameLoop.isRunning) {
    console.log('Game loop is active');
}
```

## Integration with Julia

The game loop system integrates with Julia through:

1. **Custom Events** - Julia can send game data via custom events:
   ```javascript
   document.dispatchEvent(new CustomEvent('game-data-update', { 
       detail: gameData 
   }));
   ```

2. **Module Functions** - Calls Julia functions through the WebAssembly module:
   ```javascript
   Module._run_game_loop();  // Call Julia game loop function
   ```

3. **SDL Ready Event** - Automatically starts when SDL is ready:
   ```javascript
   document.addEventListener('sdl-ready', () => {
       // SDL is ready, start game loop
   });
   ```

## Troubleshooting

### Game Loop Not Starting
- Check browser console for errors
- Ensure SDL2 module is loaded properly
- Verify `Module._run_game_loop` function exists

### Performance Issues
- Adjust FPS using `gameLoop.setFPS()`
- Check for memory leaks in game data
- Monitor browser performance tools

### Julia Integration Issues
- Ensure Julia functions are properly exported
- Check that custom events are being dispatched
- Verify game data format matches expected structure

## Development

To modify the game loop:

1. Edit `game_loop.js` for JavaScript changes
2. Edit `sdl2.jl` for Julia game logic
3. Recompile SDL2 if C/C++ changes are needed
4. Test with `test_game_loop.html` before using main page

## File Structure

```
sdlweb/
├── sdl2.html              # Main game page
├── sdl2.js                # SDL2 WebAssembly module
├── sdl2.wasm              # WebAssembly binary
├── game_loop.js           # Game loop controller
├── test_game_loop.html    # Test page
├── sdl2.jl               # Julia source
└── README_GAME_LOOP.md   # This file
``` 