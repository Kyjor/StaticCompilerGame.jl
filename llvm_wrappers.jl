function call_print_string(ptr::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    declare i32 @print_string(i8*) nounwind
    define i32 @main(i8*) {
    entry:
       %result = call i32 @print_string(i8* %0)
       ret i32 %result
    }
    """, "main"), Int32, Tuple{Ptr{UInt8}}, ptr)
end

function wasm_malloc(size::UInt32)::Ptr{Cvoid}
    Base.llvmcall(("""
        declare noalias i8* @malloc(i32) nounwind

        define i8* @my_malloc(i32 %size) {
        entry:
            %ptr = call noalias i8* @malloc(i32 %size)
            ret i8* %ptr
        }
    """, "my_malloc"), Ptr{Cvoid}, Tuple{UInt32}, size)
end

function wasm_free(ptr::Ptr{Cvoid})
    Base.llvmcall(("""
        declare void @free(i8*) nounwind

        define void @my_free(i8* %ptr) {
        entry:
            call void @free(i8* %ptr)
            ret void
        }
    """, "my_free"), Nothing, Tuple{Ptr{Cvoid}}, ptr)
end

function wasm_free(ptr::Ptr{UInt8})
    Base.llvmcall(("""
        declare void @free(i8*) nounwind

        define void @my_free(i8* %ptr) {
        entry:
            call void @free(i8* %ptr)
            ret void
        }
    """, "my_free"), Nothing, Tuple{Ptr{UInt8}}, ptr)
end


# ============================================================================
# Custom Global Variable Access Functions (C extern pattern)
# ============================================================================
# These functions access static variables in sdl_module.c
# This allows shared mutable globals across separately-compiled Julia functions

# Get the hi global variable
function llvm_get_hi()::Int32
    Base.llvmcall(("""
    declare i32 @get_hi() nounwind

    define i32 @main() {
    entry:
        %result = call i32 @get_hi()
        ret i32 %result
    }
    """, "main"), Int32, Tuple{},)
end

# Set the hi global variable
function llvm_set_hi(value::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @set_hi(i32) nounwind

    define void @main(i32 %value) {
    entry:
        call void @set_hi(i32 %value)
        ret void
    }
    """, "main"), Cvoid, Tuple{Int32}, value)
end

# ============================================================================
# OpenGL ES 3.0 Function Bindings
# ============================================================================
# These functions call OpenGL ES 3.0 functions directly via LLVM
# For web builds, Emscripten will map these to WebGL 2.0 calls

# glClear - Clear buffers to preset values
function llvm_glClear(mask::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glClear(i32) nounwind

    define void @main(i32 %mask) {
    entry:
        call void @glClear(i32 %mask)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt32}, mask)
end

# glViewport - Set the viewport
function llvm_glViewport(x::Int32, y::Int32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glViewport(i32, i32, i32, i32) nounwind

    define void @main(i32 %x, i32 %y, i32 %width, i32 %height) {
    entry:
        call void @glViewport(i32 %x, i32 %y, i32 %width, i32 %height)
        ret void
    }
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, x, y, width, height)
end

# glClearColor - Specify clear values for the color buffers
function llvm_glClearColor(red::Float32, green::Float32, blue::Float32, alpha::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearColor(float, float, float, float) nounwind

    define void @main(float %red, float %green, float %blue, float %alpha) {
    entry:
        call void @glClearColor(float %red, float %green, float %blue, float %alpha)
        ret void
    }
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32}, red, green, blue, alpha)
end

# glEnable - Enable server-side GL capabilities
function llvm_glEnable(cap::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glEnable(i32) nounwind

    define void @main(i32 %cap) {
    entry:
        call void @glEnable(i32 %cap)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt32}, cap)
end

# glDisable - Disable server-side GL capabilities
function llvm_glDisable(cap::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDisable(i32) nounwind

    define void @main(i32 %cap) {
    entry:
        call void @glDisable(i32 %cap)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt32}, cap)
end

# glGetError - Return error information
function llvm_glGetError()::UInt32
    Base.llvmcall(("""
    declare i32 @glGetError() nounwind

    define i32 @main() {
    entry:
        %result = call i32 @glGetError()
        ret i32 %result
    }
    """, "main"), UInt32, Tuple{},)
end

# glDepthMask - Enable or disable writing into the depth buffer
function llvm_glDepthMask(flag::UInt8)::Cvoid
    Base.llvmcall(("""
    declare void @glDepthMask(i8) nounwind

    define void @main(i8 %flag) {
    entry:
        call void @glDepthMask(i8 %flag)
        ret void
    }
    """, "main"), Cvoid, Tuple{UInt8}, flag)
end

# glClearDepthf - Specify the clear value for the depth buffer
function llvm_glClearDepthf(depth::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearDepthf(float) nounwind

    define void @main(float %depth) {
    entry:
        call void @glClearDepthf(float %depth)
        ret void
    }
    """, "main"), Cvoid, Tuple{Float32}, depth)
end