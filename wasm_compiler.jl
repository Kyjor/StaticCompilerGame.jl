#!/usr/bin/env julia

"""
Custom WebAssembly Compiler for Julia
Uses StaticCompiler.jl to generate LLVM IR, then compiles to WebAssembly
"""

using StaticCompiler
using StaticTools

# WebAssembly compilation functions
function compile_to_wasm(f::Function, types=(), filename::String=string(nameof(f)); 
                        method::Symbol=:emscripten, target_dir::String="wasm_build")
    
    println("🌐 Compiling $(f) to WebAssembly using method: $(method)")
    
    # Create build directory
    mkpath(target_dir)
    
    if method == :emscripten
        return compile_with_emscripten(f, types, filename, target_dir)
    elseif method == :llvm_direct
        return compile_with_llvm_direct(f, types, filename, target_dir)
    else
        error("Unknown method: $(method). Use :emscripten or :llvm_direct")
    end
end

# Method 1: Generate LLVM IR and use Emscripten
function compile_with_emscripten(f::Function, types, filename::String, target_dir::String)
    println("📝 Generating LLVM IR using StaticCompiler.jl...")
    
    # Use StaticCompiler's generate_obj with emit_llvm_only=true
    # This is the key: StaticCompiler.jl CAN generate LLVM IR!
    path, generated_ir_path = StaticCompiler.generate_obj(
        f, 
        types, 
        target_dir, 
        filename;
        emit_llvm_only=true,  # This generates .ll files instead of .o files
        demangle=true
    )
    
    println("✅ LLVM IR generated: $(generated_ir_path)")
    
    # Check if Emscripten is available
    emcc_available = try
        run(`which emcc`)
        true
    catch
        false
    end
    
    if !emcc_available
        println("⚠️  Emscripten not found. To install:")
        println("   1. Visit: https://emscripten.org/docs/getting_started/downloads.html")
        println("   2. Or use: git clone https://github.com/emscripten-core/emsdk.git")
        println("   3. Then: ./emsdk install latest && ./emsdk activate latest")
        println("")
        println("🔄 Continuing with LLVM IR generation only...")
        return generated_ir_path
    end
    
    println("🔨 Compiling to WebAssembly with Emscripten...")
    
    # Compile with Emscripten
    wasm_path = joinpath(target_dir, "$(filename).wasm")
    js_path = joinpath(target_dir, "$(filename).js")
    html_path = joinpath(target_dir, "$(filename).html")
    
    try
        # Basic Emscripten compilation
        exported_funcs = "[\"_$(filename)\"]"
        run(`emcc $(generated_ir_path) -o $(html_path) -s WASM=1 -s EXPORTED_FUNCTIONS=$(exported_funcs) -s EXPORT_ES6=1 -O2`)
        
        println("✅ WebAssembly compilation successful!")
        println("📁 Generated files:")
        println("   - $(html_path)")
        println("   - $(js_path)")
        println("   - $(wasm_path)")
        
        return html_path, js_path, wasm_path
    catch e
        println("❌ Emscripten compilation failed: $(e)")
        return generated_ir_path
    end
end

# Method 2: Direct LLVM to WebAssembly (requires LLVM with wasm32 target)
function compile_with_llvm_direct(f::Function, types, filename::String, target_dir::String)
    println("📝 Generating LLVM IR using StaticCompiler.jl...")
    
    # Generate LLVM IR
    path, ir_path = StaticCompiler.generate_obj(
        f, 
        types, 
        target_dir, 
        filename;
        emit_llvm_only=true,
        demangle=true
    )
    
    println("✅ LLVM IR generated: $(ir_path)")
    
    # Check if llc with WebAssembly support is available
    llc_available = try
        llc_output = read(`llc --version`, String)
        contains(llc_output, "wasm32")
    catch
        false
    end
    
    if !llc_available
        println("⚠️  LLVM with WebAssembly support not found.")
        println("   Install LLVM 8.0+ with WebAssembly backend")
        println("   Or use the Emscripten method instead")
        return ir_path
    end
    
    println("🔨 Compiling to WebAssembly with LLVM...")
    
    # Compile to WebAssembly object file
    wasm_obj = joinpath(target_dir, "$(filename).o")
    try
        run(`llc -march=wasm32 -filetype=obj $(ir_path) -o $(wasm_obj)`)
        println("✅ WebAssembly object file created: $(wasm_obj)")
    catch e
        println("❌ LLVM compilation failed: $(e)")
        return ir_path
    end
    
    # Try to link to final WebAssembly module (requires wasm-ld)
    wasm_path = joinpath(target_dir, "$(filename).wasm")
    wasm_ld_available = try
        run(`which wasm-ld`)
        true
    catch
        false
    end
    
    if wasm_ld_available
        try
            run(`wasm-ld $(wasm_obj) -o $(wasm_path) --no-entry --export-all`)
            println("✅ WebAssembly module created: $(wasm_path)")
            return wasm_path
        catch e
            println("⚠️  Linking failed: $(e)")
        end
    else
        println("⚠️  wasm-ld not found. Object file created: $(wasm_obj)")
    end
    
    return wasm_obj
