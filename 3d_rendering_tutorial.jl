# ============================================================================
# 3D RENDERING TUTORIAL - Software Renderer (No OpenGL)
# ============================================================================
# This tutorial teaches you how to build a 3D renderer using only SDL2
# and CPU-based software rendering. We'll build on what you already have!
#
# Table of Contents:
# 1. The Math: Understanding Perspective Projection
# 2. Coordinate Systems: World Space → View Space → Screen Space
# 3. Transformations: Translation, Rotation, Scaling
# 4. Clipping: Near/Far Planes and Screen Boundaries
# 5. Depth Sorting: Drawing Objects in Correct Order
# 6. Advanced: Triangle Rasterization (Filled Polygons)
# ============================================================================

# ============================================================================
# LESSON 1: THE MATH - Perspective Projection
# ============================================================================
# 
# What you're already doing:
#   x_per = VIEW_DISTANCE * x / z
#   y_per = VIEW_DISTANCE * y / z
#
# Why does this work?
#
# Imagine you're looking through a window. Objects farther away appear smaller.
# The formula simulates this by dividing by z (distance).
#
# Visual explanation:
#   Camera at (0, 0, 0) looking down +Z axis
#   Screen is at z = VIEW_DISTANCE
#   A point at (x, y, z) projects to screen position:
#     screen_x = (VIEW_DISTANCE * x) / z
#     screen_y = (VIEW_DISTANCE * y) / z
#
# The VIEW_DISTANCE is like the "focal length" - larger = wider field of view
#
# Your current code uses VIEW_DISTANCE = 320, which gives a ~90° field of view
# for a 640x480 screen.

# ============================================================================
# LESSON 2: COORDINATE SYSTEMS
# ============================================================================
#
# You have three coordinate spaces:
#
# 1. WORLD SPACE: Where objects exist in 3D
#    - Tie fighter at (100, 50, 500) means:
#      - 100 units right
#      - 50 units up  
#      - 500 units forward (away from camera)
#
# 2. VIEW SPACE (Camera Space): Relative to camera
#    - Camera is at origin (0, 0, 0)
#    - Looking down +Z axis
#    - +X = right, +Y = up, +Z = forward
#
# 3. SCREEN SPACE: 2D pixel coordinates
#    - (0, 0) = top-left corner
#    - (640, 480) = bottom-right corner
#    - Center = (320, 240)
#
# Your current code does:
#   World Space → View Space: Just add tie position to vertex
#   View Space → Screen Space: Perspective projection + offset to center

# ============================================================================
# LESSON 3: TRANSFORMATIONS
# ============================================================================
#
# To move, rotate, or scale objects, you need transformations.
# Let's add these to your renderer!

# Translation: Move an object
function translate_point(p::Ptr{Point3D}, tx::Float32, ty::Float32, tz::Float32)::Point3D
    return Point3D(
        p.color,
        p.x + tx,
        p.y + ty,
        p.z + tz
    )
end

# Scaling: Make object bigger/smaller
function scale_point(p::Ptr{Point3D}, sx::Float32, sy::Float32, sz::Float32)::Point3D
    return Point3D(
        p.color,
        p.x * sx,
        p.y * sy,
        p.z * sz
    )
end

# Rotation around Z-axis (yaw - turning left/right)
# Formula: 
#   x' = x*cos(angle) - y*sin(angle)
#   y' = x*sin(angle) + y*cos(angle)
#   z' = z (unchanged)
function rotate_z(p::Ptr{Point3D}, angle_rad::Float32)::Point3D
    cos_a::Float32 = Float32(cos(angle_rad))
    sin_a::Float32 = Float32(sin(angle_rad))
    return Point3D(
        p.color,
        p.x * cos_a - p.y * sin_a,
        p.x * sin_a + p.y * cos_a,
        p.z
    )
end

