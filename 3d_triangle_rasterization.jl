# ============================================================================
# TRIANGLE RASTERIZATION - Filling Polygons
# ============================================================================
# This teaches you how to fill triangles instead of just drawing wireframes.
# This is the foundation of filled 3D graphics!
# ============================================================================

include("structs.jl")
include("llvm_bindings.jl")
include("llvm_wrappers.jl")

# ============================================================================
# LESSON: What is Rasterization?
# ============================================================================
#
# Rasterization = Converting a shape (like a triangle) into pixels.
# 
# For a triangle, we need to:
# 1. Find all pixels inside the triangle
# 2. Determine the color for each pixel
# 3. Draw those pixels
#
# We'll use the "scanline" algorithm:
# - For each horizontal line (scanline) that intersects the triangle
# - Find the left and right edges
# - Fill pixels between those edges

# ============================================================================
# HELPER: Sort three points by Y coordinate
# ============================================================================

struct ScreenPoint
    x::Int32
    y::Int32
    z::Float32  # For depth
    color::UInt32
end

# Sort three points so p1.y <= p2.y <= p3.y
function sort_points_by_y(p1::ScreenPoint, p2::ScreenPoint, p3::ScreenPoint)::Tuple{ScreenPoint, ScreenPoint, ScreenPoint}
    # Simple bubble sort for 3 elements
    if p1.y > p2.y
        temp::ScreenPoint = p1
        p1 = p2
        p2 = temp
    end
    if p2.y > p3.y
        temp::ScreenPoint = p2
        p2 = p3
        p3 = temp
    end
    if p1.y > p2.y
        temp::ScreenPoint = p1
        p1 = p2
        p2 = temp
    end
    return (p1, p2, p3)
end

# ============================================================================
# HELPER: Linear Interpolation
# ============================================================================
#
# Interpolate a value between two points
# Example: If x goes from 10 to 20, and we're at position 0.5,
#          we want the value halfway between: 15

function lerp(start::Float32, end_val::Float32, t::Float32)::Float32
    return start + (end_val - start) * t
end

function lerp_int(start::Int32, end_val::Int32, t::Float32)::Int32
    return unsafe_trunc(Int32, lerp(Float32(start), Float32(end_val), t))
end

# ============================================================================
# TRIANGLE RASTERIZATION - Scanline Algorithm
# ============================================================================

# Draw a filled triangle using scanline algorithm
function draw_triangle_filled(renderer::Ptr{SDL_Renderer},
                               p1::ScreenPoint, p2::ScreenPoint, p3::ScreenPoint)::Cvoid
    # Sort points by Y coordinate (top to bottom)
    (top, mid, bottom) = sort_points_by_y(p1, p2, p3)
    
    # Calculate slopes for each edge
    # Edge from top to mid
    if mid.y != top.y
        slope1::Float32 = Float32(mid.x - top.x) / Float32(mid.y - top.y)
    else
        slope1 = Float32(0.0)
    end
    
    # Edge from top to bottom
    if bottom.y != top.y
        slope2::Float32 = Float32(bottom.x - top.x) / Float32(bottom.y - top.y)
    else
        slope2 = Float32(0.0)
    end
    
    # Edge from mid to bottom
    if bottom.y != mid.y
        slope3::Float32 = Float32(bottom.x - mid.x) / Float32(bottom.y - mid.y)
    else
        slope3 = Float32(0.0)
    end
    
    # Draw top half of triangle (top to mid)
    current_x1::Float32 = Float32(top.x)
    current_x2::Float32 = Float32(top.x)
    y::Int32 = top.y
    
    while y <= mid.y && y < Int32(480) && y >= Int32(0)
        # Calculate left and right edges
        x_left::Int32 = unsafe_trunc(Int32, current_x1 < current_x2 ? current_x1 : current_x2)
        x_right::Int32 = unsafe_trunc(Int32, current_x1 > current_x2 ? current_x1 : current_x2)
        
        # Clamp to screen bounds
        if x_left < Int32(0)
            x_left = Int32(0)
        end
        if x_right >= Int32(640)
            x_right = Int32(639)
        end
        
        # Draw horizontal line
        if x_left <= x_right
            llvm_SDL_RenderDrawLine(renderer, x_left, y, x_right, y)
        end
        
        # Update x positions for next scanline
        current_x1 += slope1
        current_x2 += slope2
        
        y += Int32(1)
    end
    
    # Draw bottom half of triangle (mid to bottom)
    # Reset x positions for bottom half
    if mid.y != top.y
        t::Float32 = Float32(mid.y - top.y) / Float32(bottom.y - top.y)
        current_x1 = lerp(Float32(top.x), Float32(bottom.x), t)
    else
        current_x1 = Float32(mid.x)
    end
    current_x2 = Float32(mid.x)
    y = mid.y
    
    while y <= bottom.y && y < Int32(480) && y >= Int32(0)
        # Calculate left and right edges
        x_left::Int32 = unsafe_trunc(Int32, current_x1 < current_x2 ? current_x1 : current_x2)
        x_right::Int32 = unsafe_trunc(Int32, current_x1 > current_x2 ? current_x1 : current_x2)
        
        # Clamp to screen bounds
        if x_left < Int32(0)
            x_left = Int32(0)
        end
        if x_right >= Int32(640)
            x_right = Int32(639)
        end
        
        # Draw horizontal line
        if x_left <= x_right
            llvm_SDL_RenderDrawLine(renderer, x_left, y, x_right, y)
        end
        
        # Update x positions for next scanline
        current_x1 += slope2
        current_x2 += slope3
        
        y += Int32(1)
    end
    
    return nothing
