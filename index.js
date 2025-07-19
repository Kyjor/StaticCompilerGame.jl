// Ensure SDL initializes after WebAssembly is loaded
// Set up the callback for when the WASM module is ready
window.onModuleReady = function() {
    console.log("Module is ready, initializing SDL...");
    console.log("Module object:", Module);
    console.log("Available functions:", Object.keys(Module).filter(key => key.startsWith('_')));
    
    // Initialize SDL drawing first
    if (Module._j_init_game_state) {
        console.log("Calling init_game_state...");
        Module._j_init_game_state();
    } else {
        console.error("init_game_state not found!");
    }
    // Test if SDL is working
    if (Module._test_sdl_working) {
        console.log("Testing SDL working...");
        Module._test_sdl_working();
    } else {
        console.error("test_sdl_working not found!");
    }

    if (Module._j_init_game_state1) {
        console.log("Calling init_game_state1...");
        let game_state_ptr = Module._j_init_game_state1();
        console.log("Game state pointer:", game_state_ptr);
        if (game_state_ptr) {
            console.log("Game state pointer is not null");
            if (Module._update_game_state) {
                console.log("Calling update_game_state...");
                Module._update_game_state(game_state_ptr);
            } else {
                console.error("update_game_state not found!");
            }
        } else {
            console.error("Game state pointer is null");
        }
    } else {
        console.error("init_game_state1 not found!");
    }
    
    let frameCount = 0;
    function runMainLoop() {
        frameCount++;
        // Call the C/C++ main_loop function
        let x = Module._draw_game_frame(999, 10, 1);
        Module._main_loop();
        // Continue the loop
        requestAnimationFrame(runMainLoop);
    }
    
    console.log("Starting main loop...");
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