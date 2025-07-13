# compile_combined_fixed.jl
using StaticTools
using StaticCompiler

include("combined_game.jl")

println("🎮 Compiling Fixed Julia + SDL2 Game")
println("=" ^ 50)

# Create output directory
wasm_dir = "combined_game_wasm"
if !isdir(wasm_dir)
    mkdir(wasm_dir)
end

# Clean up old files
println("🧹 Cleaning up old files...")
for file in readdir(wasm_dir)
    if endswith(file, ".ll") || endswith(file, ".js") || endswith(file, ".wasm")
        rm(joinpath(wasm_dir, file))
        println("🗑️  Removed: $file")
    end
end

# Only compile functions that don't conflict with C functions
functions_to_compile = [
    (update_physics, (Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32), "update_physics"),
    (draw_game_frame, (Int32, Int32, Int32), "draw_game_frame"),
    (init_sdl, (), "init_sdl"),
    (create_entities, (), "create_entities"),
    #(handle_sdl_events_wrapper, (), "handle_sdl_events_wrapper")
]

for (func, types, name) in functions_to_compile
    try
        println(" Compiling $name...")
        StaticCompiler.generate_obj(func, types, wasm_dir, name, emit_llvm_only=true)
        println("✅ Generated: $wasm_dir/$name.ll")
    catch e
        println("❌ Error compiling $name: $e")
    end
end

println("\n🔨 Compiling to WebAssembly with SDL2...")

# Compile with SDL2 support
try
    # Get only the .ll files we want
    ll_files = []
    for file in readdir(wasm_dir)
        if endswith(file, ".ll")
            push!(ll_files, joinpath(wasm_dir, file))
        end
    end
    
    # Pass files as separate arguments
    ll_files_str = join(ll_files, " ")
    
    println(" Linking files: $ll_files_str")
    
    # Link Julia LLVM IR with SDL2 C code
    cmd = `emcc $ll_files SDLCalls/sdl_module.c -s USE_SDL=2 -O2 -s WASM=1 -s EXPORTED_FUNCTIONS="['_update_physics','_draw_game_frame','_init_sdl','_create_entities', '_draw_entities', '_init_sdl_drawing', '_main_loop', '_test_sdl_working', '_test_rendering', '_create_entities_if_needed', '_update_entities', '_print_entities', '_update_input', '_get_input_state', '_update_square_position', '_get_square_position', '_deinitialize_the_game']" -s EXPORTED_RUNTIME_METHODS="['cwrap']" -s MAIN_MODULE=1 -o $wasm_dir/combined_game.js -o sdl2.html`
    
    run(cmd)
    println("✅ Combined WebAssembly module created!")
    println("📁 Files:")
    println("   - $wasm_dir/combined_game.wasm")
    println("   - $wasm_dir/combined_game.js")
    
catch e
    println("❌ Compilation failed: $e")
end