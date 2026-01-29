# Platformer Game State
# Game-specific state for a 2D platformer

struct PlatformerState
    # === REQUIRED ENGINE FIELDS ===
    input::Ptr{InputState}
    last_frame_time::UInt64
    quit::Bool
    fullscreen::Bool
    
    # === PLAYER PHYSICS ===
    player_x::Float64
    player_y::Float64
    player_vel_x::Float64
    player_vel_y::Float64
    on_ground::Int32
    coyote_time::Float64
    jump_buffer::Float64
    is_jumping::Int32
    
    # === CAMERA ===
    camera_x::Float64
    camera_y::Float64
    
    # === SPRITES ===
    player_sprite::Ptr{Sprite}
    background_sprite::Ptr{Sprite}
    
    # === ANIMATIONS ===
    player_idle_anim::Ptr{Animation}
    player_run_anim::Ptr{Animation}
    player_jump_anim::Ptr{Animation}
    current_player_anim::Ptr{Animation}
    current_anim_state::Int32
    
    # === AUDIO ===
    jump_sound::Ptr{Mix_Chunk}
    
    # === MOBILE TOUCH UI STATE ===
    left_btn_pressed::Bool
    right_btn_pressed::Bool
    jump_btn_pressed::Bool
end

# ============================================================================
# POINTER ACCESSORS
# ============================================================================

function Base.getproperty(x::Ptr{PlatformerState}, f::Symbol)
    # Required engine fields
    f === :input && return unsafe_load(Ptr{Ptr{InputState}}(x + offsetof(PlatformerState, Val(:input))))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + offsetof(PlatformerState, Val(:last_frame_time))))
    f === :quit && return unsafe_load(Ptr{Bool}(x + offsetof(PlatformerState, Val(:quit))))
    f === :fullscreen && return unsafe_load(Ptr{Bool}(x + offsetof(PlatformerState, Val(:fullscreen))))
    
    # Player physics
    f === :player_x && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_x))))
    f === :player_y && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_y))))
    f === :player_vel_x && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_vel_x))))
    f === :player_vel_y && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_vel_y))))
    f === :on_ground && return unsafe_load(Ptr{Int32}(x + offsetof(PlatformerState, Val(:on_ground))))
    f === :coyote_time && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:coyote_time))))
    f === :jump_buffer && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:jump_buffer))))
    f === :is_jumping && return unsafe_load(Ptr{Int32}(x + offsetof(PlatformerState, Val(:is_jumping))))
    
    # Camera
    f === :camera_x && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:camera_x))))
    f === :camera_y && return unsafe_load(Ptr{Float64}(x + offsetof(PlatformerState, Val(:camera_y))))
    
    # Sprites
    f === :player_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(PlatformerState, Val(:player_sprite))))
    f === :background_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(PlatformerState, Val(:background_sprite))))
    
    # Animations
    f === :player_idle_anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_idle_anim))))
    f === :player_run_anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_run_anim))))
    f === :player_jump_anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_jump_anim))))
    f === :current_player_anim && return unsafe_load(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:current_player_anim))))
    f === :current_anim_state && return unsafe_load(Ptr{Int32}(x + offsetof(PlatformerState, Val(:current_anim_state))))
    
    # Audio
    f === :jump_sound && return unsafe_load(Ptr{Ptr{Mix_Chunk}}(x + offsetof(PlatformerState, Val(:jump_sound))))
    
    # Mobile UI
    f === :left_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(PlatformerState, Val(:left_btn_pressed))))
    f === :right_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(PlatformerState, Val(:right_btn_pressed))))
    f === :jump_btn_pressed && return unsafe_load(Ptr{Bool}(x + offsetof(PlatformerState, Val(:jump_btn_pressed))))
    
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{PlatformerState}, f::Symbol, v::Any)
    # Required engine fields
    f === :input && return unsafe_store!(Ptr{Ptr{InputState}}(x + offsetof(PlatformerState, Val(:input))), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + offsetof(PlatformerState, Val(:last_frame_time))), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + offsetof(PlatformerState, Val(:quit))), v)
    f === :fullscreen && return unsafe_store!(Ptr{Bool}(x + offsetof(PlatformerState, Val(:fullscreen))), v)
    
    # Player physics
    f === :player_x && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_x))), v)
    f === :player_y && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_y))), v)
    f === :player_vel_x && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_vel_x))), v)
    f === :player_vel_y && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:player_vel_y))), v)
    f === :on_ground && return unsafe_store!(Ptr{Int32}(x + offsetof(PlatformerState, Val(:on_ground))), v)
    f === :coyote_time && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:coyote_time))), v)
    f === :jump_buffer && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:jump_buffer))), v)
    f === :is_jumping && return unsafe_store!(Ptr{Int32}(x + offsetof(PlatformerState, Val(:is_jumping))), v)
    
    # Camera
    f === :camera_x && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:camera_x))), v)
    f === :camera_y && return unsafe_store!(Ptr{Float64}(x + offsetof(PlatformerState, Val(:camera_y))), v)
    
    # Sprites
    f === :player_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(PlatformerState, Val(:player_sprite))), v)
    f === :background_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(PlatformerState, Val(:background_sprite))), v)
    
    # Animations
    f === :player_idle_anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_idle_anim))), v)
    f === :player_run_anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_run_anim))), v)
    f === :player_jump_anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:player_jump_anim))), v)
    f === :current_player_anim && return unsafe_store!(Ptr{Ptr{Animation}}(x + offsetof(PlatformerState, Val(:current_player_anim))), v)
    f === :current_anim_state && return unsafe_store!(Ptr{Int32}(x + offsetof(PlatformerState, Val(:current_anim_state))), v)
    
    # Audio
    f === :jump_sound && return unsafe_store!(Ptr{Ptr{Mix_Chunk}}(x + offsetof(PlatformerState, Val(:jump_sound))), v)
    
    # Mobile UI
    f === :left_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(PlatformerState, Val(:left_btn_pressed))), v)
    f === :right_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(PlatformerState, Val(:right_btn_pressed))), v)
    f === :jump_btn_pressed && return unsafe_store!(Ptr{Bool}(x + offsetof(PlatformerState, Val(:jump_btn_pressed))), v)
    
    return nothing
end
