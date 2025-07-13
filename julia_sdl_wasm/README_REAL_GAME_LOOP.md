# Real Game Loop Implementation

This directory contains the actual game loop implementation for the SDL2 WebAssembly game with Julia integration.

## Files

- `sdl2.html` - Main game page with SDL2 WebAssembly and Julia integration
- `sdl2.js` - SDL2 WebAssembly module
- `sdl2.wasm` - SDL2 WebAssembly binary
- `julia_sdl.js` - Julia WebAssembly module with physics functions
- `julia_sdl.wasm` - Julia WebAssembly binary
- `game_loop.js` - JavaScript game loop controller with Julia integration
- `test_game_loop.html` - Test page for the game loop system

## Julia Functions Available

The Julia module exports the following functions:

- `_update_physics()` - Updates the physics simulation
- `_get_new_x()` - Gets the current X position
- `_get_new_y()` - Gets the current Y position  
- `_get_new_vel_y()` - Gets the current Y velocity
- `_check_on_ground()` - Checks if the object is on the ground
- `_get_square_color()` - Gets the current square color

## How to Run

1. Start a local HTTP server:
   ```bash
   python3 -m http.server 8000
   # or
   cd julia_sdl_wasm
   python3 -m http.server 8000
   ```

2. Open the game in your browser:
   ```
   http://localhost:8000/sdl2.html
   ```

3. Use the controls to manage the game loop:
   - **Start Game Loop** - Begins the game loop
   - **Stop Game Loop** - Stops the game loop
   - **Pause** - Pauses the game loop
   - **Resume** - Resumes the game loop
   - **Test Julia** - Tests Julia function calls

## Keyboard Controls

- **Space** - Test Julia functions
- **P** - Pause/Resume game loop
- **S** - Stop game loop
- **R** - Restart game loop

## Game Loop Features

### Automatic Features
- **60 FPS Game Loop** - Maintains consistent frame rate
- **Julia Physics Integration** - Calls Julia physics functions each frame
- **Real-time Game Data** - Displays current physics state
- **FPS Monitoring** - Shows actual frame rate

### Manual Controls
- Start/Stop/Pause/Resume game loop
- Test Julia function calls
- Real-time game data display

## Integration Details

### JavaScript → Julia Communication
The game loop calls Julia functions through the WebAssembly module:

```javascript
// Update physics
Module._update_physics();

// Get game state
const x = Module._get_new_x();
const y = Module._get_new_y();
const velY = Module._get_new_vel_y();
const onGround = Module._check_on_ground();
const color = Module._get_square_color();
```

### Game State Display
The game loop automatically updates the display with:
- Current X, Y position
- Y velocity
- Ground collision status
- Square color
- Timestamp

## Debugging

### Console Output
Check the browser console for:
- Available Julia functions
- Function call results
- Error messages
- Game loop status

### Testing Julia Functions
Use the "Test Julia" button or press Space to test individual Julia functions and see their return values in the console.

## Performance

- **Target FPS**: 60 FPS
- **Frame Timing**: Uses `requestAnimationFrame` for smooth rendering
- **Physics Updates**: Called every frame when game loop is running
- **Memory Management**: Automatic cleanup when stopping game loop

## Troubleshooting

### Game Loop Not Starting
- Check browser console for errors
- Ensure both SDL2 and Julia modules are loaded
- Verify Module initialization completed

### Julia Functions Not Working
- Check if Julia module is loaded properly
- Verify function names match exports
- Test individual functions with "Test Julia" button

### Performance Issues
- Monitor FPS display
- Check browser performance tools
- Reduce FPS if needed: `gameLoop.setFPS(30)`

## Development

To modify the game loop:

1. Edit `game_loop.js` for JavaScript changes
2. Recompile Julia code if physics functions change
3. Test with browser console and "Test Julia" button
4. Monitor game data display for real-time feedback

## File Structure

```
julia_sdl_wasm/
├── sdl2.html              # Main game page
├── sdl2.js                # SDL2 WebAssembly module
├── sdl2.wasm              # SDL2 WebAssembly binary
├── julia_sdl.js           # Julia WebAssembly module
├── julia_sdl.wasm         # Julia WebAssembly binary
├── game_loop.js           # Game loop controller
├── test_game_loop.html    # Test page
└── README_REAL_GAME_LOOP.md # This file
``` 