#!/usr/bin/env bash
# Framework web: Julia engine + host.c → game_wasm/game.js
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

if ! command -v emcc >/dev/null 2>&1; then
    echo "❌ emcc not in PATH — install Emscripten and run: source emsdk_env.sh"
    exit 1
fi

if ! command -v llvm-link >/dev/null 2>&1; then
    echo "❌ llvm-link not in PATH — install LLVM tools (e.g. dnf install llvm)"
    exit 1
fi

if [[ -n "${JULIA:-}" ]]; then
    read -ra JULIA_CMD <<< "$JULIA"
elif julia +1.10 --version &>/dev/null; then
    JULIA_CMD=(julia +1.10)
else
    JULIA_CMD=(julia)
    if "${JULIA_CMD[@]}" --version 2>/dev/null | grep -qE 'julia version 1\.(1[1-9]|[2-9][0-9])'; then
        echo "❌ $("${JULIA_CMD[@]}" --version) — StaticCompiler needs Julia 1.10 or below"
        echo "   Install: juliaup add 1.10"
        echo "   Or run:  JULIA='julia +1.10' $0"
        exit 1
    fi
fi

echo "Using: ${JULIA_CMD[*]} ($("${JULIA_CMD[@]}" --version))"
echo "=== compile_library.jl web ==="
"${JULIA_CMD[@]}" compile_library.jl web

echo ""
echo "✅ Web build complete. Serve and open index.html:"
echo "   python3 -m http.server"
echo "   http://localhost:8000/index.html"
