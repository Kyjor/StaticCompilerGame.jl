@inline function channel_byte(v::Int32)::UInt8
    return v < Int32(0) ? UInt8(255) : UInt8(v)
end

function j_fill_rect(
    x::Int32, y::Int32, w::Int32, h::Int32,
    r::Int32, g::Int32, b::Int32, a::Int32,
)::Int32
    renderer::Ptr{SDL_Renderer} = llvm_sc_get_renderer()
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to get renderer\n")
        return Int32(-1)
    end
    llvm_SDL_SetRenderDrawColor(
        renderer,
        channel_byte(r), channel_byte(g), channel_byte(b), channel_byte(a),
    )
    rect_ptr::Ptr{SDL_Rect} = Ptr{SDL_Rect}(wasm_malloc(UInt32(16)))
    rect_i32::Ptr{Int32} = Ptr{Int32}(rect_ptr)
    unsafe_store!(rect_i32, x)
    unsafe_store!(rect_i32 + 1, y)
    unsafe_store!(rect_i32 + 2, w)
    unsafe_store!(rect_i32 + 3, h)
    result::Int32 = llvm_SDL_RenderFillRect(renderer, rect_ptr)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    return result
end
