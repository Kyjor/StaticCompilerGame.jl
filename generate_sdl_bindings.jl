#!/usr/bin/env julia

"""
SDL Binding Generator

This script generates Julia llvmcall bindings for SDL functions by:
1. Parsing sdl_module.c to find SDL function calls
2. Extracting function signatures from SDL headers
3. Generating Julia bindings with proper type mapping
"""

using Base: llvmcall
using Dates

# Configuration
const C_FILE = "SDLCalls/sdl_module.c"
const SDL_HEADERS_DIR = "SDLCalls/SDL2-2.30.11/include"
const OUTPUT_FILE = "llvm_bindings.jl"

# Type mapping from C to Julia
const TYPE_MAPPING = Dict(
    "int" => "Int32",
    "Uint32" => "UInt32", 
    "Uint64" => "UInt64",
    "Uint16" => "UInt16",
    "Uint8" => "UInt8",
    "Sint32" => "Int32",
    "Sint64" => "Int64",
    "Sint16" => "Int16", 
    "Sint8" => "Int8",
    "float" => "Float32",
    "double" => "Float64",
    "void" => "Cvoid",
    "void *" => "Cvoid",
    "void **" => "Cvoid",
    "char" => "UInt8",
    "const char *" => "UInt8",
    "char *" => "UInt8",
    "unsigned int" => "UInt32",
    "SDL_bool" => "UInt32",
    "SDL_Window *" => "SDL_Window",
    "SDL_Renderer *" => "SDL_Renderer",
    "SDL_Texture *" => "SDL_Texture",
    "SDL_Surface *" => "SDL_Surface",
    "SDL_Rect *" => "SDL_Rect",
    "SDL_Event *" => "SDL_Event",
    "SDL_Color *" => "SDL_Color",
    "SDL_Point *" => "SDL_Point",
    "SDL_FRect *" => "SDL_FRect",
    "SDL_FPoint *" => "SDL_FPoint",
    "SDL_DisplayMode*" => "SDL_DisplayMode",
    "SDL_RendererInfo*" => "SDL_RendererInfo",
    "SDL_version*" => "SDL_version",
    "SDL_Locale*" => "SDL_Locale",
    "SDL_Vertex*" => "SDL_Vertex",
    "SDL_Palette*" => "SDL_Palette",
    "SDL_PixelFormat*" => "SDL_PixelFormat",
    "SDL_Cursor*" => "SDL_Cursor",
    "SDL_Joystick*" => "SDL_Joystick",
    "SDL_GameController*" => "SDL_GameController",
    "SDL_Haptic*" => "SDL_Haptic",
    "SDL_TouchID" => "Int64",
    "SDL_FingerID" => "Int64",
    "SDL_GestureID" => "Int64",
    "SDL_TimerID" => "Int32",
    "SDL_Thread*" => "Cvoid",
    "SDL_mutex*" => "Cvoid",
    "SDL_sem*" => "Cvoid",
    "SDL_cond*" => "Cvoid",
    "SDL_RWops*" => "Cvoid",
    "SDL_AudioDeviceID" => "UInt32",
    "SDL_AudioFormat" => "UInt16",
    "SDL_AudioCallback" => "Cvoid",
    "SDL_TimerCallback" => "Cvoid",
    "SDL_HitTest" => "Cvoid",
    "SDL_LogOutputFunction" => "Cvoid",
    "SDL_AssertData*" => "Cvoid",
    "SDL_AssertionHandler" => "Cvoid",
    "SDL_BlitMap*" => "Cvoid",
    "SDL_BlendMode" => "UInt32",
    "SDL_BlendFactor" => "UInt32",
    "SDL_BlendOperation" => "UInt32",
    "SDL_ScaleMode" => "UInt32",
    "SDL_TextureAccess" => "Int32",
    "SDL_TextureModulate" => "UInt32",
    "SDL_RendererFlip" => "UInt32",
    "SDL_WindowFlags" => "UInt32",
    "SDL_WindowEventID" => "UInt8",
    "SDL_DisplayEventID" => "UInt8",
    "SDL_GLattr" => "UInt32",
    "SDL_GLprofile" => "UInt32",
    "SDL_GLcontextFlag" => "UInt32",
    "SDL_GLcontextReleaseFlag" => "UInt32",
    "SDL_GLContextResetNotification" => "UInt32",
    "SDL_Scancode" => "Int32",
    "SDL_Keycode" => "Int32",
    "SDL_Keymod" => "UInt16",
    "SDL_EventType" => "UInt32",
    "SDL_EventAction" => "UInt32",
    "SDL_JoystickType" => "Int32",
    "SDL_JoystickPowerLevel" => "Int32",
    "SDL_GameControllerType" => "Int32",
    "SDL_GameControllerBindType" => "Int32",
    "SDL_GameControllerAxis" => "Int32",
    "SDL_GameControllerButton" => "Int32",
    "SDL_HapticType" => "UInt16",
    "SDL_HapticDirectionType" => "UInt8",
    "SDL_HapticConstant" => "UInt16",
    "SDL_HapticPeriodic" => "UInt16",
    "SDL_HapticCondition" => "UInt16",
    "SDL_HapticRamp" => "UInt16",
    "SDL_HapticLeftRight" => "UInt16",
    "SDL_HapticCustom" => "UInt16",
    "SDL_SensorType" => "Int32",
    "SDL_SystemCursor" => "Int32",
    "SDL_MouseWheelDirection" => "UInt32",
    "SDL_PowerState" => "Int32",
    "SDL_ThreadPriority" => "Int32",
    "SDL_AudioStatus" => "Int32",
    "SDL_AudioFormat" => "UInt16",
    "SDL_AudioCallback" => "SDL_AudioCallback",
    "SDL_AudioFilter" => "SDL_AudioFilter",
    "SDL_AudioDeviceID" => "UInt32",
    "SDL_AudioStream *" => "SDL_AudioStream",
    "SDL_AudioCVT *" => "SDL_AudioCVT",
    "SDL_AudioSpec *" => "SDL_AudioSpec",
    "SDL_AudioCVT" => "SDL_AudioCVT",
    "SDL_AudioSpec" => "SDL_AudioSpec",
    "SDL_AudioStream" => "SDL_AudioStream",
    "SDL_AssertData" => "SDL_AssertData",
    "SDL_AtomicInt" => "Int32",
    "SDL_AtomicUint" => "UInt32",
    "SDL_AtomicSint64" => "Int64",
    "SDL_AtomicUint64" => "UInt64",
    "SDL_BlitMap" => "SDL_BlitMap",
    "SDL_Color" => "SDL_Color",
    "SDL_DisplayMode" => "SDL_DisplayMode",
    "SDL_Finger" => "SDL_Finger",
    "SDL_FPoint" => "SDL_FPoint",
    "SDL_FRect" => "SDL_FRect",
    "SDL_GUID" => "SDL_GUID",
    "SDL_HapticDirection" => "SDL_HapticDirection",
    "SDL_HapticEffect" => "SDL_HapticEffect",
    "SDL_JoystickGUID" => "SDL_JoystickGUID",
    "SDL_Keysym" => "SDL_Keysym",
    "SDL_Locale" => "SDL_Locale",
    "SDL_Palette" => "SDL_Palette",
    "SDL_PixelFormat" => "SDL_PixelFormat",
    "SDL_Point" => "SDL_Point",
    "SDL_Rect" => "SDL_Rect",
    "SDL_RendererInfo" => "SDL_RendererInfo",
    "SDL_Surface" => "SDL_Surface",
    "SDL_Texture" => "SDL_Texture",
    "SDL_Thread" => "SDL_Thread",
    "SDL_TouchFingerEvent" => "SDL_TouchFingerEvent",
    "SDL_UserEvent" => "SDL_UserEvent",
    "SDL_Version" => "SDL_version",
    "SDL_Vertex" => "SDL_Vertex",
    "SDL_Window" => "SDL_Window",
    "SDL_Renderer" => "SDL_Renderer",
    "SDL_Event" => "SDL_Event",
    "SDL_Cursor" => "SDL_Cursor",
    "SDL_Joystick" => "SDL_Joystick",
    "SDL_GameController" => "SDL_GameController",
    "SDL_Haptic" => "SDL_Haptic",
    "SDL_GameControllerButtonBind" => "SDL_GameControllerButtonBind",
    "SDL_CommonEvent" => "SDL_CommonEvent",
    "SDL_WindowEvent" => "SDL_WindowEvent",
    "SDL_KeyboardEvent" => "SDL_KeyboardEvent",
    "SDL_TextEditingEvent" => "SDL_TextEditingEvent",
    "SDL_TextInputEvent" => "SDL_TextInputEvent",
    "SDL_MouseMotionEvent" => "SDL_MouseMotionEvent",
    "SDL_MouseButtonEvent" => "SDL_MouseButtonEvent",
    "SDL_MouseWheelEvent" => "SDL_MouseWheelEvent",
    "SDL_JoyAxisEvent" => "SDL_JoyAxisEvent",
    "SDL_JoyBallEvent" => "SDL_JoyBallEvent",
    "SDL_JoyHatEvent" => "SDL_JoyHatEvent",
    "SDL_JoyButtonEvent" => "SDL_JoyButtonEvent",
    "SDL_JoyDeviceEvent" => "SDL_JoyDeviceEvent",
    "SDL_ControllerAxisEvent" => "SDL_ControllerAxisEvent",
    "SDL_ControllerButtonEvent" => "SDL_ControllerButtonEvent",
    "SDL_ControllerDeviceEvent" => "SDL_ControllerDeviceEvent",
    "SDL_AudioDeviceEvent" => "SDL_AudioDeviceEvent",
    "SDL_SensorEvent" => "SDL_SensorEvent",
    "SDL_QuitEvent" => "SDL_QuitEvent",
    "SDL_OSEvent" => "SDL_OSEvent",
    "SDL_DropEvent" => "SDL_DropEvent",
    "SDL_HapticEvent" => "SDL_HapticEvent",
    "SDL_DisplayEvent" => "SDL_DisplayEvent",
    "SDL_SysWMEvent" => "SDL_SysWMEvent",
    "SDL_ControllerTouchpadEvent" => "SDL_ControllerTouchpadEvent",
    "SDL_ControllerSensorEvent" => "SDL_ControllerSensorEvent",
    "SDL_AudioCVT" => "SDL_AudioCVT",
    "SDL_AudioSpec" => "SDL_AudioSpec",
    "SDL_AudioStream" => "SDL_AudioStream",
    "SDL_AssertData" => "SDL_AssertData",
    "SDL_AtomicInt" => "Int32",
    "SDL_AtomicUint" => "UInt32",
    "SDL_AtomicSint64" => "Int64",
    "SDL_AtomicUint64" => "UInt64",
    "SDL_BlitMap" => "SDL_BlitMap",
    "SDL_Color" => "SDL_Color",
    "SDL_DisplayMode" => "SDL_DisplayMode",
    "SDL_Finger" => "SDL_Finger",
    "SDL_FPoint" => "SDL_FPoint",
    "SDL_FRect" => "SDL_FRect",
    "SDL_GUID" => "SDL_GUID",
    "SDL_HapticDirection" => "SDL_HapticDirection",
    "SDL_HapticEffect" => "SDL_HapticEffect",
    "SDL_JoystickGUID" => "SDL_JoystickGUID",
    "SDL_Keysym" => "SDL_Keysym",
    "SDL_Locale" => "SDL_Locale",
    "SDL_Palette" => "SDL_Palette",
    "SDL_PixelFormat" => "SDL_PixelFormat",
    "SDL_Point" => "SDL_Point",
    "SDL_Rect" => "SDL_Rect",
    "SDL_RendererInfo" => "SDL_RendererInfo",
    "SDL_Surface" => "SDL_Surface",
    "SDL_Texture" => "SDL_Texture",
    "SDL_Thread" => "SDL_Thread",
    "SDL_TouchFingerEvent" => "SDL_TouchFingerEvent",
    "SDL_UserEvent" => "SDL_UserEvent",
    "SDL_Version" => "SDL_version",
    "SDL_Vertex" => "SDL_Vertex",
    "SDL_Window" => "SDL_Window",
    "SDL_Window *" => "SDL_Window",
    "SDL_Window **" => "SDL_Window",
    "SDL_Renderer" => "SDL_Renderer",
    "SDL_Event" => "SDL_Event",
    "SDL_Cursor" => "SDL_Cursor",
    "SDL_Joystick" => "SDL_Joystick",
    "SDL_GameController" => "SDL_GameController",
    "SDL_Haptic" => "SDL_Haptic",
    "SDL_GameControllerButtonBind" => "SDL_GameControllerButtonBind",
    "SDL_CommonEvent" => "SDL_CommonEvent",
    "SDL_WindowEvent" => "SDL_WindowEvent",
    "SDL_KeyboardEvent" => "SDL_KeyboardEvent",
    "SDL_TextEditingEvent" => "SDL_TextEditingEvent",
    "SDL_TextInputEvent" => "SDL_TextInputEvent",
    "SDL_MouseMotionEvent" => "SDL_MouseMotionEvent",
    "SDL_MouseButtonEvent" => "SDL_MouseButtonEvent",
    "SDL_MouseWheelEvent" => "SDL_MouseWheelEvent",
    "SDL_JoyAxisEvent" => "SDL_JoyAxisEvent",
    "SDL_JoyBallEvent" => "SDL_JoyBallEvent",
    "SDL_JoyHatEvent" => "SDL_JoyHatEvent",
    "SDL_JoyButtonEvent" => "SDL_JoyButtonEvent",
    "SDL_JoyDeviceEvent" => "SDL_JoyDeviceEvent",
    "SDL_ControllerAxisEvent" => "SDL_ControllerAxisEvent",
    "SDL_ControllerButtonEvent" => "SDL_ControllerButtonEvent",
    "SDL_ControllerDeviceEvent" => "SDL_ControllerDeviceEvent",
    "SDL_AudioDeviceEvent" => "SDL_AudioDeviceEvent",
    "SDL_SensorEvent" => "SDL_SensorEvent",
    "SDL_QuitEvent" => "SDL_QuitEvent",
    "SDL_OSEvent" => "SDL_OSEvent",
    "SDL_DropEvent" => "SDL_DropEvent",
    "SDL_HapticEvent" => "SDL_HapticEvent",
    "SDL_DisplayEvent" => "SDL_DisplayEvent",
    "SDL_SysWMEvent" => "SDL_SysWMEvent",
    "SDL_ControllerTouchpadEvent" => "SDL_ControllerTouchpadEvent",
    "SDL_ControllerSensorEvent" => "SDL_ControllerSensorEvent",
    "XUserHandle" => "Cvoid",
    "XTaskQueueHandle" => "Cvoid",
    "size_t" => "Csize_t",
    "SDL_SysWMinfo" => "Cvoid",
    "SDL_WindowsMessageHook" => "Cvoid",
    "wchar_t" => "Cwchar_t",
    "unsigned short" => "UInt16",
    "unsigned char" => "UInt8",
    "unsigned int" => "UInt32",
    "unsigned long" => "UInt32",
    "unsigned long long" => "UInt64",
    "unsigned long long int" => "UInt64",
    "unsigned long int" => "UInt32",
)