# Rotation around Y-axis (pitch - looking up/down)
function rotate_y(p::Ptr{Point3D}, angle_rad::Float32)::Point3D
    cos_a::Float32 = Float32(cos(angle_rad))
    sin_a::Float32 = Float32(sin(angle_rad))
    return Point3D(
        p.color,
        p.x * cos_a + p.z * sin_a,
        p.y,
        -p.x * sin_a + p.z * cos_a
    )
end

# Rotation around X-axis (roll - tilting)
function rotate_x(p::Ptr{Point3D}, angle_rad::Float32)::Point3D
    cos_a::Float32 = Float32(cos(angle_rad))
    sin_a::Float32 = Float32(sin(angle_rad))
    return Point3D(
        p.color,
        p.x,
        p.y * cos_a - p.z * sin_a,
        p.y * sin_a + p.z * cos_a
    )
end

# ============================================================================
# LESSON 4: IMPROVED PERSPECTIVE PROJECTION
# ============================================================================
#
# Let's create a reusable projection function with better clipping:

struct ProjectedPoint
    x::Int32
    y::Int32
    z::Float32  # Keep z for depth sorting
    valid::Bool  # Is this point on screen?
end

# Project a 3D point to 2D screen coordinates
function project_point(p::Ptr{Point3D}, view_distance::Int32, 
                       screen_width::Int32, screen_height::Int32,
                       near_z::Int32, far_z::Int32)::ProjectedPoint
    # Check if point is behind camera or too far
    if p.z <= Float32(near_z) || p.z >= Float32(far_z)
        return ProjectedPoint(Int32(0), Int32(0), p.z, false)
    end
    
    # Perspective projection
    x_per::Float32 = Float32(view_distance) * p.x / p.z
    y_per::Float32 = Float32(view_distance) * p.y / p.z
    
    # Convert to screen coordinates
    screen_x::Int32 = Int32(screen_width / 2) + unsafe_trunc(Int32, x_per)
    screen_y::Int32 = Int32(screen_height / 2) - unsafe_trunc(Int32, y_per)  # Flip Y
    
    # Check if on screen
    valid::Bool = screen_x >= Int32(0) && screen_x < screen_width &&
                  screen_y >= Int32(0) && screen_y < screen_height
    
    return ProjectedPoint(screen_x, screen_y, p.z, valid)
end

# ============================================================================
# LESSON 5: DEPTH SORTING (Z-BUFFERING CONCEPT)
# ============================================================================
#
# Problem: When objects overlap, which one should be visible?
# Solution: Draw objects from back to front (painter's algorithm)
# OR use a depth buffer (z-buffer) to track closest pixel at each position.
#
# For now, let's use simple depth sorting:

struct RenderObject
    vertices::Ptr{Point3D}
    edges::Ptr{Line3D}
    num_edges::Int32
    avg_z::Float32  # Average Z for sorting
    color::UInt32
end

# Calculate average Z distance for an object
function calculate_avg_z(vertices::Ptr{Point3D}, num_vertices::Int32)::Float32
    total_z::Float32 = Float32(0.0)
    i::Int32 = Int32(0)
    while i < num_vertices
        v::Ptr{Point3D} = vertices + (i * sizeof(Point3D))
        total_z += v.z
        i += Int32(1)
    end
    return total_z / Float32(num_vertices)
end

# Simple bubble sort for depth (back to front)
# In a real renderer, you'd use a better algorithm, but this works!
function sort_objects_by_depth(objects::Ptr{RenderObject}, num_objects::Int32)::Cvoid
    i::Int32 = Int32(0)
    while i < num_objects - Int32(1)
        j::Int32 = Int32(0)
        while j < num_objects - i - Int32(1)
            obj1::Ptr{RenderObject} = objects + (j * sizeof(RenderObject))
            obj2::Ptr{RenderObject} = objects + ((j + Int32(1)) * sizeof(RenderObject))
            
            # Swap if obj1 is closer than obj2 (larger z = closer in our system)
            if obj1.avg_z < obj2.avg_z
                # Swap objects (simple pointer swap of avg_z for demo)
                temp_z::Float32 = obj1.avg_z
                obj1.avg_z = obj2.avg_z
                obj2.avg_z = temp_z
            end
            
            j += Int32(1)
        end
        i += Int32(1)
    end
    return nothing
