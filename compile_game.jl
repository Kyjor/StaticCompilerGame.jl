# compile_combined_fixed.jl
using StaticTools
using StaticCompiler

include("sand.jl")

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
# This helps to expose the functions to the web assembly module
functions_to_compile = [
    #(call_update_input, (), "call_update_input"),
    (j_init_game_state, (Ptr{SDL_Renderer}, Ptr{SDL_Window}), "j_init_game_state"),
    (j_init_window, (), "j_init_window"),
    (j_init_renderer, (Ptr{SDL_Window},), "j_init_renderer"),
    (game_loop, (Ptr{SandSimState}, Ptr{SDL_Renderer}, Ptr{SDL_Window}), "game_loop"),
    (cleanup, (Ptr{SandSimState}, Ptr{SDL_Renderer}, Ptr{SDL_Window}), "cleanup"),
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
        # Note: Using Emscripten's built-in malloc instead of walloc.c for better large allocation support
        cmd = `emcc $ll_files SDLCalls/sdl_module.c -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s SDL2_IMAGE_FORMATS='["png"]' -s USE_SDL_TTF=2 -s USE_FREETYPE=1 -s USE_SDL_MIXER=2 -s USE_OGG=1 -O2 -s WASM=1 -s 
        EXPORTED_FUNCTIONS="[
        '_game_loop',
        '_j_init_game_state',
        '_j_init_window',
        '_j_init_renderer',
        '_pc_main',
        '_cleanup'
        ]" 
        -s EXPORTED_RUNTIME_METHODS="['cwrap']" 
        -s ALLOW_MEMORY_GROWTH=1
        -s INITIAL_MEMORY=33554432
        -s ALLOW_TABLE_GROWTH=1
        -s STACK_SIZE=1048576
        -o $output_dir/game.js
        --preload-file ./assets
        --use-preload-plugins
        --profiling
        `
        # -s ENVIRONMENT=web
        
        run(cmd)
        println("✅ Combined WebAssembly module created!")
        println("📁 Files:")
        println("   - $output_dir/game.wasm")
        println("   - $output_dir/game.js")
        # copy game_wasm/game.data to ./
        cp(joinpath(output_dir, "game.data"), "./game.data"; force=true)
        
        # Package web build files into zip
        println("\n📦 Packaging web build files...")
        zip_name = "sc-game-web.zip"
        if isfile(zip_name)
            rm(zip_name)
            println("🗑️  Removed existing $zip_name")
        end
        
        # Verify required files exist
        required_files = ["game.data", output_dir, "index.html", "index.js"]
        missing_files = String[]
        for file in required_files
            if !(isfile(file) || isdir(file))
                push!(missing_files, file)
            end
        end
        
        if !isempty(missing_files)
            println("⚠️  Warning: Missing required files for zip:")
            for file in missing_files
                println("   - $file")
            end
        else
            # Create zip with required files
            # Files should be at root of zip: game.data, game_wasm/, index.html, index.js
            try
                run(`zip -r $zip_name game.data $output_dir index.html index.js`)
                println("✅ Web build packaged: $zip_name")
                println("📦 Contents:")
                println("   - game.data")
                println("   - $output_dir/")
                println("   - index.html")
                println("   - index.js")
            catch zip_error
                println("⚠️  Warning: Failed to create zip file: $zip_error")
                println("💡 Make sure 'zip' command is available, or manually create:")
                println("   zip -r $zip_name game.data $output_dir index.html index.js")
            end
        end
        
    catch e
        println("❌ Compilation failed: $e")
    end


#     if Sys.iswindows()
#         # On Windows, call a batch file to handle emcc compilation
#         bat_file = "build_game.bat"
#         if isfile(bat_file)
#             println("⚡ Calling $bat_file to compile with emcc...")
#             run(`cmd /C $bat_file`)
#         else
#             println("❌ $bat_file not found! Please create it to handle the emcc compilation step on Windows.")
#         end
#     else
#         # Link Julia LLVM IR with SDL2 C code (non-Windows)
#         cmd = `emcc $ll_files SDLCalls/sdl_module.c walloc.c -s USE_SDL=2 -O2 -s WASM=1 -s \
#         EXPORTED_FUNCTIONS="[\n        '_game_loop',\n        '_j_init_game_state',\n        '_j_init_window',\n        '_j_init_renderer',\n        '_pc_main'\n        ]" \
#         -s EXPORTED_RUNTIME_METHODS="['cwrap']" \
#         -o $output_dir/game.js`
#         run(cmd)
#         println("✅ Combined WebAssembly module created!")
#         println("📁 Files:")
#         println("   - $output_dir/game.wasm")
#         println("   - $output_dir/game.js")
#     end
# catch e

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
            sdl_flags = `-lSDL2 -lSDL2main -lSDL2_image -lSDL2_mixer`
            output_name = "game"
            rpath_flag = `-Wl,-rpath,$(raw"$ORIGIN")`
        elseif Sys.iswindows()
            sdl_flags = `-lSDL2 -lSDL2main -lSDL2_image -lSDL2_mixer`
            output_name = "game.exe"
            rpath_flag = ``
        elseif Sys.isapple()
            sdl_flags = `-I/opt/homebrew/include/SDL2 -L/opt/homebrew/lib -lSDL2 -lSDL2main -lSDL2_image`
            output_name = "game"
            rpath_flag = `-Wl,-rpath,@loader_path`
        else
            sdl_flags = `-lSDL2 -lSDL2main -lSDL2_image -lSDL2_mixer`
            output_name = "game"
            rpath_flag = ``
        end
        
        # Link Julia object files with SDL2 C code
        cmd = `gcc $o_files SDLCalls/sdl_module.c pc_main.c $sdl_flags $rpath_flag -o $output_dir/$output_name -O2`
        
        run(cmd)
        println("✅ Desktop executable created!")
        println("📁 File: $output_dir/$output_name")
        println("🚀 To run: ./$output_dir/$output_name")
        # Copy SDL2.dll to output directory (Windows only)
        if Sys.iswindows()
            sdl_dll = joinpath(sdl_bin_path, "SDL2.dll")
            dest_dll = joinpath(output_dir, "SDL2.dll")
            cp(sdl_dll, dest_dll; force=true)
            println("🗂️  Copied SDL2.dll to $output_dir/")
        end
        
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