# ============================================================================
# 3D RENDERER - Practical Implementation Example
# ============================================================================
# This file shows how to integrate the tutorial concepts into your game.
# Copy and adapt these functions into your 3dtest.jl file.
#
# This demonstrates:
# - Improved projection with proper clipping
# - Object transformations (rotation, scaling)
# - Depth-aware rendering
# ============================================================================

# Include your existing files
include("structs.jl")
include("game_structs.jl")
include("llvm_bindings.jl")
include("llvm_wrappers.jl")
include("wallocstring.jl")

# ============================================================================
# IMPROVED PROJECTION SYSTEM
# ============================================================================

# Project a single 3D point to screen coordinates
# Returns: (screen_x, screen_y, is_valid)
function project_3d_to_2d(p::Ptr{Point3D}, 
                           view_distance::Int32,
                           screen_center_x::Int32,
                           screen_center_y::Int32,
                           near_z::Int32,
                           far_z::Int32)::Tuple{Int32, Int32, Bool}
    # Check depth bounds
    if p.z <= Float32(near_z) || p.z >= Float32(far_z)
        return (Int32(0), Int32(0), false)
    end
    
    # Perspective projection
    x_per::Float32 = Float32(view_distance) * p.x / p.z
    y_per::Float32 = Float32(view_distance) * p.y / p.z
    
    # Convert to screen coordinates
    screen_x::Int32 = screen_center_x + unsafe_trunc(Int32, x_per)
    screen_y::Int32 = screen_center_y - unsafe_trunc(Int32, y_per)  # Flip Y
    
    # Check if on screen (you'd pass screen bounds as parameters in real code)
    valid::Bool = screen_x >= Int32(0) && screen_x < Int32(640) &&
                  screen_y >= Int32(0) && screen_y < Int32(480)
    
    return (screen_x, screen_y, valid)
end

# ============================================================================
# OBJECT TRANSFORMATION
# ============================================================================

# Transform a point by translation, rotation, and scale
# This is useful for animating objects or creating multiple instances
function transform_point(p::Ptr{Point3D},
                         tx::Float32, ty::Float32, tz::Float32,  # Translation
                         rx::Float32, ry::Float32, rz::Float32,  # Rotation (radians)
                         sx::Float32, sy::Float32, sz::Float32)::Point3D  # Scale
    # Start with original point
    x::Float32 = p.x
    y::Float32 = p.y
    z::Float32 = p.z
    
    # Apply scaling first
    x *= sx
    y *= sy
    z *= sz
    
    # Apply rotation around X axis (roll)
    if rx != Float32(0.0)
        cos_rx::Float32 = Float32(cos(rx))
        sin_rx::Float32 = Float32(sin(rx))
        y_new::Float32 = y * cos_rx - z * sin_rx
        z = y * sin_rx + z * cos_rx
        y = y_new
    end
    
    # Apply rotation around Y axis (pitch)
    if ry != Float32(0.0)
        cos_ry::Float32 = Float32(cos(ry))
        sin_ry::Float32 = Float32(sin(ry))
        x_new::Float32 = x * cos_ry + z * sin_ry
        z = -x * sin_ry + z * cos_ry
        x = x_new
    end
    
    # Apply rotation around Z axis (yaw)
    if rz != Float32(0.0)
        cos_rz::Float32 = Float32(cos(rz))
        sin_rz::Float32 = Float32(sin(rz))
        x_new::Float32 = x * cos_rz - y * sin_rz
        y = x * sin_rz + y * cos_rz
        x = x_new
    end
    
    # Apply translation last
    x += tx
    y += ty
    z += tz
    
    return Point3D(p.color, x, y, z)
end

# ============================================================================
# IMPROVED WIREFRAME RENDERING
# ============================================================================

# Draw a wireframe object with transformations
function draw_wireframe_with_transform(renderer::Ptr{SDL_Renderer},
                                       vertices::Ptr{Point3D}, num_vertices::Int32,
                                       edges::Ptr{Line3D}, num_edges::Int32,
                                       world_x::Float32, world_y::Float32, world_z::Float32,
                                       rot_x::Float32, rot_y::Float32, rot_z::Float32,
                                       scale_x::Float32, scale_y::Float32, scale_z::Float32,
                                       color::UInt32,
                                       view_distance::Int32,
                                       screen_center_x::Int32,
                                       screen_center_y::Int32,
                                       near_z::Int32, far_z::Int32)::Cvoid
    # Set render color
    r::UInt8 = UInt8((color >> 16) & UInt32(0xFF))
    g::UInt8 = UInt8((color >> 8) & UInt32(0xFF))
    b::UInt8 = UInt8(color & UInt32(0xFF))
    llvm_SDL_SetRenderDrawColor(renderer, r, g, b, UInt8(255))
    
    # Draw each edge
    edge_idx::Int32 = Int32(0)
    while edge_idx < num_edges
        edge::Ptr{Line3D} = edges + (edge_idx * sizeof(Line3D))
        
        # Get vertex indices
        v1_idx::Int32 = edge.v1
        v2_idx::Int32 = edge.v2
        
        # Get original vertices
        v1_orig::Ptr{Point3D} = vertices + (v1_idx * sizeof(Point3D))
        v2_orig::Ptr{Point3D} = vertices + (v2_idx * sizeof(Point3D))
        
        # Transform vertices
        v1_transformed::Point3D = transform_point(v1_orig, world_x, world_y, world_z,
                                                   rot_x, rot_y, rot_z,
                                                   scale_x, scale_y, scale_z)
        v2_transformed::Point3D = transform_point(v2_orig, world_x, world_y, world_z,
                                                   rot_x, rot_y, rot_z,
                                                   scale_x, scale_y, scale_z)
        
        # Project to screen
        v1_ptr::Ptr{Point3D} = wasm_malloc(UInt32(sizeof(Point3D)))
        v2_ptr::Ptr{Point3D} = wasm_malloc(UInt32(sizeof(Point3D)))
        unsafe_store!(v1_ptr, v1_transformed)
        unsafe_store!(v2_ptr, v2_transformed)
        
        x1::Int32 = Int32(0)
        y1::Int32 = Int32(0)
        valid1::Bool = false
        x2::Int32 = Int32(0)
        y2::Int32 = Int32(0)
        valid2::Bool = false
        
        (x1, y1, valid1) = project_3d_to_2d(v1_ptr, view_distance, 
                                             screen_center_x, screen_center_y,
                                             near_z, far_z)
        (x2, y2, valid2) = project_3d_to_2d(v2_ptr, view_distance,
                                            screen_center_x, screen_center_y,
                                            near_z, far_z)
        
        wasm_free(Ptr{Cvoid}(v1_ptr))
        wasm_free(Ptr{Cvoid}(v2_ptr))
        
        # Draw line if both points are valid
        if valid1 && valid2
            llvm_SDL_RenderDrawLine(renderer, x1, y1, x2, y2)
        end
        
        edge_idx += Int32(1)
    end
    
    return nothing
