struct KeyState_down
    a::Bool
    d::Bool
    w::Bool
    s::Bool
    space::Bool
end

struct KeyState_up
    a::Bool
    d::Bool
    w::Bool
    s::Bool
    space::Bool
end

struct Sprite
    texture::Ptr{SDL_Texture}
    width::Int32
    height::Int32
    loaded::Bool
    is_flipped::Bool
end

# Animation frame info
struct AnimationFrame
    x::Int32
    y::Int32
    w::Int32
    h::Int32
    duration::Float64 # seconds
end

# Animation sequence
struct Animation
    frames::Ptr{AnimationFrame} # pointer to array of frames
    frame_count::Int32
    current_frame::Int32
    timer::Float64
end

# Animation state enum
const ANIM_IDLE = 0
const ANIM_RUN = 1
const ANIM_JUMP = 2

struct GameState
    player_x::Float64
    player_y::Float64
    player_vel_x::Float64
    player_vel_y::Float64
    on_ground::Int32
    coyote_time::Float64
    jump_buffer::Float64
    is_jumping::Int32
    keys_up::Ptr{KeyState_up}   
    keys_down::Ptr{KeyState_down}
    last_frame_time::UInt64
    quit::Bool
    player_sprite::Ptr{Sprite}
    player::Ptr{Player}
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    f === :player_x && return unsafe_load(Ptr{Float64}(x + 0))
    f === :player_y && return unsafe_load(Ptr{Float64}(x + 8))
    f === :player_vel_x && return unsafe_load(Ptr{Float64}(x + 16))
    f === :player_vel_y && return unsafe_load(Ptr{Float64}(x + 24))
    f === :on_ground && return unsafe_load(Ptr{Int32}(x + 32))
    f === :coyote_time && return unsafe_load(Ptr{Float64}(x + 36))
    f === :jump_buffer && return unsafe_load(Ptr{Float64}(x + 44))
    f === :is_jumping && return unsafe_load(Ptr{Int32}(x + 52))
    f === :keys_up && return unsafe_load(Ptr{Ptr{KeyState_up}}(x + 64))
    f === :keys_down && return unsafe_load(Ptr{Ptr{KeyState_down}}(x + 72))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + 80))
    f === :quit && return unsafe_load(Ptr{Bool}(x + 88))
    f === :player_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + 96))
    f === :player && return unsafe_load(Ptr{Ptr{Player}}(x + 104))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    f === :player_x && return unsafe_store!(Ptr{Float64}(x + 0), v)
    f === :player_y && return unsafe_store!(Ptr{Float64}(x + 8), v)
    f === :player_vel_x && return unsafe_store!(Ptr{Float64}(x + 16), v)
    f === :player_vel_y && return unsafe_store!(Ptr{Float64}(x + 24), v)
    f === :on_ground && return unsafe_store!(Ptr{Int32}(x + 32), v)
    f === :coyote_time && return unsafe_store!(Ptr{Float64}(x + 36), v)
    f === :jump_buffer && return unsafe_store!(Ptr{Float64}(x + 44), v)
    f === :is_jumping && return unsafe_store!(Ptr{Int32}(x + 52), v)
    f === :keys_up && return unsafe_store!(Ptr{Ptr{KeyState_up}}(x + 64), v)
    f === :keys_down && return unsafe_store!(Ptr{Ptr{KeyState_down}}(x + 72), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + 80), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + 88), v)
    f === :player_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + 96), v)
    f === :player && return unsafe_store!(Ptr{Ptr{Player}}(x + 104), v)
end

function Base.getproperty(x::Ptr{KeyState_down}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + 0))
    f === :d && return unsafe_load(Ptr{Bool}(x + 1))
    f === :w && return unsafe_load(Ptr{Bool}(x + 2))
    f === :s && return unsafe_load(Ptr{Bool}(x + 3))
    f === :space && return unsafe_load(Ptr{Bool}(x + 4))
end