end

# ============================================================================
# SIMPLER VERSION: Using SDL_RenderFillRect for each scanline
# ============================================================================
# This is easier to understand and works well for small triangles

function draw_triangle_filled_simple(renderer::Ptr{SDL_Renderer},
                                      p1::ScreenPoint, p2::ScreenPoint, p3::ScreenPoint)::Cvoid
    # Sort points by Y
    (top, mid, bottom) = sort_points_by_y(p1, p2, p3)
    
    # Calculate edge slopes
    slope_left::Float32 = Float32(0.0)
    slope_right::Float32 = Float32(0.0)
    
    if bottom.y != top.y
        slope_left = Float32(bottom.x - top.x) / Float32(bottom.y - top.y)
    end
    
    if mid.y != top.y
        slope_right = Float32(mid.x - top.x) / Float32(mid.y - top.y)
    end
    
    if bottom.y != mid.y
        slope_right = Float32(bottom.x - mid.x) / Float32(bottom.y - mid.y)
    end
    
    # Draw scanlines
    x_left::Float32 = Float32(top.x)
    x_right::Float32 = Float32(top.x)
    y::Int32 = top.y
    
    # Top half
    while y <= mid.y && y < Int32(480) && y >= Int32(0)
        x_start::Int32 = unsafe_trunc(Int32, x_left < x_right ? x_left : x_right)
        x_end::Int32 = unsafe_trunc(Int32, x_left > x_right ? x_left : x_right)
        
        if x_start < Int32(0)
            x_start = Int32(0)
        end
        if x_end >= Int32(640)
            x_end = Int32(639)
        end
        
        if x_start <= x_end
            # Use RenderDrawLine for each pixel (or RenderFillRect for a line)
            llvm_SDL_RenderDrawLine(renderer, x_start, y, x_end, y)
        end
        
        x_left += slope_left
        x_right += slope_right
        y += Int32(1)
    end
    
    # Bottom half (similar logic)
    # ... (implementation continues)
    
    return nothing
end

# ============================================================================
# EXAMPLE: Draw a 3D Triangle
# ============================================================================

