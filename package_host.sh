#!/usr/bin/env bash
# Package `host` + bundled SDL into a zip. Run ./build_host.sh first.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST="$ROOT/host"
ARCH="$(uname -m)"
PKG_NAME="sc-game-${ARCH}"
DIST="$ROOT/dist/$PKG_NAME"
LIBDIR="$DIST/lib"
ZIP="$ROOT/${PKG_NAME}.zip"

if [[ ! -f "$HOST" ]]; then
    echo "❌ Missing $HOST — run: ./build_all.sh"
    exit 1
fi

chmod +x "$HOST"

echo "📦 Packaging $HOST for $ARCH (bundling SDL)"
rm -rf "$DIST"
mkdir -p "$LIBDIR"

cp "$HOST" "$DIST/host"
chmod +x "$DIST/host"

if command -v patchelf >/dev/null 2>&1; then
    patchelf --set-rpath '$ORIGIN/lib' "$DIST/host" 2>/dev/null || true
fi

should_bundle() {
    local base="$1"
    case "$base" in
        ld-linux*|linux-vdso*)
            return 1 ;;
        libc.so*|libm.so*|libdl.so*|libpthread.so*|librt.so*|libresolv.so*)
            return 1 ;;
        libSDL*)
            return 1 ;;  # SDL2 must be static in host, never bundle
    esac
    return 0
}

copy_lib() {
    local src="$1"
    [[ -z "$src" || ! -e "$src" ]] && return 0
    local real base dest soname
    real="$(readlink -f "$src")"
    base="$(basename "$real")"
    should_bundle "$base" || return 0
    dest="$LIBDIR/$base"
    if [[ ! -f "$dest" ]]; then
        cp -L "$real" "$dest"
        echo "   lib/$base"
    fi
    soname="$(basename "$src")"
    if [[ "$soname" != "$base" && ! -e "$LIBDIR/$soname" ]]; then
        ln -sf "$base" "$LIBDIR/$soname"
        echo "   lib/$soname -> $base"
    fi
}

copy_ldd_deps() {
    local bin="$1"
    [[ -f "$bin" ]] || return 0
    while IFS= read -r lib; do
        copy_lib "$lib"
    done < <(ldd "$bin" 2>/dev/null | awk '/=> \// { print $3 }')
}

echo "📚 Bundling runtime libs (SDL2 is static in host — no SDL3):"
copy_ldd_deps "$DIST/host"

cat > "$DIST/run.sh" << 'EOF'
#!/usr/bin/env bash
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export LD_LIBRARY_PATH="$HERE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$HERE/host" "$@"
EOF
chmod +x "$DIST/run.sh"

cat > "$DIST/check.sh" << 'EOF'
#!/usr/bin/env bash
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export LD_LIBRARY_PATH="$HERE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
echo "=== ldd host ==="
ldd "$HERE/host" 2>&1 || true
if ldd "$HERE/host" 2>&1 | grep -qE 'GLIBC_|not found|version.*not found'; then
  echo ""
  echo ">>> GLIBC too old for this binary (built on a newer distro)."
  echo ">>> Fix: rebuild ON this machine (./build_all.sh), or on Fedora:"
  echo ">>>      sudo dnf install glibc-static && STATIC=1 ./build_all.sh"
fi
echo "=== lib/ ==="
ls -la "$HERE/lib" 2>/dev/null || true
echo "=== run host (3s) ==="
timeout 3 "$HERE/host" && echo OK || echo "failed"
EOF
chmod +x "$DIST/check.sh"

rm -f "$ZIP"
(cd "$ROOT/dist" && zip -rq "$ZIP" "$PKG_NAME")

echo ""
echo "✅ Package: $ZIP"
find "$DIST" -type f | sed "s|$ROOT/dist/|   |" | sort
echo ""
echo "🚀 Target: unzip && ./host   (or ./run.sh)"
