#!/usr/bin/env bash
# Build vanilla SDL2 (not Fedora sdl2-compat / SDL3) as a static PIC library.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEPS="$ROOT/deps/sdl2"
VERSION="${SDL2_VERSION:-2.30.11}"
PREFIX="$DEPS/prefix"
SRCDIR="$DEPS/SDL2-$VERSION"
TARBALL="$DEPS/SDL2-$VERSION.tar.gz"
URL="https://github.com/libsdl-org/SDL/releases/download/release-${VERSION}/SDL2-${VERSION}.tar.gz"

mkdir -p "$DEPS"

for cmd in cmake gcc curl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "❌ Missing: $cmd"
        echo "   Fedora: sudo dnf install cmake gcc curl"
        echo "   Debian: sudo apt install cmake gcc curl"
        exit 1
    fi
done

if [[ ! -f "$TARBALL" ]]; then
    echo "⬇️  Downloading SDL2 $VERSION..."
    curl -fsSL "$URL" -o "$TARBALL"
fi

if [[ ! -d "$SRCDIR" ]]; then
    tar -xf "$TARBALL" -C "$DEPS"
fi

echo "🔨 Building static SDL2 → $PREFIX"
cmake -S "$SRCDIR" -B "$DEPS/build" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDL_SHARED=OFF \
    -DSDL_STATIC=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON

cmake --build "$DEPS/build" -j"$(nproc)"
cmake --install "$DEPS/build"

if [[ -f "$PREFIX/lib64/libSDL2.a" ]]; then
    echo "✅ SDL2 installed: $PREFIX/lib64/libSDL2.a"
else
    echo "✅ SDL2 installed: $PREFIX/lib/libSDL2.a"
fi
echo "   (real SDL2 — no SDL3 / sdl2-compat)"
