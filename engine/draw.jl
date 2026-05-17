function j_fill_rect(x::Int32, y::Int32, w::Int32, h::Int32,r::Int32, g::Int32, b::Int32, a::Int32,)::Int32
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()

    if renderer == Ptr{SDL_Renderer}(C_NULL)
        return -1
    end

    rect_ptr::Ptr{SDL_Rect} = create_rect(x, y, w, h)

    if llvm_SDL_SetRenderDrawColor(renderer, UInt8(r), UInt8(g), UInt8(b), UInt8(a)) != Int32(0)
        return Int32(-1)
    end

    return_code = llvm_SDL_RenderFillRect(renderer, rect_ptr) == Int32(0) ? Int32(0) : Int32(-1)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    return return_code
end

function j_load_image(file_path::Ptr{UInt8})::Ptr{SDL_Texture}
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to get renderer\n")
        return Ptr{SDL_Texture}(C_NULL)
    end
    printf(c"Loading PNG sprite\n")
    # Load PNG surface
    surface::Ptr{SDL_Surface} = llvm_IMG_Load(file_path)
    printf(c"Surface: %p\n", surface)
    if surface == Ptr{SDL_Surface}(C_NULL)
        printf(c"Failed to load PNG surface\n")
        print_error_message()
        return Ptr{SDL_Texture}(C_NULL)
    end
    
    # Convert surface to texture
    texture::Ptr{SDL_Texture} = llvm_SDL_CreateTextureFromSurface(renderer, surface)
    llvm_SDL_FreeSurface(surface)
    
    if texture == Ptr{SDL_Texture}(C_NULL)
        printf(c"Failed to create texture from surface\n")
        print_error_message()
    end

    return texture
end

function j_draw(texture::Ptr{SDL_Texture}, x::Int32, y::Int32, w::Int32, h::Int32)::Int32
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to get renderer\n")
        return Int32(-1)
    end
    rect_ptr::Ptr{SDL_Rect} = create_rect(x, y, w, h)
    return_code = llvm_SDL_RenderCopy(renderer, texture, Ptr{SDL_Rect}(C_NULL), rect_ptr) == Int32(0) ? Int32(0) : Int32(-1)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    if return_code != Int32(0)
        printf(c"Failed to draw texture\n")
        print_error_message()
    end
    return return_code
end