# Auto-generated OpenGL bindings using llvmcall
# Generated: 2026-02-16T18:04:46.789
# Header: emsdk/upstream/emscripten/system/include/GLES3/gl3.h
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

# Original C signature: void glAttachShader(GLuint program, GLuint shader)
function llvm_glAttachShader(program::UInt32, shader::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glAttachShader(i32, i32) nounwind

define void @main(i32 %program, i32 %shader) {
entry:
    call void @glAttachShader(i32 %program, i32 %shader)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, program, shader)
end

# Original C signature: void glBeginQuery(GLenum target, GLuint id)
function llvm_glBeginQuery(target::UInt32, id::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBeginQuery(i32, i32) nounwind

define void @main(i32 %target, i32 %id) {
entry:
    call void @glBeginQuery(i32 %target, i32 %id)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, id)
end

# Original C signature: void glBeginTransformFeedback(GLenum primitiveMode)
function llvm_glBeginTransformFeedback(primitiveMode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBeginTransformFeedback(i32) nounwind

define void @main(i32 %primitiveMode) {
entry:
    call void @glBeginTransformFeedback(i32 %primitiveMode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, primitiveMode)
end

# Original C signature: void glBindAttribLocation(GLuint program, GLuint index, const GLchar * name)
function llvm_glBindAttribLocation(program::UInt32, index::UInt32, name::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glBindAttribLocation(i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %index, i8* %name) {
entry:
    call void @glBindAttribLocation(i32 %program, i32 %index, i8* %name)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{UInt8}}, program, index, name)
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

# Original C signature: void glBindBufferBase(GLenum target, GLuint index, GLuint buffer)
function llvm_glBindBufferBase(target::UInt32, index::UInt32, buffer::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindBufferBase(i32, i32, i32) nounwind

define void @main(i32 %target, i32 %index, i32 %buffer) {
entry:
    call void @glBindBufferBase(i32 %target, i32 %index, i32 %buffer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32}, target, index, buffer)
end

# Original C signature: void glBindBufferRange(GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size)
function llvm_glBindBufferRange(target::UInt32, index::UInt32, buffer::UInt32, offset::Int64, size::Int64)::Cvoid
    Base.llvmcall(("""
    declare void @glBindBufferRange(i32, i32, i32, i64, i64) nounwind

define void @main(i32 %target, i32 %index, i32 %buffer, i64 %offset, i64 %size) {
entry:
    call void @glBindBufferRange(i32 %target, i32 %index, i32 %buffer, i64 %offset, i64 %size)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Int64, Int64}, target, index, buffer, offset, size)
end

# Original C signature: void glBindFramebuffer(GLenum target, GLuint framebuffer)
function llvm_glBindFramebuffer(target::UInt32, framebuffer::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindFramebuffer(i32, i32) nounwind

define void @main(i32 %target, i32 %framebuffer) {
entry:
    call void @glBindFramebuffer(i32 %target, i32 %framebuffer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, framebuffer)
end

# Original C signature: void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
function llvm_glBindRenderbuffer(target::UInt32, renderbuffer::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindRenderbuffer(i32, i32) nounwind

define void @main(i32 %target, i32 %renderbuffer) {
entry:
    call void @glBindRenderbuffer(i32 %target, i32 %renderbuffer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, renderbuffer)
end

# Original C signature: void glBindSampler(GLuint unit, GLuint sampler)
function llvm_glBindSampler(unit::UInt32, sampler::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindSampler(i32, i32) nounwind

define void @main(i32 %unit, i32 %sampler) {
entry:
    call void @glBindSampler(i32 %unit, i32 %sampler)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, unit, sampler)
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

# Original C signature: void glBindTransformFeedback(GLenum target, GLuint id)
function llvm_glBindTransformFeedback(target::UInt32, id::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindTransformFeedback(i32, i32) nounwind

define void @main(i32 %target, i32 %id) {
entry:
    call void @glBindTransformFeedback(i32 %target, i32 %id)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, target, id)
end

# Original C signature: void glBindVertexArray(GLuint array)
function llvm_glBindVertexArray(array::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBindVertexArray(i32) nounwind

define void @main(i32 %array) {
entry:
    call void @glBindVertexArray(i32 %array)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, array)
end

# Original C signature: void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
function llvm_glBlendColor(red::Float32, green::Float32, blue::Float32, alpha::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlendColor(float, float, float, float) nounwind

define void @main(float %red, float %green, float %blue, float %alpha) {
entry:
    call void @glBlendColor(float %red, float %green, float %blue, float %alpha)
    ret void
}
    """, "main"), Cvoid, Tuple{Float32, Float32, Float32, Float32}, red, green, blue, alpha)
end

# Original C signature: void glBlendEquation(GLenum mode)
function llvm_glBlendEquation(mode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlendEquation(i32) nounwind

define void @main(i32 %mode) {
entry:
    call void @glBlendEquation(i32 %mode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, mode)
end

# Original C signature: void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
function llvm_glBlendEquationSeparate(modeRGB::UInt32, modeAlpha::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlendEquationSeparate(i32, i32) nounwind

define void @main(i32 %modeRGB, i32 %modeAlpha) {
entry:
    call void @glBlendEquationSeparate(i32 %modeRGB, i32 %modeAlpha)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, modeRGB, modeAlpha)
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

# Original C signature: void glBlendFuncSeparate(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha)
function llvm_glBlendFuncSeparate(sfactorRGB::UInt32, dfactorRGB::UInt32, sfactorAlpha::UInt32, dfactorAlpha::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlendFuncSeparate(i32, i32, i32, i32) nounwind

define void @main(i32 %sfactorRGB, i32 %dfactorRGB, i32 %sfactorAlpha, i32 %dfactorAlpha) {
entry:
    call void @glBlendFuncSeparate(i32 %sfactorRGB, i32 %dfactorRGB, i32 %sfactorAlpha, i32 %dfactorAlpha)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, UInt32}, sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha)
end

# Original C signature: void glBlitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)
function llvm_glBlitFramebuffer(srcX0::Int32, srcY0::Int32, srcX1::Int32, srcY1::Int32, dstX0::Int32, dstY0::Int32, dstX1::Int32, dstY1::Int32, mask::UInt32, filter::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glBlitFramebuffer(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %srcX0, i32 %srcY0, i32 %srcX1, i32 %srcY1, i32 %dstX0, i32 %dstY0, i32 %dstX1, i32 %dstY1, i32 %mask, i32 %filter) {
entry:
    call void @glBlitFramebuffer(i32 %srcX0, i32 %srcY0, i32 %srcX1, i32 %srcY1, i32 %dstX0, i32 %dstY0, i32 %dstX1, i32 %dstY1, i32 %mask, i32 %filter)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32}, srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter)
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

# Original C signature: GLenum glCheckFramebufferStatus(GLenum target)
function llvm_glCheckFramebufferStatus(target::UInt32)::UInt32
    Base.llvmcall(("""
    declare i32 @glCheckFramebufferStatus(i32) nounwind

define i32 @main(i32 %target) {
entry:
    %result = call i32 @glCheckFramebufferStatus(i32 %target)
    ret i32 %result
}
    """, "main"), UInt32, Tuple{UInt32}, target)
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

# Original C signature: void glClearBufferfi(GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil)
function llvm_glClearBufferfi(buffer::UInt32, drawbuffer::Int32, depth::Float32, stencil::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glClearBufferfi(i32, i32, float, i32) nounwind

define void @main(i32 %buffer, i32 %drawbuffer, float %depth, i32 %stencil) {
entry:
    call void @glClearBufferfi(i32 %buffer, i32 %drawbuffer, float %depth, i32 %stencil)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Float32, Int32}, buffer, drawbuffer, depth, stencil)
end

# Original C signature: void glClearBufferfv(GLenum buffer, GLint drawbuffer, const GLfloat * value)
function llvm_glClearBufferfv(buffer::UInt32, drawbuffer::Int32, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glClearBufferfv(i32, i32, i8*) nounwind

define void @main(i32 %buffer, i32 %drawbuffer, i8* %value) {
entry:
    call void @glClearBufferfv(i32 %buffer, i32 %drawbuffer, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Float32}}, buffer, drawbuffer, value)
end

# Original C signature: void glClearBufferiv(GLenum buffer, GLint drawbuffer, const GLint * value)
function llvm_glClearBufferiv(buffer::UInt32, drawbuffer::Int32, value::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glClearBufferiv(i32, i32, i8*) nounwind

define void @main(i32 %buffer, i32 %drawbuffer, i8* %value) {
entry:
    call void @glClearBufferiv(i32 %buffer, i32 %drawbuffer, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}}, buffer, drawbuffer, value)
end

# Original C signature: void glClearBufferuiv(GLenum buffer, GLint drawbuffer, const GLuint * value)
function llvm_glClearBufferuiv(buffer::UInt32, drawbuffer::Int32, value::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glClearBufferuiv(i32, i32, i8*) nounwind

define void @main(i32 %buffer, i32 %drawbuffer, i8* %value) {
entry:
    call void @glClearBufferuiv(i32 %buffer, i32 %drawbuffer, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{UInt32}}, buffer, drawbuffer, value)
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

# Original C signature: GLenum glClientWaitSync(GLsync sync, GLbitfield flags, GLuint64 timeout)
function llvm_glClientWaitSync(sync::UInt32, flags::UInt32, timeout::UInt32)::UInt32
    Base.llvmcall(("""
    declare i32 @glClientWaitSync(i32, i32, i32) nounwind

define i32 @main(i32 %sync, i32 %flags, i32 %timeout) {
entry:
    %result = call i32 @glClientWaitSync(i32 %sync, i32 %flags, i32 %timeout)
    ret i32 %result
}
    """, "main"), UInt32, Tuple{UInt32, UInt32, UInt32}, sync, flags, timeout)
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

# Original C signature: void glCompileShader(GLuint shader)
function llvm_glCompileShader(shader::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glCompileShader(i32) nounwind

define void @main(i32 %shader) {
entry:
    call void @glCompileShader(i32 %shader)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, shader)
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

# Original C signature: void glCompressedTexImage3D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void * data)
function llvm_glCompressedTexImage3D(target::UInt32, level::Int32, internalformat::UInt32, width::Int32, height::Int32, depth::Int32, border::Int32, imageSize::Int32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glCompressedTexImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %depth, i32 %border, i32 %imageSize, i8* %data) {
entry:
    call void @glCompressedTexImage3D(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %depth, i32 %border, i32 %imageSize, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32, Int32, Int32, Int32, Ptr{Cvoid}}, target, level, internalformat, width, height, depth, border, imageSize, data)
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

# Original C signature: void glCompressedTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void * data)
function llvm_glCompressedTexSubImage3D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, zoffset::Int32, width::Int32, height::Int32, depth::Int32, format::UInt32, imageSize::Int32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glCompressedTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %width, i32 %height, i32 %depth, i32 %format, i32 %imageSize, i8* %data) {
entry:
    call void @glCompressedTexSubImage3D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %width, i32 %height, i32 %depth, i32 %format, i32 %imageSize, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, UInt32, Int32, Ptr{Cvoid}}, target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data)
end

# Original C signature: void glCopyBufferSubData(GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size)
function llvm_glCopyBufferSubData(readTarget::UInt32, writeTarget::UInt32, readOffset::Int64, writeOffset::Int64, size::Int64)::Cvoid
    Base.llvmcall(("""
    declare void @glCopyBufferSubData(i32, i32, i64, i64, i64) nounwind

define void @main(i32 %readTarget, i32 %writeTarget, i64 %readOffset, i64 %writeOffset, i64 %size) {
entry:
    call void @glCopyBufferSubData(i32 %readTarget, i32 %writeTarget, i64 %readOffset, i64 %writeOffset, i64 %size)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int64, Int64, Int64}, readTarget, writeTarget, readOffset, writeOffset, size)
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

# Original C signature: void glCopyTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)
function llvm_glCopyTexSubImage3D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, zoffset::Int32, x::Int32, y::Int32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glCopyTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %x, i32 %y, i32 %width, i32 %height) {
entry:
    call void @glCopyTexSubImage3D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %x, i32 %y, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32}, target, level, xoffset, yoffset, zoffset, x, y, width, height)
end

# Original C signature: GLuint glCreateProgram()
function llvm_glCreateProgram()::UInt32
    Base.llvmcall(("""
    declare i32 @glCreateProgram() nounwind

define i32 @main() {
entry:
    %result = call i32 @glCreateProgram()
    ret i32 %result
}
    """, "main"), UInt32, Tuple{}, )
end

# Original C signature: GLuint glCreateShader(GLenum type)
function llvm_glCreateShader(type_::UInt32)::UInt32
    Base.llvmcall(("""
    declare i32 @glCreateShader(i32) nounwind

define i32 @main(i32 %type_) {
entry:
    %result = call i32 @glCreateShader(i32 %type_)
    ret i32 %result
}
    """, "main"), UInt32, Tuple{UInt32}, type_)
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

# Original C signature: void glDeleteFramebuffers(GLsizei n, const GLuint * framebuffers)
function llvm_glDeleteFramebuffers(n::Int32, framebuffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteFramebuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %framebuffers) {
entry:
    call void @glDeleteFramebuffers(i32 %n, i8* %framebuffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, framebuffers)
end

# Original C signature: void glDeleteProgram(GLuint program)
function llvm_glDeleteProgram(program::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteProgram(i32) nounwind

define void @main(i32 %program) {
entry:
    call void @glDeleteProgram(i32 %program)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, program)
end

# Original C signature: void glDeleteQueries(GLsizei n, const GLuint * ids)
function llvm_glDeleteQueries(n::Int32, ids::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteQueries(i32, i8*) nounwind

define void @main(i32 %n, i8* %ids) {
entry:
    call void @glDeleteQueries(i32 %n, i8* %ids)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, ids)
end

# Original C signature: void glDeleteRenderbuffers(GLsizei n, const GLuint * renderbuffers)
function llvm_glDeleteRenderbuffers(n::Int32, renderbuffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteRenderbuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %renderbuffers) {
entry:
    call void @glDeleteRenderbuffers(i32 %n, i8* %renderbuffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, renderbuffers)
end

# Original C signature: void glDeleteSamplers(GLsizei count, const GLuint * samplers)
function llvm_glDeleteSamplers(count::Int32, samplers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteSamplers(i32, i8*) nounwind

define void @main(i32 %count, i8* %samplers) {
entry:
    call void @glDeleteSamplers(i32 %count, i8* %samplers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, count, samplers)
end

# Original C signature: void glDeleteShader(GLuint shader)
function llvm_glDeleteShader(shader::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteShader(i32) nounwind

define void @main(i32 %shader) {
entry:
    call void @glDeleteShader(i32 %shader)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, shader)
end

# Original C signature: void glDeleteSync(GLsync sync)
function llvm_glDeleteSync(sync::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteSync(i32) nounwind

define void @main(i32 %sync) {
entry:
    call void @glDeleteSync(i32 %sync)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, sync)
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

# Original C signature: void glDeleteTransformFeedbacks(GLsizei n, const GLuint * ids)
function llvm_glDeleteTransformFeedbacks(n::Int32, ids::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteTransformFeedbacks(i32, i8*) nounwind

define void @main(i32 %n, i8* %ids) {
entry:
    call void @glDeleteTransformFeedbacks(i32 %n, i8* %ids)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, ids)
end

# Original C signature: void glDeleteVertexArrays(GLsizei n, const GLuint * arrays)
function llvm_glDeleteVertexArrays(n::Int32, arrays::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDeleteVertexArrays(i32, i8*) nounwind

define void @main(i32 %n, i8* %arrays) {
entry:
    call void @glDeleteVertexArrays(i32 %n, i8* %arrays)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, arrays)
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

# Original C signature: void glDetachShader(GLuint program, GLuint shader)
function llvm_glDetachShader(program::UInt32, shader::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDetachShader(i32, i32) nounwind

define void @main(i32 %program, i32 %shader) {
entry:
    call void @glDetachShader(i32 %program, i32 %shader)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, program, shader)
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

# Original C signature: void glDisableVertexAttribArray(GLuint index)
function llvm_glDisableVertexAttribArray(index::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glDisableVertexAttribArray(i32) nounwind

define void @main(i32 %index) {
entry:
    call void @glDisableVertexAttribArray(i32 %index)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, index)
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

# Original C signature: void glDrawArraysInstanced(GLenum mode, GLint first, GLsizei count, GLsizei instancecount)
function llvm_glDrawArraysInstanced(mode::UInt32, first::Int32, count::Int32, instancecount::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glDrawArraysInstanced(i32, i32, i32, i32) nounwind

define void @main(i32 %mode, i32 %first, i32 %count, i32 %instancecount) {
entry:
    call void @glDrawArraysInstanced(i32 %mode, i32 %first, i32 %count, i32 %instancecount)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32}, mode, first, count, instancecount)
end

# Original C signature: void glDrawBuffers(GLsizei n, const GLenum * bufs)
function llvm_glDrawBuffers(n::Int32, bufs::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glDrawBuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %bufs) {
entry:
    call void @glDrawBuffers(i32 %n, i8* %bufs)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, bufs)
end

# Original C signature: void glDrawElements(GLenum mode, GLsizei count, GLenum type, const void * indices)
function llvm_glDrawElements(mode::UInt32, count::Int32, type_::UInt32, indices::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glDrawElements(i32, i32, i32, i8*) nounwind

define void @main(i32 %mode, i32 %count, i32 %type_, i8* %indices) {
entry:
    call void @glDrawElements(i32 %mode, i32 %count, i32 %type_, i8* %indices)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Ptr{Cvoid}}, mode, count, type_, indices)
end

# Original C signature: void glDrawElementsInstanced(GLenum mode, GLsizei count, GLenum type, const void * indices, GLsizei instancecount)
function llvm_glDrawElementsInstanced(mode::UInt32, count::Int32, type_::UInt32, indices::Ptr{Cvoid}, instancecount::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glDrawElementsInstanced(i32, i32, i32, i8*, i32) nounwind

define void @main(i32 %mode, i32 %count, i32 %type_, i8* %indices, i32 %instancecount) {
entry:
    call void @glDrawElementsInstanced(i32 %mode, i32 %count, i32 %type_, i8* %indices, i32 %instancecount)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Ptr{Cvoid}, Int32}, mode, count, type_, indices, instancecount)
end

# Original C signature: void glDrawRangeElements(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void * indices)
function llvm_glDrawRangeElements(mode::UInt32, start::UInt32, end_::UInt32, count::Int32, type_::UInt32, indices::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glDrawRangeElements(i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %mode, i32 %start, i32 %end_, i32 %count, i32 %type_, i8* %indices) {
entry:
    call void @glDrawRangeElements(i32 %mode, i32 %start, i32 %end_, i32 %count, i32 %type_, i8* %indices)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Int32, UInt32, Ptr{Cvoid}}, mode, start, end_, count, type_, indices)
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

# Original C signature: void glEnableVertexAttribArray(GLuint index)
function llvm_glEnableVertexAttribArray(index::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glEnableVertexAttribArray(i32) nounwind

define void @main(i32 %index) {
entry:
    call void @glEnableVertexAttribArray(i32 %index)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, index)
end

# Original C signature: void glEndQuery(GLenum target)
function llvm_glEndQuery(target::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glEndQuery(i32) nounwind

define void @main(i32 %target) {
entry:
    call void @glEndQuery(i32 %target)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, target)
end

# Original C signature: void glEndTransformFeedback()
function llvm_glEndTransformFeedback()::Cvoid
    Base.llvmcall(("""
    declare void @glEndTransformFeedback() nounwind

define void @main() {
entry:
    call void @glEndTransformFeedback()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: GLsync glFenceSync(GLenum condition, GLbitfield flags)
function llvm_glFenceSync(condition::UInt32, flags::UInt32)::UInt32
    Base.llvmcall(("""
    declare i32 @glFenceSync(i32, i32) nounwind

define i32 @main(i32 %condition, i32 %flags) {
entry:
    %result = call i32 @glFenceSync(i32 %condition, i32 %flags)
    ret i32 %result
}
    """, "main"), UInt32, Tuple{UInt32, UInt32}, condition, flags)
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

# Original C signature: void glFlushMappedBufferRange(GLenum target, GLintptr offset, GLsizeiptr length)
function llvm_glFlushMappedBufferRange(target::UInt32, offset::Int64, length::Int64)::Cvoid
    Base.llvmcall(("""
    declare void @glFlushMappedBufferRange(i32, i64, i64) nounwind

define void @main(i32 %target, i64 %offset, i64 %length) {
entry:
    call void @glFlushMappedBufferRange(i32 %target, i64 %offset, i64 %length)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int64, Int64}, target, offset, length)
end

# Original C signature: void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
function llvm_glFramebufferRenderbuffer(target::UInt32, attachment::UInt32, renderbuffertarget::UInt32, renderbuffer::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glFramebufferRenderbuffer(i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %attachment, i32 %renderbuffertarget, i32 %renderbuffer) {
entry:
    call void @glFramebufferRenderbuffer(i32 %target, i32 %attachment, i32 %renderbuffertarget, i32 %renderbuffer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, UInt32}, target, attachment, renderbuffertarget, renderbuffer)
end

# Original C signature: void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
function llvm_glFramebufferTexture2D(target::UInt32, attachment::UInt32, textarget::UInt32, texture::UInt32, level::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glFramebufferTexture2D(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %attachment, i32 %textarget, i32 %texture, i32 %level) {
entry:
    call void @glFramebufferTexture2D(i32 %target, i32 %attachment, i32 %textarget, i32 %texture, i32 %level)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, UInt32, Int32}, target, attachment, textarget, texture, level)
end

# Original C signature: void glFramebufferTextureLayer(GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)
function llvm_glFramebufferTextureLayer(target::UInt32, attachment::UInt32, texture::UInt32, level::Int32, layer::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glFramebufferTextureLayer(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %attachment, i32 %texture, i32 %level, i32 %layer) {
entry:
    call void @glFramebufferTextureLayer(i32 %target, i32 %attachment, i32 %texture, i32 %level, i32 %layer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Int32, Int32}, target, attachment, texture, level, layer)
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

# Original C signature: void glGenFramebuffers(GLsizei n, GLuint * framebuffers)
function llvm_glGenFramebuffers(n::Int32, framebuffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenFramebuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %framebuffers) {
entry:
    call void @glGenFramebuffers(i32 %n, i8* %framebuffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, framebuffers)
end

# Original C signature: void glGenQueries(GLsizei n, GLuint * ids)
function llvm_glGenQueries(n::Int32, ids::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenQueries(i32, i8*) nounwind

define void @main(i32 %n, i8* %ids) {
entry:
    call void @glGenQueries(i32 %n, i8* %ids)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, ids)
end

# Original C signature: void glGenRenderbuffers(GLsizei n, GLuint * renderbuffers)
function llvm_glGenRenderbuffers(n::Int32, renderbuffers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenRenderbuffers(i32, i8*) nounwind

define void @main(i32 %n, i8* %renderbuffers) {
entry:
    call void @glGenRenderbuffers(i32 %n, i8* %renderbuffers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, renderbuffers)
end

# Original C signature: void glGenSamplers(GLsizei count, GLuint * samplers)
function llvm_glGenSamplers(count::Int32, samplers::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenSamplers(i32, i8*) nounwind

define void @main(i32 %count, i8* %samplers) {
entry:
    call void @glGenSamplers(i32 %count, i8* %samplers)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, count, samplers)
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

# Original C signature: void glGenTransformFeedbacks(GLsizei n, GLuint * ids)
function llvm_glGenTransformFeedbacks(n::Int32, ids::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenTransformFeedbacks(i32, i8*) nounwind

define void @main(i32 %n, i8* %ids) {
entry:
    call void @glGenTransformFeedbacks(i32 %n, i8* %ids)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, ids)
end

# Original C signature: void glGenVertexArrays(GLsizei n, GLuint * arrays)
function llvm_glGenVertexArrays(n::Int32, arrays::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGenVertexArrays(i32, i8*) nounwind

define void @main(i32 %n, i8* %arrays) {
entry:
    call void @glGenVertexArrays(i32 %n, i8* %arrays)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}}, n, arrays)
end

# Original C signature: void glGenerateMipmap(GLenum target)
function llvm_glGenerateMipmap(target::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glGenerateMipmap(i32) nounwind

define void @main(i32 %target) {
entry:
    call void @glGenerateMipmap(i32 %target)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, target)
end

# Original C signature: void glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufSize, GLsizei * length, GLint * size, GLenum * type, GLchar * name)
function llvm_glGetActiveAttrib(program::UInt32, index::UInt32, bufSize::Int32, length::Ptr{Int32}, size::Ptr{Int32}, type_::Ptr{UInt32}, name::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetActiveAttrib(i32, i32, i32, i8*, i8*, i8*, i8*) nounwind

define void @main(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name) {
entry:
    call void @glGetActiveAttrib(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Ptr{Int32}, Ptr{Int32}, Ptr{UInt32}, Ptr{UInt8}}, program, index, bufSize, length, size, type_, name)
end

# Original C signature: void glGetActiveUniform(GLuint program, GLuint index, GLsizei bufSize, GLsizei * length, GLint * size, GLenum * type, GLchar * name)
function llvm_glGetActiveUniform(program::UInt32, index::UInt32, bufSize::Int32, length::Ptr{Int32}, size::Ptr{Int32}, type_::Ptr{UInt32}, name::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetActiveUniform(i32, i32, i32, i8*, i8*, i8*, i8*) nounwind

define void @main(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name) {
entry:
    call void @glGetActiveUniform(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Ptr{Int32}, Ptr{Int32}, Ptr{UInt32}, Ptr{UInt8}}, program, index, bufSize, length, size, type_, name)
end

# Original C signature: void glGetActiveUniformBlockName(GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei * length, GLchar * uniformBlockName)
function llvm_glGetActiveUniformBlockName(program::UInt32, uniformBlockIndex::UInt32, bufSize::Int32, length::Ptr{Int32}, uniformBlockName::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetActiveUniformBlockName(i32, i32, i32, i8*, i8*) nounwind

define void @main(i32 %program, i32 %uniformBlockIndex, i32 %bufSize, i8* %length, i8* %uniformBlockName) {
entry:
    call void @glGetActiveUniformBlockName(i32 %program, i32 %uniformBlockIndex, i32 %bufSize, i8* %length, i8* %uniformBlockName)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Ptr{Int32}, Ptr{UInt8}}, program, uniformBlockIndex, bufSize, length, uniformBlockName)
end

# Original C signature: void glGetActiveUniformBlockiv(GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint * params)
function llvm_glGetActiveUniformBlockiv(program::UInt32, uniformBlockIndex::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetActiveUniformBlockiv(i32, i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %uniformBlockIndex, i32 %pname, i8* %params) {
entry:
    call void @glGetActiveUniformBlockiv(i32 %program, i32 %uniformBlockIndex, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Ptr{Int32}}, program, uniformBlockIndex, pname, params)
end

# Original C signature: void glGetActiveUniformsiv(GLuint program, GLsizei uniformCount, const GLuint * uniformIndices, GLenum pname, GLint * params)
function llvm_glGetActiveUniformsiv(program::UInt32, uniformCount::Int32, uniformIndices::Ptr{UInt32}, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetActiveUniformsiv(i32, i32, i8*, i32, i8*) nounwind

define void @main(i32 %program, i32 %uniformCount, i8* %uniformIndices, i32 %pname, i8* %params) {
entry:
    call void @glGetActiveUniformsiv(i32 %program, i32 %uniformCount, i8* %uniformIndices, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{UInt32}, UInt32, Ptr{Int32}}, program, uniformCount, uniformIndices, pname, params)
end

# Original C signature: void glGetAttachedShaders(GLuint program, GLsizei maxCount, GLsizei * count, GLuint * shaders)
function llvm_glGetAttachedShaders(program::UInt32, maxCount::Int32, count::Ptr{Int32}, shaders::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetAttachedShaders(i32, i32, i8*, i8*) nounwind

define void @main(i32 %program, i32 %maxCount, i8* %count, i8* %shaders) {
entry:
    call void @glGetAttachedShaders(i32 %program, i32 %maxCount, i8* %count, i8* %shaders)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}, Ptr{UInt32}}, program, maxCount, count, shaders)
end

# Original C signature: GLint glGetAttribLocation(GLuint program, const GLchar * name)
function llvm_glGetAttribLocation(program::UInt32, name::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    declare i32 @glGetAttribLocation(i32, i8*) nounwind

define i32 @main(i32 %program, i8* %name) {
entry:
    %result = call i32 @glGetAttribLocation(i32 %program, i8* %name)
    ret i32 %result
}
    """, "main"), Int32, Tuple{UInt32, Ptr{UInt8}}, program, name)
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

# Original C signature: void glGetBufferParameteri64v(GLenum target, GLenum pname, GLint64 * params)
function llvm_glGetBufferParameteri64v(target::UInt32, pname::UInt32, params::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glGetBufferParameteri64v(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetBufferParameteri64v(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Cvoid}}, target, pname, params)
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

# Original C signature: void glGetBufferPointerv(GLenum target, GLenum pname, void ** params)
function llvm_glGetBufferPointerv(target::UInt32, pname::UInt32, params::Ptr{Ptr{Cvoid}})::Cvoid
    Base.llvmcall(("""
    declare void @glGetBufferPointerv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetBufferPointerv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Ptr{Cvoid}}}, target, pname, params)
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

# Original C signature: GLint glGetFragDataLocation(GLuint program, const GLchar * name)
function llvm_glGetFragDataLocation(program::UInt32, name::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    declare i32 @glGetFragDataLocation(i32, i8*) nounwind

define i32 @main(i32 %program, i8* %name) {
entry:
    %result = call i32 @glGetFragDataLocation(i32 %program, i8* %name)
    ret i32 %result
}
    """, "main"), Int32, Tuple{UInt32, Ptr{UInt8}}, program, name)
end

# Original C signature: void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint * params)
function llvm_glGetFramebufferAttachmentParameteriv(target::UInt32, attachment::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetFramebufferAttachmentParameteriv(i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %attachment, i32 %pname, i8* %params) {
entry:
    call void @glGetFramebufferAttachmentParameteriv(i32 %target, i32 %attachment, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Ptr{Int32}}, target, attachment, pname, params)
end

# Original C signature: void glGetInteger64i_v(GLenum target, GLuint index, GLint64 * data)
function llvm_glGetInteger64i_v(target::UInt32, index::UInt32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glGetInteger64i_v(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %index, i8* %data) {
entry:
    call void @glGetInteger64i_v(i32 %target, i32 %index, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Cvoid}}, target, index, data)
end

# Original C signature: void glGetInteger64v(GLenum pname, GLint64 * data)
function llvm_glGetInteger64v(pname::UInt32, data::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glGetInteger64v(i32, i8*) nounwind

define void @main(i32 %pname, i8* %data) {
entry:
    call void @glGetInteger64v(i32 %pname, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Cvoid}}, pname, data)
end

# Original C signature: void glGetIntegeri_v(GLenum target, GLuint index, GLint * data)
function llvm_glGetIntegeri_v(target::UInt32, index::UInt32, data::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetIntegeri_v(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %index, i8* %data) {
entry:
    call void @glGetIntegeri_v(i32 %target, i32 %index, i8* %data)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, index, data)
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

# Original C signature: void glGetInternalformativ(GLenum target, GLenum internalformat, GLenum pname, GLsizei count, GLint * params)
function llvm_glGetInternalformativ(target::UInt32, internalformat::UInt32, pname::UInt32, count::Int32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetInternalformativ(i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %internalformat, i32 %pname, i32 %count, i8* %params) {
entry:
    call void @glGetInternalformativ(i32 %target, i32 %internalformat, i32 %pname, i32 %count, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, Int32, Ptr{Int32}}, target, internalformat, pname, count, params)
end

# Original C signature: void glGetProgramBinary(GLuint program, GLsizei bufSize, GLsizei * length, GLenum * binaryFormat, void * binary)
function llvm_glGetProgramBinary(program::UInt32, bufSize::Int32, length::Ptr{Int32}, binaryFormat::Ptr{UInt32}, binary::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glGetProgramBinary(i32, i32, i8*, i8*, i8*) nounwind

define void @main(i32 %program, i32 %bufSize, i8* %length, i8* %binaryFormat, i8* %binary) {
entry:
    call void @glGetProgramBinary(i32 %program, i32 %bufSize, i8* %length, i8* %binaryFormat, i8* %binary)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}, Ptr{UInt32}, Ptr{Cvoid}}, program, bufSize, length, binaryFormat, binary)
end

# Original C signature: void glGetProgramInfoLog(GLuint program, GLsizei bufSize, GLsizei * length, GLchar * infoLog)
function llvm_glGetProgramInfoLog(program::UInt32, bufSize::Int32, length::Ptr{Int32}, infoLog::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetProgramInfoLog(i32, i32, i8*, i8*) nounwind

define void @main(i32 %program, i32 %bufSize, i8* %length, i8* %infoLog) {
entry:
    call void @glGetProgramInfoLog(i32 %program, i32 %bufSize, i8* %length, i8* %infoLog)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}, Ptr{UInt8}}, program, bufSize, length, infoLog)
end

# Original C signature: void glGetProgramiv(GLuint program, GLenum pname, GLint * params)
function llvm_glGetProgramiv(program::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetProgramiv(i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %pname, i8* %params) {
entry:
    call void @glGetProgramiv(i32 %program, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, program, pname, params)
end

# Original C signature: void glGetQueryObjectuiv(GLuint id, GLenum pname, GLuint * params)
function llvm_glGetQueryObjectuiv(id::UInt32, pname::UInt32, params::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetQueryObjectuiv(i32, i32, i8*) nounwind

define void @main(i32 %id, i32 %pname, i8* %params) {
entry:
    call void @glGetQueryObjectuiv(i32 %id, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{UInt32}}, id, pname, params)
end

# Original C signature: void glGetQueryiv(GLenum target, GLenum pname, GLint * params)
function llvm_glGetQueryiv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetQueryiv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetQueryiv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint * params)
function llvm_glGetRenderbufferParameteriv(target::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetRenderbufferParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %pname, i8* %params) {
entry:
    call void @glGetRenderbufferParameteriv(i32 %target, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, target, pname, params)
end

# Original C signature: void glGetSamplerParameterfv(GLuint sampler, GLenum pname, GLfloat * params)
function llvm_glGetSamplerParameterfv(sampler::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetSamplerParameterfv(i32, i32, i8*) nounwind

define void @main(i32 %sampler, i32 %pname, i8* %params) {
entry:
    call void @glGetSamplerParameterfv(i32 %sampler, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, sampler, pname, params)
end

# Original C signature: void glGetSamplerParameteriv(GLuint sampler, GLenum pname, GLint * params)
function llvm_glGetSamplerParameteriv(sampler::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetSamplerParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %sampler, i32 %pname, i8* %params) {
entry:
    call void @glGetSamplerParameteriv(i32 %sampler, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, sampler, pname, params)
end

# Original C signature: void glGetShaderInfoLog(GLuint shader, GLsizei bufSize, GLsizei * length, GLchar * infoLog)
function llvm_glGetShaderInfoLog(shader::UInt32, bufSize::Int32, length::Ptr{Int32}, infoLog::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetShaderInfoLog(i32, i32, i8*, i8*) nounwind

define void @main(i32 %shader, i32 %bufSize, i8* %length, i8* %infoLog) {
entry:
    call void @glGetShaderInfoLog(i32 %shader, i32 %bufSize, i8* %length, i8* %infoLog)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}, Ptr{UInt8}}, shader, bufSize, length, infoLog)
end

# Original C signature: void glGetShaderPrecisionFormat(GLenum shadertype, GLenum precisiontype, GLint * range, GLint * precision)
function llvm_glGetShaderPrecisionFormat(shadertype::UInt32, precisiontype::UInt32, range::Ptr{Int32}, precision::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetShaderPrecisionFormat(i32, i32, i8*, i8*) nounwind

define void @main(i32 %shadertype, i32 %precisiontype, i8* %range, i8* %precision) {
entry:
    call void @glGetShaderPrecisionFormat(i32 %shadertype, i32 %precisiontype, i8* %range, i8* %precision)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}, Ptr{Int32}}, shadertype, precisiontype, range, precision)
end

# Original C signature: void glGetShaderSource(GLuint shader, GLsizei bufSize, GLsizei * length, GLchar * source)
function llvm_glGetShaderSource(shader::UInt32, bufSize::Int32, length::Ptr{Int32}, source::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetShaderSource(i32, i32, i8*, i8*) nounwind

define void @main(i32 %shader, i32 %bufSize, i8* %length, i8* %source) {
entry:
    call void @glGetShaderSource(i32 %shader, i32 %bufSize, i8* %length, i8* %source)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}, Ptr{UInt8}}, shader, bufSize, length, source)
end

# Original C signature: void glGetShaderiv(GLuint shader, GLenum pname, GLint * params)
function llvm_glGetShaderiv(shader::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetShaderiv(i32, i32, i8*) nounwind

define void @main(i32 %shader, i32 %pname, i8* %params) {
entry:
    call void @glGetShaderiv(i32 %shader, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, shader, pname, params)
end

# Original C signature: void glGetSynciv(GLsync sync, GLenum pname, GLsizei count, GLsizei * length, GLint * values)
function llvm_glGetSynciv(sync::UInt32, pname::UInt32, count::Int32, length::Ptr{Int32}, values::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetSynciv(i32, i32, i32, i8*, i8*) nounwind

define void @main(i32 %sync, i32 %pname, i32 %count, i8* %length, i8* %values) {
entry:
    call void @glGetSynciv(i32 %sync, i32 %pname, i32 %count, i8* %length, i8* %values)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Ptr{Int32}, Ptr{Int32}}, sync, pname, count, length, values)
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

# Original C signature: void glGetTransformFeedbackVarying(GLuint program, GLuint index, GLsizei bufSize, GLsizei * length, GLsizei * size, GLenum * type, GLchar * name)
function llvm_glGetTransformFeedbackVarying(program::UInt32, index::UInt32, bufSize::Int32, length::Ptr{Int32}, size::Ptr{Int32}, type_::Ptr{UInt32}, name::Ptr{UInt8})::Cvoid
    Base.llvmcall(("""
    declare void @glGetTransformFeedbackVarying(i32, i32, i32, i8*, i8*, i8*, i8*) nounwind

define void @main(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name) {
entry:
    call void @glGetTransformFeedbackVarying(i32 %program, i32 %index, i32 %bufSize, i8* %length, i8* %size, i8* %type_, i8* %name)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Ptr{Int32}, Ptr{Int32}, Ptr{UInt32}, Ptr{UInt8}}, program, index, bufSize, length, size, type_, name)
end

# Original C signature: GLuint glGetUniformBlockIndex(GLuint program, const GLchar * uniformBlockName)
function llvm_glGetUniformBlockIndex(program::UInt32, uniformBlockName::Ptr{UInt8})::UInt32
    Base.llvmcall(("""
    declare i32 @glGetUniformBlockIndex(i32, i8*) nounwind

define i32 @main(i32 %program, i8* %uniformBlockName) {
entry:
    %result = call i32 @glGetUniformBlockIndex(i32 %program, i8* %uniformBlockName)
    ret i32 %result
}
    """, "main"), UInt32, Tuple{UInt32, Ptr{UInt8}}, program, uniformBlockName)
end

# Original C signature: void glGetUniformIndices(GLuint program, GLsizei uniformCount, const GLchar *const* uniformNames, GLuint * uniformIndices)
function llvm_glGetUniformIndices(program::UInt32, uniformCount::Int32, uniformNames::Ptr{Ptr{Cvoid}}, uniformIndices::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetUniformIndices(i32, i32, i8*, i8*) nounwind

define void @main(i32 %program, i32 %uniformCount, i8* %uniformNames, i8* %uniformIndices) {
entry:
    call void @glGetUniformIndices(i32 %program, i32 %uniformCount, i8* %uniformNames, i8* %uniformIndices)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Ptr{Cvoid}}, Ptr{UInt32}}, program, uniformCount, uniformNames, uniformIndices)
end

# Original C signature: GLint glGetUniformLocation(GLuint program, const GLchar * name)
function llvm_glGetUniformLocation(program::UInt32, name::Ptr{UInt8})::Int32
    Base.llvmcall(("""
    declare i32 @glGetUniformLocation(i32, i8*) nounwind

define i32 @main(i32 %program, i8* %name) {
entry:
    %result = call i32 @glGetUniformLocation(i32 %program, i8* %name)
    ret i32 %result
}
    """, "main"), Int32, Tuple{UInt32, Ptr{UInt8}}, program, name)
end

# Original C signature: void glGetUniformfv(GLuint program, GLint location, GLfloat * params)
function llvm_glGetUniformfv(program::UInt32, location::Int32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetUniformfv(i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %location, i8* %params) {
entry:
    call void @glGetUniformfv(i32 %program, i32 %location, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Float32}}, program, location, params)
end

# Original C signature: void glGetUniformiv(GLuint program, GLint location, GLint * params)
function llvm_glGetUniformiv(program::UInt32, location::Int32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetUniformiv(i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %location, i8* %params) {
entry:
    call void @glGetUniformiv(i32 %program, i32 %location, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Int32}}, program, location, params)
end

# Original C signature: void glGetUniformuiv(GLuint program, GLint location, GLuint * params)
function llvm_glGetUniformuiv(program::UInt32, location::Int32, params::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetUniformuiv(i32, i32, i8*) nounwind

define void @main(i32 %program, i32 %location, i8* %params) {
entry:
    call void @glGetUniformuiv(i32 %program, i32 %location, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{UInt32}}, program, location, params)
end

# Original C signature: void glGetVertexAttribIiv(GLuint index, GLenum pname, GLint * params)
function llvm_glGetVertexAttribIiv(index::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetVertexAttribIiv(i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %pname, i8* %params) {
entry:
    call void @glGetVertexAttribIiv(i32 %index, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, index, pname, params)
end

# Original C signature: void glGetVertexAttribIuiv(GLuint index, GLenum pname, GLuint * params)
function llvm_glGetVertexAttribIuiv(index::UInt32, pname::UInt32, params::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetVertexAttribIuiv(i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %pname, i8* %params) {
entry:
    call void @glGetVertexAttribIuiv(i32 %index, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{UInt32}}, index, pname, params)
end

# Original C signature: void glGetVertexAttribPointerv(GLuint index, GLenum pname, void ** pointer)
function llvm_glGetVertexAttribPointerv(index::UInt32, pname::UInt32, pointer::Ptr{Ptr{Cvoid}})::Cvoid
    Base.llvmcall(("""
    declare void @glGetVertexAttribPointerv(i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %pname, i8* %pointer) {
entry:
    call void @glGetVertexAttribPointerv(i32 %index, i32 %pname, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Ptr{Cvoid}}}, index, pname, pointer)
end

# Original C signature: void glGetVertexAttribfv(GLuint index, GLenum pname, GLfloat * params)
function llvm_glGetVertexAttribfv(index::UInt32, pname::UInt32, params::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetVertexAttribfv(i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %pname, i8* %params) {
entry:
    call void @glGetVertexAttribfv(i32 %index, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, index, pname, params)
end

# Original C signature: void glGetVertexAttribiv(GLuint index, GLenum pname, GLint * params)
function llvm_glGetVertexAttribiv(index::UInt32, pname::UInt32, params::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glGetVertexAttribiv(i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %pname, i8* %params) {
entry:
    call void @glGetVertexAttribiv(i32 %index, i32 %pname, i8* %params)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, index, pname, params)
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

# Original C signature: void glInvalidateFramebuffer(GLenum target, GLsizei numAttachments, const GLenum * attachments)
function llvm_glInvalidateFramebuffer(target::UInt32, numAttachments::Int32, attachments::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glInvalidateFramebuffer(i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %numAttachments, i8* %attachments) {
entry:
    call void @glInvalidateFramebuffer(i32 %target, i32 %numAttachments, i8* %attachments)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{UInt32}}, target, numAttachments, attachments)
end

# Original C signature: void glInvalidateSubFramebuffer(GLenum target, GLsizei numAttachments, const GLenum * attachments, GLint x, GLint y, GLsizei width, GLsizei height)
function llvm_glInvalidateSubFramebuffer(target::UInt32, numAttachments::Int32, attachments::Ptr{UInt32}, x::Int32, y::Int32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glInvalidateSubFramebuffer(i32, i32, i8*, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %numAttachments, i8* %attachments, i32 %x, i32 %y, i32 %width, i32 %height) {
entry:
    call void @glInvalidateSubFramebuffer(i32 %target, i32 %numAttachments, i8* %attachments, i32 %x, i32 %y, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{UInt32}, Int32, Int32, Int32, Int32}, target, numAttachments, attachments, x, y, width, height)
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

# Original C signature: GLboolean glIsFramebuffer(GLuint framebuffer)
function llvm_glIsFramebuffer(framebuffer::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsFramebuffer(i32) nounwind

define i8 @main(i32 %framebuffer) {
entry:
    %result = call i8 @glIsFramebuffer(i32 %framebuffer)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, framebuffer)
end

# Original C signature: GLboolean glIsProgram(GLuint program)
function llvm_glIsProgram(program::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsProgram(i32) nounwind

define i8 @main(i32 %program) {
entry:
    %result = call i8 @glIsProgram(i32 %program)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, program)
end

# Original C signature: GLboolean glIsQuery(GLuint id)
function llvm_glIsQuery(id::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsQuery(i32) nounwind

define i8 @main(i32 %id) {
entry:
    %result = call i8 @glIsQuery(i32 %id)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, id)
end

# Original C signature: GLboolean glIsRenderbuffer(GLuint renderbuffer)
function llvm_glIsRenderbuffer(renderbuffer::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsRenderbuffer(i32) nounwind

define i8 @main(i32 %renderbuffer) {
entry:
    %result = call i8 @glIsRenderbuffer(i32 %renderbuffer)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, renderbuffer)
end

# Original C signature: GLboolean glIsSampler(GLuint sampler)
function llvm_glIsSampler(sampler::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsSampler(i32) nounwind

define i8 @main(i32 %sampler) {
entry:
    %result = call i8 @glIsSampler(i32 %sampler)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, sampler)
end

# Original C signature: GLboolean glIsShader(GLuint shader)
function llvm_glIsShader(shader::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsShader(i32) nounwind

define i8 @main(i32 %shader) {
entry:
    %result = call i8 @glIsShader(i32 %shader)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, shader)
end

# Original C signature: GLboolean glIsSync(GLsync sync)
function llvm_glIsSync(sync::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsSync(i32) nounwind

define i8 @main(i32 %sync) {
entry:
    %result = call i8 @glIsSync(i32 %sync)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, sync)
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

# Original C signature: GLboolean glIsTransformFeedback(GLuint id)
function llvm_glIsTransformFeedback(id::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsTransformFeedback(i32) nounwind

define i8 @main(i32 %id) {
entry:
    %result = call i8 @glIsTransformFeedback(i32 %id)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, id)
end

# Original C signature: GLboolean glIsVertexArray(GLuint array)
function llvm_glIsVertexArray(array::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glIsVertexArray(i32) nounwind

define i8 @main(i32 %array) {
entry:
    %result = call i8 @glIsVertexArray(i32 %array)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, array)
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

# Original C signature: void glLinkProgram(GLuint program)
function llvm_glLinkProgram(program::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glLinkProgram(i32) nounwind

define void @main(i32 %program) {
entry:
    call void @glLinkProgram(i32 %program)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, program)
end

# Original C signature: void glPauseTransformFeedback()
function llvm_glPauseTransformFeedback()::Cvoid
    Base.llvmcall(("""
    declare void @glPauseTransformFeedback() nounwind

define void @main() {
entry:
    call void @glPauseTransformFeedback()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
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

# Original C signature: void glProgramBinary(GLuint program, GLenum binaryFormat, const void * binary, GLsizei length)
function llvm_glProgramBinary(program::UInt32, binaryFormat::UInt32, binary::Ptr{Cvoid}, length::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glProgramBinary(i32, i32, i8*, i32) nounwind

define void @main(i32 %program, i32 %binaryFormat, i8* %binary, i32 %length) {
entry:
    call void @glProgramBinary(i32 %program, i32 %binaryFormat, i8* %binary, i32 %length)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Cvoid}, Int32}, program, binaryFormat, binary, length)
end

# Original C signature: void glProgramParameteri(GLuint program, GLenum pname, GLint value)
function llvm_glProgramParameteri(program::UInt32, pname::UInt32, value::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glProgramParameteri(i32, i32, i32) nounwind

define void @main(i32 %program, i32 %pname, i32 %value) {
entry:
    call void @glProgramParameteri(i32 %program, i32 %pname, i32 %value)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, program, pname, value)
end

# Original C signature: void glReadBuffer(GLenum src)
function llvm_glReadBuffer(src::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glReadBuffer(i32) nounwind

define void @main(i32 %src) {
entry:
    call void @glReadBuffer(i32 %src)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, src)
end

# Original C signature: void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void * pixels)
function llvm_glReadPixels(x::Int32, y::Int32, width::Int32, height::Int32, format::UInt32, type_::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glReadPixels(i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %x, i32 %y, i32 %width, i32 %height, i32 %format, i32 %type_, i8* %pixels) {
entry:
    call void @glReadPixels(i32 %x, i32 %y, i32 %width, i32 %height, i32 %format, i32 %type_, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, x, y, width, height, format, type_, pixels)
end

# Original C signature: void glReleaseShaderCompiler()
function llvm_glReleaseShaderCompiler()::Cvoid
    Base.llvmcall(("""
    declare void @glReleaseShaderCompiler() nounwind

define void @main() {
entry:
    call void @glReleaseShaderCompiler()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
end

# Original C signature: void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
function llvm_glRenderbufferStorage(target::UInt32, internalformat::UInt32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glRenderbufferStorage(i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %internalformat, i32 %width, i32 %height) {
entry:
    call void @glRenderbufferStorage(i32 %target, i32 %internalformat, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, Int32}, target, internalformat, width, height)
end

# Original C signature: void glRenderbufferStorageMultisample(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)
function llvm_glRenderbufferStorageMultisample(target::UInt32, samples::Int32, internalformat::UInt32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glRenderbufferStorageMultisample(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %samples, i32 %internalformat, i32 %width, i32 %height) {
entry:
    call void @glRenderbufferStorageMultisample(i32 %target, i32 %samples, i32 %internalformat, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32}, target, samples, internalformat, width, height)
end

# Original C signature: void glResumeTransformFeedback()
function llvm_glResumeTransformFeedback()::Cvoid
    Base.llvmcall(("""
    declare void @glResumeTransformFeedback() nounwind

define void @main() {
entry:
    call void @glResumeTransformFeedback()
    ret void
}
    """, "main"), Cvoid, Tuple{}, )
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

# Original C signature: void glSamplerParameterf(GLuint sampler, GLenum pname, GLfloat param)
function llvm_glSamplerParameterf(sampler::UInt32, pname::UInt32, param::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glSamplerParameterf(i32, i32, float) nounwind

define void @main(i32 %sampler, i32 %pname, float %param) {
entry:
    call void @glSamplerParameterf(i32 %sampler, i32 %pname, float %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Float32}, sampler, pname, param)
end

# Original C signature: void glSamplerParameterfv(GLuint sampler, GLenum pname, const GLfloat * param)
function llvm_glSamplerParameterfv(sampler::UInt32, pname::UInt32, param::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glSamplerParameterfv(i32, i32, i8*) nounwind

define void @main(i32 %sampler, i32 %pname, i8* %param) {
entry:
    call void @glSamplerParameterfv(i32 %sampler, i32 %pname, i8* %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Float32}}, sampler, pname, param)
end

# Original C signature: void glSamplerParameteri(GLuint sampler, GLenum pname, GLint param)
function llvm_glSamplerParameteri(sampler::UInt32, pname::UInt32, param::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glSamplerParameteri(i32, i32, i32) nounwind

define void @main(i32 %sampler, i32 %pname, i32 %param) {
entry:
    call void @glSamplerParameteri(i32 %sampler, i32 %pname, i32 %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32}, sampler, pname, param)
end

# Original C signature: void glSamplerParameteriv(GLuint sampler, GLenum pname, const GLint * param)
function llvm_glSamplerParameteriv(sampler::UInt32, pname::UInt32, param::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glSamplerParameteriv(i32, i32, i8*) nounwind

define void @main(i32 %sampler, i32 %pname, i8* %param) {
entry:
    call void @glSamplerParameteriv(i32 %sampler, i32 %pname, i8* %param)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Ptr{Int32}}, sampler, pname, param)
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

# Original C signature: void glShaderBinary(GLsizei count, const GLuint * shaders, GLenum binaryformat, const void * binary, GLsizei length)
function llvm_glShaderBinary(count::Int32, shaders::Ptr{UInt32}, binaryformat::UInt32, binary::Ptr{Cvoid}, length::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glShaderBinary(i32, i8*, i32, i8*, i32) nounwind

define void @main(i32 %count, i8* %shaders, i32 %binaryformat, i8* %binary, i32 %length) {
entry:
    call void @glShaderBinary(i32 %count, i8* %shaders, i32 %binaryformat, i8* %binary, i32 %length)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Ptr{UInt32}, UInt32, Ptr{Cvoid}, Int32}, count, shaders, binaryformat, binary, length)
end

# Original C signature: void glShaderSource(GLuint shader, GLsizei count, const GLchar *const* string, const GLint * length)
function llvm_glShaderSource(shader::UInt32, count::Int32, string::Ptr{Ptr{Cvoid}}, length::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glShaderSource(i32, i32, i8*, i8*) nounwind

define void @main(i32 %shader, i32 %count, i8* %string, i8* %length) {
entry:
    call void @glShaderSource(i32 %shader, i32 %count, i8* %string, i8* %length)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Ptr{Cvoid}}, Ptr{Int32}}, shader, count, string, length)
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

# Original C signature: void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
function llvm_glStencilFuncSeparate(face::UInt32, func::UInt32, ref::Int32, mask::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilFuncSeparate(i32, i32, i32, i32) nounwind

define void @main(i32 %face, i32 %func, i32 %ref, i32 %mask) {
entry:
    call void @glStencilFuncSeparate(i32 %face, i32 %func, i32 %ref, i32 %mask)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, Int32, UInt32}, face, func, ref, mask)
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

# Original C signature: void glStencilMaskSeparate(GLenum face, GLuint mask)
function llvm_glStencilMaskSeparate(face::UInt32, mask::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilMaskSeparate(i32, i32) nounwind

define void @main(i32 %face, i32 %mask) {
entry:
    call void @glStencilMaskSeparate(i32 %face, i32 %mask)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, face, mask)
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

# Original C signature: void glStencilOpSeparate(GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass)
function llvm_glStencilOpSeparate(face::UInt32, sfail::UInt32, dpfail::UInt32, dppass::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glStencilOpSeparate(i32, i32, i32, i32) nounwind

define void @main(i32 %face, i32 %sfail, i32 %dpfail, i32 %dppass) {
entry:
    call void @glStencilOpSeparate(i32 %face, i32 %sfail, i32 %dpfail, i32 %dppass)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, UInt32}, face, sfail, dpfail, dppass)
end

# Original C signature: void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void * pixels)
function llvm_glTexImage2D(target::UInt32, level::Int32, internalformat::Int32, width::Int32, height::Int32, border::Int32, format::UInt32, type_::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %format, i32 %type_, i8* %pixels) {
entry:
    call void @glTexImage2D(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %border, i32 %format, i32 %type_, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, internalformat, width, height, border, format, type_, pixels)
end

# Original C signature: void glTexImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void * pixels)
function llvm_glTexImage3D(target::UInt32, level::Int32, internalformat::Int32, width::Int32, height::Int32, depth::Int32, border::Int32, format::UInt32, type_::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %depth, i32 %border, i32 %format, i32 %type_, i8* %pixels) {
entry:
    call void @glTexImage3D(i32 %target, i32 %level, i32 %internalformat, i32 %width, i32 %height, i32 %depth, i32 %border, i32 %format, i32 %type_, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, internalformat, width, height, depth, border, format, type_, pixels)
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

# Original C signature: void glTexStorage2D(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height)
function llvm_glTexStorage2D(target::UInt32, levels::Int32, internalformat::UInt32, width::Int32, height::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexStorage2D(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %levels, i32 %internalformat, i32 %width, i32 %height) {
entry:
    call void @glTexStorage2D(i32 %target, i32 %levels, i32 %internalformat, i32 %width, i32 %height)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32}, target, levels, internalformat, width, height)
end

# Original C signature: void glTexStorage3D(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth)
function llvm_glTexStorage3D(target::UInt32, levels::Int32, internalformat::UInt32, width::Int32, height::Int32, depth::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glTexStorage3D(i32, i32, i32, i32, i32, i32) nounwind

define void @main(i32 %target, i32 %levels, i32 %internalformat, i32 %width, i32 %height, i32 %depth) {
entry:
    call void @glTexStorage3D(i32 %target, i32 %levels, i32 %internalformat, i32 %width, i32 %height, i32 %depth)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Int32, Int32}, target, levels, internalformat, width, height, depth)
end

# Original C signature: void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void * pixels)
function llvm_glTexSubImage2D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, width::Int32, height::Int32, format::UInt32, type_::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %type_, i8* %pixels) {
entry:
    call void @glTexSubImage2D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %width, i32 %height, i32 %format, i32 %type_, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, xoffset, yoffset, width, height, format, type_, pixels)
end

# Original C signature: void glTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void * pixels)
function llvm_glTexSubImage3D(target::UInt32, level::Int32, xoffset::Int32, yoffset::Int32, zoffset::Int32, width::Int32, height::Int32, depth::Int32, format::UInt32, type_::UInt32, pixels::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %width, i32 %height, i32 %depth, i32 %format, i32 %type_, i8* %pixels) {
entry:
    call void @glTexSubImage3D(i32 %target, i32 %level, i32 %xoffset, i32 %yoffset, i32 %zoffset, i32 %width, i32 %height, i32 %depth, i32 %format, i32 %type_, i8* %pixels)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, UInt32, UInt32, Ptr{Cvoid}}, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type_, pixels)
end

# Original C signature: void glTransformFeedbackVaryings(GLuint program, GLsizei count, const GLchar *const* varyings, GLenum bufferMode)
function llvm_glTransformFeedbackVaryings(program::UInt32, count::Int32, varyings::Ptr{Ptr{Cvoid}}, bufferMode::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glTransformFeedbackVaryings(i32, i32, i8*, i32) nounwind

define void @main(i32 %program, i32 %count, i8* %varyings, i32 %bufferMode) {
entry:
    call void @glTransformFeedbackVaryings(i32 %program, i32 %count, i8* %varyings, i32 %bufferMode)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Ptr{Ptr{Cvoid}}, UInt32}, program, count, varyings, bufferMode)
end

# Original C signature: void glUniform1f(GLint location, GLfloat v0)
function llvm_glUniform1f(location::Int32, v0::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1f(i32, float) nounwind

define void @main(i32 %location, float %v0) {
entry:
    call void @glUniform1f(i32 %location, float %v0)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Float32}, location, v0)
end

# Original C signature: void glUniform1fv(GLint location, GLsizei count, const GLfloat * value)
function llvm_glUniform1fv(location::Int32, count::Int32, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1fv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform1fv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Float32}}, location, count, value)
end

# Original C signature: void glUniform1i(GLint location, GLint v0)
function llvm_glUniform1i(location::Int32, v0::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1i(i32, i32) nounwind

define void @main(i32 %location, i32 %v0) {
entry:
    call void @glUniform1i(i32 %location, i32 %v0)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32}, location, v0)
end

# Original C signature: void glUniform1iv(GLint location, GLsizei count, const GLint * value)
function llvm_glUniform1iv(location::Int32, count::Int32, value::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1iv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform1iv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Int32}}, location, count, value)
end

# Original C signature: void glUniform1ui(GLint location, GLuint v0)
function llvm_glUniform1ui(location::Int32, v0::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1ui(i32, i32) nounwind

define void @main(i32 %location, i32 %v0) {
entry:
    call void @glUniform1ui(i32 %location, i32 %v0)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32}, location, v0)
end

# Original C signature: void glUniform1uiv(GLint location, GLsizei count, const GLuint * value)
function llvm_glUniform1uiv(location::Int32, count::Int32, value::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform1uiv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform1uiv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{UInt32}}, location, count, value)
end

# Original C signature: void glUniform2f(GLint location, GLfloat v0, GLfloat v1)
function llvm_glUniform2f(location::Int32, v0::Float32, v1::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2f(i32, float, float) nounwind

define void @main(i32 %location, float %v0, float %v1) {
entry:
    call void @glUniform2f(i32 %location, float %v0, float %v1)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Float32, Float32}, location, v0, v1)
end

# Original C signature: void glUniform2fv(GLint location, GLsizei count, const GLfloat * value)
function llvm_glUniform2fv(location::Int32, count::Int32, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2fv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform2fv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Float32}}, location, count, value)
end

# Original C signature: void glUniform2i(GLint location, GLint v0, GLint v1)
function llvm_glUniform2i(location::Int32, v0::Int32, v1::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2i(i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1) {
entry:
    call void @glUniform2i(i32 %location, i32 %v0, i32 %v1)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32}, location, v0, v1)
end

# Original C signature: void glUniform2iv(GLint location, GLsizei count, const GLint * value)
function llvm_glUniform2iv(location::Int32, count::Int32, value::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2iv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform2iv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Int32}}, location, count, value)
end

# Original C signature: void glUniform2ui(GLint location, GLuint v0, GLuint v1)
function llvm_glUniform2ui(location::Int32, v0::UInt32, v1::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2ui(i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1) {
entry:
    call void @glUniform2ui(i32 %location, i32 %v0, i32 %v1)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, UInt32}, location, v0, v1)
end

# Original C signature: void glUniform2uiv(GLint location, GLsizei count, const GLuint * value)
function llvm_glUniform2uiv(location::Int32, count::Int32, value::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform2uiv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform2uiv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{UInt32}}, location, count, value)
end

# Original C signature: void glUniform3f(GLint location, GLfloat v0, GLfloat v1, GLfloat v2)
function llvm_glUniform3f(location::Int32, v0::Float32, v1::Float32, v2::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3f(i32, float, float, float) nounwind

define void @main(i32 %location, float %v0, float %v1, float %v2) {
entry:
    call void @glUniform3f(i32 %location, float %v0, float %v1, float %v2)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Float32, Float32, Float32}, location, v0, v1, v2)
end

# Original C signature: void glUniform3fv(GLint location, GLsizei count, const GLfloat * value)
function llvm_glUniform3fv(location::Int32, count::Int32, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3fv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform3fv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Float32}}, location, count, value)
end

# Original C signature: void glUniform3i(GLint location, GLint v0, GLint v1, GLint v2)
function llvm_glUniform3i(location::Int32, v0::Int32, v1::Int32, v2::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3i(i32, i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1, i32 %v2) {
entry:
    call void @glUniform3i(i32 %location, i32 %v0, i32 %v1, i32 %v2)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32}, location, v0, v1, v2)
end

# Original C signature: void glUniform3iv(GLint location, GLsizei count, const GLint * value)
function llvm_glUniform3iv(location::Int32, count::Int32, value::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3iv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform3iv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Int32}}, location, count, value)
end

# Original C signature: void glUniform3ui(GLint location, GLuint v0, GLuint v1, GLuint v2)
function llvm_glUniform3ui(location::Int32, v0::UInt32, v1::UInt32, v2::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3ui(i32, i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1, i32 %v2) {
entry:
    call void @glUniform3ui(i32 %location, i32 %v0, i32 %v1, i32 %v2)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, UInt32, UInt32}, location, v0, v1, v2)
end

# Original C signature: void glUniform3uiv(GLint location, GLsizei count, const GLuint * value)
function llvm_glUniform3uiv(location::Int32, count::Int32, value::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform3uiv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform3uiv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{UInt32}}, location, count, value)
end

# Original C signature: void glUniform4f(GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)
function llvm_glUniform4f(location::Int32, v0::Float32, v1::Float32, v2::Float32, v3::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4f(i32, float, float, float, float) nounwind

define void @main(i32 %location, float %v0, float %v1, float %v2, float %v3) {
entry:
    call void @glUniform4f(i32 %location, float %v0, float %v1, float %v2, float %v3)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Float32, Float32, Float32, Float32}, location, v0, v1, v2, v3)
end

# Original C signature: void glUniform4fv(GLint location, GLsizei count, const GLfloat * value)
function llvm_glUniform4fv(location::Int32, count::Int32, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4fv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform4fv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Float32}}, location, count, value)
end

# Original C signature: void glUniform4i(GLint location, GLint v0, GLint v1, GLint v2, GLint v3)
function llvm_glUniform4i(location::Int32, v0::Int32, v1::Int32, v2::Int32, v3::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4i(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1, i32 %v2, i32 %v3) {
entry:
    call void @glUniform4i(i32 %location, i32 %v0, i32 %v1, i32 %v2, i32 %v3)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Int32, Int32, Int32}, location, v0, v1, v2, v3)
end

# Original C signature: void glUniform4iv(GLint location, GLsizei count, const GLint * value)
function llvm_glUniform4iv(location::Int32, count::Int32, value::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4iv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform4iv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{Int32}}, location, count, value)
end

# Original C signature: void glUniform4ui(GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)
function llvm_glUniform4ui(location::Int32, v0::UInt32, v1::UInt32, v2::UInt32, v3::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4ui(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %location, i32 %v0, i32 %v1, i32 %v2, i32 %v3) {
entry:
    call void @glUniform4ui(i32 %location, i32 %v0, i32 %v1, i32 %v2, i32 %v3)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, UInt32, UInt32, UInt32, UInt32}, location, v0, v1, v2, v3)
end

# Original C signature: void glUniform4uiv(GLint location, GLsizei count, const GLuint * value)
function llvm_glUniform4uiv(location::Int32, count::Int32, value::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniform4uiv(i32, i32, i8*) nounwind

define void @main(i32 %location, i32 %count, i8* %value) {
entry:
    call void @glUniform4uiv(i32 %location, i32 %count, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, Ptr{UInt32}}, location, count, value)
end

# Original C signature: void glUniformBlockBinding(GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding)
function llvm_glUniformBlockBinding(program::UInt32, uniformBlockIndex::UInt32, uniformBlockBinding::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUniformBlockBinding(i32, i32, i32) nounwind

define void @main(i32 %program, i32 %uniformBlockIndex, i32 %uniformBlockBinding) {
entry:
    call void @glUniformBlockBinding(i32 %program, i32 %uniformBlockIndex, i32 %uniformBlockBinding)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32}, program, uniformBlockIndex, uniformBlockBinding)
end

# Original C signature: void glUniformMatrix2fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix2fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix2fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix2fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix2x3fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix2x3fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix2x3fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix2x3fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix2x4fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix2x4fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix2x4fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix2x4fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix3fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix3fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix3fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix3fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix3x2fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix3x2fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix3x2fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix3x2fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix3x4fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix3x4fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix3x4fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix3x4fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix4fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix4fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix4fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix4fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix4x2fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix4x2fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix4x2fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix4x2fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: void glUniformMatrix4x3fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat * value)
function llvm_glUniformMatrix4x3fv(location::Int32, count::Int32, transpose::UInt8, value::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glUniformMatrix4x3fv(i32, i32, i8, i8*) nounwind

define void @main(i32 %location, i32 %count, i8 %transpose, i8* %value) {
entry:
    call void @glUniformMatrix4x3fv(i32 %location, i32 %count, i8 %transpose, i8* %value)
    ret void
}
    """, "main"), Cvoid, Tuple{Int32, Int32, UInt8, Ptr{Float32}}, location, count, transpose, value)
end

# Original C signature: GLboolean glUnmapBuffer(GLenum target)
function llvm_glUnmapBuffer(target::UInt32)::UInt8
    Base.llvmcall(("""
    declare i8 @glUnmapBuffer(i32) nounwind

define i8 @main(i32 %target) {
entry:
    %result = call i8 @glUnmapBuffer(i32 %target)
    ret i8 %result
}
    """, "main"), UInt8, Tuple{UInt32}, target)
end

# Original C signature: void glUseProgram(GLuint program)
function llvm_glUseProgram(program::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glUseProgram(i32) nounwind

define void @main(i32 %program) {
entry:
    call void @glUseProgram(i32 %program)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, program)
end

# Original C signature: void glValidateProgram(GLuint program)
function llvm_glValidateProgram(program::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glValidateProgram(i32) nounwind

define void @main(i32 %program) {
entry:
    call void @glValidateProgram(i32 %program)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32}, program)
end

# Original C signature: void glVertexAttrib1f(GLuint index, GLfloat x)
function llvm_glVertexAttrib1f(index::UInt32, x::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib1f(i32, float) nounwind

define void @main(i32 %index, float %x) {
entry:
    call void @glVertexAttrib1f(i32 %index, float %x)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32}, index, x)
end

# Original C signature: void glVertexAttrib1fv(GLuint index, const GLfloat * v)
function llvm_glVertexAttrib1fv(index::UInt32, v::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib1fv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttrib1fv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, index, v)
end

# Original C signature: void glVertexAttrib2f(GLuint index, GLfloat x, GLfloat y)
function llvm_glVertexAttrib2f(index::UInt32, x::Float32, y::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib2f(i32, float, float) nounwind

define void @main(i32 %index, float %x, float %y) {
entry:
    call void @glVertexAttrib2f(i32 %index, float %x, float %y)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32, Float32}, index, x, y)
end

# Original C signature: void glVertexAttrib2fv(GLuint index, const GLfloat * v)
function llvm_glVertexAttrib2fv(index::UInt32, v::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib2fv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttrib2fv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, index, v)
end

# Original C signature: void glVertexAttrib3f(GLuint index, GLfloat x, GLfloat y, GLfloat z)
function llvm_glVertexAttrib3f(index::UInt32, x::Float32, y::Float32, z::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib3f(i32, float, float, float) nounwind

define void @main(i32 %index, float %x, float %y, float %z) {
entry:
    call void @glVertexAttrib3f(i32 %index, float %x, float %y, float %z)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32, Float32, Float32}, index, x, y, z)
end

# Original C signature: void glVertexAttrib3fv(GLuint index, const GLfloat * v)
function llvm_glVertexAttrib3fv(index::UInt32, v::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib3fv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttrib3fv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, index, v)
end

# Original C signature: void glVertexAttrib4f(GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
function llvm_glVertexAttrib4f(index::UInt32, x::Float32, y::Float32, z::Float32, w::Float32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib4f(i32, float, float, float, float) nounwind

define void @main(i32 %index, float %x, float %y, float %z, float %w) {
entry:
    call void @glVertexAttrib4f(i32 %index, float %x, float %y, float %z, float %w)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Float32, Float32, Float32, Float32}, index, x, y, z, w)
end

# Original C signature: void glVertexAttrib4fv(GLuint index, const GLfloat * v)
function llvm_glVertexAttrib4fv(index::UInt32, v::Ptr{Float32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttrib4fv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttrib4fv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Float32}}, index, v)
end

# Original C signature: void glVertexAttribDivisor(GLuint index, GLuint divisor)
function llvm_glVertexAttribDivisor(index::UInt32, divisor::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribDivisor(i32, i32) nounwind

define void @main(i32 %index, i32 %divisor) {
entry:
    call void @glVertexAttribDivisor(i32 %index, i32 %divisor)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32}, index, divisor)
end

# Original C signature: void glVertexAttribI4i(GLuint index, GLint x, GLint y, GLint z, GLint w)
function llvm_glVertexAttribI4i(index::UInt32, x::Int32, y::Int32, z::Int32, w::Int32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribI4i(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %index, i32 %x, i32 %y, i32 %z, i32 %w) {
entry:
    call void @glVertexAttribI4i(i32 %index, i32 %x, i32 %y, i32 %z, i32 %w)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, Int32, Int32, Int32}, index, x, y, z, w)
end

# Original C signature: void glVertexAttribI4iv(GLuint index, const GLint * v)
function llvm_glVertexAttribI4iv(index::UInt32, v::Ptr{Int32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribI4iv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttribI4iv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{Int32}}, index, v)
end

# Original C signature: void glVertexAttribI4ui(GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)
function llvm_glVertexAttribI4ui(index::UInt32, x::UInt32, y::UInt32, z::UInt32, w::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribI4ui(i32, i32, i32, i32, i32) nounwind

define void @main(i32 %index, i32 %x, i32 %y, i32 %z, i32 %w) {
entry:
    call void @glVertexAttribI4ui(i32 %index, i32 %x, i32 %y, i32 %z, i32 %w)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32, UInt32, UInt32}, index, x, y, z, w)
end

# Original C signature: void glVertexAttribI4uiv(GLuint index, const GLuint * v)
function llvm_glVertexAttribI4uiv(index::UInt32, v::Ptr{UInt32})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribI4uiv(i32, i8*) nounwind

define void @main(i32 %index, i8* %v) {
entry:
    call void @glVertexAttribI4uiv(i32 %index, i8* %v)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Ptr{UInt32}}, index, v)
end

# Original C signature: void glVertexAttribIPointer(GLuint index, GLint size, GLenum type, GLsizei stride, const void * pointer)
function llvm_glVertexAttribIPointer(index::UInt32, size::Int32, type_::UInt32, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribIPointer(i32, i32, i32, i32, i8*) nounwind

define void @main(i32 %index, i32 %size, i32 %type_, i32 %stride, i8* %pointer) {
entry:
    call void @glVertexAttribIPointer(i32 %index, i32 %size, i32 %type_, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, Int32, Ptr{Cvoid}}, index, size, type_, stride, pointer)
end

# Original C signature: void glVertexAttribPointer(GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void * pointer)
function llvm_glVertexAttribPointer(index::UInt32, size::Int32, type_::UInt32, normalized::UInt8, stride::Int32, pointer::Ptr{Cvoid})::Cvoid
    Base.llvmcall(("""
    declare void @glVertexAttribPointer(i32, i32, i32, i8, i32, i8*) nounwind

define void @main(i32 %index, i32 %size, i32 %type_, i8 %normalized, i32 %stride, i8* %pointer) {
entry:
    call void @glVertexAttribPointer(i32 %index, i32 %size, i32 %type_, i8 %normalized, i32 %stride, i8* %pointer)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, Int32, UInt32, UInt8, Int32, Ptr{Cvoid}}, index, size, type_, normalized, stride, pointer)
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

# Original C signature: void glWaitSync(GLsync sync, GLbitfield flags, GLuint64 timeout)
function llvm_glWaitSync(sync::UInt32, flags::UInt32, timeout::UInt32)::Cvoid
    Base.llvmcall(("""
    declare void @glWaitSync(i32, i32, i32) nounwind

define void @main(i32 %sync, i32 %flags, i32 %timeout) {
entry:
    call void @glWaitSync(i32 %sync, i32 %flags, i32 %timeout)
    ret void
}
    """, "main"), Cvoid, Tuple{UInt32, UInt32, UInt32}, sync, flags, timeout)
end