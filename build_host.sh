#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_A="$ROOT/lib_desktop/libsc_game.a"
# shellcheck source=deps/sdl2_paths.sh
source "$ROOT/deps/sdl2_paths.sh"

if [[ ! -f "$LIB_A" ]]; then
    echo "❌ Missing $LIB_A — run: julia compile_library.jl desktop"
    exit 1
fi

if ! nm "$LIB_A" 2>/dev/null | grep -q ' T sc_run'; then
    echo "❌ $LIB_A has no compiled Julia symbols (sc_run missing)"
    echo "   Use Julia 1.10 or below — see README.md"
    exit 1
fi

if [[ -z "$SDL2_LIBDIR" || ! -f "$SDL2_LIBDIR/libSDL2.a" ]]; then
    echo "ℹ️  Vendored SDL2 not built — running deps/build_sdl2.sh"
    "$ROOT/deps/build_sdl2.sh"
    source "$ROOT/deps/sdl2_paths.sh"
fi

SDL2_A="$SDL2_LIBDIR/libSDL2.a"
SDL2_CONFIG="$SDL2_PREFIX/bin/sdl2-config"
mapfile -t SDL_CFLAGS < <("$SDL2_CONFIG" --cflags)

LINK_FLAGS=()
if [[ "${STATIC:-0}" == "1" ]]; then
    if [[ ! -f /usr/lib64/libc.a && ! -f /usr/lib/x86_64-linux-gnu/libc.a ]]; then
        echo "❌ STATIC=1 needs glibc-static"
        echo "   Fedora: sudo dnf install glibc-static"
        echo "   Debian: sudo apt install libc6-dev"
        exit 1
    fi
    LINK_FLAGS=(-static)
    echo "🔨 Fully static link (no glibc version lock on target) ..."
else
    echo "🔨 Linking host with static SDL2 ($SDL2_A) ..."
fi

# Link order: objects, then archive, then libSDL2.a (resolves SDL symbols for both host.c and libsc_game.a)
gcc "${LINK_FLAGS[@]}" -o "$ROOT/host" "$ROOT/host.c" "${SDL_CFLAGS[@]}" \
    "$LIB_A" \
    "$SDL2_A" \
    -pthread -lm -ldl

if ldd "$ROOT/host" 2>/dev/null | grep -q libSDL; then
    echo "⚠️  host still links libSDL dynamically"
    ldd "$ROOT/host" | grep SDL
    exit 1
fi

echo "✅ Built: $ROOT/host (SDL2 static, no SDL3)"
ls -lh "$ROOT/host"
if [[ "${STATIC:-0}" == "1" ]]; then
    echo "   fully static — should run on older Linux VMs"
    ldd "$ROOT/host" 2>&1 || echo "   (static binary — not a dynamic executable)"
else
    ldd "$ROOT/host" 2>/dev/null || true
    max_glibc="$(objdump -T "$ROOT/host" 2>/dev/null | grep -oP 'GLIBC_[0-9.]+' | sort -V | tail -1 || true)"
    if [[ -n "$max_glibc" ]]; then
        echo "   requires $max_glibc on target (built on this machine's glibc)"
        echo "   older VMs: build on target, or: STATIC=1 ./build_host.sh (needs glibc-static)"
    fi
fi
