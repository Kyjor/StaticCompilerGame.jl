#!/bin/bash
# SDL2 Guessing Game Runner
# This script sets up the environment and runs the game

# Set library path to local libs directory
export LD_LIBRARY_PATH="$PWD/libs:$LD_LIBRARY_PATH"

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
