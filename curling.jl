# curling.jl - Curling-Inspired Flick Game with Puzzle System
using StaticTools
using StaticCompiler

include("structs.jl")
include("game_structs.jl")
include("sprite.jl")
include("llvm_wrappers.jl") 
include("llvm_bindings.jl")
include("wallocstring.jl")
include("puzzle_system.jl")

# ============================================================================
# CONSTANTS
# ============================================================================
const STONE_RADIUS::Float64 = Float64(20.0)
const MAX_POWER::Float64 = Float64(800.0)
const FRICTION::Float64 = Float64(0.98)  # Low friction for sliding
const CURVE_STRENGTH::Float64 = Float64(0.3)  # How much the stone curves
const MIN_VELOCITY::Float64 = Float64(5.0)  # Stop when velocity is below this


const GRID_WIDTH::Int32 = Int32(160)   # 640 / 4
const GRID_HEIGHT::Int32 = Int32(160)  # 640 / 4
const GRID_SIZE::Int32 = GRID_WIDTH * GRID_HEIGHT  # 25600 cells

# ============================================================================
# GAME STATE (using GameState from puzzle_system.jl)
# ============================================================================
# GameState is now GameState from puzzle_system.jl

# ============================================================================
# WINDOW/RENDERER INIT
# ============================================================================

function j_init_window()::Ptr{SDL_Window}
    window_name = str_ptr(w"Curling Flick Game")
    window::Ptr{SDL_Window} = llvm_SDL_CreateWindow(window_name, Int32(0), Int32(0), Int32(640), Int32(640), UInt32(0))
    if window == Ptr{SDL_Window}(C_NULL)
        printf(c"Failed to create window\n")
        msg_ptr = wasm_malloc(UInt32(100))
        msg = llvm_SDL_GetErrorMsg(msg_ptr, Int32(100))
        printf(c"Error: %s\n", msg)
        wasm_free(Ptr{Cvoid}(msg_ptr))
    end
    wasm_free(Ptr{Cvoid}(window_name))
    return window
end

function j_init_renderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
    renderer::Ptr{SDL_Renderer} = llvm_SDL_CreateRenderer(window, Int32(-1), UInt32(2))
    if renderer == Ptr{SDL_Renderer}(C_NULL)
        printf(c"Failed to create renderer\n")
    end
    return renderer
end

# ============================================================================
# GAME STATE INIT
# ============================================================================