# LLVM type mapping for function declarations
const LLVM_TYPE_MAPPING = Dict(
    "Int32" => "i32",
    "UInt32" => "i32", 
    "UInt64" => "i64",
    "UInt16" => "i16",
    "UInt8" => "i8",
    "Int64" => "i64",
    "Int16" => "i16", 
    "Int8" => "i8",
    "Float32" => "float",
    "Float64" => "double",
    "Cvoid" => "void",
    "Ptr{UInt8}" => "i8*",
    "Ptr{SDL_Window}" => "i8*",
    "Ptr{SDL_Renderer}" => "i8*",
    "Ptr{SDL_Texture}" => "i8*",
    "Ptr{SDL_Surface}" => "i8*",
    "Ptr{SDL_Rect}" => "i8*",
    "Ptr{SDL_Event}" => "i8*",
    "Ptr{SDL_Color}" => "i8*",
    "Ptr{SDL_Point}" => "i8*",
    "Ptr{SDL_FRect}" => "i8*",
    "Ptr{SDL_FPoint}" => "i8*",
    "Ptr{SDL_DisplayMode}" => "i8*",
    "Ptr{SDL_RendererInfo}" => "i8*",
    "Ptr{SDL_version}" => "i8*",
    "Ptr{SDL_Locale}" => "i8*",
    "Ptr{SDL_Vertex}" => "i8*",
    "Ptr{SDL_Palette}" => "i8*",
    "Ptr{SDL_PixelFormat}" => "i8*",
    "Ptr{SDL_Cursor}" => "i8*",
    "Ptr{SDL_Joystick}" => "i8*",
    "Ptr{SDL_GameController}" => "i8*",
    "Ptr{SDL_Haptic}" => "i8*",
    "Ptr{Cvoid}" => "i8*",
    "Ptr{Cvoid}}" => "i8**",
    "Ptr{Ptr{SDL_Window}}" => "i8**",
    "Ptr{Ptr{SDL_Renderer}}" => "i8**",
    "Ptr{Ptr{SDL_Texture}}" => "i8**",
    "Ptr{Ptr{SDL_Surface}}" => "i8**",
    "Ptr{Ptr{SDL_Rect}}" => "i8**",
    "Ptr{Ptr{SDL_Event}}" => "i8**",
    "Ptr{Ptr{SDL_Color}}" => "i8**",
)