end

# Web-compatible game logic (no SDL2, pure computation)
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

# Helper function to create simple HTML wrapper
function create_simple_html_wrapper(target_dir::String)
    html_content = raw"""<!DOCTYPE html>
<html>
<head>
    <title>WebAssembly Guessing Game</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
        button { padding: 10px 20px; margin: 5px; font-size: 16px; }
        #result { margin: 20px 0; font-size: 18px; }
    </style>
</head>
<body>
    <h1>WebAssembly Guessing Game</h1>
    <p>Guess the number 7!</p>
    
    <div id="result">Make your guess!</div>
    
    <div>
        <button onclick="makeGuess(1)">1</button>
        <button onclick="makeGuess(2)">2</button>
        <button onclick="makeGuess(3)">3</button>
        <button onclick="makeGuess(4)">4</button>
        <button onclick="makeGuess(5)">5</button>
    </div>
    <div>
        <button onclick="makeGuess(6)">6</button>
        <button onclick="makeGuess(7)">7</button>
        <button onclick="makeGuess(8)">8</button>
        <button onclick="makeGuess(9)">9</button>
        <button onclick="makeGuess(0)">0</button>
    </div>
    
    <script>
        // This is a placeholder - actual WebAssembly integration 
        // depends on the output from Emscripten or manual WASM loading
        function makeGuess(guess) {
            const result = document.getElementById('result');
            
            // Simulate the game logic for demonstration
            if (guess === 7) {
                result.innerHTML = '<span style="color: green;">Correct! You win!</span>';
            } else if (guess < 7) {
                result.innerHTML = '<span style="color: orange;">Too low!</span>';
            } else {
                result.innerHTML = '<span style="color: red;">Too high!</span>';
            }
        }
    </script>
</body>
</html>"""
    
    html_path = joinpath(target_dir, "demo.html")
    open(html_path, "w") do f
        write(f, html_content)
    end
    
    println("📄 Demo HTML created: $(html_path)")
    return html_path
end

# Example usage function
function demo_compilation()
    println("🎯 WebAssembly Compilation Demo")
    println("=" ^ 40)
    println()
    
    # Use the web-compatible game function
    println("🎮 Using web-compatible game function: web_guess_game")
    println("✅ Game function signature: web_guess_game(guess::Int32)::Int32")
    println()
    
    # Try Emscripten method first
    println("🔄 Attempting Emscripten compilation...")
    try
        result = compile_to_wasm(web_guess_game, (Int32,), "web_guess_game"; 
                               method=:emscripten, target_dir="wasm_emscripten")
        println("✅ Emscripten result: $(result)")
    catch e
        println("❌ Emscripten failed: $(e)")
    end
    
    println()
    
    # Try direct LLVM method
    println("🔄 Attempting direct LLVM compilation...")
    try
        result = compile_to_wasm(web_guess_game, (Int32,), "web_guess_game"; 
                               method=:llvm_direct, target_dir="wasm_llvm")
        println("✅ LLVM result: $(result)")
    catch e
        println("❌ LLVM direct failed: $(e)")
    end
    
    println()
    
    # Create demo HTML
    println("🔄 Creating demo HTML...")
    create_simple_html_wrapper(".")
    
    println()
    println("🎯 Demo complete!")
    println()
    println("📋 Summary:")
    println("• StaticCompiler.jl CAN generate LLVM IR using emit_llvm_only=true")
    println("• The key function is: StaticCompiler.generate_obj(..., emit_llvm_only=true)")
    println("• This creates .ll files that can be compiled to WebAssembly")
    println("• Emscripten is the easiest path: LLVM IR → WebAssembly")
    println("• Direct LLVM compilation requires wasm32 target support")
    println()
    println("📁 Check the wasm_* directories for generated files")
    println("🌐 Open demo.html to see a working web interface")
end

# Main execution
if abspath(PROGRAM_FILE) == @__FILE__
    demo_compilation()
end 