end

# ============================================================================
# DEPTH-BASED COLOR SHADING
# ============================================================================

# Calculate color intensity based on distance (for depth shading)
function calculate_depth_color(base_color::UInt32, z::Float32, 
                               near_z::Int32, far_z::Int32)::UInt32
    # Normalize z to 0.0 (near) to 1.0 (far)
    z_norm::Float32 = (z - Float32(near_z)) / Float32(far_z - near_z)
    if z_norm < Float32(0.0)
        z_norm = Float32(0.0)
    elseif z_norm > Float32(1.0)
        z_norm = Float32(1.0)
    end
    
    # Extract RGB components
    r_base::UInt8 = UInt8((base_color >> 16) & UInt32(0xFF))
    g_base::UInt8 = UInt8((base_color >> 8) & UInt32(0xFF))
    b_base::UInt8 = UInt8(base_color & UInt32(0xFF))
    
    # Darken based on distance (farther = darker)
    intensity::Float32 = Float32(1.0) - (z_norm * Float32(0.7))  # Keep at least 30% brightness
    
    r_new::UInt8 = UInt8(Float32(r_base) * intensity)
    g_new::UInt8 = UInt8(Float32(g_base) * intensity)
    b_new::UInt8 = UInt8(Float32(b_base) * intensity)
    
    return (UInt32(r_new) << 16) | (UInt32(g_new) << 8) | UInt32(b_new)
end

# ============================================================================
# EXAMPLE: Enhanced Tie Fighter Rendering
# ============================================================================

# This is how you'd replace your current draw_ties function with the improved version:
#
# function draw_ties_enhanced(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Cvoid
#     i::Int32 = Int32(0)
#     while i < NUM_TIES
#         tie_ptr::Ptr{Tie} = state.ties + (i * sizeof(Tie))
#         
#         if tie_ptr.state == Int32(0)
#             i += Int32(1)
#             continue
#         end
#         
#         # Calculate depth-based color
#         depth_color::UInt32 = calculate_depth_color(
#             state.rgb_green,
#             tie_ptr.z,
#             NEAR_Z, FAR_Z
#         )
#         
#         # Draw with optional rotation (for spinning tie fighters!)
#         draw_wireframe_with_transform(
#             renderer,
#             state.tie_vlist, NUM_TIE_VERTS,
#             state.tie_shape, NUM_TIE_EDGES,
#             tie_ptr.x, tie_ptr.y, tie_ptr.z,  # Position
#             Float32(0.0), Float32(0.0), Float32(0.0),  # Rotation (could animate this!)
#             Float32(1.0), Float32(1.0), Float32(1.0),  # Scale
#             depth_color,
#             VIEW_DISTANCE,
#             Int32(320), Int32(240),  # Screen center
#             NEAR_Z, FAR_Z
#         )
#         
#         i += Int32(1)
#     end
#     
#     return nothing
# end

# ============================================================================
# KEY CONCEPTS SUMMARY
# ============================================================================
#
# 1. PERSPECTIVE PROJECTION:
#    - Formula: screen_x = (VIEW_DISTANCE * x) / z
#    - Objects farther away appear smaller
#    - VIEW_DISTANCE controls field of view
#
# 2. TRANSFORMATIONS:
#    - Translation: Move object (add to x, y, z)
#    - Rotation: Rotate around axes (use sin/cos)
#    - Scaling: Make bigger/smaller (multiply x, y, z)
#    - Order matters! Usually: Scale → Rotate → Translate
#
# 3. CLIPPING:
#    - Check if z is between NEAR_Z and FAR_Z
#    - Check if screen coordinates are within bounds
#    - Clip lines that go off-screen
#
# 4. DEPTH:
#    - Use z-value to determine drawing order
#    - Use z-value for depth-based color shading
#    - Objects closer to camera should be drawn last (or use z-buffer)
#
# 5. COORDINATE SYSTEMS:
#    - World Space: Where objects live
#    - View Space: Relative to camera
#    - Screen Space: 2D pixel coordinates
#
# ============================================================================
# PRACTICE EXERCISES
# ============================================================================
#
# 1. Add rotation to tie fighters so they spin as they fly
# 2. Create a cube model and render it
# 3. Implement a simple camera that can move around
# 4. Add depth sorting so closer objects draw on top
# 5. Create a function to load 3D models from arrays
#
# Try implementing these to reinforce what you've learned!
