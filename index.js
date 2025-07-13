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
window.Module = {
    ...window.Module,
    onRuntimeInitialized: function() {
        console.log("WASM Loaded!");
        
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

        // Listen for the custom event to send data to C
        document.addEventListener('send-to-c', function(event) {
            console.log(event.detail)
            const entityData = JSON.parse(event.detail);
        
            //sendToC(x, y);
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

        function runMainLoop() {
            console.log("Running main loop");
            console.log(Module);
            // Get pointer to C struct
            // let inputPtr = Module._get_input_state();
            
            // // Read key states from WASM memory
            // let key_A = Module.HEAPU8[inputPtr];      // First byte
            // let key_D = Module.HEAPU8[inputPtr + 1];  // Second byte
            // let key_Space = Module.HEAPU8[inputPtr + 2]; // Third byte

            // // Create gameData object to send to Julia
            // const gameData = {
            //     A: !!key_A,         // Convert to boolean
            //     D: !!key_D,
            //     Space: !!key_Space
            // };

            // updateJulia(gameData); // Send data to Julia
            let result = Module._main_loop(); // Call the C/C++ main_loop function
            requestAnimationFrame(runMainLoop);
        }
        runMainLoop();

        // // Optional: Quit SDL after 5 seconds
        // setTimeout(() => {
        //     console.log("Quitting SDL...");
        //     Module._deinitialize_the_game();
        // }, 5000);
    }
};