# Deprecated functions to skip
const DEPRECATED_FUNCTIONS = Set([
    "SDL_GetWMInfo",  # Deprecated in SDL2
    "SDL_WM_SetCaption",  # Deprecated in SDL2
    "SDL_WM_GetCaption",  # Deprecated in SDL2
    "SDL_WM_SetIcon",  # Deprecated in SDL2
    "SDL_WM_IconifyWindow",  # Deprecated in SDL2
    "SDL_WM_ToggleFullScreen",  # Deprecated in SDL2
    "SDL_WM_GrabInput",  # Deprecated in SDL2
    "SDL_WM_GetGrabInput",  # Deprecated in SDL2
    "SDL_EnableUNICODE",  # Deprecated in SDL2
    "SDL_EnableKeyRepeat",  # Deprecated in SDL2
    "SDL_GetKeyRepeat",  # Deprecated in SDL2
    "SDL_GetModState",  # Deprecated in SDL2
    "SDL_SetModState",  # Deprecated in SDL2
    "SDL_GetKeyState",  # Deprecated in SDL2
    "SDL_GetMouseState",  # Deprecated in SDL2
    "SDL_GetRelativeMouseState",  # Deprecated in SDL2
    "SDL_WarpMouse",  # Deprecated in SDL2
    "SDL_CreateRGBSurface",  # Deprecated in SDL2
    "SDL_CreateRGBSurfaceFrom",  # Deprecated in SDL2
    "SDL_LoadBMP",  # Deprecated in SDL2
    "SDL_SaveBMP",  # Deprecated in SDL2
    "SDL_SetColors",  # Deprecated in SDL2
    "SDL_SetPalette",  # Deprecated in SDL2
    "SDL_MapRGB",  # Deprecated in SDL2
    "SDL_MapRGBA",  # Deprecated in SDL2
    "SDL_GetRGB",  # Deprecated in SDL2
    "SDL_GetRGBA",  # Deprecated in SDL2
    "SDL_DisplayFormat",  # Deprecated in SDL2
    "SDL_DisplayFormatAlpha",  # Deprecated in SDL2
    "SDL_ConvertSurface",  # Deprecated in SDL2
    "SDL_UpperBlit",  # Deprecated in SDL2
    "SDL_LowerBlit",  # Deprecated in SDL2
    "SDL_FillRect",  # Deprecated in SDL2
    "SDL_UpdateRect",  # Deprecated in SDL2
    "SDL_UpdateRects",  # Deprecated in SDL2
    "SDL_Flip",  # Deprecated in SDL2
    "SDL_SetGamma",  # Deprecated in SDL2
    "SDL_SetGammaRamp",  # Deprecated in SDL2
    "SDL_GetGammaRamp",  # Deprecated in SDL2
    "SDL_JoystickOpened",  # Deprecated in SDL2
    "SDL_JoystickIndex",  # Deprecated in SDL2
    "SDL_JoystickGetAxis",  # Deprecated in SDL2
    "SDL_JoystickGetButton",  # Deprecated in SDL2
    "SDL_JoystickGetHat",  # Deprecated in SDL2
    "SDL_JoystickGetBall",  # Deprecated in SDL2
    "SDL_JoystickNumAxes",  # Deprecated in SDL2
    "SDL_JoystickNumButtons",  # Deprecated in SDL2
    "SDL_JoystickNumHats",  # Deprecated in SDL2
    "SDL_JoystickNumBalls",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceGUID",  # Deprecated in SDL2
    "SDL_JoystickGetGUID",  # Deprecated in SDL2
    "SDL_JoystickGetGUIDString",  # Deprecated in SDL2
    "SDL_JoystickGetGUIDFromString",  # Deprecated in SDL2
    "SDL_JoystickUpdate",  # Deprecated in SDL2
    "SDL_JoystickEventState",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceInstanceID",  # Deprecated in SDL2
    "SDL_JoystickInstanceID",  # Deprecated in SDL2
    "SDL_JoystickName",  # Deprecated in SDL2
    "SDL_JoystickNameForIndex",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceVendor",  # Deprecated in SDL2
    "SDL_JoystickGetVendor",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceProduct",  # Deprecated in SDL2
    "SDL_JoystickGetProduct",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceProductVersion",  # Deprecated in SDL2
    "SDL_JoystickGetProductVersion",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceType",  # Deprecated in SDL2
    "SDL_JoystickGetType",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceGUID",  # Deprecated in SDL2
    "SDL_JoystickGetGUID",  # Deprecated in SDL2
    "SDL_JoystickGetGUIDString",  # Deprecated in SDL2
    "SDL_JoystickGetGUIDFromString",  # Deprecated in SDL2
    "SDL_JoystickUpdate",  # Deprecated in SDL2
    "SDL_JoystickEventState",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceInstanceID",  # Deprecated in SDL2
    "SDL_JoystickInstanceID",  # Deprecated in SDL2
    "SDL_JoystickName",  # Deprecated in SDL2
    "SDL_JoystickNameForIndex",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceVendor",  # Deprecated in SDL2
    "SDL_JoystickGetVendor",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceProduct",  # Deprecated in SDL2
    "SDL_JoystickGetProduct",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceProductVersion",  # Deprecated in SDL2
    "SDL_JoystickGetProductVersion",  # Deprecated in SDL2
    "SDL_JoystickGetDeviceType",  # Deprecated in SDL2
    "SDL_JoystickGetType",  # Deprecated in SDL2
])

