// Ensure SDL initializes after WebAssembly is loaded
// Set up the callback for when the WASM module is ready
window.onModuleReady = function() {
    console.log("Module is ready, initializing SDL...");
    console.log("Module object:", Module);
    console.log("Available functions:", Object.keys(Module).filter(key => key.startsWith('_')));
    
    // Initialize SDL drawing first
    let window = Module._j_init_window();
    let renderer = Module._j_init_renderer(window);

    // Test if SDL is working
    if (!window || !renderer) {
        console.error("Failed to initialize SDL");
        return;
    }
    console.log("SDL initialized successfully");

    let game_state_ptr = Module._j_init_game_state();
    console.log("Game state pointer:", game_state_ptr);
    if (game_state_ptr) {
        console.log("Game state pointer is not null");
    } else {
        console.error("Game state pointer is null");
    }
    
    let frameCount = 0;
    function runMainLoop() {
        frameCount++;
        // Call the C/C++ main_loop function
        Module._game_loop(game_state_ptr, renderer);
        // Continue the loop
        requestAnimationFrame(runMainLoop);
    }
    
    runMainLoop();
};

// Check if Module is already available
console.log("Script loaded, checking Module...");
if (window.Module) {
    console.log("Module exists:", window.Module);
    if (window.Module._main_loop) {
        console.log("Module already ready, starting main loop");
        window.onModuleReady();
    } else {
        console.log("Module exists but _main_loop not ready yet");
    }
} else {
    console.log("Module not found yet, waiting...");
}