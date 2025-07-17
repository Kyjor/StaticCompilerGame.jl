# compile_combined_fixed.jl
using StaticTools
using StaticCompiler

include("game.jl")

# Parse command line arguments
build_type = "web"  # default to web build
if length(ARGS) > 0
    build_type = lowercase(ARGS[1])
    if build_type != "web" && build_type != "desktop"
        println("❌ Error: Build type must be 'web' or 'desktop'")
        println("Usage: julia compile_game.jl [web|desktop]")
        exit(1)
    end
end

println("🎮 Compiling Julia + SDL2 Game for $build_type")
println("=" ^ 50)

# Create output directories
if build_type == "web"
    output_dir = "game_wasm"
    if !isdir(output_dir)
        mkdir(output_dir)
    end
else
    output_dir = "game_desktop"
    if !isdir(output_dir)
        mkdir(output_dir)
    end
end

# Clean up old files
println("🧹 Cleaning up old files...")
for file in readdir(output_dir)
    if endswith(file, ".ll") || endswith(file, ".js") || endswith(file, ".wasm") || endswith(file, ".o") || endswith(file, ".exe")
        rm(joinpath(output_dir, file))
        println("🗑️  Removed: $file")
    end
end

# Only compile functions that don't conflict with C functions
functions_to_compile = [
    (draw_game_frame, (Int32, Int32, Int32), "draw_game_frame"),
    #(call_update_input, (), "call_update_input"),
    (j_init_game_state, (), "j_init_game_state"),
    (pc_main, (), "pc_main"),
]

for (func, types, name) in functions_to_compile
    try
        println(" Compiling $name...")
        if build_type == "web"
            StaticCompiler.generate_obj(func, types, output_dir, name, emit_llvm_only=true)
            println("✅ Generated: $output_dir/$name.ll")
        else
            StaticCompiler.generate_obj(func, types, output_dir, name, emit_llvm_only=false)
            println("✅ Generated: $output_dir/$name.o")
        end
    catch e
        println("❌ Error compiling $name: $e")
    end
end

if build_type == "web"
    println("\n🔨 Compiling to WebAssembly with SDL2...")
    
    # Compile with SDL2 support for web
    try
        # Get only the .ll files we want
        ll_files = []
        for file in readdir(output_dir)
            if endswith(file, ".ll")
                push!(ll_files, joinpath(output_dir, file))
            end
        end
        
        # Pass files as separate arguments
        ll_files_str = join(ll_files, " ")
        
        println(" Linking files: $ll_files_str")
        
        # Link Julia LLVM IR with SDL2 C code
        cmd = `emcc $ll_files SDLCalls/sdl_module.c walloc.c -s USE_SDL=2 -O2 -s WASM=1 -s 
        EXPORTED_FUNCTIONS="[
        '_draw_game_frame',
        '_draw_entities', 
        '_main_loop', 
        '_test_sdl_working', 
        '_update_entities', 
        '_print_entities', 
        '_update_input', 
        '_get_input_state', 
        '_update_square_position', 
        '_get_square_position', 
        '_deinitialize_the_game', 
        '_j_init_game_state',
        '_pc_main',
        '_set_game_state_simple',
        '_get_game_state_simple',
        '_has_game_state_simple',
        '_remove_game_state_simple',
        '_print_game_state',
        '_get_game_state_count'
        ]" 
        -s EXPORTED_RUNTIME_METHODS="['cwrap']" 
        -o $output_dir/game.js
        `
        # -s ENVIRONMENT=web
        # -s ALLOW_MEMORY_GROWTH=1
        
        run(cmd)
        println("✅ Combined WebAssembly module created!")
        println("📁 Files:")
        println("   - $output_dir/game.wasm")
        println("   - $output_dir/game.js")
        
    catch e
        println("❌ Compilation failed: $e")
    end

else
    println("\n🔨 Compiling to Desktop Executable with SDL2...")
    
    # Compile with SDL2 support for desktop
    try
        # Get only the .o files we want
        o_files = []
        for file in readdir(output_dir)
            if endswith(file, ".o")
                push!(o_files, joinpath(output_dir, file))
            end
        end
        
        # Pass files as separate arguments
        o_files_str = join(o_files, " ")
        
        println(" Linking files: $o_files_str")
        
        # Determine platform-specific flags
        if Sys.islinux()
            sdl_flags = `-lSDL2 -lSDL2main`
            output_name = "game"
            rpath_flag = `-Wl,-rpath,$(raw"$ORIGIN")`
        elseif Sys.iswindows()
            sdl_flags = `-lSDL2 -lSDL2main`
            output_name = "game.exe"
            rpath_flag = ``
        elseif Sys.isapple()
            sdl_flags = `-framework SDL2`
            output_name = "game"
            rpath_flag = `-Wl,-rpath,@loader_path`
        else
            sdl_flags = `-lSDL2 -lSDL2main`
            output_name = "game"
            rpath_flag = ``
        end
        
        # Link Julia object files with SDL2 C code
        cmd = `gcc $o_files SDLCalls/sdl_module.c pc_main.c $sdl_flags $rpath_flag -o $output_dir/$output_name -O2`
        
        run(cmd)
        println("✅ Desktop executable created!")
        println("📁 File: $output_dir/$output_name")
        println("🚀 To run: ./$output_dir/$output_name")
        
    catch e
        println("❌ Compilation failed: $e")
        println("💡 Make sure you have SDL2 development libraries installed:")
        if Sys.islinux()
            println("   Ubuntu/Debian: sudo apt-get install libsdl2-dev")
            println("   Fedora: sudo dnf install SDL2-devel")
        elseif Sys.iswindows()
            println("   Install SDL2 development libraries for Windows")
        elseif Sys.isapple()
            println("   brew install sdl2")
        end
    end
end

println("\n✅ Build complete for $build_type target!")