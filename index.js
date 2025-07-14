// Ensure SDL initializes after WebAssembly is loaded
// Set up the callback for when the WASM module is ready
window.onModuleReady = function() {
    console.log("Module is ready, initializing SDL...");
    console.log("Module object:", Module);
    console.log("Available functions:", Object.keys(Module).filter(key => key.startsWith('_')));
    
    // Initialize SDL drawing first
    if (Module._init_sdl_drawing) {
        console.log("Calling init_sdl_drawing...");
        Module._init_sdl_drawing();
    } else {
        console.error("init_sdl_drawing not found!");
    }
    
    // Test if SDL is working
    if (Module._test_sdl_working) {
        console.log("Testing SDL working...");
        Module._test_sdl_working();
    } else {
        console.error("test_sdl_working not found!");
    }
    
    let frameCount = 0;
    let is_initialized = false;
    function runMainLoop() {
        frameCount++;
        if (!is_initialized) {
            Module._j_init_game_state();
            is_initialized = true;
        }
        //console.log(`JS Main Loop Frame ${frameCount}`);
        //Module._create_entities_if_needed();
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