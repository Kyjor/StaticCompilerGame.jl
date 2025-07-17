#!/usr/bin/env julia

"""
Deployment script for the SDL2 guessing game
This script helps package the game for distribution to other machines
"""

using Printf

function main()
    println("🎮 SDL2 Guessing Game Deployment Script")
    println("=" ^ 40)
    
    # Check if executables exist
    executables = ["guessing_game", "complete_guess_game"]
    missing_executables = []
    
    for exe in executables
        if !isfile(exe)
            push!(missing_executables, exe)
        end
    end
    
    if !isempty(missing_executables)
        println("❌ Missing executables: $(join(missing_executables, ", "))")
        println("Please run: julia +1.10 game.jl")
        return 1
    end
    
    # Create deployment directory
    deploy_dir = "game_bundle"
    if isdir(deploy_dir)
        println("🗂️  Removing existing $(deploy_dir) directory...")
        rm(deploy_dir, recursive=true)
    end
    
    println("📁 Creating deployment bundle in $(deploy_dir)/")
    mkpath(deploy_dir)
    mkpath(joinpath(deploy_dir, "libs"))
    
    # Copy executables
    println("📋 Copying executables...")
    for exe in executables
        cp(exe, joinpath(deploy_dir, exe))
        # Make executable
        run(`chmod +x $(joinpath(deploy_dir, exe))`)
    end
    
    # Copy SDL2 and dependent libraries
    println("📚 Copying SDL2 and dependent libraries...")
    lib_files = [
        # SDL2 libraries
        "libSDL2-2.0.so.0",
        "libSDL2-2.0.so.0.2400.2", 
        "libSDL2.so",
        "libSDL2main.so",
        # iconv libraries (dependency)
        "libiconv.so.2",
        "libiconv.so.2.6.1",
        "libiconv.so",
        # charset libraries (dependency)
        "libcharset.so.1",
        "libcharset.so.1.0.0",
        "libcharset.so"
    ]
    
    for lib in lib_files
        lib_path = joinpath("libs", lib)
        if isfile(lib_path)
            cp(lib_path, joinpath(deploy_dir, "libs", lib))
            println("   ✓ Copied $(lib)")
        else
            println("   ⚠️  Missing $(lib)")
        end
    end
    
    # Copy wrapper C file (for reference)
    if isfile("sdl_wrapper.c")
        cp("sdl_wrapper.c", joinpath(deploy_dir, "sdl_wrapper.c"))
    end
    
    # Create run script
    println("📜 Creating run script...")
    run_script = joinpath(deploy_dir, "run_game.sh")
    open(run_script, "w") do f
        write(f, """#!/bin/bash
# SDL2 Guessing Game Runner
# This script sets up the environment and runs the game

# Set library path to local libs directory
export LD_LIBRARY_PATH="\$PWD/libs:\$LD_LIBRARY_PATH"

# Check if SDL2 is available
if ! ldconfig -p | grep -q libSDL2; then
    echo "⚠️  SDL2 not found in system libraries, using bundled version"
    echo "   If you get errors, you may need to install SDL2 development packages"
    echo "   On Ubuntu/Debian: sudo apt-get install libsdl2-dev"
    echo "   On Fedora/RHEL: sudo dnf install SDL2-devel"
    echo "   On Arch: sudo pacman -S sdl2"
    echo ""
fi

echo "🎮 Starting SDL2 Guessing Game"
echo "   Goal: Guess the number 7!"
echo "   Controls: Press number keys 0-9, ESC to quit"
echo "   Feedback: Blue=normal, Red=wrong guess, Green=correct!"
echo ""

# Check if we have all required libraries
echo "🔍 Checking dependencies..."
if [ ! -f "libs/libSDL2-2.0.so.0" ]; then
    echo "❌ Missing SDL2 library. Please ensure libs/ directory is present."
    exit 1
fi

if [ ! -f "libs/libiconv.so.2" ]; then
    echo "❌ Missing iconv library. Please ensure libs/ directory is present."
    exit 1
fi

echo "✅ All dependencies found"
echo ""

# Run the game
echo "🚀 Starting game..."
./guessing_game
""")
    end
    run(`chmod +x $(run_script)`)
    
    # Create README
    println("📝 Creating README...")
    readme_path = joinpath(deploy_dir, "README.md")
    open(readme_path, "w") do f
        write(f, """# SDL2 Guessing Game

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
export LD_LIBRARY_PATH="\$PWD/libs:\$LD_LIBRARY_PATH"
./guessing_game
```

### Option 3: Run the alternative version
```bash
export LD_LIBRARY_PATH="\$PWD/libs:\$LD_LIBRARY_PATH"
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
""")
    end
    
    # Test the executables in the bundle
    println("🧪 Testing executables in bundle...")
    test_cmd = `bash -c "cd $(deploy_dir) && export LD_LIBRARY_PATH=\$PWD/libs:\$LD_LIBRARY_PATH && ldd guessing_game"`
    try
        run(test_cmd)
        println("✅ Library dependencies look good")
    catch e
        println("⚠️  Warning: Could not test dependencies: $e")
    end
    
    # Create a tar archive
    println("📦 Creating distribution archive...")
    archive_name = "sdl2-guessing-game-$(Sys.MACHINE).tar.gz"
    run(`tar -czf $(archive_name) -C $(deploy_dir) .`)
    
    println()
    println("✅ Deployment complete!")
    println("📁 Bundle directory: $(deploy_dir)/")
    println("📦 Distribution archive: $(archive_name)")
    println()
    println("🚀 To deploy on another machine:")
    println("   1. Copy $(archive_name) to target machine")
    println("   2. Extract: tar -xzf $(archive_name)")
    println("   3. Run: ./run_game.sh")
    println()
    println("💡 The bundle includes SDL2 libraries and should work on most Linux systems")
    
    return 0
end

if abspath(PROGRAM_FILE) == @__FILE__
    exit(main())
end 