# Converting SDL2 Guessing Game to WebAssembly

## 🌐 Overview

Your game is already compiled to LLVM IR through StaticCompiler.jl, which puts you in an excellent position for WebAssembly compilation. Here are the main approaches to get your game running in the browser:

## 🛠️ **Approach 1: StaticCompiler.jl + WebAssembly (Recommended)**

### What it involves:
- Use StaticCompiler.jl's `compile_wasm` function
- Replace SDL2 calls with web-compatible alternatives
- Use HTML5 Canvas for rendering

### Pros:
- ✅ Leverages existing Julia code
- ✅ Small output files (~50KB-200KB)
- ✅ Fast compilation
- ✅ Good performance

### Cons:
- ❌ Requires rewriting graphics code
- ❌ Limited Julia language features
- ❌ No direct SDL2 support

### Steps:
1. **Modify game logic** to remove SDL2 dependencies
2. **Create web-compatible functions** for input/output
3. **Compile to WebAssembly**:
   ```julia
   using StaticCompiler
   compile_wasm(handle_guess, Tuple{Int32}, 
                path="web_build", 
                filename="guessing_game")
   ```
4. **Create HTML/JavaScript interface**

## 🎯 **Approach 2: Emscripten + SDL2**

### What it involves:
- Use Emscripten to compile SDL2 to WebAssembly
- Keep existing SDL2 code mostly unchanged
- Emscripten provides SDL2 → HTML5 Canvas mapping

### Pros:
- ✅ Minimal code changes required
- ✅ SDL2 automatically maps to HTML5 Canvas
- ✅ Mature toolchain
- ✅ Full SDL2 feature support

### Cons:
- ❌ Larger output files (~1-5MB)
- ❌ More complex build process
- ❌ Need to compile C wrapper with Emscripten

### Steps:
1. **Install Emscripten**:
   ```bash
   git clone https://github.com/emscripten-core/emsdk.git
   cd emsdk
   ./emsdk install latest
   ./emsdk activate latest
   ```

2. **Compile C wrapper** with Emscripten:
   ```bash
   emcc sdl_wrapper.c -o sdl_wrapper.js \
        -s USE_SDL=2 \
        -s EXPORTED_FUNCTIONS='["_init_game_window","_poll_key_input","_set_background_color","_render_frame","_cleanup_game_window"]' \
        -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]'
   ```

3. **Generate LLVM IR** from Julia code:
   ```julia
   using StaticCompiler
   mod = static_llvm_module(guessing_game, (Int, Ptr{Ptr{UInt8}}))
   write(mod, "guessing_game.ll")
   ```

4. **Compile LLVM IR** with Emscripten:
   ```bash
   emcc guessing_game.ll sdl_wrapper.js -o game.html \
        -s USE_SDL=2 \
        -s ALLOW_MEMORY_GROWTH=1
   ```

## 🔬 **Approach 3: WebAssemblyCompiler.jl**

### What it involves:
- Use the newer WebAssemblyCompiler.jl package
- Compiles Julia IR directly to WebAssembly
- Uses WebAssembly's garbage collector

### Pros:
- ✅ More Julia language features supported
- ✅ Direct Julia → WebAssembly compilation
- ✅ Good JavaScript interop
- ✅ Automatic memory management

### Cons:
- ❌ Experimental/newer technology
- ❌ Requires bleeding-edge browser features
- ❌ Still no direct SDL2 support

### Steps:
1. **Install WebAssemblyCompiler.jl**:
   ```julia
   using Pkg
   Pkg.add("WebAssemblyCompiler")
   ```

2. **Adapt game code** for WebAssembly:
   ```julia
   using WebAssemblyCompiler
   
   function web_game_logic(guess::Int)
       # Game logic here
       return result
   end
   
   compile_wasm(web_game_logic, (Int,))
   ```

## 🎨 **Approach 4: Pure JavaScript Rewrite**

### What it involves:
- Port the game logic to JavaScript
- Use HTML5 Canvas for graphics
- Keep the same game mechanics

### Pros:
- ✅ Full browser compatibility
- ✅ Easy to debug and modify
- ✅ No compilation needed
- ✅ Smallest download size

### Cons:
- ❌ Requires rewriting from scratch
- ❌ Loses Julia performance benefits
- ❌ Need to maintain two codebases

## 📊 **Comparison Table**

| Approach | File Size | Performance | Complexity | Julia Features | Browser Support |
|----------|-----------|-------------|------------|---------------|-----------------|
| StaticCompiler.jl | ~50KB | High | Medium | Limited | Modern |
| Emscripten | ~1-5MB | High | High | N/A | All |
| WebAssemblyCompiler.jl | ~100KB | High | Medium | Good | Cutting-edge |
| JavaScript | ~10KB | Medium | Low | N/A | All |

