struct SDL_FRect
    x::Cfloat
    y::Cfloat
    w::Cfloat
    h::Cfloat
end

struct SDL_Rect
    x::Cint
    y::Cint
    w::Cint
    h::Cint
end

mutable struct SDL_Window end
mutable struct SDL_Renderer end