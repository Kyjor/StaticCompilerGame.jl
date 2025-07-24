@generated function offsetof(::Type{X}, ::Val{field}) where {X,field}
    idx = findfirst(f->f==field, fieldnames(X))
    return fieldoffset(X, idx)
end

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

struct Player
    is_alive::Bool
    anim::Ptr{Animation}
    anim_state::Int32
end

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
    fullscreen::Bool
    camera_x::Float64
    camera_y::Float64
    left_btn_pressed::Bool
    right_btn_pressed::Bool
    jump_btn_pressed::Bool
end

function Base.getproperty(x::Ptr{GameState}, f::Symbol)
    f === :player_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_x))))
    f === :player_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_y))))
    f === :player_vel_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_x))))
    f === :player_vel_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_y))))
    f === :on_ground && return unsafe_load(Ptr{Int32}(x + offsetof(GameState, Val(:on_ground))))
    f === :coyote_time && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:coyote_time))))
    f === :jump_buffer && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:jump_buffer))))
    f === :is_jumping && return unsafe_load(Ptr{Int32}(x + offsetof(GameState, Val(:is_jumping))))
    f === :keys_up && return unsafe_load(Ptr{Ptr{KeyState_up}}(x + offsetof(GameState, Val(:keys_up))))
    f === :keys_down && return unsafe_load(Ptr{Ptr{KeyState_down}}(x + offsetof(GameState, Val(:keys_down))))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))))
    f === :quit && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:quit))))
    f === :player_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:player_sprite))))
    f === :player && return unsafe_load(Ptr{Ptr{Player}}(x + offsetof(GameState, Val(:player))))
    f === :fullscreen && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:fullscreen))))
    f === :camera_x && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_x))))
    f === :camera_y && return unsafe_load(Ptr{Float64}(x + offsetof(GameState, Val(:camera_y))))
    f === :left_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:left_btn_pressed))))
    f === :right_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:right_btn_pressed))))
    f === :jump_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(GameState, Val(:jump_btn_pressed))))
end

function Base.setproperty!(x::Ptr{GameState}, f::Symbol, v::Any)
    f === :player_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_x))), v)
    f === :player_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_y))), v)
    f === :player_vel_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_x))), v)
    f === :player_vel_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:player_vel_y))), v)
    f === :on_ground && return unsafe_store!(Ptr{Int32}(x + offsetof(GameState, Val(:on_ground))), v)
    f === :coyote_time && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:coyote_time))), v)
    f === :jump_buffer && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:jump_buffer))), v)
    f === :is_jumping && return unsafe_store!(Ptr{Int32}(x + offsetof(GameState, Val(:is_jumping))), v)
    f === :keys_up && return unsafe_store!(Ptr{Ptr{KeyState_up}}(x + offsetof(GameState, Val(:keys_up))), v)
    f === :keys_down && return unsafe_store!(Ptr{Ptr{KeyState_down}}(x + offsetof(GameState, Val(:keys_down))), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + offsetof(GameState, Val(:last_frame_time))), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:quit))), v)
    f === :player_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(GameState, Val(:player_sprite))), v)
    f === :player && return unsafe_store!(Ptr{Ptr{Player}}(x + offsetof(GameState, Val(:player))), v)
    f === :fullscreen && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:fullscreen))), v)
    f === :camera_x && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_x))), v)
    f === :camera_y && return unsafe_store!(Ptr{Float64}(x + offsetof(GameState, Val(:camera_y))), v)
    f === :left_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:left_btn_pressed))), v)
    f === :right_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:right_btn_pressed))), v)
    f === :jump_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(GameState, Val(:jump_btn_pressed))), v)
end

function Base.getproperty(x::Ptr{KeyState_down}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:a))))
    f === :d && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:d))))
    f === :w && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:w))))
    f === :s && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:s))))
    f === :space && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:space))))
end

function Base.setproperty!(x::Ptr{KeyState_down}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:a))), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:d))), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:w))), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:s))), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:space))), v)
end