# Project 3D triangle to screen and fill it
function draw_3d_triangle_filled(renderer::Ptr{SDL_Renderer},
                                  v1_3d::Ptr{Point3D}, v2_3d::Ptr{Point3D}, v3_3d::Ptr{Point3D},
                                  color::UInt32,
                                  view_distance::Int32,
                                  screen_center_x::Int32,
                                  screen_center_y::Int32,
                                  near_z::Int32, far_z::Int32)::Cvoid
    # Set color
    r::UInt8 = UInt8((color >> 16) & UInt32(0xFF))
    g::UInt8 = UInt8((color >> 8) & UInt32(0xFF))
    b::UInt8 = UInt8(color & UInt32(0xFF))
    llvm_SDL_SetRenderDrawColor(renderer, r, g, b, UInt8(255))
    
    # Project each vertex
    # (Using simplified projection - you'd use your project_3d_to_2d function)
    x1::Int32 = Int32(0)
    y1::Int32 = Int32(0)
    z1::Float32 = v1_3d.z
    valid1::Bool = false
    
    x2::Int32 = Int32(0)
    y2::Int32 = Int32(0)
    z2::Float32 = v2_3d.z
    valid2::Bool = false
    
    x3::Int32 = Int32(0)
    y3::Int32 = Int32(0)
    z3::Float32 = v3_3d.z
    valid3::Bool = false
    
    # Project v1
    if v1_3d.z > Float32(near_z) && v1_3d.z < Float32(far_z)
        x_per::Float32 = Float32(view_distance) * v1_3d.x / v1_3d.z
        y_per::Float32 = Float32(view_distance) * v1_3d.y / v1_3d.z
        x1 = screen_center_x + unsafe_trunc(Int32, x_per)
        y1 = screen_center_y - unsafe_trunc(Int32, y_per)
        valid1 = x1 >= Int32(0) && x1 < Int32(640) && y1 >= Int32(0) && y1 < Int32(480)
    end
    
    # Project v2
    if v2_3d.z > Float32(near_z) && v2_3d.z < Float32(far_z)
        x_per = Float32(view_distance) * v2_3d.x / v2_3d.z
        y_per = Float32(view_distance) * v2_3d.y / v2_3d.z
        x2 = screen_center_x + unsafe_trunc(Int32, x_per)
        y2 = screen_center_y - unsafe_trunc(Int32, y_per)
        valid2 = x2 >= Int32(0) && x2 < Int32(640) && y2 >= Int32(0) && y2 < Int32(480)
    end
    
    # Project v3
    if v3_3d.z > Float32(near_z) && v3_3d.z < Float32(far_z)
        x_per = Float32(view_distance) * v3_3d.x / v3_3d.z
        y_per = Float32(view_distance) * v3_3d.y / v3_3d.z
        x3 = screen_center_x + unsafe_trunc(Int32, x_per)
        y3 = screen_center_y - unsafe_trunc(Int32, y_per)
        valid3 = x3 >= Int32(0) && x3 < Int32(640) && y3 >= Int32(0) && y3 < Int32(480)
    end
    
    # Only draw if all vertices are valid
    if valid1 && valid2 && valid3
        p1_screen::ScreenPoint = ScreenPoint(x1, y1, z1, color)
        p2_screen::ScreenPoint = ScreenPoint(x2, y2, z2, color)
        p3_screen::ScreenPoint = ScreenPoint(x3, y3, z3, color)
        
        draw_triangle_filled(renderer, p1_screen, p2_screen, p3_screen)
    end
    
    return nothing
end

# ============================================================================
# KEY CONCEPTS
# ============================================================================
#
# 1. SCANLINE ALGORITHM:
#    - Process triangle line by line (scanline by scanline)
#    - For each line, find left and right edges
#    - Fill pixels between edges
#
# 2. TRIANGLE SPLITTING:
#    - Split triangle at middle vertex (flat-top and flat-bottom)
#    - Makes rasterization easier
#
# 3. EDGE CALCULATION:
#    - Use slopes to calculate edge positions
#    - slope = (x2 - x1) / (y2 - y1)
#    - For each scanline: x_new = x_old + slope
#
# 4. CLIPPING:
#    - Check if pixels are on screen
#    - Clamp x coordinates to screen bounds
#
# ============================================================================
# NEXT: Texture Mapping & Lighting
# ============================================================================
#
# Once you can draw filled triangles, you can add:
# 1. Texture mapping: Map images onto triangles
# 2. Gouraud shading: Interpolate colors across triangle
# 3. Z-buffering: Proper depth testing
# 4. Backface culling: Don't draw faces pointing away
#
# Would you like me to show you any of these next?
