using StaticTools

include("structs.jl")
include("llvm_wrappers.jl")
include("llvm_bindings.jl")
include("wallocstring.jl")
include("engine/graphics.jl")

function j_sdl_init()::Int32
    return llvm_SDL_Init(UInt32(SDL_INIT_VIDEO))
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    flags::UInt32 = UInt32(SDL_RENDERER_ACCELERATED) | UInt32(SDL_RENDERER_PRESENTVSYNC)
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), flags)
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to create renderer\n")
    end
    return renderer
end
