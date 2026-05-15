# Source this from bash scripts. Sets SDL2_PREFIX, SDL2_LIBDIR, SDL2_PKGCONFIG.
_sdl2_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/sdl2"
SDL2_PREFIX="$_sdl2_root/prefix"
if [[ -f "$SDL2_PREFIX/lib64/libSDL2.a" ]]; then
    SDL2_LIBDIR="$SDL2_PREFIX/lib64"
elif [[ -f "$SDL2_PREFIX/lib/libSDL2.a" ]]; then
    SDL2_LIBDIR="$SDL2_PREFIX/lib"
else
    SDL2_LIBDIR=""
fi
SDL2_PKGCONFIG="${SDL2_LIBDIR:+$SDL2_LIBDIR/pkgconfig}"
