using StaticTools
using StaticCompiler

# Include the SDL2 Julia functions
include("sdl_platformer_simple.jl")

println("🎮 Compiling Julia Functions for SDL2 Integration")
println("=" ^ 55)

# Create output directory
wasm_dir = "julia_sdl_wasm"
if !isdir(wasm_dir)
    mkdir(wasm_dir)
end

# Functions to compile with their signatures
functions_to_compile = [
    (julia_get_new_x, (Int32, Int32, Int32, Int32), "julia_get_new_x"),
    (julia_get_new_y, (Int32, Int32, Int32, Int32), "julia_get_new_y"),
    (julia_get_new_vel_y, (Int32, Int32, Int32, Int32), "julia_get_new_vel_y"),
    (julia_check_on_ground, (Int32, Int32), "julia_check_on_ground"),
    (julia_get_square_color, (Int32, Int32), "julia_get_square_color"),
    (julia_update_physics, (Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32), "julia_update_physics")
]

# Compile each function individually
ll_files = []
for (func, types, name) in functions_to_compile
    try
        println("📝 Compiling $name...")
        
        # Generate LLVM IR
        StaticCompiler.generate_obj(func, types, wasm_dir, name, emit_llvm_only=true)
        
        ll_file = "$wasm_dir/$name.ll"
        push!(ll_files, ll_file)
        println("✅ Generated: $ll_file")
    catch e
        println("❌ Error compiling $name: $e")
    end
end

# Compile all functions together into one WebAssembly module
if !isempty(ll_files)
    try
        println("\n🔨 Compiling to WebAssembly with Emscripten...")
        
        # Join all LLVM IR files
        ll_files_str = join(ll_files, " ")
        
        # Export all Julia functions
        exported_functions = ["_julia_get_new_x", "_julia_get_new_y", "_julia_get_new_vel_y", 
                             "_julia_check_on_ground", "_julia_get_square_color", "_julia_update_physics"]
        exports_str = "[" * join(["'$f'" for f in exported_functions], ", ") * "]"
        
        cmd = `emcc $ll_files_str -O2 -s WASM=1 -s EXPORTED_FUNCTIONS=$exports_str -s EXPORTED_RUNTIME_METHODS="['cwrap']" -o $wasm_dir/julia_sdl.js`
        
        run(cmd)
        
        println("✅ WebAssembly compilation successful!")
        println("📁 Generated files:")
        println("   - $wasm_dir/julia_sdl.wasm")
        println("   - $wasm_dir/julia_sdl.js")
        
        # Create a simple test HTML file
        test_html = """
<!DOCTYPE html>
<html>
<head>
    <title>Julia + SDL2 WebAssembly Test</title>
</head>
<body>
    <h1>Julia + SDL2 Integration Test</h1>
    <div id="output"></div>
    
    <script src="julia_sdl.js"></script>
    <script>
        Module.onRuntimeInitialized = function() {
            console.log("Julia WASM module loaded!");
            
            // Test calling Julia functions
            const newX = Module._julia_get_new_x(100, 0, 1, 0); // Move left
            const newY = Module._julia_get_new_y(300, 0, 1, 1); // Jump
            const color = Module._julia_get_square_color(1, 0); // On ground
            
            document.getElementById('output').innerHTML = `
                <p>Julia physics test:</p>
                <p>New X position: \${newX}</p>
                <p>New Y position: \${newY}</p>
                <p>Square color state: \${color}</p>
                <p>✅ Julia functions working!</p>
            `;
        };
    </script>
</body>
</html>
        """
        
        open("$wasm_dir/test.html", "w") do f
            write(f, test_html)
        end
        
        println("📄 Test file created: $wasm_dir/test.html")
        
    catch e
        println("❌ Emscripten compilation failed: $e")
        println("⚠️  You can still use the .ll files with other WASM compilers")
    end
end

println("\n🎯 Compilation complete!")
println("📁 Check the $wasm_dir directory for generated files.")
println("🌐 Test the integration with: $wasm_dir/test.html") 