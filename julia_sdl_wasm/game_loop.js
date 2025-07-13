// Game Loop Controller for SDL2 WebAssembly Game
// This file handles the main game loop and integration with the Julia game engine

class GameLoop {
    constructor() {
        this.isRunning = false;
        this.lastFrameTime = 0;
        this.frameCount = 0;
        this.fps = 60;
        this.frameInterval = 1000 / this.fps;
        this.gameLoopId = null;
        
        // Game state
        this.gameData = {};
        this.entities = [];
        
        // Initialize when Module is ready
        this.init();
    }
    
    init() {
        // Wait for Module to be ready
        if (typeof Module !== 'undefined' && Module.ready) {
            this.setupGameLoop();
        } else {
            // Wait for Module to be initialized
            const checkModule = () => {
                if (typeof Module !== 'undefined') {
                    if (Module.ready) {
                        this.setupGameLoop();
                    } else {
                        // Wait a bit more
                        setTimeout(checkModule, 100);
                    }
                } else {
                    setTimeout(checkModule, 100);
                }
            };
            checkModule();
        }
    }
    
    setupGameLoop() {
        console.log('Setting up game loop...');
        
        // Initialize SDL if needed
        if (typeof Module._main === 'function') {
            try {
                Module._main();
                console.log('SDL initialized successfully');
            } catch (e) {
                console.log('SDL already initialized or error:', e);
            }
        }
        
        // Check for Julia functions
        this.checkJuliaFunctions();
        
        // Start the game loop
        this.start();
    }
    
    checkJuliaFunctions() {
        const juliaFunctions = [
            '_update_physics',
            '_get_new_x',
            '_get_new_y', 
            '_get_new_vel_y',
            '_check_on_ground',
            '_get_square_color'
        ];
        
        const availableFunctions = juliaFunctions.filter(func => 
            typeof Module[func] === 'function'
        );
        
        console.log('Available Julia functions:', availableFunctions);
        
        if (availableFunctions.length > 0) {
            console.log('Julia integration detected');
        } else {
            console.log('No Julia functions found, running SDL only');
        }
    }
    
    start() {
        if (this.isRunning) return;
        
        console.log('Starting game loop...');
        this.isRunning = true;
        this.lastFrameTime = performance.now();
        this.gameLoop();
    }
    
    stop() {
        if (!this.isRunning) return;
        
        console.log('Stopping game loop...');
        this.isRunning = false;
        if (this.gameLoopId) {
            cancelAnimationFrame(this.gameLoopId);
            this.gameLoopId = null;
        }
    }
    
    gameLoop = (currentTime = performance.now()) => {
        if (!this.isRunning) return;
        
        // Calculate delta time
        const deltaTime = currentTime - this.lastFrameTime;
        
        // Only update if enough time has passed (for consistent FPS)
        if (deltaTime >= this.frameInterval) {
            this.lastFrameTime = currentTime - (deltaTime % this.frameInterval);
            this.frameCount++;
            
            // Call the Julia game loop function
            this.updateGame();
            
            // Update FPS display
            if (this.frameCount % 60 === 0) {
                const actualFps = Math.round(1000 / deltaTime);
                this.updateFPSDisplay(actualFps);
            }
        }
        
        // Schedule next frame
        this.gameLoopId = requestAnimationFrame(this.gameLoop);
    }
    
    updateGame() {
        try {
            // Call Julia physics functions if available
            if (typeof Module._update_physics === 'function') {
                Module._update_physics();
            }
            
            // Get game state from Julia functions
            this.updateGameState();
            
            // Handle any game data updates
            this.handleGameData();
            
        } catch (error) {
            console.error('Error in game loop:', error);
        }
    }
    
    updateGameState() {
        try {
            // Get current game state from Julia functions
            const gameState = {
                timestamp: Date.now(),
                physics: {}
            };
            
            // Get physics data if functions are available
            if (typeof Module._get_new_x === 'function') {
                gameState.physics.x = Module._get_new_x();
            }
            
            if (typeof Module._get_new_y === 'function') {
                gameState.physics.y = Module._get_new_y();
            }
            
            if (typeof Module._get_new_vel_y === 'function') {
                gameState.physics.velY = Module._get_new_vel_y();
            }
            
            if (typeof Module._check_on_ground === 'function') {
                gameState.physics.onGround = Module._check_on_ground();
            }
            
            if (typeof Module._get_square_color === 'function') {
                gameState.physics.color = Module._get_square_color();
            }
            
            // Update game data
            this.gameData = gameState;
            this.updateGameDisplay();
            
        } catch (error) {
            console.error('Error updating game state:', error);
        }
    }
    
