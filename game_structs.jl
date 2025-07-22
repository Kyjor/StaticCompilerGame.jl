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