"""
Extract SDL function calls from the C file
"""
function extract_sdl_functions(c_file::String)
    functions = Set{String}()
    
    if !isfile(c_file)
        println("Warning: C file not found: $c_file")
        return functions
    end
    
    content = read(c_file, String)
    
    # Find SDL function calls using regex
    # This pattern matches SDL_ followed by alphanumeric characters and underscores
    sdl_pattern = r"SDL_[a-zA-Z_][a-zA-Z0-9_]*\s*\("
    matches = eachmatch(sdl_pattern, content)
    
    for match in matches
        func_name = match.match[1:end-1]  # Remove the opening parenthesis
        func_name = strip(func_name)
        
        # Skip if it's a deprecated function
        if func_name in DEPRECATED_FUNCTIONS
            continue
        end
        
        push!(functions, func_name)
    end
    
    return functions
end

"""
Parse SDL header files to extract function signatures
"""
function parse_sdl_headers(headers_dir::String)
    function_signatures = Dict{String, Tuple{String, Vector{Tuple{String, String}}}}()

    if !isdir(headers_dir)
        println("Warning: SDL headers directory not found: $headers_dir")
        return function_signatures
    end

    # Find all header files
    header_files = String[]
    for (root, dirs, files) in walkdir(headers_dir)
        for file in files
            if endswith(file, ".h")
                println("Found header file: $file")
                push!(header_files, joinpath(root, file))
            end
        end
    end

    # Parse each header file
    for header_file in header_files
        content = read(header_file, String)

        # Match function declarations of the form:
        # extern DECLSPEC return_type SDLCALL SDL_FunctionName(params...);
        func_pattern = r"extern\s+DECLSPEC\s+([^;]+?)\s+SDLCALL\s+SDL_([a-zA-Z_][a-zA-Z0-9_]*)\s*\(([^)]*)\)\s*;"
        matches = eachmatch(func_pattern, content)

        for match in matches
            return_type = strip(match[1])
            func_name = "SDL_" * match[2]
            params_str = strip(match[3])

            # Skip deprecated functions
            if func_name in DEPRECATED_FUNCTIONS
                continue
            end

            # Parse parameters
            params = Tuple{String, String}[]
            if !isempty(params_str) && params_str != "void"
                param_parts = split(params_str, ",")
                for param in param_parts
                    param = strip(param)
                    if !isempty(param)
                        if occursin(r"\(.*\)", param)
                            # Function pointer or complex type
                            param_type = param
                            param_name = ""
                        else
                            parts = split(param)

                            if !isempty(parts)
                                last = parts[end]
                                stars = ""
                                # Pull leading * from param name into type
                                # If there are multiple *s, we need to do a double wrap ie void** -> Ptr{Ptr{Cvoid}}
                                
                                while startswith(last, "*")
                                    stars *= "*"
                                    last = last[2:end]
                                end
                                param_name = last
                                base_type = join(parts[1:end-1], " ")
                                param_type = strip(base_type * " " * stars)
                            else
                                param_type = param
                                param_name = ""
                            end
                        end
                        push!(params, (param_type, param_name))
                    end
                end
            end

            function_signatures[func_name] = (return_type, params)
        end
    end

    return function_signatures
