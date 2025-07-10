# WebAssembly Compilation Guide for Julia

## 📋 Overview

Yes, you **CAN** implement WebAssembly compilation yourself using StaticCompiler.jl! The key insight is that StaticCompiler.jl has a built-in `emit_llvm_only=true` parameter that generates LLVM IR instead of object files.

## 🔧 How It Works

```julia
# The magic function call:
StaticCompiler.generate_obj(
    (function_name, types), 
    target_directory, 
    filename;
    emit_llvm_only=true,  # This is the key!
    demangle=true
)
```

This generates `.ll` files (LLVM IR) that can be compiled to WebAssembly using standard LLVM tools.

## 🚀 Quick Start

### Step 1: Run the Demo

```bash
julia wasm_compiler.jl
```

This will:
- Create a web-compatible game function
- Generate LLVM IR using StaticCompiler.jl
- Attempt to compile to WebAssembly (if tools are available)
- Create a demo HTML page

### Step 2: Check the Output

After running, you'll see:
```
wasm_emscripten/          # Emscripten output (if available)
├── web_guess_game.ll     # LLVM IR (always generated)
├── web_guess_game.html   # HTML wrapper (if Emscripten works)
├── web_guess_game.js     # JavaScript glue (if Emscripten works)
└── web_guess_game.wasm   # WebAssembly module (if Emscripten works)

wasm_llvm/               # Direct LLVM output (if available)
├── web_guess_game.ll    # LLVM IR
├── web_guess_game.o     # WebAssembly object file
└── web_guess_game.wasm  # Final WebAssembly module

demo.html               # Working demo with JavaScript simulation
```

## 📚 Compilation Methods

### Method 1: Emscripten (Recommended)

**What it does**: Julia → LLVM IR → Emscripten → WebAssembly

**Advantages**:
- Mature toolchain
- Automatic HTML/JS generation
- Good browser compatibility
- Handles memory management

**Installation**:
```bash
# Option A: Using emsdk (recommended)
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh

# Option B: Package manager (Ubuntu/Debian)
sudo apt-get install emscripten
```

**Usage**:
```julia
using StaticCompiler, StaticTools

# Your function to compile
function my_function(x::Int32)::Int32
    return x * 2
end

# Generate LLVM IR
path, ir_file = StaticCompiler.generate_obj(
    (my_function, (Int32,)), 
    "output_dir", 
    "my_function";
    emit_llvm_only=true,
    demangle=true
)

# Compile with Emscripten
run(`emcc $(ir_file) -o my_function.html 
     -s WASM=1 
     -s EXPORTED_FUNCTIONS=["_my_function"] 
     -O2`)
```

### Method 2: Direct LLVM

**What it does**: Julia → LLVM IR → llc (wasm32) → WebAssembly

**Advantages**:
- No external dependencies beyond LLVM
- Smaller output files
- More control over compilation

**Requirements**:
- LLVM 8.0+ with WebAssembly backend
- wasm-ld linker (optional, for final linking)

**Installation**:
```bash
# Ubuntu/Debian
sudo apt-get install llvm lld

# Fedora/RHEL
sudo dnf install llvm lld

# Check WebAssembly support
llc --version | grep wasm32
```

**Usage**:
```julia
# Generate LLVM IR (same as above)
path, ir_file = StaticCompiler.generate_obj(...)

# Compile to WebAssembly object
run(`llc -march=wasm32 -filetype=obj $(ir_file) -o my_function.o`)

# Link to final WebAssembly module (optional)
run(`wasm-ld my_function.o -o my_function.wasm --no-entry --export-all`)
```

## 🎮 Example: Converting Your Game

Here's how to convert your SDL2 game to WebAssembly:

### Step 1: Create Web-Compatible Version

```julia
# Original game uses SDL2 - need to remove that for web
function web_guess_game(guess::Int32)::Int32
    target = Int32(7)
    
    if guess == target
        return Int32(1)  # Correct
    elseif guess < target
        return Int32(-1) # Too low
    else
        return Int32(2)  # Too high
    end
end
```

### Step 2: Compile to WebAssembly

```julia
include("wasm_compiler.jl")

# Create the game function
web_game = create_web_compatible_game()

# Compile using Emscripten
result = compile_to_wasm(web_game, (Int32,), "web_guess_game"; 
                        method=:emscripten, target_dir="web_game")
```

### Step 3: Create HTML Interface

```html
<!DOCTYPE html>
<html>
<head>
    <title>WebAssembly Guessing Game</title>
</head>
<body>
    <h1>Guess the Number!</h1>
    <div id="result">Make your guess!</div>
    
    <button onclick="makeGuess(1)">1</button>
    <button onclick="makeGuess(2)">2</button>
    <!-- ... more buttons ... -->
    <button onclick="makeGuess(9)">9</button>
    
    <script>
        // Load the WebAssembly module
        WebAssembly.instantiateStreaming(fetch('web_guess_game.wasm'))
            .then(result => {
                window.wasmModule = result.instance;
            });

        function makeGuess(guess) {
            if (!window.wasmModule) {
                document.getElementById('result').textContent = 'Loading...';
                return;
            }
            
            // Call the WebAssembly function
            const result = window.wasmModule.exports.web_guess_game(guess);
            
            if (result === 1) {
                document.getElementById('result').textContent = 'Correct! You win!';
            } else if (result === -1) {
                document.getElementById('result').textContent = 'Too low!';
            } else {
                document.getElementById('result').textContent = 'Too high!';
            }
        }
    </script>
</body>
</html>
```