function Base.setproperty!(x::Ptr{KeyState_down}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + 0), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + 1), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + 2), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + 3), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + 4), v)
end

function Base.getproperty(x::Ptr{KeyState_up}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + 0))
    f === :d && return unsafe_load(Ptr{Bool}(x + 1))
    f === :w && return unsafe_load(Ptr{Bool}(x + 2))
    f === :s && return unsafe_load(Ptr{Bool}(x + 3))
    f === :space && return unsafe_load(Ptr{Bool}(x + 4))
end

function Base.setproperty!(x::Ptr{KeyState_up}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + 0), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + 1), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + 2), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + 3), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + 4), v)
end

function Base.getproperty(x::Ptr{Sprite}, f::Symbol)
    f === :texture && return unsafe_load(Ptr{Ptr{SDL_Texture}}(x + 0))
    f === :width && return unsafe_load(Ptr{Int32}(x + 8))
    f === :height && return unsafe_load(Ptr{Int32}(x + 12))
    f === :loaded && return unsafe_load(Ptr{Bool}(x + 16))
    f === :is_flipped && return unsafe_load(Ptr{Bool}(x + 17))
end

function Base.setproperty!(x::Ptr{Sprite}, f::Symbol, v::Any)
    f === :texture && return unsafe_store!(Ptr{Ptr{SDL_Texture}}(x + 0), v)
    f === :width && return unsafe_store!(Ptr{Int32}(x + 8), v)
    f === :height && return unsafe_store!(Ptr{Int32}(x + 12), v)
        f === :loaded && return unsafe_store!(Ptr{Bool}(x + 16), v)
    f === :is_flipped && return unsafe_store!(Ptr{Bool}(x + 17), v)
end

function Base.getproperty(x::Ptr{AnimationFrame}, f::Symbol)
    f === :x && return unsafe_load(Ptr{Int32}(x + 0))
    f === :y && return unsafe_load(Ptr{Int32}(x + 4))
    f === :w && return unsafe_load(Ptr{Int32}(x + 8))
    f === :h && return unsafe_load(Ptr{Int32}(x + 12))
    f === :duration && return unsafe_load(Ptr{Float64}(x + 16))
end

function Base.setproperty!(x::Ptr{AnimationFrame}, f::Symbol, v::Any)
    f === :x && return unsafe_store!(Ptr{Int32}(x + 0), v)
    f === :y && return unsafe_store!(Ptr{Int32}(x + 4), v)
    f === :w && return unsafe_store!(Ptr{Int32}(x + 8), v)
    f === :h && return unsafe_store!(Ptr{Int32}(x + 12), v)
    f === :duration && return unsafe_store!(Ptr{Float64}(x + 16), v)
end

function Base.getproperty(x::Ptr{Animation}, f::Symbol)
    f === :frames && return unsafe_load(Ptr{Ptr{AnimationFrame}}(x + 0))
    f === :frame_count && return unsafe_load(Ptr{Int32}(x + 8))
    f === :current_frame && return unsafe_load(Ptr{Int32}(x + 12))
    f === :timer && return unsafe_load(Ptr{Float64}(x + 16))
end

function Base.setproperty!(x::Ptr{Animation}, f::Symbol, v::Any)
    f === :frames && return unsafe_store!(Ptr{Ptr{AnimationFrame}}(x + 0), v)
    f === :frame_count && return unsafe_store!(Ptr{Int32}(x + 8), v)
    f === :current_frame && return unsafe_store!(Ptr{Int32}(x + 12), v)
    f === :timer && return unsafe_store!(Ptr{Float64}(x + 16), v)
end

function Base.getproperty(x::Ptr{Player}, f::Symbol)
    f === :is_alive && return unsafe_load(Ptr{Bool}(x + 0))
end

function Base.setproperty!(x::Ptr{Player}, f::Symbol, v::Any)
    f === :is_alive && return unsafe_store!(Ptr{Bool}(x + 0), v)
end