function j_init_game_state(renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    printf(c"Initializing curling puzzle game\n")
    
    # Create puzzle level (start with puzzle 1)
   level::Ptr{PuzzleLevel} = create_puzzle_1()
    
    # Get player stone from level
    player_stone_ptr1::Ptr{Stone} = Ptr{Stone}(C_NULL)
    player_stone::Stone = Stone(Float64(0.0), Float64(0.0), Float64(0.0), Float64(0.0), Float64(0.0), Float64(0.0), true, false)
    if level.stone_count > Int32(0)
        player_stone_ptr::Ptr{Stone} = level.stones
        # Find player stone
        i::Int32 = Int32(0)
        while i < level.stone_count
            stone_ptr::Ptr{Stone} = level.stones + Int64(i * sizeof(Stone))
            if stone_ptr.is_player
                player_stone = unsafe_load(stone_ptr)
                break
            end
            i += Int32(1)
        end
    else
        # Fallback to level start position
        player_stone_ptr1.x = level.start_x
        player_stone_ptr1.y = level.start_y
        player_stone = unsafe_load(player_stone_ptr1)
    end
    
    # # Create game state
    state_ptr::Ptr{GameState} = Ptr{GameState}(wasm_malloc(UInt32(sizeof(GameState))))
    unsafe_store!(
        Ptr{GameState}(state_ptr),
        GameState(
            level,               # level
            player_stone,        # player_stone
            false,               # is_charging
            Float64(0.0),        # charge_power
            Float64(0.0),        # drag_start_x
            Float64(0.0),        # drag_start_y
            Float64(0.0),        # drag_current_x
            Float64(0.0),        # drag_current_y
            false,               # is_sweeping
            Float64(0.0),        # sweep_timer
            UInt64(0),           # last_frame_time
            false,               # quit
            false                # level_complete
        )
    )
    
    printf(c"Puzzle game ready\n")
    printf(c"Click/touch and drag backward to charge, release to launch\n")
    printf(c"Hold SPACE to sweep (reduces friction)\n")
    printf(c"Press R to reset\n")
    
    return state_ptr
end

# ============================================================================
# INPUT HANDLING
# ============================================================================

function handle_input(state::Ptr{GameState}, window::Ptr{SDL_Window})::Cvoid
    event_ptr::Ptr{SDL_Event} = Ptr{SDL_Event}(wasm_malloc(UInt32(56)))
    
    while llvm_SDL_PollEvent(event_ptr) != Int32(0)
        event_type::UInt32 = event_ptr.type
        mx::Int32 = Int32(0)
        my::Int32 = Int32(0)
        mx_ptr::Ptr{Int32} = Ptr{Int32}(C_NULL)
        my_ptr::Ptr{Int32} = Ptr{Int32}(C_NULL)
        dx::Float64 = Float64(0.0)
        dy::Float64 = Float64(0.0)
        tx::Float64 = Float64(0.0)
        ty::Float64 = Float64(0.0)
        drag_dist::Float64 = Float64(0.0)
        dx_norm::Float64 = Float64(0.0)
        dy_norm::Float64 = Float64(0.0)
        angle::Float64 = Float64(0.0)
        launch_speed::Float64 = Float64(0.0)
        if event_type == SDL_QUIT
            state.quit = true
        elseif event_type == SDL_KEYDOWN
            key::Int32 = event_ptr.key.keysym.sym
            if key == SDLK_ESCAPE
                state.quit = true
            elseif key == SDLK_r
                # Reset stone position
                level::Ptr{PuzzleLevel} = state.level
                player_stone_ptr::Ptr{Stone} = Ptr{Stone}(C_NULL)
                i::Int32 = Int32(0)
                while i < level.stone_count
                    stone_ptr::Ptr{Stone} = level.stones + Int64(i * sizeof(Stone))
                    if stone_ptr.is_player
                        player_stone_ptr = stone_ptr
                        break
                    end
                    i += Int32(1)
                end
                if player_stone_ptr != Ptr{Stone}(C_NULL)
                    player_stone_ptr.x = level.start_x
                    player_stone_ptr.y = level.start_y
                    player_stone_ptr.vel_x = Float64(0.0)
                    player_stone_ptr.vel_y = Float64(0.0)
                    player_stone_ptr.angle = Float64(0.0)
                    player_stone_ptr.spin = Float64(0.0)
                    player_stone_ptr.is_active = false
                end
                state.is_charging = false
                state.charge_power = Float64(0.0)
                state.is_sweeping = false
                state.sweep_timer = Float64(0.0)
                state.level_complete = false
                # Reset targets
                i = Int32(0)
                while i < level.target_count
                    target_ptr::Ptr{Target} = level.targets + Int64(i * sizeof(Target))
                    target_ptr.is_hit = false
                    i += Int32(1)
                end
                printf(c"Stone reset\n")
            elseif key == SDLK_SPACE
                # Start sweeping
                state.is_sweeping = true
            end
        elseif event_type == SDL_KEYUP
            key = event_ptr.key.keysym.sym
            if key == SDLK_SPACE
                # Stop sweeping
                state.is_sweeping = false
                state.sweep_timer = Float64(0.0)
            end
        elseif event_type == SDL_MOUSEBUTTONDOWN
            # Start charging
             mx_ptr = Ptr{Int32}(C_NULL)
             my_ptr = Ptr{Int32}(C_NULL)
            if event_ptr.button.button == UInt8(1)  # Left mouse button
                mx_ptr = Ptr{Int32}(wasm_malloc(UInt32(4)))
                my_ptr = Ptr{Int32}(wasm_malloc(UInt32(4)))
                llvm_SDL_GetMouseState(mx_ptr, my_ptr)
                mx = unsafe_load(mx_ptr)
                my = unsafe_load(my_ptr)
                wasm_free(Ptr{Cvoid}(mx_ptr))
                wasm_free(Ptr{Cvoid}(my_ptr))
                
                # Only start charging if player stone is stopped
                level = state.level
                player_stone_ptr = Ptr{Stone}(C_NULL)
                i = Int32(0)
                while i < level.stone_count
                    stone_ptr = level.stones + Int64(i * sizeof(Stone))
                    if stone_ptr.is_player
                        player_stone_ptr = stone_ptr
                        break
                    end
                    i += Int32(1)
                end
                if player_stone_ptr != Ptr{Stone}(C_NULL)
                    if abs(player_stone_ptr.vel_x) < MIN_VELOCITY && abs(player_stone_ptr.vel_y) < MIN_VELOCITY
                        state.is_charging = true
                        state.drag_start_x = Float64(mx)
                        state.drag_start_y = Float64(my)
                        state.drag_current_x = Float64(mx)
                        state.drag_current_y = Float64(my)
                        state.charge_power = Float64(0.0)
                    end
                end
            end
        elseif event_type == SDL_MOUSEMOTION
            # Update drag position while charging
            if state.is_charging
                mx_ptr = Ptr{Int32}(wasm_malloc(UInt32(4)))
                my_ptr = Ptr{Int32}(wasm_malloc(UInt32(4)))
                llvm_SDL_GetMouseState(mx_ptr, my_ptr)
                mx = unsafe_load(mx_ptr)
                my = unsafe_load(my_ptr)
                wasm_free(Ptr{Cvoid}(mx_ptr))
                wasm_free(Ptr{Cvoid}(my_ptr))
                
                state.drag_current_x = Float64(mx)
                state.drag_current_y = Float64(my)
                
                # Calculate power based on drag distance (backward = more power)
                dx = state.drag_current_x - state.drag_start_x
                dy = state.drag_current_y - state.drag_start_y
                drag_dist = sqrt(dx * dx + dy * dy)
                
                # Power increases as you drag backward (away from stone)
                # Max power at ~200 pixels drag
                state.charge_power = min(drag_dist / Float64(200.0), Float64(1.0))
            end
        elseif event_type == SDL_MOUSEBUTTONUP
            # Release and launch
            if event_ptr.button.button == UInt8(1) && state.is_charging
                # Calculate launch direction and power
                dx = state.drag_start_x - state.drag_current_x  # Reverse: start to current
                dy = state.drag_start_y - state.drag_current_y
                dist = sqrt(dx * dx + dy * dy)
                
                if dist > Float64(10.0)  # Minimum drag distance
                    # Normalize direction
                    dx_norm = dx / dist
                    dy_norm = dy / dist
                    
                    # Launch velocity based on power
                    launch_speed = state.charge_power * MAX_POWER
                    
                    # Find player stone and launch it
                    level = state.level
                    player_stone_ptr = Ptr{Stone}(C_NULL)
                    i = Int32(0)
                    while i < level.stone_count
                        stone_ptr = level.stones + Int64(i * sizeof(Stone))
                        if stone_ptr.is_player
                            player_stone_ptr = stone_ptr
                            break
                        end
                        i += Int32(1)
                    end
                    if player_stone_ptr != Ptr{Stone}(C_NULL)
                        player_stone_ptr.vel_x = dx_norm * launch_speed
                        player_stone_ptr.vel_y = dy_norm * launch_speed
                        player_stone_ptr.is_active = true
                        
                        # Calculate spin based on drag angle (sideways drag = spin)
                        angle = llvm_SDL_atan2(dy, dx)
                        player_stone_ptr.spin = llvm_SDL_sin(angle) * Float64(0.5)  # -0.5 to 0.5
                        
                        printf(c"Launched! Power: %.2f, Spin: %.2f\n", state.charge_power, player_stone_ptr.spin)
                    end
                end
                
                state.is_charging = false
                state.charge_power = Float64(0.0)
            end
        # # Touch events for mobile
        # elseif event_type == SDL_FINGERDOWN
        #     tx = Float64(event_ptr.tfinger.x)
        #     ty = Float64(event_ptr.tfinger.y)
        #     win_w_ptr = Ref{Int32}(0)
        #     win_h_ptr = Ref{Int32}(0)
        #     llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
        #     win_w = win_w_ptr[]
        #     win_h = win_h_ptr[]
            
        #     mx = Int32(tx * Float64(win_w))
        #     my = Int32(ty * Float64(win_h))
            
        #     if abs(state.stone_vel_x) < MIN_VELOCITY && abs(state.stone_vel_y) < MIN_VELOCITY
        #         state.is_charging = true
        #         state.drag_start_x = Float64(mx)
        #         state.drag_start_y = Float64(my)
        #         state.drag_current_x = Float64(mx)
        #         state.drag_current_y = Float64(my)
        #         state.charge_power = Float64(0.0)
        #     end
        # elseif event_type == SDL_FINGERMOTION
        #     if state.is_charging
        #         tx = Float64(event_ptr.tfinger.x)
        #         ty = Float64(event_ptr.tfinger.y)
        #         win_w_ptr = Ref{Int32}(0)
        #         win_h_ptr = Ref{Int32}(0)
        #         llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
        #         win_w = win_w_ptr[]
        #         win_h = win_h_ptr[]
                
        #         mx = Int32(tx * Float64(win_w))
        #         my = Int32(ty * Float64(win_h))
                
        #         state.drag_current_x = Float64(mx)
        #         state.drag_current_y = Float64(my)
                
        #         dx = state.drag_current_x - state.drag_start_x
        #         dy = state.drag_current_y - state.drag_start_y
        #         drag_dist = sqrt(dx * dx + dy * dy)
                
        #         state.charge_power = min(drag_dist / Float64(200.0), Float64(1.0))
        #     end
        # elseif event_type == SDL_FINGERUP
        #     if state.is_charging
        #         tx = Float64(event_ptr.tfinger.x)
        #         ty = Float64(event_ptr.tfinger.y)
        #         win_w_ptr = Ref{Int32}(0)
        #         win_h_ptr = Ref{Int32}(0)
        #         llvm_SDL_GetWindowSize(window, Base.unsafe_convert(Ptr{Int32}, win_w_ptr), Base.unsafe_convert(Ptr{Int32}, win_h_ptr))
        #         win_w = win_w_ptr[]
        #         win_h = win_h_ptr[]
                
        #         mx = Int32(tx * Float64(win_w))
        #         my = Int32(ty * Float64(win_h))
                
        #         state.drag_current_x = Float64(mx)
        #         state.drag_current_y = Float64(my)
                
        #         dx = state.drag_start_x - state.drag_current_x
        #         dy = state.drag_start_y - state.drag_current_y
        #         dist = sqrt(dx * dx + dy * dy)
                
        #         if dist > Float64(10.0)
        #             dx_norm = dx / dist
        #             dy_norm = dy / dist
                    
        #             launch_speed = state.charge_power * MAX_POWER
        #             state.stone_vel_x = dx_norm * launch_speed
        #             state.stone_vel_y = dy_norm * launch_speed
                    
        #             angle = atan2(dy, dx)
        #             state.stone_spin = sin(angle) * Float64(0.5)
                    
        #             printf(c"Launched! Power: %.2f, Spin: %.2f\n", state.charge_power, state.stone_spin)
        #         end
                
        #         state.is_charging = false
        #         state.charge_power = Float64(0.0)
        #     end
        end
    end
    
    wasm_free(Ptr{Cvoid}(event_ptr))
    return nothing
end

# ============================================================================
# PHYSICS UPDATE
# ============================================================================

function update_physics(state::Ptr{GameState}, delta_time::Float64)::Cvoid
    level::Ptr{PuzzleLevel} = state.level
    
    # Update sweep timer
    if state.is_sweeping
        state.sweep_timer += delta_time
    else
        state.sweep_timer = Float64(0.0)
    end
    
    # Update all stones
    i::Int32 = Int32(0)
    while i < level.stone_count
        stone_ptr::Ptr{Stone} = level.stones + Int64(i * sizeof(Stone))
        is_player::Bool = stone_ptr.is_player
        
        # Update physics for this stone
        update_stone_physics(stone_ptr, level, state.is_sweeping && is_player, delta_time)
        
        i += Int32(1)
    end
    
    # Check stone-to-stone collisions
    i = Int32(0)
    while i < level.stone_count
        stone1_ptr::Ptr{Stone} = level.stones + Int64(i * sizeof(Stone))
        if stone1_ptr.is_active
            j::Int32 = i + Int32(1)
            while j < level.stone_count
                stone2_ptr::Ptr{Stone} = level.stones + Int64(j * sizeof(Stone))
                if stone2_ptr.is_active && check_stone_collision(stone1_ptr, stone2_ptr)
                    resolve_stone_collision(stone1_ptr, stone2_ptr)
                end
                j += Int32(1)
            end
        end
        i += Int32(1)
    end
    
    # Check target hits
    player_stone_ptr::Ptr{Stone} = Ptr{Stone}(C_NULL)
    i = Int32(0)
    while i < level.stone_count
        stone_ptr = level.stones + Int64(i * sizeof(Stone))
        if stone_ptr.is_player
            player_stone_ptr = stone_ptr
            break
        end
        i += Int32(1)
    end
    
    if player_stone_ptr != Ptr{Stone}(C_NULL)
        i = Int32(0)
        while i < level.target_count
            target_ptr::Ptr{Target} = level.targets + Int64(i * sizeof(Target))
            if !target_ptr.is_hit && check_target_hit(player_stone_ptr, target_ptr)
                target_ptr.is_hit = true
                state.level_complete = true
                printf(c"Target hit! Level complete!\n")
            end
            i += Int32(1)
        end
    end
    
    return nothing
end

# ============================================================================
# RENDERING
# ============================================================================

function render_game(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer})::Cvoid
    level::Ptr{PuzzleLevel} = state.level
    
    # Clear to ice blue background
    llvm_SDL_SetRenderDrawColor(renderer, UInt8(200), UInt8(220), UInt8(255), UInt8(255))
    llvm_SDL_RenderClear(renderer)
    
    # Draw ice cells (optional - can be commented out for performance)
    # i::Int32 = Int32(0)
    # while i < level.grid_width * level.grid_height
    #     cell_ptr::Ptr{IceCell} = level.ice_cells + Int64(i * sizeof(IceCell))
    #     draw_ice_cell(renderer, cell_ptr)
    #     i += Int32(1)
    # end
    
    # Draw targets
    i::Int32 = Int32(0)
    while i < level.target_count
        target_ptr::Ptr{Target} = level.targets + Int64(i * sizeof(Target))
        draw_target(renderer, target_ptr)
        i += Int32(1)
    end
    
    # Draw all stones
    i = Int32(0)
    while i < level.stone_count
        stone_ptr::Ptr{Stone} = level.stones + Int64(i * sizeof(Stone))
        draw_stone(renderer, stone_ptr)
        i += Int32(1)
    end
    
    # Draw charge indicator when charging
    if state.is_charging
        # Find player stone position
        player_stone_ptr::Ptr{Stone} = Ptr{Stone}(C_NULL)
        i = Int32(0)
        while i < level.stone_count
            stone_ptr = level.stones + Int64(i * sizeof(Stone))
            if stone_ptr.is_player
                player_stone_ptr = stone_ptr
                break
            end
            i += Int32(1)
        end
        
        if player_stone_ptr != Ptr{Stone}(C_NULL)
            # Draw line from stone to drag start
            llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(200), UInt8(0), UInt8(150))
            draw_line(renderer, unsafe_trunc(Int32, llvm_SDL_round(player_stone_ptr.x)), unsafe_trunc(Int32, llvm_SDL_round(player_stone_ptr.y)), unsafe_trunc(Int32, llvm_SDL_round(state.drag_start_x)), unsafe_trunc(Int32, llvm_SDL_round(state.drag_start_y)))
            
            # Draw line from drag start to current position
            llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(100), UInt8(0), UInt8(200))
            draw_line(renderer, unsafe_trunc(Int32, llvm_SDL_round(state.drag_start_x)), unsafe_trunc(Int32, llvm_SDL_round(state.drag_start_y)), unsafe_trunc(Int32, llvm_SDL_round(state.drag_current_x)), unsafe_trunc(Int32, llvm_SDL_round(state.drag_current_y)))
            
            # Draw power meter
            meter_x::Int32 = Int32(20)
            meter_y::Int32 = Int32(20)
            meter_w::Int32 = Int32(200)
            meter_h::Int32 = Int32(20)
            
            # Background
            rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
            unsafe_store!(Ptr{Int32}(rect_ptr), meter_x)
            unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), meter_y)
            unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), meter_w)
            unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), meter_h)
            llvm_SDL_SetRenderDrawColor(renderer, UInt8(50), UInt8(50), UInt8(50), UInt8(200))
            llvm_SDL_RenderFillRect(renderer, rect_ptr)
            
            # Power bar
            power_w::Int32 = unsafe_trunc(Int32, llvm_SDL_round(Float64(meter_w) * state.charge_power))
            if power_w > Int32(0)
                unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), power_w)
                llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(200), UInt8(0), UInt8(255))
                llvm_SDL_RenderFillRect(renderer, rect_ptr)
            end
            
            wasm_free(Ptr{Cvoid}(rect_ptr))
        end
    end
    
    # Draw sweep indicator
    if state.is_sweeping
        # Find player stone
        player_stone_ptr = Ptr{Stone}(C_NULL)
        i = Int32(0)
        while i < level.stone_count
            stone_ptr = level.stones + Int64(i * sizeof(Stone))
            if stone_ptr.is_player
                player_stone_ptr = stone_ptr
                break
            end
            i += Int32(1)
        end
        
        if player_stone_ptr != Ptr{Stone}(C_NULL)
            # Draw sweep effect (circle around stone)
            llvm_SDL_SetRenderDrawColor(renderer, UInt8(255), UInt8(255), UInt8(100), UInt8(150))
            sweep_radius::Int32 = unsafe_trunc(Int32, STONE_RADIUS * Float64(1.5))
            draw_circle_outline(renderer, unsafe_trunc(Int32, llvm_SDL_round(player_stone_ptr.x)), unsafe_trunc(Int32, llvm_SDL_round(player_stone_ptr.y)), sweep_radius)
        end
    end
    
    # Draw level complete message
    if state.level_complete
        # Simple text indicator (could be improved with actual text rendering)
        llvm_SDL_SetRenderDrawColor(renderer, UInt8(100), UInt8(255), UInt8(100), UInt8(200))
        rect_ptr = wasm_malloc(UInt32(sizeof(SDL_Rect)))
        unsafe_store!(Ptr{Int32}(rect_ptr), Int32(200))
        unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), Int32(300))
        unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), Int32(240))
        unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), Int32(40))
        llvm_SDL_RenderFillRect(renderer, rect_ptr)
        wasm_free(Ptr{Cvoid}(rect_ptr))
    end
    
    llvm_SDL_RenderPresent(renderer)
    return nothing
