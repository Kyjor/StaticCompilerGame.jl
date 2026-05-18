// Framework web: init once, then one sc_frame per requestAnimationFrame.
window.onModuleReady = function () {
    if (typeof Module._sc_engine_init !== "function" ||
        typeof Module._sc_frame !== "function") {
        console.error("Missing engine exports — rebuild with ./build_web.sh");
        return;
    }

    if (Module._sc_engine_init() !== 0) {
        console.error("sc_engine_init failed");
        return;
    }

    function frame() {
        if (Module._sc_frame() !== 0) {
            requestAnimationFrame(frame);
        } else {
            Module._sc_engine_shutdown();
        }
    }

    requestAnimationFrame(frame);
};
