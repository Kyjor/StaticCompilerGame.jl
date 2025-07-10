using StaticTools
using StaticCompiler

# Include the platformer game logic
include("platformer_web.jl")

# Compile individual functions to LLVM IR for WebAssembly
function compile_platformer_functions()
    println("🎮 Compiling Platformer Functions to WebAssembly")
    println("=" ^ 50)
    
    # Create output directory
    wasm_dir = "platformer_wasm"
    if !isdir(wasm_dir)
        mkdir(wasm_dir)
    end
    
    # Compile each function individually
    functions_to_compile = [
        (init_platformer_game, (), "init_game"),
        (handle_key_input, (Int32, Int32), "handle_input"), 
        (update_platformer_physics, (), "update_physics"),
        (get_square_x, (), "get_x"),
        (get_square_y, (), "get_y"), 
        (get_square_state, (), "get_state"),
        (run_platformer_frame, (), "run_frame")
    ]
    
    for (func, types, name) in functions_to_compile
        try
            println("📝 Compiling $name...")
            
            # Generate LLVM IR
            StaticCompiler.generate_obj(func, types, wasm_dir, name, emit_llvm_only=true)
            
            println("✅ Generated: $wasm_dir/$name.ll")
        catch e
            println("❌ Error compiling $name: $e")
        end
    end
    
    println("\n🔨 Converting to WebAssembly with Emscripten...")
    
    # Try to compile the main frame function to WASM
    try
        run(`emcc $wasm_dir/run_frame.ll -O2 -s WASM=1 -s EXPORTED_FUNCTIONS="['_run_platformer_frame']" -o $wasm_dir/platformer_game.js`)
        println("✅ WebAssembly module created: $wasm_dir/platformer_game.wasm")
    catch e
        println("❌ Emscripten compilation failed: $e")
        println("⚠️  You can still use the .ll files with other WASM compilers")
    end
    
    println("\n📁 Generated files in $wasm_dir/:")
    try
        for file in readdir(wasm_dir)
            println("   - $file")
        end
    catch
        println("   (Directory listing failed)")
    end
end

# Run the compilation
compile_platformer_functions() 