end

# Helper to draw a filled circle (approximate with filled square for simplicity)
function draw_circle_filled(renderer::Ptr{SDL_Renderer}, center_x::Int32, center_y::Int32, radius::Int32)::Cvoid
    # Draw as filled square (simple basic shape)
    rect_ptr::Ptr{SDL_Rect} = wasm_malloc(UInt32(sizeof(SDL_Rect)))
    unsafe_store!(Ptr{Int32}(rect_ptr), center_x - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(4)), center_y - radius)
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(8)), radius * Int32(2))
    unsafe_store!(Ptr{Int32}(rect_ptr + Int64(12)), radius * Int32(2))
    llvm_SDL_RenderFillRect(renderer, rect_ptr)
    wasm_free(Ptr{Cvoid}(rect_ptr))
    return nothing
end

function test()::Int32
    return Int32(0)
end
# Helper to draw a circle outline
function draw_circle_outline(renderer::Ptr{SDL_Renderer}, center_x::Int32, center_y::Int32, radius::Int32)::Cvoid
    # Draw circle outline using lines
    num_points::Int32 = Int32(32)
    i::Int32 = Int32(1)
    prev_x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(Float64(0)) * Float64(radius)))
    prev_y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(Float64(0)) * Float64(radius)))
 
    while i < num_points
        angle::Float64 = Float64(i + Int32(1)) * Float64(2.0 * 3.14159265359) / Float64(num_points)
        x::Int32 = center_x + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_cos(angle) * Float64(radius)))
        y::Int32 = center_y + unsafe_trunc(Int32, llvm_SDL_round(llvm_SDL_sin(angle) * Float64(radius)))
        
        draw_line(renderer, prev_x, prev_y, x, y)
        
        prev_x = x
        prev_y = y

        i += Int32(1)
    end

    return nothing