end


"""
Convert C type to Julia type
"""
function c_to_julia_type(c_type::String)
    c_type = strip(c_type)
    
    # Handle const qualifier
    if startswith(c_type, "const ")
        c_type = c_type[7:end]
    end
    
    # Handle pointer types
    if endswith(c_type, "*")
        #println("Pointer type: $c_type")
        base_type = strip(c_type[1:end-1])
        julia_base = get(TYPE_MAPPING, base_type, base_type)
        # if has multiple *s, we need to do a double wrap ie void** -> Ptr{Ptr{Cvoid}}
        if count(c -> c == '*', c_type) > 1
            return "Ptr{Ptr{$julia_base}}"
        else
            return "Ptr{$julia_base}"
        end
    end
    
    # Handle basic types
    return get(TYPE_MAPPING, c_type, c_type)
end

"""
Convert Julia type to LLVM type
"""
function julia_to_llvm_type(julia_type::Union{String, SubString{String}})
    julia_type = String(julia_type)
    return get(LLVM_TYPE_MAPPING, julia_type, "i8*")
end

"""
Generate LLVM IR for function declaration
"""
function generate_llvm_declaration(func_name::String, return_type::String, params::Vector{Tuple{String, String}})
    # Convert return type
    julia_return = c_to_julia_type(return_type)
    llvm_return = julia_to_llvm_type(julia_return)
    
    # Convert parameter types
    llvm_params = String[]
    for (param_type, _) in params
        julia_param = c_to_julia_type(param_type)
        llvm_param = julia_to_llvm_type(julia_param)
        push!(llvm_params, llvm_param)
    end
    
    param_str = join(llvm_params, ", ")
    return "declare $llvm_return @$func_name($param_str) nounwind\n"
