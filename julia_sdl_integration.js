// Julia + SDL2 Integration
// This shows how to integrate Julia physics with your existing SDL2 setup

console.log("Initializing Julia + SDL2 integration...");

// Game state managed in JavaScript, physics handled by Julia
let gameState = {
    square: {
        x: 100,
        y: 300,
        velX: 0,
        velY: 0,
        onGround: true
    },
    input: {
        A: false,    // Left
        D: false,    // Right  
        Space: false // Jump
    }
};

// Load Julia WebAssembly module
let juliaModule = null;

// This integrates with your existing SDL2 setup
window.Module = {
    ...window.Module,
    onRuntimeInitialized: function() {
        console.log("SDL2 WASM Loaded!");
        
        // Initialize SDL
        try {
            Module._main(); // Your existing SDL initialization
            console.log("SDL initialized successfully");
        } catch (e) {
            console.error("Failed to initialize SDL:", e);
            return;
        }
        
        // Load Julia physics module
        loadJuliaPhysics();
        
        // Start the enhanced game loop
        runMainLoop();
    }
};

// Load Julia WebAssembly module for physics
async function loadJuliaPhysics() {
    try {
        console.log("Loading Julia physics module...");
        
        // Import Julia module (adjust path as needed)
        const JuliaModule = await import('./julia_sdl_wasm/julia_sdl.js');
        
        // Wait for Julia module to initialize
        juliaModule = await JuliaModule.default();
        
        console.log("✅ Julia physics module loaded!");
        console.log("Available Julia functions:", [
            '_get_new_x', '_get_new_y', '_get_new_vel_y', 
            '_check_on_ground', '_get_square_color', '_update_physics'
        ]);
        
    } catch (error) {
        console.error("❌ Failed to load Julia physics:", error);
        console.log("⚠️ Falling back to JavaScript physics simulation");
        juliaModule = null;
    }
}

// Enhanced main loop with Julia physics
function runMainLoop() {
    // Get input state from SDL (your existing code)
    let inputPtr = Module._get_input_state();
    
    // Read key states from WASM memory (your existing code)
    let key_A = Module.HEAPU8[inputPtr];      // Left
    let key_D = Module.HEAPU8[inputPtr + 1];  // Right  
    let key_Space = Module.HEAPU8[inputPtr + 2]; // Jump
    
    // Update input state
    gameState.input.A = !!key_A;
    gameState.input.D = !!key_D;
    gameState.input.Space = !!key_Space;
    
    // Update physics using Julia (if loaded) or fallback
    if (juliaModule) {
        updatePhysicsWithJulia();
    } else {
        updatePhysicsJavaScript();
    }
    
    // Render using SDL2 (your existing rendering code)
    renderWithSDL2();
    
    // Continue game loop
    requestAnimationFrame(runMainLoop);
}

// Update physics using Julia WebAssembly functions
function updatePhysicsWithJulia() {
    const { square, input } = gameState;
    
    // Call Julia functions for physics calculations
    const newX = juliaModule._get_new_x(
        square.x, 
        square.velX, 
        input.A ? 1 : 0,     // key_A (left)
        input.D ? 1 : 0      // key_D (right)
    );
    
    const newY = juliaModule._get_new_y(
        square.y,
        square.velY,
        square.onGround ? 1 : 0,  // on_ground
        input.Space ? 1 : 0       // key_space (jump)
    );
    
    const newVelY = juliaModule._get_new_vel_y(
        square.y,
        square.velY,
        square.onGround ? 1 : 0,  // on_ground
        input.Space ? 1 : 0       // key_space (jump)
    );
    
    const newOnGround = juliaModule._check_on_ground(
        newY,
        newVelY
    );
    
    const colorState = juliaModule._get_square_color(
        square.onGround ? 1 : 0,  // on_ground
        input.Space ? 1 : 0       // key_space
    );
    
    // Update game state with Julia results
    square.x = newX;
    square.y = newY;
    square.velY = newVelY;
    square.onGround = !!newOnGround;
    
    // Update velocity X based on input (Julia handles this internally)
    if (input.A) {
        square.velX = -5;
    } else if (input.D) {
        square.velX = 5;
    } else {
        square.velX = 0;
    }
    
    // Store color state for rendering
    square.colorState = colorState;
}

