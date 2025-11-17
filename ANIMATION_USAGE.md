# Animation System Usage Guide

## Overview

The animation system allows you to create frame-based animations from sprite sheets. Each animation consists of:
- Multiple frames (crop regions in a sprite sheet)
- FPS (frames per second) - shared across all frames in the animation
- Loop flag - whether the animation repeats
- Automatic frame advancement based on delta time

## Core Structures

### AnimationFrame
Defines a single frame as a crop region:
```julia
struct AnimationFrame
    crop_x::Int32  # X position in sprite sheet
    crop_y::Int32  # Y position in sprite sheet  
    crop_w::Int32  # Width of frame
    crop_h::Int32  # Height of frame
end
```

### Animation
A sequence of frames that plays over time:
```julia
struct Animation
    frames::Ptr{AnimationFrame}  # Array of frames
    frame_count::Int32           # How many frames
    fps::Float64                 # Playback speed
    loop::Bool                   # Should it repeat?
    current_frame::Int32         # Current frame index
    timer::Float64               # Internal timer
    finished::Bool               # Has it completed? (non-looping only)
end
```

## Animation States (Constants)

```julia
const ANIM_IDLE = Int32(0)
const ANIM_WALK = Int32(1)
const ANIM_RUN = Int32(2)
const ANIM_JUMP = Int32(3)
```

## Creating Animations

### Step 1: Create Frames Array

```julia
# Allocate memory for frames
frames::Ptr{AnimationFrame} = create_frames_array(Int32(4))  # 4 frames

# Set each frame's crop region
set_frame(frames, Int32(0), Int32(0),  Int32(0), Int32(8), Int32(8))   # Frame 0: (0,0) 8x8
set_frame(frames, Int32(1), Int32(8),  Int32(0), Int32(8), Int32(8))   # Frame 1: (8,0) 8x8
set_frame(frames, Int32(2), Int32(16), Int32(0), Int32(8), Int32(8))   # Frame 2: (16,0) 8x8
set_frame(frames, Int32(3), Int32(24), Int32(0), Int32(8), Int32(8))   # Frame 3: (24,0) 8x8
```

### Step 2: Create Animation

```julia
# Create a walking animation at 10 FPS that loops
walk_anim::Ptr{Animation} = create_animation(
    frames,           # Pointer to frames array
    Int32(4),         # Number of frames
    Float64(10.0),    # FPS
    true              # Loop
)

# Create a jump animation (1 frame, doesn't loop)
jump_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
set_frame(jump_frames, Int32(0), Int32(32), Int32(0), Int32(8), Int32(8))
jump_anim::Ptr{Animation} = create_animation(jump_frames, Int32(1), Float64(1.0), false)
```

## Using Animations

### Update Animation (in game loop)

```julia
# Call this every frame with delta_time
update_animation(walk_anim, delta_time)
```

The animation will:
- Advance frames automatically based on FPS
- Loop back to start if `loop == true`
- Stop on last frame if `loop == false` and set `finished = true`

### Render with Animation

```julia
# Render sprite using current animation frame
render_sprite_animated(
    renderer,
    player_sprite,
    walk_anim,
    Float32(x_position),
    Float32(y_position)
)
```

### Reset Animation

```julia
# Reset to first frame (useful when switching animations)
reset_animation(walk_anim)
```

### Check if Animation Finished

```julia
if walk_anim.finished
    # Animation completed (for non-looping animations)
end
```

## Complete Example: Player with Multiple Animations