    handleGameData() {
        // Listen for game data updates from Julia
        document.addEventListener('game-data-update', (event) => {
            this.gameData = event.detail;
            this.updateGameDisplay();
        });
        
        // Also listen for custom events that might be sent from Julia
        document.addEventListener('send-to-c', (event) => {
            if (event.detail) {
                this.gameData = event.detail;
                this.updateGameDisplay();
            }
        });
    }
    
    updateGameDisplay() {
        // Update any UI elements with game data
        const gameDataDisplay = document.getElementById('game-data-display');
        if (gameDataDisplay && this.gameData) {
            // Update game display with current data
            gameDataDisplay.textContent = JSON.stringify(this.gameData, null, 2);
        }
    }
    
    updateFPSDisplay(fps) {
        // Update FPS display if there's an element for it
        const fpsElement = document.getElementById('fps-display');
        if (fpsElement) {
            fpsElement.textContent = `FPS: ${fps}`;
        }
    }
    
    // Public methods for external control
    setFPS(fps) {
        this.fps = fps;
        this.frameInterval = 1000 / this.fps;
    }
    
    getGameData() {
        return this.gameData;
    }
    
    // Pause/resume functionality
    pause() {
        this.stop();
    }
    
    resume() {
        this.start();
    }
}

// Global game loop instance
let gameLoopInstance = null;

// Initialize game loop when page loads
document.addEventListener('DOMContentLoaded', () => {
    console.log('Initializing game loop...');
    gameLoopInstance = new GameLoop();
});

// Export for external use
window.GameLoop = GameLoop;
window.gameLoop = gameLoopInstance;

// Alternative initialization for when Module is loaded after DOM
if (typeof Module !== 'undefined') {
    Module.onRuntimeInitialized = () => {
        console.log('Module runtime initialized');
        if (!gameLoopInstance) {
            gameLoopInstance = new GameLoop();
        }
    };
}

// Listen for SDL ready event
document.addEventListener('sdl-ready', () => {
    console.log('SDL is ready, starting game loop...');
    if (gameLoopInstance) {
        gameLoopInstance.start();
    }
});

// Utility functions for external use
window.startGameLoop = () => {
    if (gameLoopInstance) {
        gameLoopInstance.start();
    }
};

window.stopGameLoop = () => {
    if (gameLoopInstance) {
        gameLoopInstance.stop();
    }
};

window.pauseGameLoop = () => {
    if (gameLoopInstance) {
        gameLoopInstance.pause();
    }
};

window.resumeGameLoop = () => {
    if (gameLoopInstance) {
        gameLoopInstance.resume();
    }
};

// Test Julia functions
window.testJuliaFunctions = () => {
    console.log('Testing Julia functions...');
    
    if (typeof Module._update_physics === 'function') {
        console.log('Calling _update_physics...');
        Module._update_physics();
    }
    
    if (typeof Module._get_new_x === 'function') {
        const x = Module._get_new_x();
        console.log('get_new_x result:', x);
    }
    
    if (typeof Module._get_new_y === 'function') {
        const y = Module._get_new_y();
        console.log('get_new_y result:', y);
    }
    
    if (typeof Module._check_on_ground === 'function') {
        const onGround = Module._check_on_ground();
        console.log('check_on_ground result:', onGround);
    }
    
    if (typeof Module._get_square_color === 'function') {
        const color = Module._get_square_color();
        console.log('get_square_color result:', color);
    }
};

// Add keyboard controls
document.addEventListener('keydown', (event) => {
    if (!gameLoopInstance || !gameLoopInstance.isRunning) return;
    
    switch(event.key) {
        case ' ':
            // Space bar to test Julia functions
            testJuliaFunctions();
            break;
        case 'p':
        case 'P':
            // P to pause/resume
            if (gameLoopInstance.isRunning) {
                gameLoopInstance.pause();
            } else {
                gameLoopInstance.resume();
            }
            break;
        case 's':
        case 'S':
            // S to stop
            gameLoopInstance.stop();
            break;
        case 'r':
        case 'R':
            // R to restart
            gameLoopInstance.start();
            break;
    }
});

console.log('Game loop script loaded'); 