end

"""
Generate LLVM IR for function call
"""
function generate_llvm_call(func_name::String, return_type::String, params::Vector{Tuple{String, String}})
    # Convert return type
    julia_return = c_to_julia_type(return_type)
    llvm_return = julia_to_llvm_type(julia_return)
    
    # Convert parameter types
    llvm_params = String[]
    julia_params = String[]
    param_names = String[]
    
    for (i, (param_type, param_name)) in enumerate(params)
        julia_param = c_to_julia_type(param_type)
        llvm_param = julia_to_llvm_type(julia_param)
        
        push!(llvm_params, llvm_param)
        push!(julia_params, julia_param)
        
        # Generate parameter name for LLVM
        if isempty(param_name)
            push!(param_names, "%" * string(i-1))
        else
            push!(param_names, "%" * param_name)
        end
    end
    
    param_names_and_types = ""
    for i in eachindex(llvm_params)
        param_names_and_types *= "$(llvm_params[i]) $(param_names[i])$(i == length(llvm_params) ? "" : ", ")"
    end
    if llvm_return == "void"
        return "define void @main(" * param_names_and_types * ") {\n" *
               "        entry:\n" *
               "            call void @" * func_name * "(" * param_names_and_types * ")\n" *
               "            ret void\n" *
               "        }"
    else
        return "define " * llvm_return * " @main(" * param_names_and_types * ") {\n" *
               "        entry:\n" *
               "            %result = call " * llvm_return * " @" * func_name * "(" * param_names_and_types * ")\n" *
               "            ret " * llvm_return * " %result\n" *
               "        }"
    end
