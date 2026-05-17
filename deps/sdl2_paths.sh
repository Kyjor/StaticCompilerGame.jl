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

_sdl2_image_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/sdl2_image"
SDL2_IMAGE_PREFIX="$_sdl2_image_root/prefix"
if [[ -f "$SDL2_IMAGE_PREFIX/lib64/libSDL2_image.a" ]]; then
    SDL2_IMAGE_LIBDIR="$SDL2_IMAGE_PREFIX/lib64"
elif [[ -f "$SDL2_IMAGE_PREFIX/lib/libSDL2_image.a" ]]; then
    SDL2_IMAGE_LIBDIR="$SDL2_IMAGE_PREFIX/lib"
else
    SDL2_IMAGE_LIBDIR=""
fi
SDL2_IMAGE_PKGCONFIG="${SDL2_IMAGE_LIBDIR:+$SDL2_IMAGE_LIBDIR/pkgconfig}"

_sdl2_mixer_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/sdl2_mixer"
SDL2_MIXER_PREFIX="$_sdl2_mixer_root/prefix"
if [[ -f "$SDL2_MIXER_PREFIX/lib64/libSDL2_mixer.a" ]]; then
    SDL2_MIXER_LIBDIR="$SDL2_MIXER_PREFIX/lib64"
elif [[ -f "$SDL2_MIXER_PREFIX/lib/libSDL2_mixer.a" ]]; then
    SDL2_MIXER_LIBDIR="$SDL2_MIXER_PREFIX/lib"
else
    SDL2_MIXER_LIBDIR=""
fi
SDL2_MIXER_PKGCONFIG="${SDL2_MIXER_LIBDIR:+$SDL2_MIXER_LIBDIR/pkgconfig}"
