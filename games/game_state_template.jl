# ============================================================================
# GAME STATE TEMPLATE
# ============================================================================
# 
# HOW TO USE:
# 1. Copy this file to your game folder: games/mygame/mygame_state.jl
# 2. Rename "MyGameState" to your game name (e.g., "PlatformerState", "ShooterState")
# 3. Add/remove fields as needed for your game
# 4. Update the getproperty and setproperty! functions to match your fields
# 5. Include this file in your game.jl AFTER including engine/engine.jl
#
# REQUIRED FIELDS (DO NOT REMOVE):
# - input::Ptr{InputState}     - Engine input state pointer
# - last_frame_time::UInt64    - For delta time calculation
# - quit::Bool                 - Game exit flag
# - fullscreen::Bool           - Fullscreen toggle state
#
# COMMON OPTIONAL FIELDS:
# - player_x, player_y         - Player position
# - player_vel_x, player_vel_y - Player velocity
# - camera_x, camera_y         - Camera offset
# - sprites, animations        - Game assets
#
# REMEMBER:
# - All fields must have explicit types
# - Use Ptr{T} for any dynamically allocated data
# - Free all allocated memory in your cleanup function
# ============================================================================

# --- STEP 1: Define your game state struct ---
# Add/remove fields as needed. Keep the required fields listed above.

struct MyGameState
    # === REQUIRED ENGINE FIELDS (do not remove) ===
    input::Ptr{InputState}
    last_frame_time::UInt64
    quit::Bool
    fullscreen::Bool
    
    # === PLAYER FIELDS (customize as needed) ===
    player_x::Float64
    player_y::Float64
    player_vel_x::Float64
    player_vel_y::Float64
    
    # === CAMERA FIELDS (optional) ===
    camera_x::Float64
    camera_y::Float64
    
    # === SPRITE/ANIMATION FIELDS (customize as needed) ===
    player_sprite::Ptr{Sprite}
    background_sprite::Ptr{Sprite}
    
    # === ADD YOUR GAME-SPECIFIC FIELDS BELOW ===
    # Example: health::Int32
    # Example: score::Int32
    # Example: enemies::Ptr{EnemyList}
end

# --- STEP 2: Define getproperty for pointer access ---
# Add a line for EACH field in your struct above.
# Format: f === :field_name && return unsafe_load(Ptr{FieldType}(x + offsetof(MyGameState, Val(:field_name))))

function Base.getproperty(x::Ptr{MyGameState}, f::Symbol)
    # Required engine fields
    f === :input && return unsafe_load(Ptr{Ptr{InputState}}(x + offsetof(MyGameState, Val(:input))))
    f === :last_frame_time && return unsafe_load(Ptr{UInt64}(x + offsetof(MyGameState, Val(:last_frame_time))))
    f === :quit && return unsafe_load(Ptr{Bool}(x + offsetof(MyGameState, Val(:quit))))
    f === :fullscreen && return unsafe_load(Ptr{Bool}(x + offsetof(MyGameState, Val(:fullscreen))))
    
    # Player fields
    f === :player_x && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_x))))
    f === :player_y && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_y))))
    f === :player_vel_x && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_vel_x))))
    f === :player_vel_y && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_vel_y))))
    
    # Camera fields
    f === :camera_x && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:camera_x))))
    f === :camera_y && return unsafe_load(Ptr{Float64}(x + offsetof(MyGameState, Val(:camera_y))))
    
    # Sprite fields
    f === :player_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(MyGameState, Val(:player_sprite))))
    f === :background_sprite && return unsafe_load(Ptr{Ptr{Sprite}}(x + offsetof(MyGameState, Val(:background_sprite))))
    
    # ADD YOUR FIELDS HERE - copy the pattern above
    # f === :health && return unsafe_load(Ptr{Int32}(x + offsetof(MyGameState, Val(:health))))
    
    return getfield(x, f)
end

# --- STEP 3: Define setproperty! for pointer writes ---
# Add a line for EACH field in your struct above.
# Format: f === :field_name && return unsafe_store!(Ptr{FieldType}(x + offsetof(MyGameState, Val(:field_name))), v)

function Base.setproperty!(x::Ptr{MyGameState}, f::Symbol, v::Any)
    # Required engine fields
    f === :input && return unsafe_store!(Ptr{Ptr{InputState}}(x + offsetof(MyGameState, Val(:input))), v)
    f === :last_frame_time && return unsafe_store!(Ptr{UInt64}(x + offsetof(MyGameState, Val(:last_frame_time))), v)
    f === :quit && return unsafe_store!(Ptr{Bool}(x + offsetof(MyGameState, Val(:quit))), v)
    f === :fullscreen && return unsafe_store!(Ptr{Bool}(x + offsetof(MyGameState, Val(:fullscreen))), v)
    
    # Player fields
    f === :player_x && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_x))), v)
    f === :player_y && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_y))), v)
    f === :player_vel_x && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_vel_x))), v)
    f === :player_vel_y && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:player_vel_y))), v)
    
    # Camera fields
    f === :camera_x && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:camera_x))), v)
    f === :camera_y && return unsafe_store!(Ptr{Float64}(x + offsetof(MyGameState, Val(:camera_y))), v)
    
    # Sprite fields
    f === :player_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(MyGameState, Val(:player_sprite))), v)
    f === :background_sprite && return unsafe_store!(Ptr{Ptr{Sprite}}(x + offsetof(MyGameState, Val(:background_sprite))), v)
    
    # ADD YOUR FIELDS HERE - copy the pattern above
    # f === :health && return unsafe_store!(Ptr{Int32}(x + offsetof(MyGameState, Val(:health))), v)
    
    return nothing
end
