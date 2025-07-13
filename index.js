// Ensure SDL initializes after WebAssembly is loaded
console.log(window.Module);
const dummyEntityData = [
    { x: 1.0, y: 4.0 }, { x: 1.0, y: 3.0 }, { x: 1.0, y: 4.0 },
    { x: 2.0, y: 4.0 }, { x: 3.0, y: 4.0 }, { x: 3.0, y: 3.0 },
    { x: 2.0, y: 3.0 }, { x: 4.0, y: 3.0 }, { x: 5.0, y: 3.0 },
    { x: 6.0, y: 3.0 }, { x: 0.0, y: 3.0 }, { x: -1.0, y: 3.0 },
    { x: -2.0, y: 3.0 }, { x: -3.0, y: 3.0 }, { x: -4.0, y: 3.0 },
    { x: 0.0, y: 4.0 }
  ];

// Wait for the existing Module to be ready
function waitForModule() {
    if (window.Module && window.Module.onRuntimeInitialized) {
        // Module is already set up, just add our initialization
        const originalOnRuntimeInitialized = window.Module.onRuntimeInitialized;
        window.Module.onRuntimeInitialized = function() {
            // Call the original function first
            if (originalOnRuntimeInitialized) {
                originalOnRuntimeInitialized();
            }
            
            console.log("WASM Loaded!");
            
            // Test SDL first
            const testResult = Module._test_sdl_working();
            console.log("SDL test result:", testResult);
            
            // Initialize SDL first
            const initResult = Module._init_sdl_drawing();
            console.log("SDL Init result:", initResult);
            
            // Test SDL again after initialization
            const testResult2 = Module._test_sdl_working();
            console.log("SDL test result after init:", testResult2);
            
            // Test rendering
            const renderTest = Module._test_rendering();
            console.log("Render test result:", renderTest);
            
            // Create some entities
            Module._create_entities_if_needed();
            
            function updateJulia(data) {
                // Update the DOM with data to be read by Julia
                // Get the game container element
                const gameContainer = document.getElementById('game-container');

                // Update the value of the element
                gameContainer.value = JSON.stringify(data);

                // Dispatch a custom event
                const event = new CustomEvent('game-data-update', { detail: data });
                gameContainer.dispatchEvent(event);
            }

            function sendToC(x, y) {
                ccall(
                    'update_square_position', // Function name
                    null,                     // Return type (void)
                    ['number', 'number'],     // Argument types (int, int)
                    [x, y]                   // Arguments
                );
            }

            // Listen for the custom event to send data to 

            function runMainLoop() {
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
    } else {
        // Module not ready yet, wait a bit and try again
        setTimeout(waitForModule, 100);
    }
}

// Start waiting for Module to be ready
waitForModule();