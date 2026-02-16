#!/usr/bin/env julia

"""
OpenGL Binding Generator

This script generates Julia llvmcall bindings for OpenGL functions
by parsing OpenGL header files (similar to generate_sdl_bindings.jl).
"""

using Dates

# Configuration
const GL_HEADER_FILE = "emsdk/upstream/emscripten/system/include/GLES/gl.h"
const OUTPUT_FILE = "llvm_bindings_opengl.jl"

# Type mapping from OpenGL types to Julia/LLVM types
const GL_TYPE_MAPPING = Dict(
    "void" => ("Cvoid", "void"),
    "GLenum" => ("UInt32", "i32"),
    "GLbitfield" => ("UInt32", "i32"),
    "GLboolean" => ("UInt8", "i8"),
    "GLbyte" => ("Int8", "i8"),
    "GLubyte" => ("UInt8", "i8"),
    "GLshort" => ("Int16", "i16"),
    "GLushort" => ("UInt16", "i16"),
    "GLint" => ("Int32", "i32"),
    "GLuint" => ("UInt32", "i32"),
    "GLsizei" => ("Int32", "i32"),
    "GLfloat" => ("Float32", "float"),
    "GLdouble" => ("Float64", "double"),
    "GLclampf" => ("Float32", "float"),
    "GLclampd" => ("Float64", "double"),
    "GLclampx" => ("Int32", "i32"),
    "GLfixed" => ("Int32", "i32"),
    "GLsizeiptr" => ("Int64", "i64"),
    "GLintptr" => ("Int64", "i64"),
)

const LLVM_TYPE_MAPPING = Dict(
    "Cvoid" => "void",
    "UInt32" => "i32",
    "Int32" => "i32",
    "UInt8" => "i8",
    "Int8" => "i8",
    "UInt16" => "i16",
    "Int16" => "i16",
    "Float32" => "float",
    "Float64" => "double",
    "Int64" => "i64",
    "Ptr{Cvoid}" => "i8*",
    "Ptr{UInt8}" => "i8*",
    "Ptr{Int32}" => "i8*",
    "Ptr{Float32}" => "i8*",
)

function map_gl_type_to_julia(gl_type::String)::Tuple{String,String}
    gl_type = strip(gl_type)

    # Handle const qualifier
    is_const = startswith(gl_type, "const ")
    if is_const
        gl_type = gl_type[7:end]
    end

    # Count asterisks (handle multiple pointers like void**)
    asterisk_count = 0
    temp_type = gl_type
    while endswith(temp_type, "*")
        asterisk_count += 1
        temp_type = strip(temp_type[1:end-1])
    end

    base_type = temp_type

    # Handle pointer types
    if asterisk_count > 0
        if haskey(GL_TYPE_MAPPING, base_type)
            julia_base, _ = GL_TYPE_MAPPING[base_type]
        else
            julia_base = "Cvoid"
        end

        # Build nested Ptr types for multiple pointers
        julia_type = julia_base
        for _ in 1:asterisk_count
            julia_type = "Ptr{$julia_type}"
        end
        return (julia_type, "i8*")
    end

    # Handle basic types
    if haskey(GL_TYPE_MAPPING, gl_type)
        return GL_TYPE_MAPPING[gl_type]
    end

    # Default fallback
    return ("UInt32", "i32")
end

function julia_to_llvm_type(julia_type::String)::String
    return get(LLVM_TYPE_MAPPING, julia_type, "i8*")
end

# Parse OpenGL header file to extract function signatures
function parse_opengl_header(header_file::String)
    function_signatures = Dict{String,Tuple{String,Vector{Tuple{String,String}}}}()

    if !isfile(header_file)
        println("Warning: OpenGL header file not found: $header_file")
        return function_signatures
    end

    content = read(header_file, String)

    # Match function declarations of the form:
    # GL_API return_type GL_APIENTRY glFunctionName(params...);
    # Pattern: GL_API [const] return_type GL_APIENTRY glFunctionName(params);
    func_pattern = r"GL_API\s+(?:const\s+)?([^\s]+)\s+GL_APIENTRY\s+(gl[a-zA-Z0-9_]+)\s*\(([^)]*)\)\s*;"
    matches = eachmatch(func_pattern, content)

    for match in matches
        return_type = strip(match[1])
        func_name = match[2]
        params_str = strip(match[3])

        # Parse parameters
        params = Tuple{String,String}[]
        if !isempty(params_str) && params_str != "void"
            # Split by comma, but be careful with function pointers
            param_parts = split(params_str, ',')
            for param_part in param_parts
                param_part = strip(param_part)
                # Match: [const] type [*...] [name]
                # Handle cases like: "const GLfloat *eqn", "GLenum func", "void **params"

                # Parse parameter: [const] type [*...] [name]
                # Examples: "void **params", "const GLfloat *eqn", "GLenum func"

                # First, try to find the parameter name (last identifier that's not part of type keywords)
                # Split by spaces and asterisks
                words = split(param_part, r"[\s*]+")
                words = filter(!isempty, words)

                # Common type keywords that shouldn't be names
                type_keywords = Set(["const", "void", "GLenum", "GLint", "GLuint", "GLfloat", "GLdouble",
                    "GLboolean", "GLbitfield", "GLsizei", "GLsizeiptr", "GLintptr",
                    "GLbyte", "GLubyte", "GLshort", "GLushort", "GLfixed", "GLclampf",
                    "GLclampd", "GLclampx"])

                # Find the last word that's not a type keyword - that's the parameter name
                param_name = ""
                type_words = String[]
                for word in words
                    if word in type_keywords || word == "*"
                        push!(type_words, word)
                    else
                        # This might be the parameter name, but continue to find the last one
                        if param_name != ""
                            # We had a previous candidate, add it to type_words
                            push!(type_words, param_name)
                        end
                        param_name = word
                    end
                end

                # Reconstruct the type part (everything except the parameter name)
                # Count asterisks in the original string
                asterisk_count = count(c -> c == '*', param_part)

                # Build type string
                if param_name != ""
                    # Remove the parameter name from the original string to get the type
                    type_str = replace(param_part, Regex("\\b" * param_name * "\\b") => "", count=1)
                    type_str = strip(type_str)
                else
                    type_str = param_part
                end

                push!(params, (type_str, param_name))
            end
        end

        function_signatures[func_name] = (return_type, params)
    end

    return function_signatures