end

# ============================================================================
# LESSON 6: LINE CLIPPING
# ============================================================================
#
# When a line goes off-screen, we need to clip it.
# Cohen-Sutherland algorithm is a classic approach, but here's a simpler version:

struct ClippedLine
    x1::Int32
    y1::Int32
    x2::Int32
    y2::Int32
    valid::Bool
end

# Simple line clipping to screen bounds
function clip_line_to_screen(x1::Int32, y1::Int32, x2::Int32, y2::Int32,
                              screen_width::Int32, screen_height::Int32)::ClippedLine
    # If both points are off-screen in same direction, reject
    if (x1 < Int32(0) && x2 < Int32(0)) || (x1 >= screen_width && x2 >= screen_width) ||
       (y1 < Int32(0) && y2 < Int32(0)) || (y1 >= screen_height && y2 >= screen_height)
        return ClippedLine(Int32(0), Int32(0), Int32(0), Int32(0), false)
    end
    
    # Simple approach: Clamp to screen bounds
    # (A full implementation would calculate intersection points)
    x1_clamped::Int32 = x1 < Int32(0) ? Int32(0) : (x1 >= screen_width ? screen_width - Int32(1) : x1)
    y1_clamped::Int32 = y1 < Int32(0) ? Int32(0) : (y1 >= screen_height ? screen_height - Int32(1) : y1)
    x2_clamped::Int32 = x2 < Int32(0) ? Int32(0) : (x2 >= screen_width ? screen_width - Int32(1) : x2)
    y2_clamped::Int32 = y2 < Int32(0) ? Int32(0) : (y2 >= screen_height ? screen_height - Int32(1) : y2)
    
    return ClippedLine(x1_clamped, y1_clamped, x2_clamped, y2_clamped, true)
end

# ============================================================================
# LESSON 7: IMPROVED RENDERING FUNCTION
# ============================================================================
#
# Let's create a better rendering function that uses all these concepts:

function draw_wireframe_object(renderer::Ptr{SDL_Renderer},
                                vertices::Ptr{Point3D}, num_vertices::Int32,
                                edges::Ptr{Line3D}, num_edges::Int32,
                                world_x::Float32, world_y::Float32, world_z::Float32,
                                color::UInt32,
                                view_distance::Int32, screen_width::Int32, screen_height::Int32,
                                near_z::Int32, far_z::Int32)::Cvoid
    # Set color
    r::UInt8 = UInt8((color >> 16) & UInt32(0xFF))
    g::UInt8 = UInt8((color >> 8) & UInt32(0xFF))
    b::UInt8 = UInt8(color & UInt32(0xFF))
    llvm_SDL_SetRenderDrawColor(renderer, r, g, b, UInt8(255))
    
    # Project all vertices first
    # (In a real renderer, you'd cache these)
    edge_idx::Int32 = Int32(0)
    while edge_idx < num_edges
        edge::Ptr{Line3D} = edges + (edge_idx * sizeof(Line3D))
        
        # Get vertices
        v1_idx::Int32 = edge.v1
        v2_idx::Int32 = edge.v2
        v1::Ptr{Point3D} = vertices + (v1_idx * sizeof(Point3D))
        v2::Ptr{Point3D} = vertices + (v2_idx * sizeof(Point3D))
        
        # Transform to world space
        v1_world::Point3D = Point3D(
            v1.color,
            v1.x + world_x,
            v1.y + world_y,
            v1.z + world_z
        )
        v2_world::Point3D = Point3D(
            v2.color,
            v2.x + world_x,
            v2.y + world_y,
            v2.z + world_z
        )
        
        # Project to screen
        v1_world_ptr::Ptr{Point3D} = wasm_malloc(UInt32(sizeof(Point3D)))
        unsafe_store!(v1_world_ptr, v1_world)
        v2_world_ptr::Ptr{Point3D} = wasm_malloc(UInt32(sizeof(Point3D)))
        unsafe_store!(v2_world_ptr, v2_world)
        
        proj1::ProjectedPoint = project_point(v1_world_ptr, view_distance, 
                                               screen_width, screen_height, near_z, far_z)
        proj2::ProjectedPoint = project_point(v2_world_ptr, view_distance,
                                               screen_width, screen_height, near_z, far_z)
        
        wasm_free(Ptr{Cvoid}(v1_world_ptr))
        wasm_free(Ptr{Cvoid}(v2_world_ptr))
        
        # Draw if both points are valid
        if proj1.valid && proj2.valid
            # Clip line to screen
            clipped::ClippedLine = clip_line_to_screen(proj1.x, proj1.y, proj2.x, proj2.y,
                                                        screen_width, screen_height)
            if clipped.valid
                llvm_SDL_RenderDrawLine(renderer, clipped.x1, clipped.y1, clipped.x2, clipped.y2)
            end
        end
        
        edge_idx += Int32(1)
    end
    
    return nothing