end

# Helper to draw a line
function draw_line(renderer::Ptr{SDL_Renderer}, x1::Int32, y1::Int32, x2::Int32, y2::Int32)::Cvoid
    llvm_SDL_RenderDrawLine(renderer, x1, y1, x2, y2)
    return nothing
end

# ============================================================================
# MAIN GAME LOOP
# ============================================================================

function game_loop(state::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Ptr{GameState}
    # Calculate delta time
    current_time::UInt64 = llvm_SDL_GetPerformanceCounter()
    delta_time::Float64 = Float64(current_time - state.last_frame_time) / Float64(llvm_SDL_GetPerformanceFrequency())
    state.last_frame_time = current_time
    
    # Clamp delta time
    if delta_time > Float64(0.1)
        delta_time = Float64(0.1)
    end
    
    handle_input(state, window)
    update_physics(state, delta_time)
    render_game(state, renderer)
    
    llvm_SDL_Delay(UInt32(16))  # ~60 FPS
    
    return state
end

# ============================================================================
# ENTRY POINTS
# ============================================================================

function pc_main()::Int32
    llvm_SDL_Init(UInt32(32))  # SDL_INIT_VIDEO
    
    window::Ptr{SDL_Window} = j_init_window()
    renderer::Ptr{SDL_Renderer} = j_init_renderer(window)
    state_ptr::Ptr{GameState} = j_init_game_state(renderer, window)
    
    while !state_ptr.quit
        game_loop(state_ptr, renderer, window)
    end
    
    cleanup(state_ptr, renderer, window)
    return Int32(0)
end

function cleanup(state_ptr::Ptr{GameState}, renderer::Ptr{SDL_Renderer}, window::Ptr{SDL_Window})::Cvoid
    if state_ptr.level != Ptr{PuzzleLevel}(C_NULL)
        free_puzzle_level(state_ptr.level)
    end
    wasm_free(Ptr{Cvoid}(state_ptr))
    llvm_SDL_DestroyRenderer(renderer)
    llvm_SDL_DestroyWindow(window)
    llvm_SDL_Quit()
    return nothing
end
