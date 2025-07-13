using StaticTools
using StaticCompiler

# Include the SDL drawing Julia code
include("julia_sdl_drawing.jl")

# Compile SDL drawing functions to WebAssembly
function compile_sdl_drawing()
    println("🎮 Compiling SDL Drawing Functions to WebAssembly")
    println("=" ^ 50)
    
    # Create output directory
    wasm_dir = "sdl_drawing_wasm"
    if !isdir(wasm_dir)
        mkdir(wasm_dir)
    end
    
    # Functions to compile
    functions_to_compile = [
        (init_sdl_drawing, (), "init_sdl_drawing"),
        (clear_screen, (Int32,), "clear_screen"),
        (draw_rect, (Int32, Int32, Int32, Int32, Int32), "draw_rect"),
        (present_frame, (), "present_frame"),
        (handle_events, (), "handle_events"),
        (get_time, (), "get_time"),
        (init_game, (), "init_game"),
        (update_physics, (), "update_physics"),
        (draw_frame, (), "draw_frame"),
        (run_game_frame, (), "run_game_frame"),
        (get_square_x, (), "get_square_x"),
        (get_square_y, (), "get_square_y"),
        (get_square_state, (), "get_square_state"),
        (test_sdl_drawing, (), "test_sdl_drawing")
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
    
    # Try to compile the main game frame function to WASM
    try
        # Compile with SDL2 support
        cmd = `emcc $wasm_dir/run_game_frame.ll sdl_drawing.c -s USE_SDL=2 -O2 -s WASM=1 -s EXPORTED_FUNCTIONS="['_run_game_frame','_init_game','_get_square_x','_get_square_y','_get_square_state','_test_sdl_drawing']" -o $wasm_dir/sdl_drawing_game.js`
        run(cmd)
        println("✅ WebAssembly module created: $wasm_dir/sdl_drawing_game.wasm")
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
compile_sdl_drawing() 