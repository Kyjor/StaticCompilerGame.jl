# SDL2 Guessing Game

A simple number guessing game built with Julia and SDL2, compiled to native executables using StaticCompiler.jl. This project demonstrates how to create portable, standalone executables from Julia code that can run on other machines without requiring Julia or dependencies to be installed.

## 🎮 Game Description

**Objective**: Guess the number 7!

**Controls**:
- Press number keys `0-9` to make guesses
- Press `ESC` to quit the game

**Visual Feedback**:
- **Blue background**: Normal state, waiting for input
- **Red background**: Wrong guess (displays for 1 second)
- **Green background**: Correct guess (displays for 2 seconds, then exits)

## 🛠️ Building the Game

### Prerequisites
- **Julia 1.10.x** (specifically required for StaticCompiler.jl)
- **SDL2 development libraries** (for compilation only)
- **Julia packages**: StaticTools.jl, StaticCompiler.jl

### Installation Commands

**Ubuntu/Debian:**
```bash
# Install Julia 1.10
curl -fsSL https://install.julialang.org | sh
juliaup add 1.10

# Install SDL2 development libraries
sudo apt-get update
sudo apt-get install libsdl2-dev

# Install Julia packages
julia +1.10 -e 'using Pkg; Pkg.add(["StaticTools", "StaticCompiler"])'
```

**Fedora/RHEL:**
```bash
# Install Julia 1.10
curl -fsSL https://install.julialang.org | sh
juliaup add 1.10

# Install SDL2 development libraries
sudo dnf install SDL2-devel

# Install Julia packages
julia +1.10 -e 'using Pkg; Pkg.add(["StaticTools", "StaticCompiler"])'
```

**Arch Linux:**
```bash
# Install Julia 1.10
curl -fsSL https://install.julialang.org | sh
juliaup add 1.10

# Install SDL2 development libraries
sudo pacman -S sdl2

# Install Julia packages
julia +1.10 -e 'using Pkg; Pkg.add(["StaticTools", "StaticCompiler"])'
```

### Build Process

1. **Clone/Download the project**
2. **Compile the game**:
   ```bash
   julia +1.10 game.jl
   ```

This creates two executables:
- `guessing_game`: Main game with Julia-implemented logic
- `complete_guess_game`: Alternative with C-implemented logic

## 📦 Deployment Instructions

### Quick Deploy (Recommended)

1. **Build the game** (if not already done):
   ```bash
   julia +1.10 game.jl
   ```

2. **Create deployment bundle**:
   ```bash
   julia deploy.jl
   ```

3. **Transfer to target machine**:
   ```bash
   # Copy the generated archive to target machine
   scp sdl2-guessing-game-*.tar.gz user@target-machine:/destination/
   ```

4. **On target machine**:
   ```bash
   # Extract and run
   tar -xzf sdl2-guessing-game-*.tar.gz
   ./run_game.sh
   ```

### Manual Deploy Process

If you prefer to deploy manually:

1. **Create deployment directory**:
   ```bash
   mkdir game_deployment
   cd game_deployment
   ```

2. **Copy executables**:
   ```bash
   cp ../guessing_game ../complete_guess_game .
   chmod +x guessing_game complete_guess_game
   ```

3. **Copy libraries**:
   ```bash
   cp -r ../libs .
   ```

4. **Create run script**:
   ```bash
   cat > run_game.sh << 'EOF'
   #!/bin/bash
   export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"
   echo "🎮 Starting SDL2 Guessing Game"
   echo "   Goal: Guess the number 7!"
   echo "   Controls: Press 0-9, ESC to quit"
   ./guessing_game
   EOF
   chmod +x run_game.sh
   ```

5. **Create archive**:
   ```bash
   cd ..
   tar -czf game_deployment.tar.gz -C game_deployment .
   ```

## 🚀 Running on Target Machines

### System Requirements

**Minimum Requirements**:
- Linux x86_64 system
- GLIBC 2.17+ (most distributions from 2012+)
- Basic graphics support (X11 or Wayland)
- ~15MB free disk space

**Supported Distributions**:
- Ubuntu 14.04+
- Debian 8+
- Fedora 20+
- RHEL/CentOS 7+
- Arch Linux
- openSUSE 13.2+

### Installation on Target Machine

1. **Extract the game**:
   ```bash
   tar -xzf sdl2-guessing-game-*.tar.gz
   cd [extracted_directory]
   ```

2. **Run the game**:
   ```bash
   ./run_game.sh
   ```

   Or directly:
   ```bash
   export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"
   ./guessing_game
   ```

## 🔧 Troubleshooting

### "Library not found" errors

**Problem**: `error while loading shared libraries: libSDL2-2.0.so.0: cannot open shared object file`

**Solutions**:
1. **Use the run script** (recommended):
   ```bash
   ./run_game.sh
   ```

2. **Set library path manually**:
   ```bash
   export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"
   ./guessing_game
   ```

