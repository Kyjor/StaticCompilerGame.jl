#!/bin/bash

# Package Game Script
# Zips up the necessary files to run the game

echo "🎮 Packaging game for deployment..."

# Set variables
PACKAGE_NAME="sc-game-package"
OUTPUT_DIR="Build"
ZIP_NAME="${PACKAGE_NAME}.zip"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
    echo "📁 Created output directory: $OUTPUT_DIR"
fi

# Check if required files exist
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found!"
    exit 1
fi

if [ ! -f "index.js" ]; then
    echo "❌ Error: index.js not found!"
    exit 1
fi

if [ ! -d "game_wasm" ]; then
    echo "❌ Error: game_wasm directory not found!"
    exit 1
fi

# Remove old zip if it exists
if [ -f "$OUTPUT_DIR/$ZIP_NAME" ]; then
    rm "$OUTPUT_DIR/$ZIP_NAME"
    echo "🗑️  Removed old package: $OUTPUT_DIR/$ZIP_NAME"
fi

# Create the zip file
echo "📦 Creating package: $OUTPUT_DIR/$ZIP_NAME"
zip -r "$OUTPUT_DIR/$ZIP_NAME" index.html index.js game_wasm/

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
    echo "   2. Open index.html in a web browser"
    echo "   3. Or serve with a local web server:"
    echo "      python3 -m http.server 8000"
    echo "      Then visit: http://localhost:8000"
else
    echo "❌ Error: Failed to create package!"
    exit 1
fi 