```julia
# ============================================================================
# PLAYER ANIMATION SETUP
# ============================================================================

# Create IDLE animation (2 frames, 2 FPS, loops)
idle_frames::Ptr{AnimationFrame} = create_frames_array(Int32(2))
set_frame(idle_frames, Int32(0), Int32(120), Int32(360), Int32(8), Int32(8))
set_frame(idle_frames, Int32(1), Int32(128), Int32(360), Int32(8), Int32(8))
player_idle::Ptr{Animation} = create_animation(idle_frames, Int32(2), Float64(2.0), true)

# Create WALK animation (4 frames, 8 FPS, loops)
walk_frames::Ptr{AnimationFrame} = create_frames_array(Int32(4))
set_frame(walk_frames, Int32(0), Int32(136), Int32(360), Int32(8), Int32(8))
set_frame(walk_frames, Int32(1), Int32(144), Int32(360), Int32(8), Int32(8))
set_frame(walk_frames, Int32(2), Int32(152), Int32(360), Int32(8), Int32(8))
set_frame(walk_frames, Int32(3), Int32(160), Int32(360), Int32(8), Int32(8))
player_walk::Ptr{Animation} = create_animation(walk_frames, Int32(4), Float64(8.0), true)

# Create RUN animation (4 frames, 12 FPS, loops)
run_frames::Ptr{AnimationFrame} = create_frames_array(Int32(4))
set_frame(run_frames, Int32(0), Int32(168), Int32(360), Int32(8), Int32(8))
set_frame(run_frames, Int32(1), Int32(176), Int32(360), Int32(8), Int32(8))
set_frame(run_frames, Int32(2), Int32(184), Int32(360), Int32(8), Int32(8))
set_frame(run_frames, Int32(3), Int32(192), Int32(360), Int32(8), Int32(8))
player_run::Ptr{Animation} = create_animation(run_frames, Int32(4), Float64(12.0), true)

# Create JUMP animation (1 frame, doesn't loop)
jump_frames::Ptr{AnimationFrame} = create_frames_array(Int32(1))
set_frame(jump_frames, Int32(0), Int32(200), Int32(360), Int32(8), Int32(8))
player_jump::Ptr{Animation} = create_animation(jump_frames, Int32(1), Float64(1.0), false)

# ============================================================================
# IN GAME LOOP
# ============================================================================

# Track current animation
current_anim::Ptr{Animation} = player_idle
current_anim_state::Int32 = ANIM_IDLE

# Determine which animation to play based on game state
new_anim_state::Int32 = ANIM_IDLE

if !on_ground
    new_anim_state = ANIM_JUMP
elseif abs(velocity_x) > Float64(250.0)
    new_anim_state = ANIM_RUN
elseif abs(velocity_x) > Float64(1.0)
    new_anim_state = ANIM_WALK
else
    new_anim_state = ANIM_IDLE
end

# Switch animation if state changed
if new_anim_state != current_anim_state
    current_anim_state = new_anim_state
    
    if new_anim_state == ANIM_IDLE
        current_anim = player_idle
    elseif new_anim_state == ANIM_WALK
        current_anim = player_walk
    elseif new_anim_state == ANIM_RUN
        current_anim = player_run
    elseif new_anim_state == ANIM_JUMP
        current_anim = player_jump
    end
    
    reset_animation(current_anim)
end

# Update current animation
update_animation(current_anim, delta_time)

# Render with current animation
render_sprite_animated(renderer, player_sprite, current_anim, Float32(player_x), Float32(player_y))

# ============================================================================
# CLEANUP
# ============================================================================

# Free all animations when done
free_animation(player_idle)
free_animation(player_walk)
free_animation(player_run)
free_animation(player_jump)
```

## API Reference

### Functions

#### `create_frames_array(count::Int32)::Ptr{AnimationFrame}`
Allocates memory for an array of frames.

#### `set_frame(frames, index, crop_x, crop_y, crop_w, crop_h)::Cvoid`
Sets the crop region for a specific frame in the array.

#### `create_animation(frames, frame_count, fps, loop)::Ptr{Animation}`
Creates a new animation from a frames array.

#### `update_animation(anim, delta_time)::Cvoid`
Updates animation timer and advances frames. Call every frame.

#### `reset_animation(anim)::Cvoid`
Resets animation to first frame and clears finished flag.

#### `get_current_frame(anim)::AnimationFrame`
Returns the current frame's crop data.

#### `render_sprite_animated(renderer, sprite, anim, x, y)::Int32`
Renders sprite using the animation's current frame.

#### `free_animation(anim)::Cvoid`
Frees animation and its frames array from memory.

## Important Notes

1. **Memory Management**: Always free animations when done with `free_animation()`
2. **Frame Data**: Frames are stored in the sprite sheet, not copied
3. **FPS is Per-Animation**: All frames in one animation use the same FPS
4. **Manual Frame Setting**: Use `set_frame()` to define custom crop regions for each frame
5. **No GC**: Everything follows the project's strict no-GC rules with manual memory management

## Tips

- Start animations at low FPS (2-4) for idle, higher (8-12) for action
- Use non-looping animations for one-shot events (attacks, jumps)
- Reset animations when switching to avoid "frame pop"
- Store animation pointers in your game state or entity structs
- Use the same sprite texture for all animations of one entity