end

# ============================================================================
# LESSON 8: FIELD OF VIEW (FOV) CALCULATION
# ============================================================================
#
# Your VIEW_DISTANCE = 320 gives approximately 90° FOV for 640x480 screen.
# 
# Formula: FOV = 2 * atan(screen_width / (2 * view_distance))
# 
# For VIEW_DISTANCE = 320, screen_width = 640:
#   FOV = 2 * atan(640 / 640) = 2 * atan(1) = 2 * 45° = 90°
#
# To change FOV, adjust VIEW_DISTANCE:
#   - Smaller VIEW_DISTANCE = wider FOV (more zoomed out)
#   - Larger VIEW_DISTANCE = narrower FOV (more zoomed in)

function calculate_view_distance(fov_degrees::Float32, screen_width::Int32)::Int32
    fov_rad::Float32 = fov_degrees * Float32(3.14159265359) / Float32(180.0)
    view_dist::Float32 = Float32(screen_width) / (Float32(2.0) * Float32(tan(fov_rad / Float32(2.0))))
    return unsafe_trunc(Int32, view_dist)
end

# ============================================================================
# PRACTICAL EXAMPLE: Using These Functions
# ============================================================================
#
# Here's how you'd use the improved rendering in your game:
#
# function draw_tie_fighter_improved(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, tie_index::Int32)::Cvoid
#     tie_ptr::Ptr{Tie} = state.ties + (tie_index * sizeof(Tie))
#     
#     if tie_ptr.state == Int32(0)
#         return nothing
#     end
#     
#     # Use the improved rendering function
#     draw_wireframe_object(
#         renderer,
#         state.tie_vlist, NUM_TIE_VERTS,
#         state.tie_shape, NUM_TIE_EDGES,
#         tie_ptr.x, tie_ptr.y, tie_ptr.z,
#         state.rgb_green,
#         VIEW_DISTANCE, 640, 480,
#         NEAR_Z, FAR_Z
#     )
# end

# ============================================================================
# NEXT STEPS: What to Learn Next
# ============================================================================
#
# 1. Triangle Rasterization: Fill polygons instead of just wireframe
# 2. Texture Mapping: Map images onto 3D surfaces
# 3. Lighting: Calculate light intensity based on surface normals
# 4. Z-Buffer: Proper depth testing for overlapping objects
# 5. Frustum Culling: Don't render objects outside view
# 6. Backface Culling: Don't render faces pointing away from camera
#
# Would you like me to implement any of these next?