// Fallback JavaScript physics (if Julia module fails to load)
function updatePhysicsJavaScript() {
    const { square, input } = gameState;
    
    // Simple physics simulation
    square.velY += 1; // Gravity
    
    // Horizontal movement
    if (input.A) {
        square.velX = -5;
    } else if (input.D) {
        square.velX = 5;
    } else {
        square.velX = 0;
    }
    
    // Jumping
    if (input.Space && square.onGround) {
        square.velY = -12;
        square.onGround = false;
    }
    
    // Update position
    square.x += square.velX;
    square.y += square.velY;
    
    // Boundary checking
    if (square.x < 0) square.x = 0;
    if (square.x > 768) square.x = 768; // 800 - 32
    
    // Ground collision
    const groundY = 548; // 600 - 32 - 20
    if (square.y >= groundY) {
        square.y = groundY;
        square.velY = 0;
        square.onGround = true;
    }
    
    // Color state for rendering
    if (input.Space) {
        square.colorState = 2; // Yellow - jumping
    } else if (square.onGround) {
        square.colorState = 1; // Green - on ground
    } else {
        square.colorState = 0; // Red - in air
    }
}

// Render using SDL2 (integrate with your existing rendering)
function renderWithSDL2() {
    const { square } = gameState;
    
    // Clear screen (your existing SDL2 code)
    // Module._SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255); // Sky blue
    // Module._SDL_RenderClear(renderer);
    
    // Draw ground (your existing SDL2 code)
    // Module._SDL_SetRenderDrawColor(renderer, 139, 69, 19, 255); // Brown
    // Module._SDL_Rect(0, 580, 800, 20);
    // Module._SDL_RenderFillRect(renderer, groundRect);
    
    // Set square color based on Julia physics result
    let r, g, b;
    switch(square.colorState) {
        case 0: // Red - in air
            r = 255; g = 107; b = 107;
            break;
        case 1: // Green - on ground  
            r = 76; g = 175; b = 80;
            break;
        case 2: // Yellow - jumping
            r = 255; g = 215; b = 0;
            break;
        default:
            r = 255; g = 107; b = 107;
    }
    
    // Draw square with Julia-calculated position and color
    // Module._SDL_SetRenderDrawColor(renderer, r, g, b, 255);
    // const squareRect = { x: square.x, y: square.y, w: 32, h: 32 };
    // Module._SDL_RenderFillRect(renderer, squareRect);
    
    // Present (your existing SDL2 code)
    // Module._SDL_RenderPresent(renderer);
    
    // Alternative: Use your existing entity update system
    updateEntityDataForSDL();
}

// Update entity data for your existing SDL2 system
function updateEntityDataForSDL() {
    const { square } = gameState;
    
    // Create entity data in the format your SDL2 system expects
    const entityData = [{
        x: square.x / 32.0,  // Convert to your coordinate system
        y: square.y / 32.0,
        colorState: square.colorState
    }];
    
    // Use your existing entity update function
    if (typeof updateGameData === 'function') {
        updateGameData(JSON.stringify(entityData));
    }
    
    // Or trigger the custom event you're listening for
    const event = new CustomEvent('send-to-c', { 
        detail: JSON.stringify(entityData) 
    });
    document.dispatchEvent(event);
}

// Debug information
function logPhysicsDebug() {
    const { square, input } = gameState;
    console.log(`Physics Debug:
        Position: (${square.x}, ${square.y})
        Velocity: (${square.velX}, ${square.velY})
        On Ground: ${square.onGround}
        Input: A=${input.A}, D=${input.D}, Space=${input.Space}
        Color State: ${square.colorState}
        Physics Engine: ${juliaModule ? 'Julia WASM' : 'JavaScript Fallback'}
    `);
}

// Call debug info every 60 frames (1 second at 60fps)
let debugCounter = 0;
const originalRunMainLoop = runMainLoop;
runMainLoop = function() {
    originalRunMainLoop();
    
    debugCounter++;
    if (debugCounter % 60 === 0) {
        logPhysicsDebug();
    }
};

// Export functions for external use
window.gameState = gameState;
window.juliaModule = () => juliaModule;
window.logPhysicsDebug = logPhysicsDebug; 