function Base.getproperty(x::Ptr{KeyState_up}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:a))))
    f === :d && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:d))))
    f === :w && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:w))))
    f === :s && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:s))))
    f === :space && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:space))))
end

function Base.setproperty!(x::Ptr{KeyState_up}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:a))), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:d))), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:w))), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:s))), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:space))), v)
end

function Base.getproperty(x::Ptr{Sprite}, f::Symbol)
    f === :texture && return unsafe_load(Ptr{Ptr{SDL_Texture}}(x + 0))
    f === :width && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:width))))
    f === :height && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:height))))
    f === :loaded && return unsafe_load(Ptr{Bool}(x + offsetof(Sprite, Val(:loaded))))
    f === :is_flipped && return unsafe_load(Ptr{Bool}(x + offsetof(Sprite, Val(:is_flipped))))
end

function Base.setproperty!(x::Ptr{Sprite}, f::Symbol, v::Any)
    f === :texture && return unsafe_store!(Ptr{Ptr{SDL_Texture}}(x + 0), v)
    f === :width && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:width))), v)
    f === :height && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:height))), v)
    f === :loaded && return unsafe_store!(Ptr{Bool}(x + offsetof(Sprite, Val(:loaded))), v)
    f === :is_flipped && return unsafe_store!(Ptr{Bool}(x + offsetof(Sprite, Val(:is_flipped))), v)
end

function Base.getproperty(x::Ptr{AnimationFrame}, f::Symbol)
    f === :x && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:x))))
    f === :y && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:y))))
    f === :w && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:w))))
    f === :h && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:h))))
    f === :duration && return unsafe_load(Ptr{Float64}(x + offsetof(AnimationFrame, Val(:duration))))
end

function Base.setproperty!(x::Ptr{AnimationFrame}, f::Symbol, v::Any)
    f === :x && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:x))), v)
    f === :y && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:y))), v)
    f === :w && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:w))), v)
    f === :h && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:h))), v)
    f === :duration && return unsafe_store!(Ptr{Float64}(x + offsetof(AnimationFrame, Val(:duration))), v)
end

function Base.getproperty(x::Ptr{Animation}, f::Symbol)
    f === :frames && return unsafe_load(Ptr{Ptr{AnimationFrame}}(x + offsetof(Animation, Val(:frames))))
    f === :frame_count && return unsafe_load(Ptr{Int32}(x + offsetof(Animation, Val(:frame_count))))
    f === :current_frame && return unsafe_load(Ptr{Int32}(x + offsetof(Animation, Val(:current_frame))))
    f === :timer && return unsafe_load(Ptr{Float64}(x + offsetof(Animation, Val(:timer))))
end

function Base.setproperty!(x::Ptr{Animation}, f::Symbol, v::Any)
    f === :frames && return unsafe_store!(Ptr{Ptr{AnimationFrame}}(x + offsetof(Animation, Val(:frames))), v)
    f === :frame_count && return unsafe_store!(Ptr{Int32}(x + offsetof(Animation, Val(:frame_count))), v)
    f === :current_frame && return unsafe_store!(Ptr{Int32}(x + offsetof(Animation, Val(:current_frame))), v)
    f === :timer && return unsafe_store!(Ptr{Float64}(x + offsetof(Animation, Val(:timer))), v)
end

function Base.getproperty(x::Ptr{Player}, f::Symbol)
    f === :is_alive && return unsafe_load(Ptr{Bool}(x + offsetof(Player, Val(:is_alive))))
    f === :anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(Player, Val(:anim))))
    f === :anim_state && return unsafe_load(Ptr{Int32}(x + offsetof(Player, Val(:anim_state))))
end

function Base.setproperty!(x::Ptr{Player}, f::Symbol, v::Any)
    f === :is_alive && return unsafe_store!(Ptr{Bool}(x + offsetof(Player, Val(:is_alive))), v)
    f === :anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(Player, Val(:anim))), v)
    f === :anim_state && return unsafe_store!(Ptr{Int32}(x + offsetof(Player, Val(:anim_state))), v)
end