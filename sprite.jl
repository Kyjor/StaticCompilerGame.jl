
# Sprite loading functions
function init_sprite_system()::Int32
    printf(c"Initializing sprite system\n")
    # Initialize SDL2_image with PNG support
    init_result::Int32 = llvm_IMG_Init(Int32(2))  # IMG_INIT_PNG = 2
    if init_result == 0
        printf(c"Failed to initialize SDL2_image\n")
        return Int32(-1)
    end
    printf(c"Sprite system initialized\n")
    return Int32(0)
end

function load_sprite(renderer::Ptr{SDL_Renderer}, file_path::Ptr{UInt8})::Ptr{Sprite}
    printf(c"Loading PNG sprite\n")
    # Load PNG surface
    surface::Ptr{SDL_Surface} = llvm_IMG_Load(file_path)
    printf(c"Surface: %p\n", surface)
    if surface == Ptr{SDL_Surface}(C_NULL)
        printf(c"Failed to load PNG surface\n")
        return Ptr{Sprite}(C_NULL)
    end
    # get sdl error
    msg_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(1024))
    error_msg::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(msg_ptr, Int32(1024))
    printf(c"Error: %s\n", error_msg)
    wasm_free(Ptr{Cvoid}(msg_ptr))
    
    # Convert surface to texture
    texture::Ptr{SDL_Texture} = llvm_SDL_CreateTextureFromSurface(renderer, surface)
    llvm_SDL_FreeSurface(surface)
    
    if texture == Ptr{SDL_Texture}(C_NULL)
        printf(c"Failed to create texture from surface\n")
        return Ptr{Sprite}(C_NULL)
    end
    
    # Get texture dimensions (using surface dimensions)
    surface_width::Int32 = surface.w
    surface_height::Int32 = surface.h
    
    printf(c"Surface width: %d, Surface height: %d\n", surface_width, surface_height)
    # Create sprite structure
    sprite_ptr::Ptr{Sprite} = Ptr{Sprite}(wasm_malloc(UInt32(sizeof(Sprite))))
    unsafe_store!(Ptr{Sprite}(sprite_ptr), Sprite(texture, surface_width, surface_height, true))
    
    printf(c"PNG sprite loaded successfully\n")
    return sprite_ptr
end

function render_sprite(renderer::Ptr{SDL_Renderer}, sprite::Ptr{Sprite}, x::Float32, y::Float32)::Int32
    if sprite == Ptr{Sprite}(C_NULL)
        return Int32(-1)
    end
    
    sprite_data::Sprite = unsafe_load(Ptr{Sprite}(sprite))
    if !sprite_data.loaded
        return Int32(-1)
    end
    
    # Create destination rectangle
    dst_rect::SDL_FRect = SDL_FRect(x, y, Float32(sprite_data.width), Float32(sprite_data.height))
    dst_rect_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(sizeof(SDL_FRect)))
    unsafe_store!(Ptr{SDL_FRect}(dst_rect_ptr), dst_rect)
    
    # Render the texture
    render_result::Int32 = llvm_SDL_RenderCopyF(renderer, sprite_data.texture, Ptr{SDL_FRect}(C_NULL), Ptr{SDL_FRect}(dst_rect_ptr))
    wasm_free(Ptr{Cvoid}(dst_rect_ptr))
    
    return render_result
end

function free_sprite(sprite::Ptr{Sprite})::Cvoid
    if sprite == Ptr{Sprite}(C_NULL)
        return
    end
    
    sprite_data::Sprite = unsafe_load(Ptr{Sprite}(sprite))
    if sprite_data.loaded && sprite_data.texture != Ptr{SDL_Texture}(C_NULL)
        llvm_SDL_DestroyTexture(sprite_data.texture)
    end
    
    wasm_free(Ptr{Cvoid}(sprite))
end