3. **Install SDL2 on target system**:
   ```bash
   # Ubuntu/Debian
   sudo apt-get install libsdl2-2.0-0
   
   # Fedora/RHEL
   sudo dnf install SDL2
   
   # Arch Linux
   sudo pacman -S sdl2
   ```

### "Permission denied" errors

**Problem**: `bash: ./guessing_game: Permission denied`

**Solution**:
```bash
chmod +x guessing_game complete_guess_game run_game.sh
```

### Game window doesn't appear

**Problem**: Game starts but no window appears

**Solutions**:
1. **Check graphics support**:
   ```bash
   echo $DISPLAY  # Should show something like :0
   ```

2. **Try different video drivers**:
   ```bash
   SDL_VIDEODRIVER=x11 ./guessing_game
   # or
   SDL_VIDEODRIVER=wayland ./guessing_game
   ```

3. **Check if running over SSH**:
   ```bash
   ssh -X user@machine  # Enable X11 forwarding
   ```

### Dependency checking

**Check what libraries are needed**:
```bash
ldd guessing_game
```

**Check what's in the bundle**:
```bash
ls -la libs/
```

## 📁 Project Structure

```
sc-game/
├── game.jl                 # Main compilation script
├── deploy.jl               # Deployment script
├── sdl_wrapper.c           # C wrapper for SDL2 functions
├── run.jl                  # Alternative runner (if needed)
├── libs/                   # SDL2 libraries directory
│   ├── libSDL2.so          # Main SDL2 library
│   ├── libSDL2main.a       # Static main library
│   ├── libiconv.so.2       # Character encoding library
│   ├── libcharset.so.1     # Character set library
│   └── ...                 # Other SDL2 libraries
├── guessing_game           # Compiled executable (Julia logic)
├── complete_guess_game     # Compiled executable (C logic)
├── game_bundle/            # Deployment bundle (after deploy.jl)
├── *.tar.gz               # Distribution archive
└── README.md              # This file
```

## 🔄 Portability Options

The game offers three compilation strategies in `game.jl`:

### Option 1: Portable Bundle (Default)
```julia
# Uses local libraries with fallback to system
portable_flags = `-L./libs -lSDL2 -lSDL2main -Wl,-rpath,\$ORIGIN/libs -Wl,-rpath,\$ORIGIN`
```
- **Pros**: Works on most systems, self-contained
- **Cons**: Larger file size (~15MB)

### Option 2: System Libraries
```julia
# Requires SDL2 installed on target system
system_flags = `-lSDL2 -lSDL2main`
```
- **Pros**: Smaller executable (~14KB)
- **Cons**: Requires SDL2 installation on target

### Option 3: Partial Static
```julia
# Static link what's possible, dynamic for the rest
partial_static_flags = `-L./libs ./libs/libSDL2main.a -lSDL2 -Wl,-rpath,\$ORIGIN/libs`
```
- **Pros**: Balance of size and portability
- **Cons**: Still requires some dynamic libraries

## 🔬 Technical Details

- **Language**: Julia 1.10.x with C interop
- **Graphics**: SDL2 via C wrapper functions
- **Compilation**: StaticCompiler.jl creates native executables
- **Architecture**: x86_64 Linux
- **Dependencies**: Self-contained with bundled libraries
- **Memory**: ~1MB runtime memory usage
- **Performance**: Native machine code speed

### C Wrapper Functions
The game uses these C functions from `sdl_wrapper.c`:
- `init_game_window()`: Initialize SDL2 and create window
- `poll_key_input()`: Non-blocking keyboard input
- `set_background_color()`: Change background color
- `render_frame()`: Update display
- `cleanup_game_window()`: Clean up SDL2 resources

## 🎯 Use Cases

This project demonstrates:
- **Portable Julia applications**: Creating executables that don't require Julia
- **Game development**: Simple SDL2 game development in Julia
- **Cross-system deployment**: Distributing Julia applications to other machines
- **C interop**: Calling C libraries from Julia
- **Static compilation**: Using StaticCompiler.jl for native executables

## 📋 Deployment Checklist

**Before deployment**:
- [ ] Game compiles successfully with `julia +1.10 game.jl`
- [ ] Both executables work on development machine
- [ ] Deployment script runs without errors: `julia deploy.jl`
- [ ] Archive is created: `sdl2-guessing-game-*.tar.gz`

**On target machine**:
- [ ] Archive extracts successfully
- [ ] `run_game.sh` has execute permissions
- [ ] Game runs with `./run_game.sh`
- [ ] All controls work (0-9 keys, ESC)
- [ ] Visual feedback works (color changes)

## 📧 Support

If you encounter issues:
1. Check the troubleshooting section above
2. Verify system requirements
3. Try the manual deployment process
4. Check library dependencies with `ldd guessing_game`

## 📜 License

This project is provided as-is for educational and demonstration purposes.
