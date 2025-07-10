// Enhanced index.js with Julia Physics Integration
console.log("Initializing SDL + Julia module...");

// Your existing dummy entity data (can be removed later)
const dummyEntityData = [
    { x: 1.0, y: 4.0 }, { x: 1.0, y: 3.0 }, { x: 1.0, y: 4.0 },
    { x: 2.0, y: 4.0 }, { x: 3.0, y: 4.0 }, { x: 3.0, y: 3.0 },
    { x: 2.0, y: 3.0 }, { x: 4.0, y: 3.0 }, { x: 5.0, y: 3.0 },
    { x: 6.0, y: 3.0 }, { x: 0.0, y: 3.0 }, { x: -1.0, y: 3.0 },
    { x: -2.0, y: 3.0 }, { x: -3.0, y: 3.0 }, { x: -4.0, y: 3.0 },
    { x: 0.0, y: 4.0 }
];

window.Module = {
    ...window.Module,
    onRuntimeInitialized: function() {
        console.log("🎮 SDL2 WASM Loaded!");
        
        // Initialize SDL (your existing code)
        try {
            Module._main(); // This calls the C main() function which sets up SDL
            console.log("✅ SDL initialized successfully");
        } catch (e) {
            console.error("❌ Failed to initialize SDL:", e);
            return;
        }
        
        // Your existing updateGameData function (preserved)
        window.updateGameData = function(data) {
            console.log("Updating game data:", data);
            const entityData = JSON.parse(data);
            
            // Allocate memory for the entity array
            const size = entityData.length * 8; // Each entity (x, y) takes 8 bytes (2 floats)
            const ptr = _malloc(size);
            
            // Copy entity data into WebAssembly memory
            for (let i = 0; i < entityData.length; i++) {
                Module.HEAPF32[(ptr >> 2) + i * 2] = entityData[i].x;
                Module.HEAPF32[(ptr >> 2) + i * 2 + 1] = entityData[i].y;
            }

            // Call the C function to update entities
            Module._update_entities(ptr, entityData.length);

            // Free allocated memory
            _free(ptr);

            // Optionally print entities in the C side
            Module._print_entities();
        };

        // Your existing updateJulia function (now enhanced)
        function updateJulia(data) {
            // Update the DOM with data to be read by Julia
            const gameContainer = document.getElementById('game-container');
            if (gameContainer) {
                gameContainer.value = JSON.stringify(data);
                const event = new CustomEvent('game-data-update', { detail: data });
                gameContainer.dispatchEvent(event);
            }
            
            // NEW: Update Julia physics and get entity data back
            if (typeof window.updateJuliaGameData === 'function') {
                const juliaEntityData = window.updateJuliaGameData(data);
                
                // Send Julia physics results to your SDL2 system
                if (juliaEntityData && juliaEntityData.length > 0) {
                    window.updateGameData(JSON.stringify(juliaEntityData));
                }
            }
        }

        // Your existing sendToC function (preserved)
        function sendToC(x, y) {
            ccall(
                'update_square_position', // Function name
                null,                     // Return type (void)
                ['number', 'number'],     // Argument types (int, int)
                [x, y]                   // Arguments
            );
        }

        // Your existing event listener (preserved)
        document.addEventListener('send-to-c', function(event) {
            console.log("Send-to-C event:", event.detail);
            const entityData = JSON.parse(event.detail);
        
            // Allocate memory for the entity array
            const size = entityData.length * 8; // Each entity (x, y) takes 8 bytes (2 floats)
            const ptr = _malloc(size);
            
            // Copy entity data into WebAssembly memory
            for (let i = 0; i < entityData.length; i++) {
                Module.HEAPF32[(ptr >> 2) + i * 2] = entityData[i].x;
                Module.HEAPF32[(ptr >> 2) + i * 2 + 1] = entityData[i].y;
            }

            // Call the C function to update entities
            Module._update_entities(ptr, entityData.length);

            // Free allocated memory
            _free(ptr);

            // Optionally print entities in the C side
            Module._print_entities();
        });

        // Enhanced main loop with Julia physics integration
        function runMainLoop() {
            // Get pointer to C struct (your existing code)
            let inputPtr = Module._get_input_state();
            
            // Read key states from WASM memory (your existing code)
            let key_A = Module.HEAPU8[inputPtr];      // First byte
            let key_D = Module.HEAPU8[inputPtr + 1];  // Second byte
            let key_Space = Module.HEAPU8[inputPtr + 2]; // Third byte

            // Create gameData object to send to Julia (your existing code)
            const gameData = {
                A: !!key_A,         // Convert to boolean
                D: !!key_D,
                Space: !!key_Space
            };

            // NEW: Enhanced update with Julia physics
            updateJulia(gameData); // This now includes Julia physics
            
            // Call the C/C++ main_loop function (your existing code)
            let result = Module._main_loop();
            
            // Continue main loop
            requestAnimationFrame(runMainLoop);
        }
        
        // Start the main loop
        runMainLoop();

        // Optional: Quit SDL after 5 seconds (your existing code - commented out)
        // setTimeout(() => {
        //     console.log("Quitting SDL...");
        //     Module._deinitialize_the_game();
        // }, 5000);
    }
}; 