## 🚀 **Recommended Implementation Path**

### **Phase 1: Quick Web Demo**
1. Start with the HTML/JavaScript version (see `index.html`)
2. This gives you immediate browser compatibility
3. Test the game mechanics and user interface

### **Phase 2: StaticCompiler.jl WebAssembly**
1. Implement the Julia → WebAssembly compilation
2. Focus on the game logic only
3. Use HTML5 Canvas for rendering

### **Phase 3: Full SDL2 + Emscripten (Optional)**
1. If you need more complex graphics
2. Compile the entire SDL2 stack
3. Get pixel-perfect native → web conversion

## 📋 **Step-by-Step Guide for StaticCompiler.jl Approach**

### 1. **Prepare Julia Code**
```julia
# Remove SDL2 dependencies
function web_handle_guess(guess::Int32)::Int32
    target::Int32 = 7
    
    if guess == target
        return Int32(1)  # Green - correct
    elseif guess >= 0 && guess <= 9
        return Int32(2)  # Red - wrong
    else
        return Int32(0)  # Blue - invalid
    end
end
```

### 2. **Compile to WebAssembly**
```julia
using StaticCompiler
compile_wasm(web_handle_guess, Tuple{Int32}, 
             path="web_build", 
             filename="guessing_game")
```

### 3. **Create HTML Interface**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Julia WebAssembly Game</title>
</head>
<body>
    <canvas id="gameCanvas" width="400" height="300"></canvas>
    <script type="module">
        import init, { web_handle_guess } from './guessing_game.js';
        
        async function run() {
            await init();
            
            // Game logic
            function makeGuess(guess) {
                const result = web_handle_guess(guess);
                updateCanvas(result);
            }
            
            // Input handling
            document.addEventListener('keydown', (e) => {
                if (e.key >= '0' && e.key <= '9') {
                    makeGuess(parseInt(e.key));
                }
            });
        }
        
        run();
    </script>
</body>
</html>
```

### 4. **Canvas Rendering**
```javascript
function updateCanvas(result) {
    const canvas = document.getElementById('gameCanvas');
    const ctx = canvas.getContext('2d');
    
    // Clear canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    // Set background color based on result
    if (result === 0) {
        ctx.fillStyle = '#4A90E2'; // Blue
    } else if (result === 1) {
        ctx.fillStyle = '#7ED321'; // Green
    } else if (result === 2) {
        ctx.fillStyle = '#D0021B'; // Red
    }
    
    // Fill background
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    // Add text
    ctx.fillStyle = 'white';
    ctx.font = '24px Arial';
    ctx.textAlign = 'center';
    ctx.fillText('Guess the number 7!', canvas.width/2, canvas.height/2);
}
```

## 🔧 **Technical Requirements**

### **For StaticCompiler.jl:**
- Julia 1.10+
- StaticCompiler.jl package
- Modern browser with WebAssembly support

### **For Emscripten:**
- Emscripten SDK
- SDL2 development libraries
- Node.js for build tools

### **For WebAssemblyCompiler.jl:**
- Julia 1.9+
- WebAssemblyCompiler.jl package
- Bleeding-edge browser (Chrome 119+, Firefox 120+)

## 🎯 **Expected Outcomes**

### **File Sizes:**
- **StaticCompiler.jl**: ~50KB WASM + ~20KB HTML/JS
- **Emscripten**: ~1-5MB (includes SDL2 runtime)
- **WebAssemblyCompiler.jl**: ~100KB WASM + ~30KB HTML/JS
- **Pure JavaScript**: ~10KB total

### **Performance:**
- **All approaches**: Near-native performance for game logic
- **Load times**: StaticCompiler.jl and JavaScript are fastest
- **Runtime**: All approaches should achieve 60 FPS easily

### **Compatibility:**
- **StaticCompiler.jl**: Modern browsers (95% coverage)
- **Emscripten**: All browsers (99% coverage)
- **WebAssemblyCompiler.jl**: Cutting-edge browsers (70% coverage)
- **JavaScript**: All browsers (100% coverage)

## 🏁 **Next Steps**

1. **Try the demo**: Open `index.html` in your browser
2. **Choose approach**: Based on your requirements
3. **Set up toolchain**: Install necessary tools
4. **Convert code**: Adapt your Julia code for the web
5. **Test and iterate**: Debug and optimize

Your SDL2 guessing game is perfectly suited for WebAssembly conversion - the simple graphics and straightforward logic make it an ideal candidate for any of these approaches! 