## 🔍 Troubleshooting

### "LLVM IR generation failed"

**Problem**: StaticCompiler.jl compilation errors

**Solutions**:
1. Check function type annotations: `function f(x::Int32)::Int32`
2. Avoid unsupported operations (file I/O, complex allocations)
3. Use only primitive types (Int32, Float64, etc.)
4. Check StaticCompiler.jl compatibility

### "Emscripten not found"

**Problem**: `emcc` command not available

**Solutions**:
1. Install Emscripten using emsdk (see installation above)
2. Activate Emscripten environment: `source ./emsdk_env.sh`
3. Add to PATH: `export PATH=$PATH:/path/to/emsdk/upstream/emscripten`

### "WebAssembly not supported"

**Problem**: LLVM lacks WebAssembly backend

**Solutions**:
1. Install LLVM 8.0+: `sudo apt-get install llvm-8`
2. Use Emscripten method instead
3. Check support: `llc --version | grep wasm32`

### "Function not exported"

**Problem**: WebAssembly function not accessible from JavaScript

**Solutions**:
1. For Emscripten: Use `-s EXPORTED_FUNCTIONS=["_function_name"]`
2. For direct LLVM: Use `--export-all` or `--export=function_name`
3. Check function name mangling (`demangle=true`)

## 📊 Performance Comparison

| Method | Size | Compatibility | Setup Difficulty | Performance |
|--------|------|---------------|------------------|-------------|
| **Emscripten** | ~1-5MB | Excellent | Medium | Good |
| **Direct LLVM** | ~50-500KB | Good | Hard | Excellent |
| **JavaScript Port** | ~10KB | Perfect | Easy | Good |

## 🎯 Best Practices

### 1. Function Design
```julia
# ✅ Good: Simple, type-annotated
function compute(x::Int32, y::Int32)::Int32
    return x + y
end

# ❌ Bad: Complex, allocation-heavy
function bad_compute(data)
    result = Dict()
    for item in data
        result[item] = process(item)
    end
    return result
end
```

### 2. Memory Management
- Avoid dynamic allocations
- Use primitive types (Int32, Float64)
- Pre-allocate arrays if needed
- Consider stack-only data structures

### 3. Browser Integration
- Use `WebAssembly.instantiateStreaming()` for loading
- Handle loading states in JavaScript
- Provide fallbacks for unsupported browsers
- Use Web Workers for heavy computations

## 📖 Complete Example

Here's a complete working example:

### Julia Code (`math_functions.jl`)
```julia
using StaticCompiler, StaticTools

function fibonacci(n::Int32)::Int32
    if n <= 1
        return n
    end
    return fibonacci(n - 1) + fibonacci(n - 2)
end

function factorial(n::Int32)::Int32
    if n <= 1
        return Int32(1)
    end
    return n * factorial(n - 1)
end

# Compile to WebAssembly
include("wasm_compiler.jl")

# Compile both functions
compile_to_wasm(fibonacci, (Int32,), "fibonacci"; 
               method=:emscripten, target_dir="math_wasm")
compile_to_wasm(factorial, (Int32,), "factorial"; 
               method=:emscripten, target_dir="math_wasm")
```

### HTML Interface (`math_demo.html`)
```html
<!DOCTYPE html>
<html>
<head>
    <title>WebAssembly Math Functions</title>
</head>
<body>
    <h1>WebAssembly Math Demo</h1>
    
    <div>
        <input type="number" id="input" value="10" min="0" max="20">
        <button onclick="calculateFib()">Fibonacci</button>
        <button onclick="calculateFact()">Factorial</button>
    </div>
    
    <div id="result">Result will appear here</div>
    
    <script>
        Promise.all([
            WebAssembly.instantiateStreaming(fetch('fibonacci.wasm')),
            WebAssembly.instantiateStreaming(fetch('factorial.wasm'))
        ]).then(([fibResult, factResult]) => {
            window.fibModule = fibResult.instance;
            window.factModule = factResult.instance;
        });

        function calculateFib() {
            const n = parseInt(document.getElementById('input').value);
            const result = window.fibModule.exports.fibonacci(n);
            document.getElementById('result').textContent = 
                `Fibonacci(${n}) = ${result}`;
        }

        function calculateFact() {
            const n = parseInt(document.getElementById('input').value);
            const result = window.factModule.exports.factorial(n);
            document.getElementById('result').textContent = 
                `Factorial(${n}) = ${result}`;
        }
    </script>
</body>
</html>
```

## 🎉 Conclusion

**Yes, you can absolutely implement WebAssembly compilation yourself!** The key insight is that StaticCompiler.jl already has the capability to generate LLVM IR using the `emit_llvm_only=true` parameter. From there, it's just a matter of using standard LLVM/Emscripten tools to compile to WebAssembly.

The process is:
1. **Julia** → **LLVM IR** (using StaticCompiler.jl)
2. **LLVM IR** → **WebAssembly** (using Emscripten or LLVM)
3. **WebAssembly** → **Web App** (using JavaScript/HTML)

This gives you full control over the compilation process and opens up many possibilities for deploying Julia code to the web! 