end

"""
Generate Julia function signature
"""
function generate_julia_signature(func_name::String, return_type::String, params::Vector{Tuple{String, String}})
    julia_return = c_to_julia_type(return_type)
    julia_params = String[]
    
    for (param_type, param_name) in params
        julia_param = c_to_julia_type(param_type)
        if isempty(param_name)
            push!(julia_params, julia_param)
        else
            push!(julia_params, "$param_name::$julia_param")
        end
    end
    
    param_str = join(julia_params, ", ")
    return "function llvm_$func_name($param_str)::$julia_return"
end

"""
Generate Julia tuple type for llvmcall
"""
function generate_julia_tuple_type(params::Vector{Tuple{String, String}})
    julia_types = String[]
    
    for (param_type, _) in params
        julia_param = c_to_julia_type(param_type)
        push!(julia_types, julia_param)
    end
    
    if isempty(julia_types)
        return "Tuple{}"
    else
        return "Tuple{" * join(julia_types, ", ") * "}"
    end
end

"""
Generate Julia parameter list for llvmcall
"""
function generate_julia_param_list(params::Vector{Tuple{String, String}})
    param_names = String[]
    
    for (_, param_name) in params
        if isempty(param_name)
            push!(param_names, "arg" * string(length(param_names) + 1))
        else
            push!(param_names, param_name)
        end
    end
    
    return join(param_names, ", ")
