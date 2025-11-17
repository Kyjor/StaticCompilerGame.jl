# Player Animation Setup Example
# This shows how to create animations for the player sprite

# ============================================================================
# PLAYER ANIMATION INITIALIZATION
# Call this in j_init_game_state or create a separate init function
# ============================================================================

function create_player_animations()::NTuple{3, Ptr{Animation}}
    # IDLE Animation - 1 frame at (120, 360), looping at 2 FPS
    idle_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
    set_frame(idle_frames, Int32(0), Int32(120), Int32(360), Int32(8), Int32(8))
    idle_anim::Ptr{Animation} = create_animation(idle_frames, Int32(1), Float64(2.0), true)
    
    # RUN Animation - 4 frames at y=368, looping at 8 FPS
    run_frames::Ptr{AnimationFrame} = create_frames_array(Int32(4))
    set_frame(run_frames, Int32(0), Int32(16), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(1), Int32(24), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(2), Int32(32), Int32(368), Int32(8), Int32(8))
    set_frame(run_frames, Int32(3), Int32(40), Int32(368), Int32(8), Int32(8))
    run_anim::Ptr{Animation} = create_animation(run_frames, Int32(4), Float64(8.0), true)
    
    # JUMP Animation - 1 frame at (8, 368), non-looping
    jump_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
    set_frame(jump_frames, Int32(0), Int32(8), Int32(368), Int32(8), Int32(8))
    jump_anim::Ptr{Animation} = create_animation(jump_frames, Int32(1), Float64(1.0), false)
    
    return (idle_anim, run_anim, jump_anim)
end

# ============================================================================
# EXAMPLE: How to integrate into game_loop
# ============================================================================

# Add these to GameState (you'll need to update game_structs.jl):
# - player_idle_anim::Ptr{Animation}
# - player_run_anim::Ptr{Animation}  
# - player_jump_anim::Ptr{Animation}
# - current_player_anim::Ptr{Animation}
# - current_anim_state::Int32

# Then in game_loop, replace the commented animation section (lines 325-346) with:

# # --- Player Animation Selection ---
# new_anim_state::Int32 = ANIM_IDLE
# 
# if game_state.on_ground == Int32(0)
#     new_anim_state = ANIM_JUMP
# elseif abs(game_state.player_vel_x) > Float64(1.0)
#     new_anim_state = ANIM_RUN
# else
#     new_anim_state = ANIM_IDLE
# end
# 
# # Switch animation if state changed
# if new_anim_state != game_state.current_anim_state
#     game_state.current_anim_state = new_anim_state
#     
#     if new_anim_state == ANIM_IDLE
#         game_state.current_player_anim = game_state.player_idle_anim
#     elseif new_anim_state == ANIM_RUN
#         game_state.current_player_anim = game_state.player_run_anim
#     elseif new_anim_state == ANIM_JUMP
#         game_state.current_player_anim = game_state.player_jump_anim
#     end
#     
#     reset_animation(game_state.current_player_anim)
# end
# 
# # Update current animation
# update_animation(game_state.current_player_anim, delta_time)
# 
# # Render with animation (replace line 407)
# render_sprite_animated(renderer, game_state.player_sprite, game_state.current_player_anim, 
#                       Float32(game_state.player_x - game_state.camera_x), 
#                       Float32(game_state.player_y - game_state.camera_y))

# ============================================================================
# CLEANUP
# Don't forget to free animations in cleanup() function
# ============================================================================

# free_animation(game_state.player_idle_anim)
# free_animation(game_state.player_run_anim)
# free_animation(game_state.player_jump_anim)

