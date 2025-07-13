// Ensure SDL initializes after WebAssembly is loaded
// Set up the callback for when the WASM module is ready
window.onModuleReady = function() {
    console.log("Module is ready, starting main loop");
    
    function runMainLoop() {
        console.log("Running main loop");
        // Call the C/C++ main_loop function
        Module._main_loop();
        requestAnimationFrame(runMainLoop);
    }
    runMainLoop();

    // // Optional: Quit SDL after 5 seconds
    // setTimeout(() => {
    //     console.log("Quitting SDL...");
    //     Module._deinitialize_the_game();
    // }, 5000);
};

// If the module is already initialized when this script runs
if (window.Module && window.Module._main_loop) {
    console.log("Module already ready, starting main loop");
    window.onModuleReady();
} else {
    console.log("Waiting for Module to be ready...");
}