end

"""
Generate complete Julia binding function
"""
function generate_julia_binding(func_name::String, return_type::String, params::Vector{Tuple{String, String}})
    # Generate components
    julia_sig = generate_julia_signature(func_name, return_type, params)
    julia_return = c_to_julia_type(return_type)
    julia_tuple = generate_julia_tuple_type(params)
    julia_params = generate_julia_param_list(params)
    
    # Generate LLVM IR
    llvm_decl = generate_llvm_declaration(func_name, return_type, params)
    llvm_call = generate_llvm_call(func_name, return_type, params)
    
    # Original C signature for comment
    param_str = join([isempty(name) ? type : type * " " * name for (type, name) in params], ", ")
    c_signature = return_type * " " * func_name * "(" * param_str * ")"
    
    # Generate the complete function
    return "
    # Original C signature: $c_signature
    $julia_sig
        Base.llvmcall((\"\"\"
        $llvm_decl
        $llvm_call
        \"\"\", \"main\"), $julia_return, $julia_tuple, $julia_params)
    end"
end


"""
Main function to generate all bindings
"""
function generate_bindings()
    println("Generating SDL bindings...")
    
    # Extract SDL functions from C file
    println("Extracting SDL functions from $C_FILE...")
    sdl_functions = extract_sdl_functions(C_FILE)
    println("Found $(length(sdl_functions)) SDL function calls")
    
    # Parse SDL headers
    println("Parsing SDL headers from $SDL_HEADERS_DIR...")
    function_signatures = parse_sdl_headers(SDL_HEADERS_DIR)
    println("Found $(length(function_signatures)) function signatures in headers")
    println(function_signatures)
    
    # Generate bindings
    println("Generating Julia bindings...")
    bindings = String[]
    
    # Add header comment
    header_comment = "# Auto-generated SDL bindings using llvmcall\n" *
                     "# Source: " * C_FILE * "\n" *
                     "# Headers: " * SDL_HEADERS_DIR * "\n\n"
    push!(bindings, header_comment)
    
    skip_functions = ["SDL_UIKitRunApp", "SDL_Vulkan_CreateSurface", "SDL_WinRTGetFSPathUNICODE", "SDL_WinRTGetFSPathUTF8", "SDL_hid_enumerate", "SDL_hid_get_feature_report", "SDL_hid_open", "SDL_hid_open_path"]
    # Generate binding for each function
    for func_name in sort(collect(keys(function_signatures)))
        if func_name in skip_functions
            continue
        end
        if haskey(function_signatures, func_name)
            return_type, params = function_signatures[func_name]
            binding = generate_julia_binding(func_name, return_type, params)
            push!(bindings, binding)
        else
            println("Warning: No signature found for $func_name")
        end
    end
    
    # Write to output file
    println("Writing bindings to $OUTPUT_FILE...")
    write(OUTPUT_FILE, join(bindings, "\n"))
    
    println("Generated $(length(bindings) - 1) binding functions")
    println("Bindings written to $OUTPUT_FILE")
end

# Run the generator
if abspath(PROGRAM_FILE) == @__FILE__
    generate_bindings()
end 