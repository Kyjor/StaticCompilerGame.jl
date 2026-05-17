function create_rect(x::Int32, y::Int32, w::Int32, h::Int32)::Ptr{SDL_Rect}
    rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    unsafe_store!(Ptr{Int32}(rect_ptr), x)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), y)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), w)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), h)
    return rect_ptr
end

function print_error_message()
    msg_ptr::Ptr{Cvoid} = wasm_malloc(UInt32(1024))
    error_msg::Ptr{Cvoid} = llvm_SDL_GetErrorMsg(msg_ptr, Int32(1024))
    printf(c"Error: %s\n", error_msg)
    wasm_free(Ptr{Cvoid}(msg_ptr))
end