#!/usr/bin/env bash
# Build static SDL2_mixer against vendored SDL2 (deps/sdl2/prefix).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=deps/sdl2_paths.sh
source "$ROOT/deps/sdl2_paths.sh"

DEPS="$ROOT/deps/sdl2_mixer"
VERSION="${SDL2_MIXER_VERSION:-2.8.0}"
PREFIX="$DEPS/prefix"
SRCDIR="$DEPS/SDL2_mixer-$VERSION"
TARBALL="$DEPS/SDL2_mixer-$VERSION.tar.gz"
URL="https://github.com/libsdl-org/SDL_mixer/releases/download/release-${VERSION}/SDL2_mixer-${VERSION}.tar.gz"

mkdir -p "$DEPS"

if [[ -z "$SDL2_LIBDIR" || ! -f "$SDL2_LIBDIR/libSDL2.a" ]]; then
    echo "ℹ️  Vendored SDL2 required — running deps/build_sdl2.sh"
    "$ROOT/deps/build_sdl2.sh"
    # shellcheck source=deps/sdl2_paths.sh
    source "$ROOT/deps/sdl2_paths.sh"
fi

print_build_dep_hints() {
    case "$(uname -s)" in
    Darwin)
        echo "   macOS: brew install cmake   (curl is built-in; gcc/clang: xcode-select --install)"
        ;;
    Linux)
        echo "   Fedora: sudo dnf install cmake gcc curl"
        echo "   Debian: sudo apt install cmake gcc curl"
        ;;
    *)
        echo "   Install: cmake, a C compiler, and curl"
        ;;
    esac
}

for cmd in cmake gcc curl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "❌ Missing: $cmd"
        print_build_dep_hints
        exit 1
    fi
done

if [[ ! -f "$TARBALL" ]]; then
    echo "⬇️  Downloading SDL2_mixer $VERSION..."
    curl -fsSL "$URL" -o "$TARBALL"
fi

if [[ ! -d "$SRCDIR" ]]; then
    tar -xf "$TARBALL" -C "$DEPS"
fi

SDL2_CMAKE_DIR="$SDL2_PREFIX/lib/cmake/SDL2"
CMAKE_EXTRA=()
if [[ -d "$SDL2_CMAKE_DIR" ]]; then
    CMAKE_EXTRA=(-DSDL2_DIR="$SDL2_CMAKE_DIR")
fi

echo "🔨 Building static SDL2_mixer → $PREFIX (SDL2 at $SDL2_PREFIX)"
cmake -S "$SRCDIR" -B "$DEPS/build" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH="$SDL2_PREFIX" \
    "${CMAKE_EXTRA[@]}" \
    -DBUILD_SHARED_LIBS=OFF \
    -DSDL2MIXER_DEPS_SHARED=OFF \
    -DSDL2MIXER_VENDORED=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DSDL2MIXER_VORBIS=OFF \
    -DSDL2MIXER_FLAC=OFF \
    -DSDL2MIXER_MP3=OFF \
    -DSDL2MIXER_MOD=OFF \
    -DSDL2MIXER_MIDI=OFF \
    -DSDL2MIXER_OPUS=OFF \
    -DSDL2MIXER_WAVPACK=OFF \
    -DSDL2MIXER_GME=OFF

NPROC="$(getconf _NPROCESSORS_ONLN 2>/dev/null || nproc 2>/dev/null || echo 4)"
cmake --build "$DEPS/build" -j"$NPROC"
cmake --install "$DEPS/build"

if [[ -f "$PREFIX/lib64/libSDL2_mixer.a" ]]; then
    echo "✅ SDL2_mixer installed: $PREFIX/lib64/libSDL2_mixer.a"
else
    echo "✅ SDL2_mixer installed: $PREFIX/lib/libSDL2_mixer.a"
fi
