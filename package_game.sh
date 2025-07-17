#!/bin/bash

# Package Game Script
# Zips up the necessary files to run the game

# Parse command line arguments
build_type="web"  # default to web build
if [ $# -gt 0 ]; then
    build_type=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    if [ "$build_type" != "web" ] && [ "$build_type" != "desktop" ]; then
        echo "❌ Error: Build type must be 'web' or 'desktop'"
        echo "Usage: ./package_game.sh [web|desktop]"
        exit 1
    fi
fi

echo "🎮 Packaging game for $build_type deployment..."

# Set variables based on build type
if [ "$build_type" = "web" ]; then
    PACKAGE_NAME="sc-game-web"
    GAME_DIR="game_wasm"
    REQUIRED_FILES=("index.html" "index.js")
else
    PACKAGE_NAME="sc-game-desktop"
    GAME_DIR="game_desktop"
    REQUIRED_FILES=()
fi

OUTPUT_DIR="Build"
ZIP_NAME="${PACKAGE_NAME}.zip"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
    echo "📁 Created output directory: $OUTPUT_DIR"
fi

# Check if required files exist
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Error: $file not found!"
        exit 1
    fi
done

if [ ! -d "$GAME_DIR" ]; then
    echo "❌ Error: $GAME_DIR directory not found!"
    echo "💡 Make sure you've built the game first:"
    echo "   julia compile_game.jl $build_type"
    exit 1
fi

# For desktop, check if the executable exists
if [ "$build_type" = "desktop" ]; then
    if [ ! -f "$GAME_DIR/game" ] && [ ! -f "$GAME_DIR/game.exe" ]; then
        echo "❌ Error: Game executable not found in $GAME_DIR!"
        echo "💡 Make sure you've built the game first:"
        echo "   julia compile_game.jl desktop"
        exit 1
    fi
fi

# Remove old zip if it exists
if [ -f "$OUTPUT_DIR/$ZIP_NAME" ]; then
    rm "$OUTPUT_DIR/$ZIP_NAME"
    echo "🗑️  Removed old package: $OUTPUT_DIR/$ZIP_NAME"
fi

# Create the zip file
echo "📦 Creating package: $OUTPUT_DIR/$ZIP_NAME"

if [ "$build_type" = "web" ]; then
    zip -r "$OUTPUT_DIR/$ZIP_NAME" index.html index.js "$GAME_DIR/"
else
    # For desktop, include the executable and any necessary libraries
    zip -r "$OUTPUT_DIR/$ZIP_NAME" "$GAME_DIR/"
fi

# Check if zip was created successfully
if [ $? -eq 0 ]; then
    echo "✅ Package created successfully!"
    echo "📁 Location: $OUTPUT_DIR/$ZIP_NAME"
    
    # Show package size
    PACKAGE_SIZE=$(du -h "$OUTPUT_DIR/$ZIP_NAME" | cut -f1)
    echo "📊 Package size: $PACKAGE_SIZE"
    
    echo ""
    echo "🚀 To run the game:"
    echo "   1. Extract the zip file"
    if [ "$build_type" = "web" ]; then
        echo "   2. Open index.html in a web browser"
        echo "   3. Or serve with a local web server:"
        echo "      python3 -m http.server 8000"
        echo "      Then visit: http://localhost:8000"
    else
        echo "   2. Make the game executable: chmod +x game_desktop/game"
        echo "   3. Run the game: ./game_desktop/game"
        echo "   4. Or double-click the game file in your file manager"
    fi
else
    echo "❌ Error: Failed to create package!"
    exit 1
fi 