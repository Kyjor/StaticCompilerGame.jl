// SDL Bridge for Julia WebAssembly
// This allows Julia code to call SDL functions through JavaScript

class SDLBridge {
    constructor() {
        this.initialized = false;
        this.canvas = null;
        this.ctx = null;
        this.window = null;
        this.renderer = null;
        this.screenWidth = 800;
        this.screenHeight = 600;
        
        // Initialize when Module is ready
        this.init();
    }
    
    init() {
        // Wait for Module to be ready
        if (typeof Module !== 'undefined' && Module.ready) {
            this.setupSDL();
        } else {
            // Wait for Module to be initialized
            const checkModule = () => {
                if (typeof Module !== 'undefined') {
                    if (Module.ready) {
                        this.setupSDL();
                    } else {
                        setTimeout(checkModule, 100);
                    }
                } else {
                    setTimeout(checkModule, 100);
                }
            };
            checkModule();
        }
    }
    
    setupSDL() {
        console.log('Setting up SDL bridge...');
        
        // Get the canvas from the existing SDL setup
        this.canvas = document.getElementById('canvas');
        if (!this.canvas) {
            console.error('Canvas not found');
            return;
        }
        
        this.ctx = this.canvas.getContext('2d');
        if (!this.ctx) {
            console.error('Could not get 2D context');
            return;
        }
        
        // Set canvas size
        this.canvas.width = this.screenWidth;
        this.canvas.height = this.screenHeight;
        
        this.initialized = true;
        console.log('SDL bridge initialized');
    }
    
    // SDL functions that Julia can call
    
    // Initialize SDL drawing
    init_sdl_drawing() {
        if (!this.initialized) {
            this.setupSDL();
        }
        console.log('SDL drawing initialized');
        return 0;
    }
    
    // Clear screen with color
    clear_screen(color) {
        if (!this.initialized) return;
        
        const colors = {
            0: '#000000', // Black
            1: '#FFFFFF', // White
            2: '#FF0000', // Red
            3: '#00FF00', // Green
            4: '#0000FF'  // Blue
        };
        
        const fillColor = colors[color] || '#000000';
        this.ctx.fillStyle = fillColor;
        this.ctx.fillRect(0, 0, this.screenWidth, this.screenHeight);
        
        console.log(`Clear screen: ${fillColor}`);
    }
    
    // Draw a rectangle
    draw_rect(x, y, w, h, color) {
        if (!this.initialized) return;
        
        const colors = {
            0: '#FFFF00', // Yellow
            1: '#FFFFFF', // White
            2: '#FF0000', // Red
            3: '#00FF00', // Green
            4: '#0000FF'  // Blue
        };
        
        const fillColor = colors[color] || '#FFFF00';
        this.ctx.fillStyle = fillColor;
        this.ctx.fillRect(x, y, w, h);
        
        console.log(`Draw rect: (${x}, ${y}, ${w}, ${h}) color: ${fillColor}`);
    }
    
    // Present the frame
    present_frame() {
        if (!this.initialized) return;
        
        // In HTML5 canvas, drawing is immediate
        // This function is mainly for compatibility
        console.log('Present frame');
    }
    
    // Handle SDL events
    handle_events() {
        if (!this.initialized) return 0;
        
        // Check for quit events
        // For now, just return continue
        return 0;
    }
    
    // Get current time in milliseconds
    get_time() {
        return Date.now();
    }
}

// Global SDL bridge instance
let sdlBridge = null;

// Initialize SDL bridge when page loads
document.addEventListener('DOMContentLoaded', () => {
    console.log('Initializing SDL bridge...');
    sdlBridge = new SDLBridge();
});

// Export SDL functions for Julia to call
window.init_sdl_drawing = () => {
    if (sdlBridge) {
        return sdlBridge.init_sdl_drawing();
    }
    return -1;
};

window.clear_screen = (color) => {
    if (sdlBridge) {
        sdlBridge.clear_screen(color);
    }
};

window.draw_rect = (x, y, w, h, color) => {
    if (sdlBridge) {
        sdlBridge.draw_rect(x, y, w, h, color);
    }
};

window.present_frame = () => {
    if (sdlBridge) {
        sdlBridge.present_frame();
    }
};

window.handle_events = () => {
    if (sdlBridge) {
        return sdlBridge.handle_events();
    }
    return 0;
};

window.get_time = () => {
    if (sdlBridge) {
        return sdlBridge.get_time();
    }
    return 0;
};

console.log('SDL bridge script loaded'); 