end

function generate_llvm_declaration(func_name::String, return_type::String, params::Vector{Tuple{String,String}})
    julia_return, llvm_return = map_gl_type_to_julia(return_type)

    param_types = String[]
    for (param_type, _) in params
        _, llvm_param = map_gl_type_to_julia(param_type)
        push!(param_types, llvm_param)
    end

    param_str = isempty(param_types) ? "" : join(param_types, ", ")
    return "    declare $llvm_return @$func_name($param_str) nounwind"
end

function generate_llvm_call(func_name::String, return_type::String, params::Vector{Tuple{String,String}})
    julia_return, llvm_return = map_gl_type_to_julia(return_type)

    param_names = String[]
    param_types = String[]
    for (i, (param_type, param_name)) in enumerate(params)
        name = isempty(param_name) ? "%p$i" : "%$param_name"
        push!(param_names, name)
        _, llvm_param = map_gl_type_to_julia(param_type)
        push!(param_types, llvm_param)
    end

    param_str = isempty(param_names) ? "" : join([t * " " * n for (t, n) in zip(param_types, param_names)], ", ")
    # Include types in the call (matching manual bindings format)
    call_params = String[]
    for (t, n) in zip(param_types, param_names)
        push!(call_params, "$t $n")
    end
    call_str = isempty(call_params) ? "@$func_name()" : "@$func_name($(join(call_params, ", ")))"

    if return_type == "void"
        return """
    define $llvm_return @main($param_str) {
    entry:
        call $llvm_return $call_str
        ret void
    }"""
    else
        return """
    define $llvm_return @main($param_str) {
    entry:
        %result = call $llvm_return $call_str
        ret $llvm_return %result
    }"""
    end
end

function generate_julia_signature(func_name::String, return_type::String, params::Vector{Tuple{String,String}})
    julia_return, _ = map_gl_type_to_julia(return_type)

    param_list = String[]
    for (param_type, param_name) in params
        julia_type, _ = map_gl_type_to_julia(param_type)
        name = isempty(param_name) ? "arg" : param_name
        push!(param_list, "$name::$julia_type")
    end

    param_str = isempty(param_list) ? "" : join(param_list, ", ")
    return "function llvm_$func_name($param_str)::$julia_return"
end

function generate_julia_tuple_type(params::Vector{Tuple{String,String}})
    types = String[]
    for (param_type, _) in params
        julia_type, _ = map_gl_type_to_julia(param_type)
        push!(types, julia_type)
    end

    return isempty(types) ? "Tuple{}" : "Tuple{$(join(types, ", "))}"
end

function generate_julia_param_list(params::Vector{Tuple{String,String}})
    names = String[]
    for (_, param_name) in params
        name = isempty(param_name) ? "arg" : param_name
        push!(names, name)
    end

    return isempty(names) ? "" : join(names, ", ")
end

function generate_binding(func_name::String, return_type::String, params::Vector{Tuple{String,String}})
    julia_sig = generate_julia_signature(func_name, return_type, params)
    julia_return, _ = map_gl_type_to_julia(return_type)
    julia_tuple = generate_julia_tuple_type(params)
    julia_params = generate_julia_param_list(params)

    llvm_decl = generate_llvm_declaration(func_name, return_type, params)
    llvm_call = generate_llvm_call(func_name, return_type, params)

    param_str = join([isempty(name) ? type : type * " " * name for (type, name) in params], ", ")
    c_signature = return_type * " " * func_name * "(" * param_str * ")"

    return """
# Original C signature: $c_signature
$julia_sig
    Base.llvmcall((\"\"\"
$llvm_decl

$llvm_call
    \"\"\", \"main\"), $julia_return, $julia_tuple, $julia_params)
end"""
end

function main()
    println("Generating OpenGL bindings...")

    # Parse OpenGL header
    println("Parsing OpenGL header from $GL_HEADER_FILE...")
    function_signatures = parse_opengl_header(GL_HEADER_FILE)
    println("Found $(length(function_signatures)) function signatures in header")

    bindings = String[]

    # Add header comment
    header_comment = """# Auto-generated OpenGL bindings using llvmcall
# Generated: $(now())
# Header: $GL_HEADER_FILE
#
# These functions call OpenGL functions directly via LLVM
# For web builds, Emscripten will map these to WebGL 2.0 calls
# For desktop builds, link against libGL or libGLESv2

"""
    push!(bindings, header_comment)

    # Generate bindings for each function
    for func_name in sort(collect(keys(function_signatures)))
        return_type, params = function_signatures[func_name]
        binding = generate_binding(func_name, return_type, params)
        push!(bindings, binding)
    end

    # Write to output file
    println("Writing bindings to $OUTPUT_FILE...")
    write(OUTPUT_FILE, join(bindings, "\n\n"))

    println("Generated $(length(function_signatures)) OpenGL binding functions")
    println("Bindings written to $OUTPUT_FILE")
    println("\nTo use these bindings, add to your code:")
    println("  include(\"$OUTPUT_FILE\")")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
