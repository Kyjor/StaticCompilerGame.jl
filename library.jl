using StaticTools

include("structs.jl")
include("llvm_wrappers.jl")
include("llvm_bindings.jl")
include("wallocstring.jl")
include("engine/helpers.jl")
include("engine/graphics.jl")
include("engine/c_hooks.jl")
include("engine/context.jl")
include("engine/frame.jl")
include("engine/input.jl")
include("engine/draw.jl")
include("engine/run.jl")

function j_sdl_init()::Int32
    if llvm_SDL_Init(UInt32(SDL_INIT_VIDEO)) != Int32(0)
        return Int32(-1)
    end
    # IMG_INIT_PNG = 2
    if llvm_IMG_Init(Int32(2)) == Int32(0)
        return Int32(-1)
    end
    return Int32(0)
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    flags::UInt32 = UInt32(SDL_RENDERER_ACCELERATED) | UInt32(SDL_RENDERER_PRESENTVSYNC)
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), flags)
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to create renderer\n")
    end
    return renderer
end
