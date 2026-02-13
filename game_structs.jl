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
    left::Bool
    right::Bool
    up::Bool
    down::Bool
end

struct KeyState_up
    a::Bool
    d::Bool
    w::Bool
    s::Bool
    space::Bool
    left::Bool
    right::Bool
    up::Bool
    down::Bool
end

struct KeyState_pressed
    a::Bool
    d::Bool
    w::Bool
    s::Bool
    space::Bool
    left::Bool
    right::Bool
    up::Bool
    down::Bool
end

struct Sprite
    texture::Ptr{SDL_Texture}
    width::Int32
    height::Int32
    crop_x::Int32
    crop_y::Int32
    crop_w::Int32
    crop_h::Int32
    loaded::Bool
    is_flipped::Bool
end

# Animation frame info - defines a crop region in a sprite sheet
struct AnimationFrame
    crop_x::Int32      # X position in sprite sheet
    crop_y::Int32      # Y position in sprite sheet
    crop_w::Int32      # Width of this frame
    crop_h::Int32      # Height of this frame
end

# Animation sequence - a collection of frames that play in order
struct Animation
    frames::Ptr{AnimationFrame}  # Pointer to array of frames
    frame_count::Int32           # Number of frames in this animation
    fps::Float64                 # Frames per second (same for all frames)
    loop::Bool                   # Should the animation loop?
    current_frame::Int32         # Current frame index
    timer::Float64               # Time accumulated for current frame
    finished::Bool               # Has the animation completed? (for non-looping)
end

# Animation state enum
const ANIM_IDLE = Int32(0)
const ANIM_WALK = Int32(1)
const ANIM_RUN = Int32(2)
const ANIM_JUMP = Int32(3)

struct Player
    is_alive::Bool
    anim::Ptr{Animation}
    anim_state::Int32
    on_ground::Bool
end

function Base.getproperty(x::Ptr{KeyState_down}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:a))))
    f === :d && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:d))))
    f === :w && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:w))))
    f === :s && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:s))))
    f === :space && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:space))))
    f === :left && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:left))))
    f === :right && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:right))))
    f === :up && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:up))))
    f === :down && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_down, Val(:down))))
end

function Base.setproperty!(x::Ptr{KeyState_down}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:a))), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:d))), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:w))), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:s))), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:space))), v)
    f === :left && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:left))), v)
    f === :right && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:right))), v)
    f === :up && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:up))), v)
    f === :down && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_down, Val(:down))), v)
end

function Base.getproperty(x::Ptr{KeyState_up}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:a))))
    f === :d && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:d))))
    f === :w && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:w))))
    f === :s && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:s))))
    f === :space && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:space))))
    f === :left && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:left))))
    f === :right && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:right))))
    f === :up && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:up))))
    f === :down && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_up, Val(:down))))
end

function Base.setproperty!(x::Ptr{KeyState_up}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:a))), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:d))), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:w))), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:s))), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:space))), v)
    f === :left && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:left))), v)
    f === :right && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:right))), v)
    f === :up && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:up))), v)
    f === :down && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_up, Val(:down))), v)
end

function Base.getproperty(x::Ptr{KeyState_pressed}, f::Symbol)
    f === :a && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:a))))
    f === :d && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:d))))
    f === :w && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:w))))
    f === :s && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:s))))
    f === :space && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:space))))
    f === :left && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:left))))
    f === :right && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:right))))
    f === :up && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:up))))
    f === :down && return unsafe_load(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:down))))
end

function Base.setproperty!(x::Ptr{KeyState_pressed}, f::Symbol, v::Any)
    f === :a && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:a))), v)
    f === :d && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:d))), v)
    f === :w && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:w))), v)
    f === :s && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:s))), v)
    f === :space && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:space))), v)
    f === :left && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:left))), v)
    f === :right && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:right))), v)
    f === :up && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:up))), v)
    f === :down && return unsafe_store!(Ptr{Bool}(x + offsetof(KeyState_pressed, Val(:down))), v)
end

function Base.getproperty(x::Ptr{Sprite}, f::Symbol)
    f === :texture && return unsafe_load(Ptr{Ptr{SDL_Texture}}(x + 0))
    f === :width && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:width))))
    f === :height && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:height))))
    f === :crop_x && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_x))))
    f === :crop_y && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_y))))
    f === :crop_w && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_w))))
    f === :crop_h && return unsafe_load(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_h))))
    f === :loaded && return unsafe_load(Ptr{Bool}(x + offsetof(Sprite, Val(:loaded))))
    f === :is_flipped && return unsafe_load(Ptr{Bool}(x + offsetof(Sprite, Val(:is_flipped))))
