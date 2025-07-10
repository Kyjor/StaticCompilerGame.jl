using StaticTools
using StaticCompiler

# Include the platformer functions
include("simple_platformer_web.jl")

# Simple compilation test
println("🎮 Compiling Simple Platformer to WebAssembly")
println("=" ^ 50)

# Create output directory
wasm_dir = "platformer_simple_wasm"
if !isdir(wasm_dir)
    mkdir(wasm_dir)
end

# Compile the main function
try
    println("📝 Compiling web_platformer_update function...")
    
    # Generate LLVM IR for the main function
    StaticCompiler.generate_obj(
        web_platformer_update,
        (Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32),
        wasm_dir,
        "web_platformer_update",
        emit_llvm_only=true
    )
    
    println("✅ LLVM IR generated: $wasm_dir/web_platformer_update.ll")
    
    # Try to compile to WebAssembly with Emscripten
    println("🔨 Compiling to WebAssembly with Emscripten...")
    
    cmd = `emcc $wasm_dir/web_platformer_update.ll -O2 -s WASM=1 -s EXPORTED_FUNCTIONS="['_web_platformer_update']" -s EXPORTED_RUNTIME_METHODS="['cwrap']" -o $wasm_dir/platformer_game.js`
    
    run(cmd)
    
    println("✅ WebAssembly compilation successful!")
    println("📁 Generated files:")
    println("   - $wasm_dir/platformer_game.wasm")
    println("   - $wasm_dir/platformer_game.js")
    
catch e
    println("❌ Error: $e")
    println("⚠️  Check if the .ll file was generated correctly.")
end

# Also compile the position functions
for (func_name, func) in [
    ("web_platformer_get_x", web_platformer_get_x),
    ("web_platformer_get_y", web_platformer_get_y)
]
    try
        println("📝 Compiling $func_name...")
        
        StaticCompiler.generate_obj(
            func,
            (Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32),
            wasm_dir,
            func_name,
            emit_llvm_only=true
        )
        
        println("✅ Generated: $wasm_dir/$func_name.ll")
    catch e
        println("❌ Error compiling $func_name: $e")
    end
end

println("\n🎯 Compilation complete!")
println("📁 Check the $wasm_dir directory for generated files.") 