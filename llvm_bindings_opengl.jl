# Auto-generated OpenGL bindings using llvmcall
# Generated: 2026-02-16T15:33:23.906
# Header: emsdk/upstream/emscripten/system/include/GLES/gl.h
# 
# These functions call OpenGL functions directly via LLVM
# For web builds, Emscripten will map these to WebGL 2.0 calls
# For desktop builds, link against libGL or libGLESv2



# Original C signature: void glActiveTexture(GLenum texture)
function llvm_glActiveTexture(texture::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glActiveTexture(i32) nounwind

define void @main(i32 %texture) {
entry:
    call void @glActiveTexture(i32 %texture)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, texture)
end

# Original C signature: void glAlphaFunc(GLenum func, GLfloat ref)
function llvm_glAlphaFunc(func::UInt32, ref::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glAlphaFunc(i32, float) nounwind

define void @main(i32 %func, float %ref) {
entry:
    call void @glAlphaFunc(i32 %func, float %ref)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32}, func, ref)
end

# Original C signature: void glAlphaFuncx(GLenum func, GLfixed ref)
function llvm_glAlphaFuncx(func::UInt32, ref::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glAlphaFuncx(i32, i32) nounwind

define void @main(i32 %func, i32 %ref) {
entry:
    call void @glAlphaFuncx(i32 %func, i32 %ref)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32}, func, ref)
end

# Original C signature: void glBindBuffer(GLenum target, GLuint buffer)
function llvm_glBindBuffer(target::UInt32, buffer::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindBuffer(i32, i32) nounwind

define void @main(i32 %target, i32 %buffer) {
entry:
    call void @glBindBuffer(i32 %target, i32 %buffer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, buffer)
end

# Original C signature: void glBindTexture(GLenum target, GLuint texture)
function llvm_glBindTexture(target::UInt32, texture::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindTexture(i32, i32) nounwind

define void @main(i32 %target, i32 %texture) {
entry:
    call void @glBindTexture(i32 %target, i32 %texture)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, texture)
end

# Original C signature: void glBlendFunc(GLenum sfactor, GLenum dfactor)
function llvm_glBlendFunc(sfactor::UInt32, dfactor::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlendFunc(i32, i32) nounwind

define void @main(i32 %sfactor, i32 %dfactor) {
entry:
    call void @glBlendFunc(i32 %sfactor, i32 %dfactor)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, sfactor, dfactor)
end

# Original C signature: void glBufferData(GLenum target, GLsizeiptr size, const void * data, GLenum usage)
function llvm_glBufferData(target::UInt32, size::Int64, data::Ptr{Cvoid}, usage::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBufferData(i32, i64, i8*, i32) nounwind

define void @main(i32 %target, i64 %size, i8* %data, i32 %usage) {
entry:
    call void @glBufferData(i32 %target, i64 %size, i8* %data, i32 %usage)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int64, Ptr{Cvoid}, UInt32}, target, size, data, usage)
end

# Original C signature: void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const void * data)
function llvm_glBufferSubData(target::UInt32, offset::Int64, size::Int64, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glBufferSubData(i32, i64, i64, i8*) nounwind

define void @main(i32 %target, i64 %offset, i64 %size, i8* %data) {
entry:
    call void @glBufferSubData(i32 %target, i64 %offset, i64 %size, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int64, Int64, Ptr{Cvoid}}, target, offset, size, data)
end

# Original C signature: void glClear(GLbitfield mask)
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

# Original C signature: void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
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

# Original C signature: void glClearColorx(GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha)
function llvm_glClearColorx(red::Int32, green::Int32, blue::Int32, alpha::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearColorx(i32, i32, i32, i32) nounwind

define void @main(i32 %red, i32 %green, i32 %blue, i32 %alpha) {
entry:
    call void @glClearColorx(i32 %red, i32 %green, i32 %blue, i32 %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, red, green, blue, alpha)
end

# Original C signature: void glClearDepthf(GLfloat d)
function llvm_glClearDepthf(d::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearDepthf(float) nounwind

define void @main(float %d) {
entry:
    call void @glClearDepthf(float %d)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32}, d)
end

# Original C signature: void glClearDepthx(GLfixed depth)
function llvm_glClearDepthx(depth::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearDepthx(i32) nounwind

define void @main(i32 %depth) {
entry:
    call void @glClearDepthx(i32 %depth)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32}, depth)
end

# Original C signature: void glClearStencil(GLint s)
function llvm_glClearStencil(s::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearStencil(i32) nounwind

define void @main(i32 %s) {
entry:
    call void @glClearStencil(i32 %s)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32}, s)
end

# Original C signature: void glClientActiveTexture(GLenum texture)
function llvm_glClientActiveTexture(texture::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glClientActiveTexture(i32) nounwind

define void @main(i32 %texture) {
entry:
    call void @glClientActiveTexture(i32 %texture)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, texture)
end

# Original C signature: void glClipPlanef(GLenum p, const GLfloat * eqn)
function llvm_glClipPlanef(p::UInt32, eqn::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glClipPlanef(i32, i8*) nounwind

define void @main(i32 %p, i8* %eqn) {
entry:
    call void @glClipPlanef(i32 %p, i8* %eqn)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, p, eqn)
end

# Original C signature: void glClipPlanex(GLenum plane, const GLfixed * equation)
function llvm_glClipPlanex(plane::UInt32, equation::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glClipPlanex(i32, i8*) nounwind

define void @main(i32 %plane, i8* %equation) {
entry:
    call void @glClipPlanex(i32 %plane, i8* %equation)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, plane, equation)
end

# Original C signature: void glColor4f(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
function llvm_glColor4f(red::Float32, green::Float32, blue::Float32, alpha::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glColor4f(float, float, float, float) nounwind

define void @main(float %red, float %green, float %blue, float %alpha) {
entry:
    call void @glColor4f(float %red, float %green, float %blue, float %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32}, red, green, blue, alpha)
end

# Original C signature: void glColor4ub(GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha)
function llvm_glColor4ub(red::UInt8, green::UInt8, blue::UInt8, alpha::UInt8)::Cvoid
    Base.llvmcall(("""
    declare void @glColor4ub(i8, i8, i8, i8) nounwind

define void @main(i8 %red, i8 %green, i8 %blue, i8 %alpha) {
entry:
    call void @glColor4ub(i8 %red, i8 %green, i8 %blue, i8 %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt8, UInt8, UInt8, UInt8}, red, green, blue, alpha)
end

# Original C signature: void glColor4x(GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha)
function llvm_glColor4x(red::Int32, green::Int32, blue::Int32, alpha::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glColor4x(i32, i32, i32, i32) nounwind

define void @main(i32 %red, i32 %green, i32 %blue, i32 %alpha) {
entry:
    call void @glColor4x(i32 %red, i32 %green, i32 %blue, i32 %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, red, green, blue, alpha)
end

# Original C signature: void glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)
function llvm_glColorMask(red::UInt8, green::UInt8, blue::UInt8, alpha::UInt8)::Cvoid
    Base.llvmcall(("""
    declare void @glColorMask(i8, i8, i8, i8) nounwind

define void @main(i8 %red, i8 %green, i8 %blue, i8 %alpha) {
entry:
    call void @glColorMask(i8 %red, i8 %green, i8 %blue, i8 %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt8, UInt8, UInt8, UInt8}, red, green, blue, alpha)
end

# Original C signature: void glColorPointer(GLint size, GLenum type, GLsizei stride, const void * pointer)
function llvm_glColorPointer(size::Int32, type::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glColorPointer(i32, i32, i32, i8*) nounwind

define void @main(i32 %size, i32 %type, i32 %stride, i8* %pointer) {
entry:
    call void @glColorPointer(i32 %size, i32 %type, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, Int32, Ptr{Cvoid}}, size, type, stride, pointer)
end

# Original C signature: void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void * data)
function llvm_glCompressedTexImage2D(target::UInt32, level::Int32, internalformat::UInt32, width::Int32, height::Int32, border::Int32, imageSize::Int32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glCompressedTexImage2D(i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %imageSize, i8* %data) {
entry:
    call void @glCompressedTexImage2D(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %imageSize, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32, Int32, Int32, Ptr{Cvoid}}, target, level, internalformat, width, height, border, imageSize, data)
end

# Original C signature: void glCompressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void * data)
function llvm_glCompressedTexSubImage2D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, width::Int32, height::Int32, format::UInt32, imageSize::Int32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glCompressedTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %imageSize, i8* %data) {
entry:
    call void @glCompressedTexSubImage2D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %imageSize, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, UInt32, Int32, Ptr{Cvoid}}, target, level, xoffset, yoffset, width, height, format, imageSize, data)
end

# Original C signature: void glCopyTexImage2D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)
function llvm_glCopyTexImage2D(target::UInt32, level::Int32, internalformat::UInt32, x::Int32, y::Int32, width::Int32, height::Int32, border::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glCopyTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %x, i32 %y, i32 %width, i32 %height, i32 %border) {
entry:
    call void @glCopyTexImage2D(i32 %target, i32 %level, i32 %internalformat, i32 %x, i32 %y, i32 %width, i32 %height, i32 %border)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32, Int32, Int32, Int32}, target, level, internalformat, x, y, width, height, border)
end

# Original C signature: void glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
function llvm_glCopyTexSubImage2D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, x::Int32, y::Int32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glCopyTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %x, i32 %y, i32 %width, i32 %height) {
entry:
    call void @glCopyTexSubImage2D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %x, i32 %y, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, Int32, Int32}, target, level, xoffset, yoffset, x, y, width, height)
end

# Original C signature: void glCullFace(GLenum mode)
function llvm_glCullFace(mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glCullFace(i32) nounwind

define void @main(i32 %mode) {
entry:
    call void @glCullFace(i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mode)
end

# Original C signature: void glDeleteBuffers(GLsizei n, const GLuint * buffers)
function llvm_glDeleteBuffers(n::Int32, buffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteBuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %buffers) {
entry:
    call void @glDeleteBuffers(i32 %n, i8* %buffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, buffers)
end

# Original C signature: void glDeleteTextures(GLsizei n, const GLuint * textures)
function llvm_glDeleteTextures(n::Int32, textures::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteTextures(i32, i8*) nounwind

define void @main(i32 %n, i8* %textures) {
entry:
    call void @glDeleteTextures(i32 %n, i8* %textures)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, textures)
end

# Original C signature: void glDepthFunc(GLenum func)
function llvm_glDepthFunc(func::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDepthFunc(i32) nounwind

define void @main(i32 %func) {
entry:
    call void @glDepthFunc(i32 %func)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, func)
end

# Original C signature: void glDepthMask(GLboolean flag)
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

# Original C signature: void glDepthRangef(GLfloat n, GLfloat f)
function llvm_glDepthRangef(n::Float32, f::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glDepthRangef(float, float) nounwind

define void @main(float %n, float %f) {
entry:
    call void @glDepthRangef(float %n, float %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32}, n, f)
end

# Original C signature: void glDepthRangex(GLfixed n, GLfixed f)
function llvm_glDepthRangex(n::Int32, f::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glDepthRangex(i32, i32) nounwind

define void @main(i32 %n, i32 %f) {
entry:
    call void @glDepthRangex(i32 %n, i32 %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32}, n, f)
end

# Original C signature: void glDisable(GLenum cap)
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

# Original C signature: void glDisableClientState(GLenum array)
function llvm_glDisableClientState(array::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDisableClientState(i32) nounwind

define void @main(i32 %array) {
entry:
    call void @glDisableClientState(i32 %array)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, array)
end

# Original C signature: void glDrawArrays(GLenum mode, GLint first, GLsizei count)
function llvm_glDrawArrays(mode::UInt32, first::Int32, count::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glDrawArrays(i32, i32, i32) nounwind

define void @main(i32 %mode, i32 %first, i32 %count) {
entry:
    call void @glDrawArrays(i32 %mode, i32 %first, i32 %count)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32}, mode, first, count)
end

# Original C signature: void glDrawElements(GLenum mode, GLsizei count, GLenum type, const void * indices)
function llvm_glDrawElements(mode::UInt32, count::Int32, type::UInt32, indices::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glDrawElements(i32, i32, i32, i8*) nounwind

define void @main(i32 %mode, i32 %count, i32 %type, i8* %indices) {
entry:
    call void @glDrawElements(i32 %mode, i32 %count, i32 %type, i8* %indices)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Ptr{Cvoid}}, mode, count, type, indices)
end

# Original C signature: void glEnable(GLenum cap)
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

# Original C signature: void glEnableClientState(GLenum array)
function llvm_glEnableClientState(array::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glEnableClientState(i32) nounwind

define void @main(i32 %array) {
entry:
    call void @glEnableClientState(i32 %array)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, array)
end

# Original C signature: void glFinish()
function llvm_glFinish()::Cvoid
    Base.llvmcall(("""
    declare void @glFinish() nounwind

define void @main() {
entry:
    call void @glFinish()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glFlush()
function llvm_glFlush()::Cvoid
    Base.llvmcall(("""
    declare void @glFlush() nounwind

define void @main() {
entry:
    call void @glFlush()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glFogf(GLenum pname, GLfloat param)
function llvm_glFogf(pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glFogf(i32, float) nounwind

define void @main(i32 %pname, float %param) {
entry:
    call void @glFogf(i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32}, pname, param)
end

# Original C signature: void glFogfv(GLenum pname, const GLfloat * params)
function llvm_glFogfv(pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glFogfv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glFogfv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, pname, params)
end

# Original C signature: void glFogx(GLenum pname, GLfixed param)
function llvm_glFogx(pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glFogx(i32, i32) nounwind

define void @main(i32 %pname, i32 %param) {
entry:
    call void @glFogx(i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32}, pname, param)
end

# Original C signature: void glFogxv(GLenum pname, const GLfixed * param)
function llvm_glFogxv(pname::UInt32, param::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glFogxv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %param) {
entry:
    call void @glFogxv(i32 %pname, i8* %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, pname, param)
end

# Original C signature: void glFrontFace(GLenum mode)
function llvm_glFrontFace(mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glFrontFace(i32) nounwind

define void @main(i32 %mode) {
entry:
    call void @glFrontFace(i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mode)
end

# Original C signature: void glFrustumf(GLfloat l, GLfloat r, GLfloat b, GLfloat t, GLfloat n, GLfloat f)
function llvm_glFrustumf(l::Float32, r::Float32, b::Float32, t::Float32, n::Float32, f::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glFrustumf(float, float, float, float, float, float) nounwind

define void @main(float %l, float %r, float %b, float %t, float %n, float %f) {
entry:
    call void @glFrustumf(float %l, float %r, float %b, float %t, float %n, float %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32, Float32, Float32}, l, r, b, t, n, f)
end

# Original C signature: void glFrustumx(GLfixed l, GLfixed r, GLfixed b, GLfixed t, GLfixed n, GLfixed f)
function llvm_glFrustumx(l::Int32, r::Int32, b::Int32, t::Int32, n::Int32, f::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glFrustumx(i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %l, i32 %r, i32 %b, i32 %t, i32 %n, i32 %f) {
entry:
    call void @glFrustumx(i32 %l, i32 %r, i32 %b, i32 %t, i32 %n, i32 %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, Int32, Int32}, l, r, b, t, n, f)
end

# Original C signature: void glGenBuffers(GLsizei n, GLuint * buffers)
function llvm_glGenBuffers(n::Int32, buffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenBuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %buffers) {
entry:
    call void @glGenBuffers(i32 %n, i8* %buffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, buffers)
end

# Original C signature: void glGenTextures(GLsizei n, GLuint * textures)
function llvm_glGenTextures(n::Int32, textures::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenTextures(i32, i8*) nounwind

define void @main(i32 %n, i8* %textures) {
entry:
    call void @glGenTextures(i32 %n, i8* %textures)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, textures)
end

# Original C signature: void glGetBooleanv(GLenum pname, GLboolean * data)
function llvm_glGetBooleanv(pname::UInt32, data::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetBooleanv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %data) {
entry:
    call void @glGetBooleanv(i32 %pname, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{UInt8}}, pname, data)
end

# Original C signature: void glGetBufferParameteriv(GLenum target, GLenum pname, GLint * params)
function llvm_glGetBufferParameteriv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetBufferParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetBufferParameteriv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetClipPlanef(GLenum plane, GLfloat * equation)
function llvm_glGetClipPlanef(plane::UInt32, equation::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetClipPlanef(i32, i8*) nounwind

define void @main(i32 %plane, i8* %equation) {
entry:
    call void @glGetClipPlanef(i32 %plane, i8* %equation)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, plane, equation)
end

# Original C signature: void glGetClipPlanex(GLenum plane, GLfixed * equation)
function llvm_glGetClipPlanex(plane::UInt32, equation::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetClipPlanex(i32, i8*) nounwind

define void @main(i32 %plane, i8* %equation) {
entry:
    call void @glGetClipPlanex(i32 %plane, i8* %equation)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, plane, equation)
end

# Original C signature: GLenum glGetError()
function llvm_glGetError()::UInt32
    Base.llvmcall(("""
    declare i32 @glGetError() nounwind

define i32 @main() {
entry:
    %result = call i32 @glGetError()
    ret i32 %result
}
    """, "main"), UInt32, Tuple{}, )
end

# Original C signature: void glGetFixedv(GLenum pname, GLfixed * params)
function llvm_glGetFixedv(pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetFixedv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glGetFixedv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, pname, params)
end

# Original C signature: void glGetFloatv(GLenum pname, GLfloat * data)
function llvm_glGetFloatv(pname::UInt32, data::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetFloatv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %data) {
entry:
    call void @glGetFloatv(i32 %pname, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, pname, data)
end

# Original C signature: void glGetIntegerv(GLenum pname, GLint * data)
function llvm_glGetIntegerv(pname::UInt32, data::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetIntegerv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %data) {
entry:
    call void @glGetIntegerv(i32 %pname, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, pname, data)
end

# Original C signature: void glGetLightfv(GLenum light, GLenum pname, GLfloat * params)
function llvm_glGetLightfv(light::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetLightfv(i32, i32, i8*) nounwind

define void @main(i32 %light, i32 %pname, i8* %params) {
entry:
    call void @glGetLightfv(i32 %light, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, light, pname, params)
end

# Original C signature: void glGetLightxv(GLenum light, GLenum pname, GLfixed * params)
function llvm_glGetLightxv(light::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetLightxv(i32, i32, i8*) nounwind

define void @main(i32 %light, i32 %pname, i8* %params) {
entry:
    call void @glGetLightxv(i32 %light, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, light, pname, params)
end

# Original C signature: void glGetMaterialfv(GLenum face, GLenum pname, GLfloat * params)
function llvm_glGetMaterialfv(face::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetMaterialfv(i32, i32, i8*) nounwind

define void @main(i32 %face, i32 %pname, i8* %params) {
entry:
    call void @glGetMaterialfv(i32 %face, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, face, pname, params)
end

# Original C signature: void glGetMaterialxv(GLenum face, GLenum pname, GLfixed * params)
function llvm_glGetMaterialxv(face::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetMaterialxv(i32, i32, i8*) nounwind

define void @main(i32 %face, i32 %pname, i8* %params) {
entry:
    call void @glGetMaterialxv(i32 %face, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, face, pname, params)
end

# Original C signature: void glGetPointerv(GLenum pname, void ** params)
function llvm_glGetPointerv(pname::UInt32, params::Ptr{Ptr{Cvoid}})::Cvoid
    Base.llvmcall(("""
    declare void @glGetPointerv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glGetPointerv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Ptr{Cvoid}}}, pname, params)
end

# Original C signature: void glGetTexEnvfv(GLenum target, GLenum pname, GLfloat * params)
function llvm_glGetTexEnvfv(target::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexEnvfv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexEnvfv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, target, pname, params)
end

# Original C signature: void glGetTexEnviv(GLenum target, GLenum pname, GLint * params)
function llvm_glGetTexEnviv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexEnviv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexEnviv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetTexEnvxv(GLenum target, GLenum pname, GLfixed * params)
function llvm_glGetTexEnvxv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexEnvxv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexEnvxv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetTexParameterfv(GLenum target, GLenum pname, GLfloat * params)
function llvm_glGetTexParameterfv(target::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexParameterfv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexParameterfv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, target, pname, params)
end

# Original C signature: void glGetTexParameteriv(GLenum target, GLenum pname, GLint * params)
function llvm_glGetTexParameteriv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexParameteriv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetTexParameterxv(GLenum target, GLenum pname, GLfixed * params)
function llvm_glGetTexParameterxv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTexParameterxv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetTexParameterxv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glHint(GLenum target, GLenum mode)
function llvm_glHint(target::UInt32, mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glHint(i32, i32) nounwind

define void @main(i32 %target, i32 %mode) {
entry:
    call void @glHint(i32 %target, i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, mode)
end

# Original C signature: GLboolean glIsBuffer(GLuint buffer)
function llvm_glIsBuffer(buffer::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsBuffer(i32) nounwind

define i8 @main(i32 %buffer) {
entry:
    %result = call i8 @glIsBuffer(i32 %buffer)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, buffer)
end

# Original C signature: GLboolean glIsEnabled(GLenum cap)
function llvm_glIsEnabled(cap::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsEnabled(i32) nounwind

define i8 @main(i32 %cap) {
entry:
    %result = call i8 @glIsEnabled(i32 %cap)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, cap)
end

# Original C signature: GLboolean glIsTexture(GLuint texture)
function llvm_glIsTexture(texture::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsTexture(i32) nounwind

define i8 @main(i32 %texture) {
entry:
    %result = call i8 @glIsTexture(i32 %texture)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, texture)
end

# Original C signature: void glLightModelf(GLenum pname, GLfloat param)
function llvm_glLightModelf(pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glLightModelf(i32, float) nounwind

define void @main(i32 %pname, float %param) {
entry:
    call void @glLightModelf(i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32}, pname, param)
end

# Original C signature: void glLightModelfv(GLenum pname, const GLfloat * params)
function llvm_glLightModelfv(pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glLightModelfv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glLightModelfv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, pname, params)
end

# Original C signature: void glLightModelx(GLenum pname, GLfixed param)
function llvm_glLightModelx(pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glLightModelx(i32, i32) nounwind

define void @main(i32 %pname, i32 %param) {
entry:
    call void @glLightModelx(i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32}, pname, param)
end

# Original C signature: void glLightModelxv(GLenum pname, const GLfixed * param)
function llvm_glLightModelxv(pname::UInt32, param::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glLightModelxv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %param) {
entry:
    call void @glLightModelxv(i32 %pname, i8* %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, pname, param)
end

# Original C signature: void glLightf(GLenum light, GLenum pname, GLfloat param)
function llvm_glLightf(light::UInt32, pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glLightf(i32, i32, float) nounwind

define void @main(i32 %light, i32 %pname, float %param) {
entry:
    call void @glLightf(i32 %light, i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Float32}, light, pname, param)
end

# Original C signature: void glLightfv(GLenum light, GLenum pname, const GLfloat * params)
function llvm_glLightfv(light::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glLightfv(i32, i32, i8*) nounwind

define void @main(i32 %light, i32 %pname, i8* %params) {
entry:
    call void @glLightfv(i32 %light, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, light, pname, params)
end

# Original C signature: void glLightx(GLenum light, GLenum pname, GLfixed param)
function llvm_glLightx(light::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glLightx(i32, i32, i32) nounwind

define void @main(i32 %light, i32 %pname, i32 %param) {
entry:
    call void @glLightx(i32 %light, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, light, pname, param)
end

# Original C signature: void glLightxv(GLenum light, GLenum pname, const GLfixed * params)
function llvm_glLightxv(light::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glLightxv(i32, i32, i8*) nounwind

define void @main(i32 %light, i32 %pname, i8* %params) {
entry:
    call void @glLightxv(i32 %light, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, light, pname, params)
end

# Original C signature: void glLineWidth(GLfloat width)
function llvm_glLineWidth(width::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glLineWidth(float) nounwind

define void @main(float %width) {
entry:
    call void @glLineWidth(float %width)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32}, width)
end

# Original C signature: void glLineWidthx(GLfixed width)
function llvm_glLineWidthx(width::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glLineWidthx(i32) nounwind

define void @main(i32 %width) {
entry:
    call void @glLineWidthx(i32 %width)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32}, width)
end

# Original C signature: void glLoadIdentity()
function llvm_glLoadIdentity()::Cvoid
    Base.llvmcall(("""
    declare void @glLoadIdentity() nounwind

define void @main() {
entry:
    call void @glLoadIdentity()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glLoadMatrixf(const GLfloat * m)
function llvm_glLoadMatrixf(m::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glLoadMatrixf(i8*) nounwind

define void @main(i8* %m) {
entry:
    call void @glLoadMatrixf(i8* %m)
    ret void
}
    """, "main"), Cvoid, Tuple{Ptr{Float32}}, m)
end

# Original C signature: void glLoadMatrixx(const GLfixed * m)
function llvm_glLoadMatrixx(m::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glLoadMatrixx(i8*) nounwind

define void @main(i8* %m) {
entry:
    call void @glLoadMatrixx(i8* %m)
    ret void
}
    """, "main"), Cvoid, Tuple{Ptr{Int32}}, m)
end

# Original C signature: void glLogicOp(GLenum opcode)
function llvm_glLogicOp(opcode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glLogicOp(i32) nounwind

define void @main(i32 %opcode) {
entry:
    call void @glLogicOp(i32 %opcode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, opcode)
end

# Original C signature: void glMaterialf(GLenum face, GLenum pname, GLfloat param)
function llvm_glMaterialf(face::UInt32, pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glMaterialf(i32, i32, float) nounwind

define void @main(i32 %face, i32 %pname, float %param) {
entry:
    call void @glMaterialf(i32 %face, i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Float32}, face, pname, param)
end

# Original C signature: void glMaterialfv(GLenum face, GLenum pname, const GLfloat * params)
function llvm_glMaterialfv(face::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glMaterialfv(i32, i32, i8*) nounwind

define void @main(i32 %face, i32 %pname, i8* %params) {
entry:
    call void @glMaterialfv(i32 %face, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, face, pname, params)
end

# Original C signature: void glMaterialx(GLenum face, GLenum pname, GLfixed param)
function llvm_glMaterialx(face::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glMaterialx(i32, i32, i32) nounwind

define void @main(i32 %face, i32 %pname, i32 %param) {
entry:
    call void @glMaterialx(i32 %face, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, face, pname, param)
end

# Original C signature: void glMaterialxv(GLenum face, GLenum pname, const GLfixed * param)
function llvm_glMaterialxv(face::UInt32, pname::UInt32, param::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glMaterialxv(i32, i32, i8*) nounwind

define void @main(i32 %face, i32 %pname, i8* %param) {
entry:
    call void @glMaterialxv(i32 %face, i32 %pname, i8* %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, face, pname, param)
end

# Original C signature: void glMatrixMode(GLenum mode)
function llvm_glMatrixMode(mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glMatrixMode(i32) nounwind

define void @main(i32 %mode) {
entry:
    call void @glMatrixMode(i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mode)
end

# Original C signature: void glMultMatrixf(const GLfloat * m)
function llvm_glMultMatrixf(m::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glMultMatrixf(i8*) nounwind

define void @main(i8* %m) {
entry:
    call void @glMultMatrixf(i8* %m)
    ret void
}
    """, "main"), Cvoid, Tuple{Ptr{Float32}}, m)
end

# Original C signature: void glMultMatrixx(const GLfixed * m)
function llvm_glMultMatrixx(m::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glMultMatrixx(i8*) nounwind

define void @main(i8* %m) {
entry:
    call void @glMultMatrixx(i8* %m)
    ret void
}
    """, "main"), Cvoid, Tuple{Ptr{Int32}}, m)
end

# Original C signature: void glMultiTexCoord4f(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)
function llvm_glMultiTexCoord4f(target::UInt32, s::Float32, t::Float32, r::Float32, q::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glMultiTexCoord4f(i32, float, float, float, float) nounwind

define void @main(i32 %target, float %s, float %t, float %r, float %q) {
entry:
    call void @glMultiTexCoord4f(i32 %target, float %s, float %t, float %r, float %q)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32, Float32, Float32, Float32}, target, s, t, r, q)
end

# Original C signature: void glMultiTexCoord4x(GLenum texture, GLfixed s, GLfixed t, GLfixed r, GLfixed q)
function llvm_glMultiTexCoord4x(texture::UInt32, s::Int32, t::Int32, r::Int32, q::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glMultiTexCoord4x(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %texture, i32 %s, i32 %t, i32 %r, i32 %q) {
entry:
    call void @glMultiTexCoord4x(i32 %texture, i32 %s, i32 %t, i32 %r, i32 %q)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32}, texture, s, t, r, q)
end

# Original C signature: void glNormal3f(GLfloat nx, GLfloat ny, GLfloat nz)
function llvm_glNormal3f(nx::Float32, ny::Float32, nz::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glNormal3f(float, float, float) nounwind

define void @main(float %nx, float %ny, float %nz) {
entry:
    call void @glNormal3f(float %nx, float %ny, float %nz)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32}, nx, ny, nz)
end

# Original C signature: void glNormal3x(GLfixed nx, GLfixed ny, GLfixed nz)
function llvm_glNormal3x(nx::Int32, ny::Int32, nz::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glNormal3x(i32, i32, i32) nounwind

define void @main(i32 %nx, i32 %ny, i32 %nz) {
entry:
    call void @glNormal3x(i32 %nx, i32 %ny, i32 %nz)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32}, nx, ny, nz)
end

# Original C signature: void glNormalPointer(GLenum type, GLsizei stride, const void * pointer)
function llvm_glNormalPointer(type::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glNormalPointer(i32, i32, i8*) nounwind

define void @main(i32 %type, i32 %stride, i8* %pointer) {
entry:
    call void @glNormalPointer(i32 %type, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Cvoid}}, type, stride, pointer)
end

# Original C signature: void glOrthof(GLfloat l, GLfloat r, GLfloat b, GLfloat t, GLfloat n, GLfloat f)
function llvm_glOrthof(l::Float32, r::Float32, b::Float32, t::Float32, n::Float32, f::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glOrthof(float, float, float, float, float, float) nounwind

define void @main(float %l, float %r, float %b, float %t, float %n, float %f) {
entry:
    call void @glOrthof(float %l, float %r, float %b, float %t, float %n, float %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32, Float32, Float32}, l, r, b, t, n, f)
end

# Original C signature: void glOrthox(GLfixed l, GLfixed r, GLfixed b, GLfixed t, GLfixed n, GLfixed f)
function llvm_glOrthox(l::Int32, r::Int32, b::Int32, t::Int32, n::Int32, f::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glOrthox(i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %l, i32 %r, i32 %b, i32 %t, i32 %n, i32 %f) {
entry:
    call void @glOrthox(i32 %l, i32 %r, i32 %b, i32 %t, i32 %n, i32 %f)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, Int32, Int32}, l, r, b, t, n, f)
end

# Original C signature: void glPixelStorei(GLenum pname, GLint param)
function llvm_glPixelStorei(pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glPixelStorei(i32, i32) nounwind

define void @main(i32 %pname, i32 %param) {
entry:
    call void @glPixelStorei(i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32}, pname, param)
end

# Original C signature: void glPointParameterf(GLenum pname, GLfloat param)
function llvm_glPointParameterf(pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glPointParameterf(i32, float) nounwind

define void @main(i32 %pname, float %param) {
entry:
    call void @glPointParameterf(i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32}, pname, param)
end

# Original C signature: void glPointParameterfv(GLenum pname, const GLfloat * params)
function llvm_glPointParameterfv(pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glPointParameterfv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glPointParameterfv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, pname, params)
end

# Original C signature: void glPointParameterx(GLenum pname, GLfixed param)
function llvm_glPointParameterx(pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glPointParameterx(i32, i32) nounwind

define void @main(i32 %pname, i32 %param) {
entry:
    call void @glPointParameterx(i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32}, pname, param)
end

# Original C signature: void glPointParameterxv(GLenum pname, const GLfixed * params)
function llvm_glPointParameterxv(pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glPointParameterxv(i32, i8*) nounwind

define void @main(i32 %pname, i8* %params) {
entry:
    call void @glPointParameterxv(i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, pname, params)
end

# Original C signature: void glPointSize(GLfloat size)
function llvm_glPointSize(size::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glPointSize(float) nounwind

define void @main(float %size) {
entry:
    call void @glPointSize(float %size)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32}, size)
end

# Original C signature: void glPointSizePointerOES(GLenum type, GLsizei stride, const void * pointer)
function llvm_glPointSizePointerOES(type::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glPointSizePointerOES(i32, i32, i8*) nounwind

define void @main(i32 %type, i32 %stride, i8* %pointer) {
entry:
    call void @glPointSizePointerOES(i32 %type, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Cvoid}}, type, stride, pointer)
end

# Original C signature: void glPointSizex(GLfixed size)
function llvm_glPointSizex(size::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glPointSizex(i32) nounwind

define void @main(i32 %size) {
entry:
    call void @glPointSizex(i32 %size)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32}, size)
end

# Original C signature: void glPolygonOffset(GLfloat factor, GLfloat units)
function llvm_glPolygonOffset(factor::Float32, units::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glPolygonOffset(float, float) nounwind

define void @main(float %factor, float %units) {
entry:
    call void @glPolygonOffset(float %factor, float %units)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32}, factor, units)
end

# Original C signature: void glPolygonOffsetx(GLfixed factor, GLfixed units)
function llvm_glPolygonOffsetx(factor::Int32, units::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glPolygonOffsetx(i32, i32) nounwind

define void @main(i32 %factor, i32 %units) {
entry:
    call void @glPolygonOffsetx(i32 %factor, i32 %units)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32}, factor, units)
end

# Original C signature: void glPopMatrix()
function llvm_glPopMatrix()::Cvoid
    Base.llvmcall(("""
    declare void @glPopMatrix() nounwind

define void @main() {
entry:
    call void @glPopMatrix()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glPushMatrix()
function llvm_glPushMatrix()::Cvoid
    Base.llvmcall(("""
    declare void @glPushMatrix() nounwind

define void @main() {
entry:
    call void @glPushMatrix()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void * pixels)
function llvm_glReadPixels(x::Int32, y::Int32, width::Int32, height::Int32, format::UInt32, type::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glReadPixels(i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %x, i32 %y, i32 %width, i32 %height, i32 %format, i32 %type, i8* %pixels) {
entry:
    call void @glReadPixels(i32 %x, i32 %y, i32 %width, i32 %height, i32 %format, i32 %type, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, x, y, width, height, format, type, pixels)
end

# Original C signature: void glRotatef(GLfloat angle, GLfloat x, GLfloat y, GLfloat z)
function llvm_glRotatef(angle::Float32, x::Float32, y::Float32, z::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glRotatef(float, float, float, float) nounwind

define void @main(float %angle, float %x, float %y, float %z) {
entry:
    call void @glRotatef(float %angle, float %x, float %y, float %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32}, angle, x, y, z)
end

# Original C signature: void glRotatex(GLfixed angle, GLfixed x, GLfixed y, GLfixed z)
function llvm_glRotatex(angle::Int32, x::Int32, y::Int32, z::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glRotatex(i32, i32, i32, i32) nounwind

define void @main(i32 %angle, i32 %x, i32 %y, i32 %z) {
entry:
    call void @glRotatex(i32 %angle, i32 %x, i32 %y, i32 %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, angle, x, y, z)
end

# Original C signature: void glSampleCoverage(GLfloat value, GLboolean invert)
function llvm_glSampleCoverage(value::Float32, invert::UInt8)::Cvoid
    Base.llvmcall(("""
    declare void @glSampleCoverage(float, i8) nounwind

define void @main(float %value, i8 %invert) {
entry:
    call void @glSampleCoverage(float %value, i8 %invert)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, UInt8}, value, invert)
end

# Original C signature: void glSampleCoveragex(GLclampx value, GLboolean invert)
function llvm_glSampleCoveragex(value::Int32, invert::UInt8)::Cvoid
    Base.llvmcall(("""
    declare void @glSampleCoveragex(i32, i8) nounwind

define void @main(i32 %value, i8 %invert) {
entry:
    call void @glSampleCoveragex(i32 %value, i8 %invert)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt8}, value, invert)
end

# Original C signature: void glScalef(GLfloat x, GLfloat y, GLfloat z)
function llvm_glScalef(x::Float32, y::Float32, z::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glScalef(float, float, float) nounwind

define void @main(float %x, float %y, float %z) {
entry:
    call void @glScalef(float %x, float %y, float %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32}, x, y, z)
end

# Original C signature: void glScalex(GLfixed x, GLfixed y, GLfixed z)
function llvm_glScalex(x::Int32, y::Int32, z::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glScalex(i32, i32, i32) nounwind

define void @main(i32 %x, i32 %y, i32 %z) {
entry:
    call void @glScalex(i32 %x, i32 %y, i32 %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32}, x, y, z)
end

# Original C signature: void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
function llvm_glScissor(x::Int32, y::Int32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glScissor(i32, i32, i32, i32) nounwind

define void @main(i32 %x, i32 %y, i32 %width, i32 %height) {
entry:
    call void @glScissor(i32 %x, i32 %y, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, x, y, width, height)
end

# Original C signature: void glShadeModel(GLenum mode)
function llvm_glShadeModel(mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glShadeModel(i32) nounwind

define void @main(i32 %mode) {
entry:
    call void @glShadeModel(i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mode)
end

# Original C signature: void glStencilFunc(GLenum func, GLint ref, GLuint mask)
function llvm_glStencilFunc(func::UInt32, ref::Int32, mask::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilFunc(i32, i32, i32) nounwind

define void @main(i32 %func, i32 %ref, i32 %mask) {
entry:
    call void @glStencilFunc(i32 %func, i32 %ref, i32 %mask)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32}, func, ref, mask)
end

# Original C signature: void glStencilMask(GLuint mask)
function llvm_glStencilMask(mask::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilMask(i32) nounwind

define void @main(i32 %mask) {
entry:
    call void @glStencilMask(i32 %mask)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mask)
end

# Original C signature: void glStencilOp(GLenum fail, GLenum zfail, GLenum zpass)
function llvm_glStencilOp(fail::UInt32, zfail::UInt32, zpass::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilOp(i32, i32, i32) nounwind

define void @main(i32 %fail, i32 %zfail, i32 %zpass) {
entry:
    call void @glStencilOp(i32 %fail, i32 %zfail, i32 %zpass)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32}, fail, zfail, zpass)
end

# Original C signature: void glTexCoordPointer(GLint size, GLenum type, GLsizei stride, const void * pointer)
function llvm_glTexCoordPointer(size::Int32, type::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexCoordPointer(i32, i32, i32, i8*) nounwind

define void @main(i32 %size, i32 %type, i32 %stride, i8* %pointer) {
entry:
    call void @glTexCoordPointer(i32 %size, i32 %type, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, Int32, Ptr{Cvoid}}, size, type, stride, pointer)
end

# Original C signature: void glTexEnvf(GLenum target, GLenum pname, GLfloat param)
function llvm_glTexEnvf(target::UInt32, pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnvf(i32, i32, float) nounwind

define void @main(i32 %target, i32 %pname, float %param) {
entry:
    call void @glTexEnvf(i32 %target, i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Float32}, target, pname, param)
end

# Original C signature: void glTexEnvfv(GLenum target, GLenum pname, const GLfloat * params)
function llvm_glTexEnvfv(target::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnvfv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexEnvfv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, target, pname, params)
end

# Original C signature: void glTexEnvi(GLenum target, GLenum pname, GLint param)
function llvm_glTexEnvi(target::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnvi(i32, i32, i32) nounwind

define void @main(i32 %target, i32 %pname, i32 %param) {
entry:
    call void @glTexEnvi(i32 %target, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, target, pname, param)
end

# Original C signature: void glTexEnviv(GLenum target, GLenum pname, const GLint * params)
function llvm_glTexEnviv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnviv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexEnviv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glTexEnvx(GLenum target, GLenum pname, GLfixed param)
function llvm_glTexEnvx(target::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnvx(i32, i32, i32) nounwind

define void @main(i32 %target, i32 %pname, i32 %param) {
entry:
    call void @glTexEnvx(i32 %target, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, target, pname, param)
end

# Original C signature: void glTexEnvxv(GLenum target, GLenum pname, const GLfixed * params)
function llvm_glTexEnvxv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexEnvxv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexEnvxv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void * pixels)
function llvm_glTexImage2D(target::UInt32, level::Int32, internalformat::Int32, width::Int32, height::Int32, border::Int32, format::UInt32, type::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %format, i32 %type, i8* %pixels) {
entry:
    call void @glTexImage2D(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %format, i32 %type, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, internalformat, width, height, border, format, type, pixels)
end

# Original C signature: void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
function llvm_glTexParameterf(target::UInt32, pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameterf(i32, i32, float) nounwind

define void @main(i32 %target, i32 %pname, float %param) {
entry:
    call void @glTexParameterf(i32 %target, i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Float32}, target, pname, param)
end

# Original C signature: void glTexParameterfv(GLenum target, GLenum pname, const GLfloat * params)
function llvm_glTexParameterfv(target::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameterfv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexParameterfv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, target, pname, params)
end

# Original C signature: void glTexParameteri(GLenum target, GLenum pname, GLint param)
function llvm_glTexParameteri(target::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameteri(i32, i32, i32) nounwind

define void @main(i32 %target, i32 %pname, i32 %param) {
entry:
    call void @glTexParameteri(i32 %target, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, target, pname, param)
end

# Original C signature: void glTexParameteriv(GLenum target, GLenum pname, const GLint * params)
function llvm_glTexParameteriv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexParameteriv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glTexParameterx(GLenum target, GLenum pname, GLfixed param)
function llvm_glTexParameterx(target::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameterx(i32, i32, i32) nounwind

define void @main(i32 %target, i32 %pname, i32 %param) {
entry:
    call void @glTexParameterx(i32 %target, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, target, pname, param)
end

# Original C signature: void glTexParameterxv(GLenum target, GLenum pname, const GLfixed * params)
function llvm_glTexParameterxv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glTexParameterxv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glTexParameterxv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void * pixels)
function llvm_glTexSubImage2D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, width::Int32, height::Int32, format::UInt32, type::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %type, i8* %pixels) {
entry:
    call void @glTexSubImage2D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %type, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, xoffset, yoffset, width, height, format, type, pixels)
end

# Original C signature: void glTranslatef(GLfloat x, GLfloat y, GLfloat z)
function llvm_glTranslatef(x::Float32, y::Float32, z::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glTranslatef(float, float, float) nounwind

define void @main(float %x, float %y, float %z) {
entry:
    call void @glTranslatef(float %x, float %y, float %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32}, x, y, z)
end

# Original C signature: void glTranslatex(GLfixed x, GLfixed y, GLfixed z)
function llvm_glTranslatex(x::Int32, y::Int32, z::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTranslatex(i32, i32, i32) nounwind

define void @main(i32 %x, i32 %y, i32 %z) {
entry:
    call void @glTranslatex(i32 %x, i32 %y, i32 %z)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32}, x, y, z)
end

# Original C signature: void glVertexPointer(GLint size, GLenum type, GLsizei stride, const void * pointer)
function llvm_glVertexPointer(size::Int32, type::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexPointer(i32, i32, i32, i8*) nounwind

define void @main(i32 %size, i32 %type, i32 %stride, i8* %pointer) {
entry:
    call void @glVertexPointer(i32 %size, i32 %type, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, Int32, Ptr{Cvoid}}, size, type, stride, pointer)
end

# Original C signature: void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
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