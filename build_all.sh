#!/usr/bin/env bash
# Full pipeline: Julia library → C host → zip package
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

# StaticCompiler needs Julia 1.10 or below — prefer juliaup's +1.10
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

echo "=== 1/4 deps/build_sdl2.sh (vanilla SDL2, not sdl2-compat) ==="
"$ROOT/deps/build_sdl2.sh"

echo "=== 2/4 compile_library.jl ==="
"${JULIA_CMD[@]}" compile_library.jl desktop

echo "=== 3/4 build_host.sh ==="
STATIC="${STATIC:-0}" "$ROOT/build_host.sh"

echo "=== 4/4 package_host.sh ==="
"$ROOT/package_host.sh"