end

function Base.setproperty!(x::Ptr{Sprite}, f::Symbol, v::Any)
    f === :texture && return unsafe_store!(Ptr{Ptr{SDL_Texture}}(x + 0), v)
    f === :width && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:width))), v)
    f === :height && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:height))), v)
    f === :crop_x && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_x))), v)
    f === :crop_y && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_y))), v)
    f === :crop_w && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_w))), v)
    f === :crop_h && return unsafe_store!(Ptr{Int32}(x + offsetof(Sprite, Val(:crop_h))), v)
    f === :loaded && return unsafe_store!(Ptr{Bool}(x + offsetof(Sprite, Val(:loaded))), v)
    f === :is_flipped && return unsafe_store!(Ptr{Bool}(x + offsetof(Sprite, Val(:is_flipped))), v)
end

function Base.getproperty(x::Ptr{AnimationFrame}, f::Symbol)
    f === :crop_x && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_x))))
    f === :crop_y && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_y))))
    f === :crop_w && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_w))))
    f === :crop_h && return unsafe_load(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_h))))
end

function Base.setproperty!(x::Ptr{AnimationFrame}, f::Symbol, v::Any)
    f === :crop_x && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_x))), v)
    f === :crop_y && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_y))), v)
    f === :crop_w && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_w))), v)
    f === :crop_h && return unsafe_store!(Ptr{Int32}(x + offsetof(AnimationFrame, Val(:crop_h))), v)
end

function Base.getproperty(x::Ptr{Animation}, f::Symbol)
    f === :frames && return unsafe_load(Ptr{Ptr{AnimationFrame}}(x + offsetof(Animation, Val(:frames))))
    f === :frame_count && return unsafe_load(Ptr{Int32}(x + offsetof(Animation, Val(:frame_count))))
    f === :fps && return unsafe_load(Ptr{Float64}(x + offsetof(Animation, Val(:fps))))
    f === :loop && return unsafe_load(Ptr{Bool}(x + offsetof(Animation, Val(:loop))))
    f === :current_frame && return unsafe_load(Ptr{Int32}(x + offsetof(Animation, Val(:current_frame))))
    f === :timer && return unsafe_load(Ptr{Float64}(x + offsetof(Animation, Val(:timer))))
    f === :finished && return unsafe_load(Ptr{Bool}(x + offsetof(Animation, Val(:finished))))
end

function Base.setproperty!(x::Ptr{Animation}, f::Symbol, v::Any)
    f === :frames && return unsafe_store!(Ptr{Ptr{AnimationFrame}}(x + offsetof(Animation, Val(:frames))), v)
    f === :frame_count && return unsafe_store!(Ptr{Int32}(x + offsetof(Animation, Val(:frame_count))), v)
    f === :fps && return unsafe_store!(Ptr{Float64}(x + offsetof(Animation, Val(:fps))), v)
    f === :loop && return unsafe_store!(Ptr{Bool}(x + offsetof(Animation, Val(:loop))), v)
    f === :current_frame && return unsafe_store!(Ptr{Int32}(x + offsetof(Animation, Val(:current_frame))), v)
    f === :timer && return unsafe_store!(Ptr{Float64}(x + offsetof(Animation, Val(:timer))), v)
    f === :finished && return unsafe_store!(Ptr{Bool}(x + offsetof(Animation, Val(:finished))), v)
end

function Base.getproperty(x::Ptr{Player}, f::Symbol)
    f === :is_alive && return unsafe_load(Ptr{Bool}(x + offsetof(Player, Val(:is_alive))))
    f === :anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(Player, Val(:anim))))
    f === :anim_state && return unsafe_load(Ptr{Int32}(x + offsetof(Player, Val(:anim_state))))
    f === :on_ground && return unsafe_load(Ptr{Bool}(x + offsetof(Player, Val(:on_ground))))
end

function Base.setproperty!(x::Ptr{Player}, f::Symbol, v::Any)
    f === :is_alive && return unsafe_store!(Ptr{Bool}(x + offsetof(Player, Val(:is_alive))), v)
    f === :anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(Player, Val(:anim))), v)
    f === :anim_state && return unsafe_store!(Ptr{Int32}(x + offsetof(Player, Val(:anim_state))), v)
    f === :on_ground && return unsafe_store!(Ptr{Bool}(x + offsetof(Player, Val(:on_ground))), v)
end