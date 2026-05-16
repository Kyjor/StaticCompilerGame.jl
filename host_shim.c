/* Optional launcher: build with
 *   gcc -o host_jl host_shim.c
 * Run from repo root (same directory as host.jl):
 *   ./host_jl
 *
 * Does not link the engine library; execs `julia host.jl`.
 * For the static C game path, keep using host.c + ./build_host.sh.
 */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    const char *cmd = "julia host.jl";
    int code = system(cmd);
    if (code != 0)
        fprintf(stderr, "host_shim: failed (%d) — run from repo root, need `julia` on PATH\n", code);
    return code != 0 ? 1 : 0;
}
