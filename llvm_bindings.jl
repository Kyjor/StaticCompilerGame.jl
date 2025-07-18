# Auto-generated SDL bindings using llvmcall
# Source: SDLCalls/sdl_module.c
# Headers: SDLCalls/SDL2-2.30.11/include



    # Original C signature: void SDL_AddEventWatch(SDL_EventFilter filter, void * userdata)
    function llvm_SDL_AddEventWatch(filter::SDL_EventFilter, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AddEventWatch(i8*, i8*) nounwind

        define void @main(i8* %filter, i8* %userdata) {
        entry:
            call void @SDL_AddEventWatch(i8* %filter, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_EventFilter, Ptr{Cvoid}}, filter, userdata)
    end

    # Original C signature: void SDL_AddHintCallback(const char * name, SDL_HintCallback callback, void * userdata)
    function llvm_SDL_AddHintCallback(name::Ptr{UInt8}, callback::SDL_HintCallback, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AddHintCallback(i8*, i8*, i8*) nounwind

        define void @main(i8* %name, i8* %callback, i8* %userdata) {
        entry:
            call void @SDL_AddHintCallback(i8* %name, i8* %callback, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{UInt8}, SDL_HintCallback, Ptr{Cvoid}}, name, callback, userdata)
    end

    # Original C signature: SDL_TimerID SDL_AddTimer(Uint32 interval, SDL_TimerCallback callback, void * param)
    function llvm_SDL_AddTimer(interval::UInt32, callback::Cvoid, param::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AddTimer(i32, void, i8*) nounwind

        define i32 @main(i32 %interval, void %callback, i8* %param) {
        entry:
            %result = call i32 @SDL_AddTimer(i32 %interval, void %callback, i8* %param)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Cvoid, Ptr{Cvoid}}, interval, callback, param)
    end

    # Original C signature: SDL_PixelFormat * SDL_AllocFormat(Uint32 pixel_format)
    function llvm_SDL_AllocFormat(pixel_format::UInt32)::Ptr{SDL_PixelFormat}
        Base.llvmcall(("""
        declare i8* @SDL_AllocFormat(i32) nounwind

        define i8* @main(i32 %pixel_format) {
        entry:
            %result = call i8* @SDL_AllocFormat(i32 %pixel_format)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_PixelFormat}, Tuple{UInt32}, pixel_format)
    end

    # Original C signature: void SDL_AndroidBackButton()
    function llvm_SDL_AndroidBackButton()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AndroidBackButton() nounwind

        define void @main() {
        entry:
            call void @SDL_AndroidBackButton()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void * SDL_AndroidGetActivity()
    function llvm_SDL_AndroidGetActivity()::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_AndroidGetActivity() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_AndroidGetActivity()
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{}, )
    end

    # Original C signature: const char * SDL_AndroidGetExternalStoragePath()
    function llvm_SDL_AndroidGetExternalStoragePath()::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_AndroidGetExternalStoragePath() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_AndroidGetExternalStoragePath()
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{}, )
    end

    # Original C signature: int SDL_AndroidGetExternalStorageState()
    function llvm_SDL_AndroidGetExternalStorageState()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AndroidGetExternalStorageState() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_AndroidGetExternalStorageState()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: const char * SDL_AndroidGetInternalStoragePath()
    function llvm_SDL_AndroidGetInternalStoragePath()::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_AndroidGetInternalStoragePath() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_AndroidGetInternalStoragePath()
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{}, )
    end

    # Original C signature: void * SDL_AndroidGetJNIEnv()
    function llvm_SDL_AndroidGetJNIEnv()::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_AndroidGetJNIEnv() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_AndroidGetJNIEnv()
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_AndroidRequestPermission(const char * permission)
    function llvm_SDL_AndroidRequestPermission(permission::Ptr{UInt8})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_AndroidRequestPermission(i8*) nounwind

        define i32 @main(i8* %permission) {
        entry:
            %result = call i32 @SDL_AndroidRequestPermission(i8* %permission)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}}, permission)
    end

    # Original C signature: int SDL_AndroidSendMessage(Uint32 command, int param)
    function llvm_SDL_AndroidSendMessage(command::UInt32, param::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AndroidSendMessage(i32, i32) nounwind

        define i32 @main(i32 %command, i32 %param) {
        entry:
            %result = call i32 @SDL_AndroidSendMessage(i32 %command, i32 %param)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Int32}, command, param)
    end

    # Original C signature: int SDL_AndroidShowToast(const char* message, int duration, int gravity, int xoffset, int yoffset)
    function llvm_SDL_AndroidShowToast(message::Ptr{UInt8}, duration::Int32, gravity::Int32, xoffset::Int32, yoffset::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AndroidShowToast(i8*, i32, i32, i32, i32) nounwind

        define i32 @main(i8* %message, i32 %duration, i32 %gravity, i32 %xoffset, i32 %yoffset) {
        entry:
            %result = call i32 @SDL_AndroidShowToast(i8* %message, i32 %duration, i32 %gravity, i32 %xoffset, i32 %yoffset)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Int32, Int32, Int32, Int32}, message, duration, gravity, xoffset, yoffset)
    end

    # Original C signature: int SDL_AtomicAdd(SDL_atomic_t * a, int v)
    function llvm_SDL_AtomicAdd(a::Ptr{SDL_atomic_t}, v::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicAdd(i8*, i32) nounwind

        define i32 @main(i8* %a, i32 %v) {
        entry:
            %result = call i32 @SDL_AtomicAdd(i8* %a, i32 %v)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_atomic_t}, Int32}, a, v)
    end

    # Original C signature: SDL_bool SDL_AtomicCAS(SDL_atomic_t * a, int oldval, int newval)
    function llvm_SDL_AtomicCAS(a::Ptr{SDL_atomic_t}, oldval::Int32, newval::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicCAS(i8*, i32, i32) nounwind

        define i32 @main(i8* %a, i32 %oldval, i32 %newval) {
        entry:
            %result = call i32 @SDL_AtomicCAS(i8* %a, i32 %oldval, i32 %newval)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_atomic_t}, Int32, Int32}, a, oldval, newval)
    end

    # Original C signature: SDL_bool SDL_AtomicCASPtr(void ** a, void * oldval, void * newval)
    function llvm_SDL_AtomicCASPtr(a::Ptr{Ptr{Cvoid}}, oldval::Ptr{Cvoid}, newval::Ptr{Cvoid})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicCASPtr(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %a, i8* %oldval, i8* %newval) {
        entry:
            %result = call i32 @SDL_AtomicCASPtr(i8* %a, i8* %oldval, i8* %newval)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}}, a, oldval, newval)
    end

    # Original C signature: int SDL_AtomicGet(SDL_atomic_t * a)
    function llvm_SDL_AtomicGet(a::Ptr{SDL_atomic_t})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicGet(i8*) nounwind

        define i32 @main(i8* %a) {
        entry:
            %result = call i32 @SDL_AtomicGet(i8* %a)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_atomic_t}}, a)
    end

    # Original C signature: void* SDL_AtomicGetPtr(void ** a)
    function llvm_SDL_AtomicGetPtr(a::Ptr{Ptr{Cvoid}})::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_AtomicGetPtr(i8*) nounwind

        define i8* @main(i8* %a) {
        entry:
            %result = call i8* @SDL_AtomicGetPtr(i8* %a)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{Ptr{Cvoid}}}, a)
    end

    # Original C signature: void SDL_AtomicLock(SDL_SpinLock * lock)
    function llvm_SDL_AtomicLock(lock::Ptr{SDL_SpinLock})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AtomicLock(i8*) nounwind

        define void @main(i8* %lock) {
        entry:
            call void @SDL_AtomicLock(i8* %lock)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_SpinLock}}, lock)
    end

    # Original C signature: int SDL_AtomicSet(SDL_atomic_t * a, int v)
    function llvm_SDL_AtomicSet(a::Ptr{SDL_atomic_t}, v::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicSet(i8*, i32) nounwind

        define i32 @main(i8* %a, i32 %v) {
        entry:
            %result = call i32 @SDL_AtomicSet(i8* %a, i32 %v)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_atomic_t}, Int32}, a, v)
    end

    # Original C signature: void* SDL_AtomicSetPtr(void ** a, void* v)
    function llvm_SDL_AtomicSetPtr(a::Ptr{Ptr{Cvoid}}, v::Ptr{Cvoid})::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_AtomicSetPtr(i8*, i8*) nounwind

        define i8* @main(i8* %a, i8* %v) {
        entry:
            %result = call i8* @SDL_AtomicSetPtr(i8* %a, i8* %v)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{Ptr{Cvoid}}, Ptr{Cvoid}}, a, v)
    end

    # Original C signature: SDL_bool SDL_AtomicTryLock(SDL_SpinLock * lock)
    function llvm_SDL_AtomicTryLock(lock::Ptr{SDL_SpinLock})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_AtomicTryLock(i8*) nounwind

        define i32 @main(i8* %lock) {
        entry:
            %result = call i32 @SDL_AtomicTryLock(i8* %lock)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_SpinLock}}, lock)
    end

    # Original C signature: void SDL_AtomicUnlock(SDL_SpinLock * lock)
    function llvm_SDL_AtomicUnlock(lock::Ptr{SDL_SpinLock})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AtomicUnlock(i8*) nounwind

        define void @main(i8* %lock) {
        entry:
            call void @SDL_AtomicUnlock(i8* %lock)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_SpinLock}}, lock)
    end

    # Original C signature: int SDL_AudioInit(const char * driver_name)
    function llvm_SDL_AudioInit(driver_name::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AudioInit(i8*) nounwind

        define i32 @main(i8* %driver_name) {
        entry:
            %result = call i32 @SDL_AudioInit(i8* %driver_name)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, driver_name)
    end

    # Original C signature: void SDL_AudioQuit()
    function llvm_SDL_AudioQuit()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AudioQuit() nounwind

        define void @main() {
        entry:
            call void @SDL_AudioQuit()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_AudioStreamAvailable(SDL_AudioStream * stream)
    function llvm_SDL_AudioStreamAvailable(stream::Ptr{SDL_AudioStream})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AudioStreamAvailable(i8*) nounwind

        define i32 @main(i8* %stream) {
        entry:
            %result = call i32 @SDL_AudioStreamAvailable(i8* %stream)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioStream}}, stream)
    end

    # Original C signature: void SDL_AudioStreamClear(SDL_AudioStream * stream)
    function llvm_SDL_AudioStreamClear(stream::Ptr{SDL_AudioStream})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_AudioStreamClear(i8*) nounwind

        define void @main(i8* %stream) {
        entry:
            call void @SDL_AudioStreamClear(i8* %stream)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_AudioStream}}, stream)
    end

    # Original C signature: int SDL_AudioStreamFlush(SDL_AudioStream * stream)
    function llvm_SDL_AudioStreamFlush(stream::Ptr{SDL_AudioStream})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AudioStreamFlush(i8*) nounwind

        define i32 @main(i8* %stream) {
        entry:
            %result = call i32 @SDL_AudioStreamFlush(i8* %stream)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioStream}}, stream)
    end

    # Original C signature: int SDL_AudioStreamGet(SDL_AudioStream * stream, void * buf, int len)
    function llvm_SDL_AudioStreamGet(stream::Ptr{SDL_AudioStream}, buf::Ptr{Cvoid}, len::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AudioStreamGet(i8*, i8*, i32) nounwind

        define i32 @main(i8* %stream, i8* %buf, i32 %len) {
        entry:
            %result = call i32 @SDL_AudioStreamGet(i8* %stream, i8* %buf, i32 %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioStream}, Ptr{Cvoid}, Int32}, stream, buf, len)
    end

    # Original C signature: int SDL_AudioStreamPut(SDL_AudioStream * stream, const void * buf, int len)
    function llvm_SDL_AudioStreamPut(stream::Ptr{SDL_AudioStream}, buf::Ptr{Cvoid}, len::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_AudioStreamPut(i8*, i8*, i32) nounwind

        define i32 @main(i8* %stream, i8* %buf, i32 %len) {
        entry:
            %result = call i32 @SDL_AudioStreamPut(i8* %stream, i8* %buf, i32 %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioStream}, Ptr{Cvoid}, Int32}, stream, buf, len)
    end

    # Original C signature: int SDL_BuildAudioCVT(SDL_AudioCVT * cvt, SDL_AudioFormat src_format, Uint8 src_channels, int src_rate, SDL_AudioFormat dst_format, Uint8 dst_channels, int dst_rate)
    function llvm_SDL_BuildAudioCVT(cvt::Ptr{SDL_AudioCVT}, src_format::UInt16, src_channels::UInt8, src_rate::Int32, dst_format::UInt16, dst_channels::UInt8, dst_rate::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_BuildAudioCVT(i8*, i16, i8, i32, i16, i8, i32) nounwind

        define i32 @main(i8* %cvt, i16 %src_format, i8 %src_channels, i32 %src_rate, i16 %dst_format, i8 %dst_channels, i32 %dst_rate) {
        entry:
            %result = call i32 @SDL_BuildAudioCVT(i8* %cvt, i16 %src_format, i8 %src_channels, i32 %src_rate, i16 %dst_format, i8 %dst_channels, i32 %dst_rate)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioCVT}, UInt16, UInt8, Int32, UInt16, UInt8, Int32}, cvt, src_format, src_channels, src_rate, dst_format, dst_channels, dst_rate)
    end

    # Original C signature: void SDL_CalculateGammaRamp(float gamma, Uint16 * ramp)
    function llvm_SDL_CalculateGammaRamp(gamma::Float32, ramp::Ptr{UInt16})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_CalculateGammaRamp(float, i8*) nounwind

        define void @main(float %gamma, i8* %ramp) {
        entry:
            call void @SDL_CalculateGammaRamp(float %gamma, i8* %ramp)
            ret void
        }
        """, "main"), Cvoid, Tuple{Float32, Ptr{UInt16}}, gamma, ramp)
    end

    # Original C signature: int SDL_CaptureMouse(SDL_bool enabled)
    function llvm_SDL_CaptureMouse(enabled::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CaptureMouse(i32) nounwind

        define i32 @main(i32 %enabled) {
        entry:
            %result = call i32 @SDL_CaptureMouse(i32 %enabled)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, enabled)
    end

    # Original C signature: void SDL_ClearComposition()
    function llvm_SDL_ClearComposition()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ClearComposition() nounwind

        define void @main() {
        entry:
            call void @SDL_ClearComposition()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_ClearError()
    function llvm_SDL_ClearError()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ClearError() nounwind

        define void @main() {
        entry:
            call void @SDL_ClearError()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_ClearHints()
    function llvm_SDL_ClearHints()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ClearHints() nounwind

        define void @main() {
        entry:
            call void @SDL_ClearHints()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_ClearQueuedAudio(SDL_AudioDeviceID dev)
    function llvm_SDL_ClearQueuedAudio(dev::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ClearQueuedAudio(i32) nounwind

        define void @main(i32 %dev) {
        entry:
            call void @SDL_ClearQueuedAudio(i32 %dev)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, dev)
    end

    # Original C signature: void SDL_CloseAudio()
    function llvm_SDL_CloseAudio()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_CloseAudio() nounwind

        define void @main() {
        entry:
            call void @SDL_CloseAudio()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_CloseAudioDevice(SDL_AudioDeviceID dev)
    function llvm_SDL_CloseAudioDevice(dev::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_CloseAudioDevice(i32) nounwind

        define void @main(i32 %dev) {
        entry:
            call void @SDL_CloseAudioDevice(i32 %dev)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, dev)
    end

    # Original C signature: SDL_BlendMode SDL_ComposeCustomBlendMode(SDL_BlendFactor srcColorFactor, SDL_BlendFactor dstColorFactor, SDL_BlendOperation colorOperation, SDL_BlendFactor srcAlphaFactor, SDL_BlendFactor dstAlphaFactor, SDL_BlendOperation alphaOperation)
    function llvm_SDL_ComposeCustomBlendMode(srcColorFactor::UInt32, dstColorFactor::UInt32, colorOperation::UInt32, srcAlphaFactor::UInt32, dstAlphaFactor::UInt32, alphaOperation::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_ComposeCustomBlendMode(i32, i32, i32, i32, i32, i32) nounwind

        define i32 @main(i32 %srcColorFactor, i32 %dstColorFactor, i32 %colorOperation, i32 %srcAlphaFactor, i32 %dstAlphaFactor, i32 %alphaOperation) {
        entry:
            %result = call i32 @SDL_ComposeCustomBlendMode(i32 %srcColorFactor, i32 %dstColorFactor, i32 %colorOperation, i32 %srcAlphaFactor, i32 %dstAlphaFactor, i32 %alphaOperation)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}, srcColorFactor, dstColorFactor, colorOperation, srcAlphaFactor, dstAlphaFactor, alphaOperation)
    end

    # Original C signature: int SDL_CondBroadcast(SDL_cond * cond)
    function llvm_SDL_CondBroadcast(cond::Ptr{SDL_cond})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CondBroadcast(i8*) nounwind

        define i32 @main(i8* %cond) {
        entry:
            %result = call i32 @SDL_CondBroadcast(i8* %cond)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_cond}}, cond)
    end

    # Original C signature: int SDL_CondSignal(SDL_cond * cond)
    function llvm_SDL_CondSignal(cond::Ptr{SDL_cond})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CondSignal(i8*) nounwind

        define i32 @main(i8* %cond) {
        entry:
            %result = call i32 @SDL_CondSignal(i8* %cond)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_cond}}, cond)
    end

    # Original C signature: int SDL_CondWait(SDL_cond * cond, SDL_mutex * mutex)
    function llvm_SDL_CondWait(cond::Ptr{SDL_cond}, mutex::Ptr{SDL_mutex})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CondWait(i8*, i8*) nounwind

        define i32 @main(i8* %cond, i8* %mutex) {
        entry:
            %result = call i32 @SDL_CondWait(i8* %cond, i8* %mutex)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_cond}, Ptr{SDL_mutex}}, cond, mutex)
    end

    # Original C signature: int SDL_CondWaitTimeout(SDL_cond * cond, SDL_mutex * mutex, Uint32 ms)
    function llvm_SDL_CondWaitTimeout(cond::Ptr{SDL_cond}, mutex::Ptr{SDL_mutex}, ms::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CondWaitTimeout(i8*, i8*, i32) nounwind

        define i32 @main(i8* %cond, i8* %mutex, i32 %ms) {
        entry:
            %result = call i32 @SDL_CondWaitTimeout(i8* %cond, i8* %mutex, i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_cond}, Ptr{SDL_mutex}, UInt32}, cond, mutex, ms)
    end

    # Original C signature: int SDL_ConvertAudio(SDL_AudioCVT * cvt)
    function llvm_SDL_ConvertAudio(cvt::Ptr{SDL_AudioCVT})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ConvertAudio(i8*) nounwind

        define i32 @main(i8* %cvt) {
        entry:
            %result = call i32 @SDL_ConvertAudio(i8* %cvt)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioCVT}}, cvt)
    end

    # Original C signature: int SDL_ConvertPixels(int width, int height, Uint32 src_format, const void * src, int src_pitch, Uint32 dst_format, void * dst, int dst_pitch)
    function llvm_SDL_ConvertPixels(width::Int32, height::Int32, src_format::UInt32, src::Ptr{Cvoid}, src_pitch::Int32, dst_format::UInt32, dst::Ptr{Cvoid}, dst_pitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ConvertPixels(i32, i32, i32, i8*, i32, i32, i8*, i32) nounwind

        define i32 @main(i32 %width, i32 %height, i32 %src_format, i8* %src, i32 %src_pitch, i32 %dst_format, i8* %dst, i32 %dst_pitch) {
        entry:
            %result = call i32 @SDL_ConvertPixels(i32 %width, i32 %height, i32 %src_format, i8* %src, i32 %src_pitch, i32 %dst_format, i8* %dst, i32 %dst_pitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, UInt32, Ptr{Cvoid}, Int32, UInt32, Ptr{Cvoid}, Int32}, width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch)
    end

    # Original C signature: SDL_Renderer * SDL_CreateRenderer(SDL_Window * window, int index, Uint32 flags)
    function llvm_SDL_CreateRenderer(window::Ptr{SDL_Window}, index::Int32, flags::UInt32)::Ptr{SDL_Renderer}
        Base.llvmcall(("""
        declare i8* @SDL_CreateRenderer(i8*, i32, i32) nounwind

        define i8* @main(i8* %window, i32 %index, i32 %flags) {
        entry:
            %result = call i8* @SDL_CreateRenderer(i8* %window, i32 %index, i32 %flags)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Renderer}, Tuple{Ptr{SDL_Window}, Int32, UInt32}, window, index, flags)
    end

    # Original C signature: SDL_Window * SDL_CreateShapedWindow(const char * title, unsigned int x, unsigned int y, unsigned int w, unsigned int h, Uint32 flags)
    function llvm_SDL_CreateShapedWindow(title::Ptr{UInt8}, x::UInt32, y::UInt32, w::UInt32, h::UInt32, flags::UInt32)::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_CreateShapedWindow(i8*, i32, i32, i32, i32, i32) nounwind

        define i8* @main(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags) {
        entry:
            %result = call i8* @SDL_CreateShapedWindow(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{Ptr{UInt8}, UInt32, UInt32, UInt32, UInt32, UInt32}, title, x, y, w, h, flags)
    end

    # Original C signature: SDL_Renderer * SDL_CreateSoftwareRenderer(SDL_Surface * surface)
    function llvm_SDL_CreateSoftwareRenderer(surface::Ptr{SDL_Surface})::Ptr{SDL_Renderer}
        Base.llvmcall(("""
        declare i8* @SDL_CreateSoftwareRenderer(i8*) nounwind

        define i8* @main(i8* %surface) {
        entry:
            %result = call i8* @SDL_CreateSoftwareRenderer(i8* %surface)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Renderer}, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: SDL_Texture * SDL_CreateTexture(SDL_Renderer * renderer, Uint32 format, int access, int w, int h)
    function llvm_SDL_CreateTexture(renderer::Ptr{SDL_Renderer}, format::UInt32, access::Int32, w::Int32, h::Int32)::Ptr{SDL_Texture}
        Base.llvmcall(("""
        declare i8* @SDL_CreateTexture(i8*, i32, i32, i32, i32) nounwind

        define i8* @main(i8* %renderer, i32 %format, i32 %access, i32 %w, i32 %h) {
        entry:
            %result = call i8* @SDL_CreateTexture(i8* %renderer, i32 %format, i32 %access, i32 %w, i32 %h)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Texture}, Tuple{Ptr{SDL_Renderer}, UInt32, Int32, Int32, Int32}, renderer, format, access, w, h)
    end

    # Original C signature: SDL_Texture * SDL_CreateTextureFromSurface(SDL_Renderer * renderer, SDL_Surface * surface)
    function llvm_SDL_CreateTextureFromSurface(renderer::Ptr{SDL_Renderer}, surface::Ptr{SDL_Surface})::Ptr{SDL_Texture}
        Base.llvmcall(("""
        declare i8* @SDL_CreateTextureFromSurface(i8*, i8*) nounwind

        define i8* @main(i8* %renderer, i8* %surface) {
        entry:
            %result = call i8* @SDL_CreateTextureFromSurface(i8* %renderer, i8* %surface)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Texture}, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Surface}}, renderer, surface)
    end

    # Original C signature: SDL_Window * SDL_CreateWindow(const char * title, int x, int y, int w, int h, Uint32 flags)
    function llvm_SDL_CreateWindow(title::Ptr{UInt8}, x::Int32, y::Int32, w::Int32, h::Int32, flags::UInt32)::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_CreateWindow(i8*, i32, i32, i32, i32, i32) nounwind

        define i8* @main(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags) {
        entry:
            %result = call i8* @SDL_CreateWindow(i8* %title, i32 %x, i32 %y, i32 %w, i32 %h, i32 %flags)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{Ptr{UInt8}, Int32, Int32, Int32, Int32, UInt32}, title, x, y, w, h, flags)
    end

    # Original C signature: int SDL_CreateWindowAndRenderer(int width, int height, Uint32 window_flags, SDL_Window ** window, SDL_Renderer ** renderer)
    function llvm_SDL_CreateWindowAndRenderer(width::Int32, height::Int32, window_flags::UInt32, window::Ptr{Ptr{SDL_Window}}, renderer::Ptr{Ptr{SDL_Renderer}})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_CreateWindowAndRenderer(i32, i32, i32, i8**, i8**) nounwind

        define i32 @main(i32 %width, i32 %height, i32 %window_flags, i8** %window, i8** %renderer) {
        entry:
            %result = call i32 @SDL_CreateWindowAndRenderer(i32 %width, i32 %height, i32 %window_flags, i8** %window, i8** %renderer)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, UInt32, Ptr{Ptr{SDL_Window}}, Ptr{Ptr{SDL_Renderer}}}, width, height, window_flags, window, renderer)
    end

    # Original C signature: SDL_Window * SDL_CreateWindowFrom(const void * data)
    function llvm_SDL_CreateWindowFrom(data::Ptr{Cvoid})::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_CreateWindowFrom(i8*) nounwind

        define i8* @main(i8* %data) {
        entry:
            %result = call i8* @SDL_CreateWindowFrom(i8* %data)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{Ptr{Cvoid}}, data)
    end

    # Original C signature: SDL_bool SDL_DXGIGetOutputInfo(int displayIndex, int * adapterIndex, int * outputIndex)
    function llvm_SDL_DXGIGetOutputInfo(displayIndex::Int32, adapterIndex::Ptr{Int32}, outputIndex::Ptr{Int32})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_DXGIGetOutputInfo(i32, i8*, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %adapterIndex, i8* %outputIndex) {
        entry:
            %result = call i32 @SDL_DXGIGetOutputInfo(i32 %displayIndex, i8* %adapterIndex, i8* %outputIndex)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32, Ptr{Int32}, Ptr{Int32}}, displayIndex, adapterIndex, outputIndex)
    end

    # Original C signature: void SDL_DelEventWatch(SDL_EventFilter filter, void * userdata)
    function llvm_SDL_DelEventWatch(filter::SDL_EventFilter, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DelEventWatch(i8*, i8*) nounwind

        define void @main(i8* %filter, i8* %userdata) {
        entry:
            call void @SDL_DelEventWatch(i8* %filter, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_EventFilter, Ptr{Cvoid}}, filter, userdata)
    end

    # Original C signature: void SDL_DelHintCallback(const char * name, SDL_HintCallback callback, void * userdata)
    function llvm_SDL_DelHintCallback(name::Ptr{UInt8}, callback::SDL_HintCallback, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DelHintCallback(i8*, i8*, i8*) nounwind

        define void @main(i8* %name, i8* %callback, i8* %userdata) {
        entry:
            call void @SDL_DelHintCallback(i8* %name, i8* %callback, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{UInt8}, SDL_HintCallback, Ptr{Cvoid}}, name, callback, userdata)
    end

    # Original C signature: void SDL_Delay(Uint32 ms)
    function llvm_SDL_Delay(ms::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Delay(i32) nounwind

        define void @main(i32 %ms) {
        entry:
            call void @SDL_Delay(i32 %ms)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, ms)
    end

    # Original C signature: Uint32 SDL_DequeueAudio(SDL_AudioDeviceID dev, void * data, Uint32 len)
    function llvm_SDL_DequeueAudio(dev::UInt32, data::Ptr{Cvoid}, len::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_DequeueAudio(i32, i8*, i32) nounwind

        define i32 @main(i32 %dev, i8* %data, i32 %len) {
        entry:
            %result = call i32 @SDL_DequeueAudio(i32 %dev, i8* %data, i32 %len)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32, Ptr{Cvoid}, UInt32}, dev, data, len)
    end

    # Original C signature: void SDL_DestroyCond(SDL_cond * cond)
    function llvm_SDL_DestroyCond(cond::Ptr{SDL_cond})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyCond(i8*) nounwind

        define void @main(i8* %cond) {
        entry:
            call void @SDL_DestroyCond(i8* %cond)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_cond}}, cond)
    end

    # Original C signature: void SDL_DestroyMutex(SDL_mutex * mutex)
    function llvm_SDL_DestroyMutex(mutex::Ptr{SDL_mutex})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyMutex(i8*) nounwind

        define void @main(i8* %mutex) {
        entry:
            call void @SDL_DestroyMutex(i8* %mutex)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_mutex}}, mutex)
    end

    # Original C signature: void SDL_DestroyRenderer(SDL_Renderer * renderer)
    function llvm_SDL_DestroyRenderer(renderer::Ptr{SDL_Renderer})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyRenderer(i8*) nounwind

        define void @main(i8* %renderer) {
        entry:
            call void @SDL_DestroyRenderer(i8* %renderer)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: void SDL_DestroySemaphore(SDL_sem * sem)
    function llvm_SDL_DestroySemaphore(sem::Ptr{SDL_sem})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroySemaphore(i8*) nounwind

        define void @main(i8* %sem) {
        entry:
            call void @SDL_DestroySemaphore(i8* %sem)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_sem}}, sem)
    end

    # Original C signature: void SDL_DestroyTexture(SDL_Texture * texture)
    function llvm_SDL_DestroyTexture(texture::Ptr{SDL_Texture})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyTexture(i8*) nounwind

        define void @main(i8* %texture) {
        entry:
            call void @SDL_DestroyTexture(i8* %texture)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Texture}}, texture)
    end

    # Original C signature: void SDL_DestroyWindow(SDL_Window * window)
    function llvm_SDL_DestroyWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DestroyWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_DestroyWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_DestroyWindowSurface(SDL_Window * window)
    function llvm_SDL_DestroyWindowSurface(window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_DestroyWindowSurface(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_DestroyWindowSurface(i8* %window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_DetachThread(SDL_Thread * thread)
    function llvm_SDL_DetachThread(thread::Ptr{SDL_Thread})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DetachThread(i8*) nounwind

        define void @main(i8* %thread) {
        entry:
            call void @SDL_DetachThread(i8* %thread)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Thread}}, thread)
    end

    # Original C signature: int SDL_Direct3D9GetAdapterIndex(int displayIndex)
    function llvm_SDL_Direct3D9GetAdapterIndex(displayIndex::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_Direct3D9GetAdapterIndex(i32) nounwind

        define i32 @main(i32 %displayIndex) {
        entry:
            %result = call i32 @SDL_Direct3D9GetAdapterIndex(i32 %displayIndex)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, displayIndex)
    end

    # Original C signature: void SDL_DisableScreenSaver()
    function llvm_SDL_DisableScreenSaver()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_DisableScreenSaver() nounwind

        define void @main() {
        entry:
            call void @SDL_DisableScreenSaver()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_EnableScreenSaver()
    function llvm_SDL_EnableScreenSaver()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_EnableScreenSaver() nounwind

        define void @main() {
        entry:
            call void @SDL_EnableScreenSaver()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_EncloseFPoints(const SDL_FPoint * points, int count, const SDL_FRect * clip, SDL_FRect * result)
    function llvm_SDL_EncloseFPoints(points::Ptr{SDL_FPoint}, count::Int32, clip::Ptr{SDL_FRect}, result::Ptr{SDL_FRect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_EncloseFPoints(i8*, i32, i8*, i8*) nounwind

        define i32 @main(i8* %points, i32 %count, i8* %clip, i8* %result) {
        entry:
            %result = call i32 @SDL_EncloseFPoints(i8* %points, i32 %count, i8* %clip, i8* %result)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_FPoint}, Int32, Ptr{SDL_FRect}, Ptr{SDL_FRect}}, points, count, clip, result)
    end

    # Original C signature: SDL_bool SDL_EnclosePoints(const SDL_Point * points, int count, const SDL_Rect * clip, SDL_Rect * result)
    function llvm_SDL_EnclosePoints(points::Ptr{SDL_Point}, count::Int32, clip::Ptr{SDL_Rect}, result::Ptr{SDL_Rect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_EnclosePoints(i8*, i32, i8*, i8*) nounwind

        define i32 @main(i8* %points, i32 %count, i8* %clip, i8* %result) {
        entry:
            %result = call i32 @SDL_EnclosePoints(i8* %points, i32 %count, i8* %clip, i8* %result)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Point}, Int32, Ptr{SDL_Rect}, Ptr{SDL_Rect}}, points, count, clip, result)
    end

    # Original C signature: int SDL_Error(SDL_errorcode code)
    function llvm_SDL_Error(code::SDL_errorcode)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_Error(i8*) nounwind

        define i32 @main(i8* %code) {
        entry:
            %result = call i32 @SDL_Error(i8* %code)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{SDL_errorcode}, code)
    end

    # Original C signature: Uint8 SDL_EventState(Uint32 type, int state)
    function llvm_SDL_EventState(type::UInt32, state::Int32)::UInt8
        Base.llvmcall(("""
        declare i8 @SDL_EventState(i32, i32) nounwind

        define i8 @main(i32 %type, i32 %state) {
        entry:
            %result = call i8 @SDL_EventState(i32 %type, i32 %state)
            ret i8 %result
        }
        """, "main"), UInt8, Tuple{UInt32, Int32}, type, state)
    end

    # Original C signature: int SDL_FillRects(SDL_Surface * dst, const SDL_Rect * rects, int count, Uint32 color)
    function llvm_SDL_FillRects(dst::Ptr{SDL_Surface}, rects::Ptr{SDL_Rect}, count::Int32, color::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_FillRects(i8*, i8*, i32, i32) nounwind

        define i32 @main(i8* %dst, i8* %rects, i32 %count, i32 %color) {
        entry:
            %result = call i32 @SDL_FillRects(i8* %dst, i8* %rects, i32 %count, i32 %color)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}, Int32, UInt32}, dst, rects, count, color)
    end

    # Original C signature: void SDL_FilterEvents(SDL_EventFilter filter, void * userdata)
    function llvm_SDL_FilterEvents(filter::SDL_EventFilter, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FilterEvents(i8*, i8*) nounwind

        define void @main(i8* %filter, i8* %userdata) {
        entry:
            call void @SDL_FilterEvents(i8* %filter, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_EventFilter, Ptr{Cvoid}}, filter, userdata)
    end

    # Original C signature: int SDL_FlashWindow(SDL_Window * window, SDL_FlashOperation operation)
    function llvm_SDL_FlashWindow(window::Ptr{SDL_Window}, operation::SDL_FlashOperation)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_FlashWindow(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %operation) {
        entry:
            %result = call i32 @SDL_FlashWindow(i8* %window, i8* %operation)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, SDL_FlashOperation}, window, operation)
    end

    # Original C signature: void SDL_FlushEvent(Uint32 type)
    function llvm_SDL_FlushEvent(type::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FlushEvent(i32) nounwind

        define void @main(i32 %type) {
        entry:
            call void @SDL_FlushEvent(i32 %type)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, type)
    end

    # Original C signature: void SDL_FlushEvents(Uint32 minType, Uint32 maxType)
    function llvm_SDL_FlushEvents(minType::UInt32, maxType::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FlushEvents(i32, i32) nounwind

        define void @main(i32 %minType, i32 %maxType) {
        entry:
            call void @SDL_FlushEvents(i32 %minType, i32 %maxType)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32, UInt32}, minType, maxType)
    end

    # Original C signature: void SDL_FreeAudioStream(SDL_AudioStream * stream)
    function llvm_SDL_FreeAudioStream(stream::Ptr{SDL_AudioStream})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeAudioStream(i8*) nounwind

        define void @main(i8* %stream) {
        entry:
            call void @SDL_FreeAudioStream(i8* %stream)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_AudioStream}}, stream)
    end

    # Original C signature: void SDL_FreeCursor(SDL_Cursor * cursor)
    function llvm_SDL_FreeCursor(cursor::Ptr{SDL_Cursor})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeCursor(i8*) nounwind

        define void @main(i8* %cursor) {
        entry:
            call void @SDL_FreeCursor(i8* %cursor)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Cursor}}, cursor)
    end

    # Original C signature: void SDL_FreeFormat(SDL_PixelFormat * format)
    function llvm_SDL_FreeFormat(format::Ptr{SDL_PixelFormat})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeFormat(i8*) nounwind

        define void @main(i8* %format) {
        entry:
            call void @SDL_FreeFormat(i8* %format)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_PixelFormat}}, format)
    end

    # Original C signature: void SDL_FreePalette(SDL_Palette * palette)
    function llvm_SDL_FreePalette(palette::Ptr{SDL_Palette})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreePalette(i8*) nounwind

        define void @main(i8* %palette) {
        entry:
            call void @SDL_FreePalette(i8* %palette)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Palette}}, palette)
    end

    # Original C signature: void SDL_FreeRW(SDL_RWops * area)
    function llvm_SDL_FreeRW(area::Ptr{SDL_RWops})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeRW(i8*) nounwind

        define void @main(i8* %area) {
        entry:
            call void @SDL_FreeRW(i8* %area)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_RWops}}, area)
    end

    # Original C signature: void SDL_FreeSurface(SDL_Surface * surface)
    function llvm_SDL_FreeSurface(surface::Ptr{SDL_Surface})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeSurface(i8*) nounwind

        define void @main(i8* %surface) {
        entry:
            call void @SDL_FreeSurface(i8* %surface)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: void SDL_FreeWAV(Uint8 * audio_buf)
    function llvm_SDL_FreeWAV(audio_buf::Ptr{UInt8})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_FreeWAV(i8*) nounwind

        define void @main(i8* %audio_buf) {
        entry:
            call void @SDL_FreeWAV(i8* %audio_buf)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{UInt8}}, audio_buf)
    end

    # Original C signature: int SDL_GDKGetDefaultUser(XUserHandle * outUserHandle)
    function llvm_SDL_GDKGetDefaultUser(outUserHandle::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GDKGetDefaultUser(i8*) nounwind

        define i32 @main(i8* %outUserHandle) {
        entry:
            %result = call i32 @SDL_GDKGetDefaultUser(i8* %outUserHandle)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}}, outUserHandle)
    end

    # Original C signature: int SDL_GDKGetTaskQueue(XTaskQueueHandle * outTaskQueue)
    function llvm_SDL_GDKGetTaskQueue(outTaskQueue::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GDKGetTaskQueue(i8*) nounwind

        define i32 @main(i8* %outTaskQueue) {
        entry:
            %result = call i32 @SDL_GDKGetTaskQueue(i8* %outTaskQueue)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}}, outTaskQueue)
    end

    # Original C signature: int SDL_GDKRunApp(SDL_main_func mainFunction, void * reserved)
    function llvm_SDL_GDKRunApp(mainFunction::SDL_main_func, reserved::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GDKRunApp(i8*, i8*) nounwind

        define i32 @main(i8* %mainFunction, i8* %reserved) {
        entry:
            %result = call i32 @SDL_GDKRunApp(i8* %mainFunction, i8* %reserved)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{SDL_main_func, Ptr{Cvoid}}, mainFunction, reserved)
    end

    # Original C signature: void SDL_GDKSuspendComplete()
    function llvm_SDL_GDKSuspendComplete()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GDKSuspendComplete() nounwind

        define void @main() {
        entry:
            call void @SDL_GDKSuspendComplete()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_GL_BindTexture(SDL_Texture * texture, float * texw, float * texh)
    function llvm_SDL_GL_BindTexture(texture::Ptr{SDL_Texture}, texw::Ptr{Float32}, texh::Ptr{Float32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_BindTexture(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %texw, i8* %texh) {
        entry:
            %result = call i32 @SDL_GL_BindTexture(i8* %texture, i8* %texw, i8* %texh)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{Float32}, Ptr{Float32}}, texture, texw, texh)
    end

    # Original C signature: SDL_GLContext SDL_GL_CreateContext(SDL_Window * window)
    function llvm_SDL_GL_CreateContext(window::Ptr{SDL_Window})::SDL_GLContext
        Base.llvmcall(("""
        declare i8* @SDL_GL_CreateContext(i8*) nounwind

        define i8* @main(i8* %window) {
        entry:
            %result = call i8* @SDL_GL_CreateContext(i8* %window)
            ret i8* %result
        }
        """, "main"), SDL_GLContext, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_GL_DeleteContext(SDL_GLContext context)
    function llvm_SDL_GL_DeleteContext(context::SDL_GLContext)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GL_DeleteContext(i8*) nounwind

        define void @main(i8* %context) {
        entry:
            call void @SDL_GL_DeleteContext(i8* %context)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_GLContext}, context)
    end

    # Original C signature: SDL_bool SDL_GL_ExtensionSupported(const char * extension)
    function llvm_SDL_GL_ExtensionSupported(extension::Ptr{UInt8})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GL_ExtensionSupported(i8*) nounwind

        define i32 @main(i8* %extension) {
        entry:
            %result = call i32 @SDL_GL_ExtensionSupported(i8* %extension)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}}, extension)
    end

    # Original C signature: int SDL_GL_GetAttribute(SDL_GLattr attr, int * value)
    function llvm_SDL_GL_GetAttribute(attr::UInt32, value::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_GetAttribute(i32, i8*) nounwind

        define i32 @main(i32 %attr, i8* %value) {
        entry:
            %result = call i32 @SDL_GL_GetAttribute(i32 %attr, i8* %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Ptr{Int32}}, attr, value)
    end

    # Original C signature: SDL_GLContext SDL_GL_GetCurrentContext()
    function llvm_SDL_GL_GetCurrentContext()::SDL_GLContext
        Base.llvmcall(("""
        declare i8* @SDL_GL_GetCurrentContext() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GL_GetCurrentContext()
            ret i8* %result
        }
        """, "main"), SDL_GLContext, Tuple{}, )
    end

    # Original C signature: SDL_Window* SDL_GL_GetCurrentWindow()
    function llvm_SDL_GL_GetCurrentWindow()::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_GL_GetCurrentWindow() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GL_GetCurrentWindow()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{}, )
    end

    # Original C signature: void SDL_GL_GetDrawableSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GL_GetDrawableSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GL_GetDrawableSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GL_GetDrawableSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: int SDL_GL_GetSwapInterval()
    function llvm_SDL_GL_GetSwapInterval()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_GetSwapInterval() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GL_GetSwapInterval()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GL_LoadLibrary(const char * path)
    function llvm_SDL_GL_LoadLibrary(path::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_LoadLibrary(i8*) nounwind

        define i32 @main(i8* %path) {
        entry:
            %result = call i32 @SDL_GL_LoadLibrary(i8* %path)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, path)
    end

    # Original C signature: int SDL_GL_MakeCurrent(SDL_Window * window, SDL_GLContext context)
    function llvm_SDL_GL_MakeCurrent(window::Ptr{SDL_Window}, context::SDL_GLContext)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_MakeCurrent(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %context) {
        entry:
            %result = call i32 @SDL_GL_MakeCurrent(i8* %window, i8* %context)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, SDL_GLContext}, window, context)
    end

    # Original C signature: void SDL_GL_ResetAttributes()
    function llvm_SDL_GL_ResetAttributes()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GL_ResetAttributes() nounwind

        define void @main() {
        entry:
            call void @SDL_GL_ResetAttributes()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_GL_SetAttribute(SDL_GLattr attr, int value)
    function llvm_SDL_GL_SetAttribute(attr::UInt32, value::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_SetAttribute(i32, i32) nounwind

        define i32 @main(i32 %attr, i32 %value) {
        entry:
            %result = call i32 @SDL_GL_SetAttribute(i32 %attr, i32 %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Int32}, attr, value)
    end

    # Original C signature: int SDL_GL_SetSwapInterval(int interval)
    function llvm_SDL_GL_SetSwapInterval(interval::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_SetSwapInterval(i32) nounwind

        define i32 @main(i32 %interval) {
        entry:
            %result = call i32 @SDL_GL_SetSwapInterval(i32 %interval)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, interval)
    end

    # Original C signature: void SDL_GL_SwapWindow(SDL_Window * window)
    function llvm_SDL_GL_SwapWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GL_SwapWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_GL_SwapWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_GL_UnbindTexture(SDL_Texture * texture)
    function llvm_SDL_GL_UnbindTexture(texture::Ptr{SDL_Texture})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GL_UnbindTexture(i8*) nounwind

        define i32 @main(i8* %texture) {
        entry:
            %result = call i32 @SDL_GL_UnbindTexture(i8* %texture)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}}, texture)
    end

    # Original C signature: void SDL_GL_UnloadLibrary()
    function llvm_SDL_GL_UnloadLibrary()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GL_UnloadLibrary() nounwind

        define void @main() {
        entry:
            call void @SDL_GL_UnloadLibrary()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: SDL_GUID SDL_GUIDFromString(const char * pchGUID)
    function llvm_SDL_GUIDFromString(pchGUID::Ptr{UInt8})::SDL_GUID
        Base.llvmcall(("""
        declare i8* @SDL_GUIDFromString(i8*) nounwind

        define i8* @main(i8* %pchGUID) {
        entry:
            %result = call i8* @SDL_GUIDFromString(i8* %pchGUID)
            ret i8* %result
        }
        """, "main"), SDL_GUID, Tuple{Ptr{UInt8}}, pchGUID)
    end

    # Original C signature: void SDL_GUIDToString(SDL_GUID guid, char * pszGUID, int cbGUID)
    function llvm_SDL_GUIDToString(guid::SDL_GUID, pszGUID::Ptr{UInt8}, cbGUID::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GUIDToString(i8*, i8*, i32) nounwind

        define void @main(i8* %guid, i8* %pszGUID, i32 %cbGUID) {
        entry:
            call void @SDL_GUIDToString(i8* %guid, i8* %pszGUID, i32 %cbGUID)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_GUID, Ptr{UInt8}, Int32}, guid, pszGUID, cbGUID)
    end

    # Original C signature: int SDL_GameControllerAddMapping(const char* mappingString)
    function llvm_SDL_GameControllerAddMapping(mappingString::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerAddMapping(i8*) nounwind

        define i32 @main(i8* %mappingString) {
        entry:
            %result = call i32 @SDL_GameControllerAddMapping(i8* %mappingString)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, mappingString)
    end

    # Original C signature: int SDL_GameControllerAddMappingsFromRW(SDL_RWops * rw, int freerw)
    function llvm_SDL_GameControllerAddMappingsFromRW(rw::Ptr{SDL_RWops}, freerw::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerAddMappingsFromRW(i8*, i32) nounwind

        define i32 @main(i8* %rw, i32 %freerw) {
        entry:
            %result = call i32 @SDL_GameControllerAddMappingsFromRW(i8* %rw, i32 %freerw)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_RWops}, Int32}, rw, freerw)
    end

    # Original C signature: void SDL_GameControllerClose(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerClose(gamecontroller::Ptr{SDL_GameController})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GameControllerClose(i8*) nounwind

        define void @main(i8* %gamecontroller) {
        entry:
            call void @SDL_GameControllerClose(i8* %gamecontroller)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: int SDL_GameControllerEventState(int state)
    function llvm_SDL_GameControllerEventState(state::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerEventState(i32) nounwind

        define i32 @main(i32 %state) {
        entry:
            %result = call i32 @SDL_GameControllerEventState(i32 %state)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, state)
    end

    # Original C signature: const char* SDL_GameControllerGetAppleSFSymbolsNameForAxis(SDL_GameController * gamecontroller, SDL_GameControllerAxis axis)
    function llvm_SDL_GameControllerGetAppleSFSymbolsNameForAxis(gamecontroller::Ptr{SDL_GameController}, axis::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetAppleSFSymbolsNameForAxis(i8*, i32) nounwind

        define i8* @main(i8* %gamecontroller, i32 %axis) {
        entry:
            %result = call i8* @SDL_GameControllerGetAppleSFSymbolsNameForAxis(i8* %gamecontroller, i32 %axis)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, axis)
    end

    # Original C signature: const char* SDL_GameControllerGetAppleSFSymbolsNameForButton(SDL_GameController * gamecontroller, SDL_GameControllerButton button)
    function llvm_SDL_GameControllerGetAppleSFSymbolsNameForButton(gamecontroller::Ptr{SDL_GameController}, button::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetAppleSFSymbolsNameForButton(i8*, i32) nounwind

        define i8* @main(i8* %gamecontroller, i32 %button) {
        entry:
            %result = call i8* @SDL_GameControllerGetAppleSFSymbolsNameForButton(i8* %gamecontroller, i32 %button)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, button)
    end

    # Original C signature: SDL_bool SDL_GameControllerGetAttached(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetAttached(gamecontroller::Ptr{SDL_GameController})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetAttached(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerGetAttached(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: Sint16 SDL_GameControllerGetAxis(SDL_GameController * gamecontroller, SDL_GameControllerAxis axis)
    function llvm_SDL_GameControllerGetAxis(gamecontroller::Ptr{SDL_GameController}, axis::Int32)::Int16
        Base.llvmcall(("""
        declare i16 @SDL_GameControllerGetAxis(i8*, i32) nounwind

        define i16 @main(i8* %gamecontroller, i32 %axis) {
        entry:
            %result = call i16 @SDL_GameControllerGetAxis(i8* %gamecontroller, i32 %axis)
            ret i16 %result
        }
        """, "main"), Int16, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, axis)
    end

    # Original C signature: SDL_GameControllerAxis SDL_GameControllerGetAxisFromString(const char * str)
    function llvm_SDL_GameControllerGetAxisFromString(str::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetAxisFromString(i8*) nounwind

        define i32 @main(i8* %str) {
        entry:
            %result = call i32 @SDL_GameControllerGetAxisFromString(i8* %str)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: SDL_GameControllerButtonBind SDL_GameControllerGetBindForAxis(SDL_GameController * gamecontroller, SDL_GameControllerAxis axis)
    function llvm_SDL_GameControllerGetBindForAxis(gamecontroller::Ptr{SDL_GameController}, axis::Int32)::SDL_GameControllerButtonBind
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetBindForAxis(i8*, i32) nounwind

        define i8* @main(i8* %gamecontroller, i32 %axis) {
        entry:
            %result = call i8* @SDL_GameControllerGetBindForAxis(i8* %gamecontroller, i32 %axis)
            ret i8* %result
        }
        """, "main"), SDL_GameControllerButtonBind, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, axis)
    end

    # Original C signature: SDL_GameControllerButtonBind SDL_GameControllerGetBindForButton(SDL_GameController * gamecontroller, SDL_GameControllerButton button)
    function llvm_SDL_GameControllerGetBindForButton(gamecontroller::Ptr{SDL_GameController}, button::Int32)::SDL_GameControllerButtonBind
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetBindForButton(i8*, i32) nounwind

        define i8* @main(i8* %gamecontroller, i32 %button) {
        entry:
            %result = call i8* @SDL_GameControllerGetBindForButton(i8* %gamecontroller, i32 %button)
            ret i8* %result
        }
        """, "main"), SDL_GameControllerButtonBind, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, button)
    end

    # Original C signature: Uint8 SDL_GameControllerGetButton(SDL_GameController * gamecontroller, SDL_GameControllerButton button)
    function llvm_SDL_GameControllerGetButton(gamecontroller::Ptr{SDL_GameController}, button::Int32)::UInt8
        Base.llvmcall(("""
        declare i8 @SDL_GameControllerGetButton(i8*, i32) nounwind

        define i8 @main(i8* %gamecontroller, i32 %button) {
        entry:
            %result = call i8 @SDL_GameControllerGetButton(i8* %gamecontroller, i32 %button)
            ret i8 %result
        }
        """, "main"), UInt8, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, button)
    end

    # Original C signature: SDL_GameControllerButton SDL_GameControllerGetButtonFromString(const char * str)
    function llvm_SDL_GameControllerGetButtonFromString(str::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetButtonFromString(i8*) nounwind

        define i32 @main(i8* %str) {
        entry:
            %result = call i32 @SDL_GameControllerGetButtonFromString(i8* %str)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: Uint16 SDL_GameControllerGetFirmwareVersion(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetFirmwareVersion(gamecontroller::Ptr{SDL_GameController})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_GameControllerGetFirmwareVersion(i8*) nounwind

        define i16 @main(i8* %gamecontroller) {
        entry:
            %result = call i16 @SDL_GameControllerGetFirmwareVersion(i8* %gamecontroller)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: int SDL_GameControllerGetNumTouchpadFingers(SDL_GameController * gamecontroller, int touchpad)
    function llvm_SDL_GameControllerGetNumTouchpadFingers(gamecontroller::Ptr{SDL_GameController}, touchpad::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetNumTouchpadFingers(i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %touchpad) {
        entry:
            %result = call i32 @SDL_GameControllerGetNumTouchpadFingers(i8* %gamecontroller, i32 %touchpad)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, touchpad)
    end

    # Original C signature: int SDL_GameControllerGetNumTouchpads(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetNumTouchpads(gamecontroller::Ptr{SDL_GameController})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetNumTouchpads(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerGetNumTouchpads(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: int SDL_GameControllerGetPlayerIndex(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetPlayerIndex(gamecontroller::Ptr{SDL_GameController})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetPlayerIndex(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerGetPlayerIndex(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: Uint16 SDL_GameControllerGetProduct(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetProduct(gamecontroller::Ptr{SDL_GameController})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_GameControllerGetProduct(i8*) nounwind

        define i16 @main(i8* %gamecontroller) {
        entry:
            %result = call i16 @SDL_GameControllerGetProduct(i8* %gamecontroller)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: Uint16 SDL_GameControllerGetProductVersion(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetProductVersion(gamecontroller::Ptr{SDL_GameController})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_GameControllerGetProductVersion(i8*) nounwind

        define i16 @main(i8* %gamecontroller) {
        entry:
            %result = call i16 @SDL_GameControllerGetProductVersion(i8* %gamecontroller)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: int SDL_GameControllerGetSensorData(SDL_GameController * gamecontroller, SDL_SensorType type, float * data, int num_values)
    function llvm_SDL_GameControllerGetSensorData(gamecontroller::Ptr{SDL_GameController}, type::Int32, data::Ptr{Float32}, num_values::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetSensorData(i8*, i32, i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %type, i8* %data, i32 %num_values) {
        entry:
            %result = call i32 @SDL_GameControllerGetSensorData(i8* %gamecontroller, i32 %type, i8* %data, i32 %num_values)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Int32, Ptr{Float32}, Int32}, gamecontroller, type, data, num_values)
    end

    # Original C signature: float SDL_GameControllerGetSensorDataRate(SDL_GameController * gamecontroller, SDL_SensorType type)
    function llvm_SDL_GameControllerGetSensorDataRate(gamecontroller::Ptr{SDL_GameController}, type::Int32)::Float32
        Base.llvmcall(("""
        declare float @SDL_GameControllerGetSensorDataRate(i8*, i32) nounwind

        define float @main(i8* %gamecontroller, i32 %type) {
        entry:
            %result = call float @SDL_GameControllerGetSensorDataRate(i8* %gamecontroller, i32 %type)
            ret float %result
        }
        """, "main"), Float32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, type)
    end

    # Original C signature: int SDL_GameControllerGetSensorDataWithTimestamp(SDL_GameController * gamecontroller, SDL_SensorType type, Uint64 * timestamp, float * data, int num_values)
    function llvm_SDL_GameControllerGetSensorDataWithTimestamp(gamecontroller::Ptr{SDL_GameController}, type::Int32, timestamp::Ptr{UInt64}, data::Ptr{Float32}, num_values::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetSensorDataWithTimestamp(i8*, i32, i8*, i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %type, i8* %timestamp, i8* %data, i32 %num_values) {
        entry:
            %result = call i32 @SDL_GameControllerGetSensorDataWithTimestamp(i8* %gamecontroller, i32 %type, i8* %timestamp, i8* %data, i32 %num_values)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Int32, Ptr{UInt64}, Ptr{Float32}, Int32}, gamecontroller, type, timestamp, data, num_values)
    end

    # Original C signature: const char * SDL_GameControllerGetSerial(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetSerial(gamecontroller::Ptr{SDL_GameController})::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetSerial(i8*) nounwind

        define i8* @main(i8* %gamecontroller) {
        entry:
            %result = call i8* @SDL_GameControllerGetSerial(i8* %gamecontroller)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: Uint64 SDL_GameControllerGetSteamHandle(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetSteamHandle(gamecontroller::Ptr{SDL_GameController})::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GameControllerGetSteamHandle(i8*) nounwind

        define i64 @main(i8* %gamecontroller) {
        entry:
            %result = call i64 @SDL_GameControllerGetSteamHandle(i8* %gamecontroller)
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: const char* SDL_GameControllerGetStringForAxis(SDL_GameControllerAxis axis)
    function llvm_SDL_GameControllerGetStringForAxis(axis::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetStringForAxis(i32) nounwind

        define i8* @main(i32 %axis) {
        entry:
            %result = call i8* @SDL_GameControllerGetStringForAxis(i32 %axis)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Int32}, axis)
    end

    # Original C signature: const char* SDL_GameControllerGetStringForButton(SDL_GameControllerButton button)
    function llvm_SDL_GameControllerGetStringForButton(button::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerGetStringForButton(i32) nounwind

        define i8* @main(i32 %button) {
        entry:
            %result = call i8* @SDL_GameControllerGetStringForButton(i32 %button)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Int32}, button)
    end

    # Original C signature: int SDL_GameControllerGetTouchpadFinger(SDL_GameController * gamecontroller, int touchpad, int finger, Uint8 * state, float * x, float * y, float * pressure)
    function llvm_SDL_GameControllerGetTouchpadFinger(gamecontroller::Ptr{SDL_GameController}, touchpad::Int32, finger::Int32, state::Ptr{UInt8}, x::Ptr{Float32}, y::Ptr{Float32}, pressure::Ptr{Float32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetTouchpadFinger(i8*, i32, i32, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %gamecontroller, i32 %touchpad, i32 %finger, i8* %state, i8* %x, i8* %y, i8* %pressure) {
        entry:
            %result = call i32 @SDL_GameControllerGetTouchpadFinger(i8* %gamecontroller, i32 %touchpad, i32 %finger, i8* %state, i8* %x, i8* %y, i8* %pressure)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Int32, Int32, Ptr{UInt8}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}}, gamecontroller, touchpad, finger, state, x, y, pressure)
    end

    # Original C signature: SDL_GameControllerType SDL_GameControllerGetType(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetType(gamecontroller::Ptr{SDL_GameController})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerGetType(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerGetType(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: Uint16 SDL_GameControllerGetVendor(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerGetVendor(gamecontroller::Ptr{SDL_GameController})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_GameControllerGetVendor(i8*) nounwind

        define i16 @main(i8* %gamecontroller) {
        entry:
            %result = call i16 @SDL_GameControllerGetVendor(i8* %gamecontroller)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasAxis(SDL_GameController * gamecontroller, SDL_GameControllerAxis axis)
    function llvm_SDL_GameControllerHasAxis(gamecontroller::Ptr{SDL_GameController}, axis::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasAxis(i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %axis) {
        entry:
            %result = call i32 @SDL_GameControllerHasAxis(i8* %gamecontroller, i32 %axis)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, axis)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasButton(SDL_GameController * gamecontroller, SDL_GameControllerButton button)
    function llvm_SDL_GameControllerHasButton(gamecontroller::Ptr{SDL_GameController}, button::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasButton(i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %button) {
        entry:
            %result = call i32 @SDL_GameControllerHasButton(i8* %gamecontroller, i32 %button)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, button)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasLED(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerHasLED(gamecontroller::Ptr{SDL_GameController})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasLED(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerHasLED(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasRumble(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerHasRumble(gamecontroller::Ptr{SDL_GameController})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasRumble(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerHasRumble(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasRumbleTriggers(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerHasRumbleTriggers(gamecontroller::Ptr{SDL_GameController})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasRumbleTriggers(i8*) nounwind

        define i32 @main(i8* %gamecontroller) {
        entry:
            %result = call i32 @SDL_GameControllerHasRumbleTriggers(i8* %gamecontroller)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: SDL_bool SDL_GameControllerHasSensor(SDL_GameController * gamecontroller, SDL_SensorType type)
    function llvm_SDL_GameControllerHasSensor(gamecontroller::Ptr{SDL_GameController}, type::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerHasSensor(i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %type) {
        entry:
            %result = call i32 @SDL_GameControllerHasSensor(i8* %gamecontroller, i32 %type)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, type)
    end

    # Original C signature: SDL_bool SDL_GameControllerIsSensorEnabled(SDL_GameController * gamecontroller, SDL_SensorType type)
    function llvm_SDL_GameControllerIsSensorEnabled(gamecontroller::Ptr{SDL_GameController}, type::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerIsSensorEnabled(i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %type) {
        entry:
            %result = call i32 @SDL_GameControllerIsSensorEnabled(i8* %gamecontroller, i32 %type)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, type)
    end

    # Original C signature: char * SDL_GameControllerMapping(SDL_GameController * gamecontroller)
    function llvm_SDL_GameControllerMapping(gamecontroller::Ptr{SDL_GameController})::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerMapping(i8*) nounwind

        define i8* @main(i8* %gamecontroller) {
        entry:
            %result = call i8* @SDL_GameControllerMapping(i8* %gamecontroller)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{SDL_GameController}}, gamecontroller)
    end

    # Original C signature: char * SDL_GameControllerMappingForGUID(SDL_JoystickGUID guid)
    function llvm_SDL_GameControllerMappingForGUID(guid::SDL_JoystickGUID)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerMappingForGUID(i8*) nounwind

        define i8* @main(i8* %guid) {
        entry:
            %result = call i8* @SDL_GameControllerMappingForGUID(i8* %guid)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{SDL_JoystickGUID}, guid)
    end

    # Original C signature: char * SDL_GameControllerMappingForIndex(int mapping_index)
    function llvm_SDL_GameControllerMappingForIndex(mapping_index::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GameControllerMappingForIndex(i32) nounwind

        define i8* @main(i32 %mapping_index) {
        entry:
            %result = call i8* @SDL_GameControllerMappingForIndex(i32 %mapping_index)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Int32}, mapping_index)
    end

    # Original C signature: int SDL_GameControllerNumMappings()
    function llvm_SDL_GameControllerNumMappings()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerNumMappings() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GameControllerNumMappings()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GameControllerRumble(SDL_GameController * gamecontroller, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
    function llvm_SDL_GameControllerRumble(gamecontroller::Ptr{SDL_GameController}, low_frequency_rumble::UInt16, high_frequency_rumble::UInt16, duration_ms::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerRumble(i8*, i16, i16, i32) nounwind

        define i32 @main(i8* %gamecontroller, i16 %low_frequency_rumble, i16 %high_frequency_rumble, i32 %duration_ms) {
        entry:
            %result = call i32 @SDL_GameControllerRumble(i8* %gamecontroller, i16 %low_frequency_rumble, i16 %high_frequency_rumble, i32 %duration_ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, UInt16, UInt16, UInt32}, gamecontroller, low_frequency_rumble, high_frequency_rumble, duration_ms)
    end

    # Original C signature: int SDL_GameControllerRumbleTriggers(SDL_GameController * gamecontroller, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
    function llvm_SDL_GameControllerRumbleTriggers(gamecontroller::Ptr{SDL_GameController}, left_rumble::UInt16, right_rumble::UInt16, duration_ms::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerRumbleTriggers(i8*, i16, i16, i32) nounwind

        define i32 @main(i8* %gamecontroller, i16 %left_rumble, i16 %right_rumble, i32 %duration_ms) {
        entry:
            %result = call i32 @SDL_GameControllerRumbleTriggers(i8* %gamecontroller, i16 %left_rumble, i16 %right_rumble, i32 %duration_ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, UInt16, UInt16, UInt32}, gamecontroller, left_rumble, right_rumble, duration_ms)
    end

    # Original C signature: int SDL_GameControllerSendEffect(SDL_GameController * gamecontroller, const void * data, int size)
    function llvm_SDL_GameControllerSendEffect(gamecontroller::Ptr{SDL_GameController}, data::Ptr{Cvoid}, size::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerSendEffect(i8*, i8*, i32) nounwind

        define i32 @main(i8* %gamecontroller, i8* %data, i32 %size) {
        entry:
            %result = call i32 @SDL_GameControllerSendEffect(i8* %gamecontroller, i8* %data, i32 %size)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Ptr{Cvoid}, Int32}, gamecontroller, data, size)
    end

    # Original C signature: int SDL_GameControllerSetLED(SDL_GameController * gamecontroller, Uint8 red, Uint8 green, Uint8 blue)
    function llvm_SDL_GameControllerSetLED(gamecontroller::Ptr{SDL_GameController}, red::UInt8, green::UInt8, blue::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerSetLED(i8*, i8, i8, i8) nounwind

        define i32 @main(i8* %gamecontroller, i8 %red, i8 %green, i8 %blue) {
        entry:
            %result = call i32 @SDL_GameControllerSetLED(i8* %gamecontroller, i8 %red, i8 %green, i8 %blue)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, UInt8, UInt8, UInt8}, gamecontroller, red, green, blue)
    end

    # Original C signature: void SDL_GameControllerSetPlayerIndex(SDL_GameController * gamecontroller, int player_index)
    function llvm_SDL_GameControllerSetPlayerIndex(gamecontroller::Ptr{SDL_GameController}, player_index::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GameControllerSetPlayerIndex(i8*, i32) nounwind

        define void @main(i8* %gamecontroller, i32 %player_index) {
        entry:
            call void @SDL_GameControllerSetPlayerIndex(i8* %gamecontroller, i32 %player_index)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_GameController}, Int32}, gamecontroller, player_index)
    end

    # Original C signature: int SDL_GameControllerSetSensorEnabled(SDL_GameController * gamecontroller, SDL_SensorType type, SDL_bool enabled)
    function llvm_SDL_GameControllerSetSensorEnabled(gamecontroller::Ptr{SDL_GameController}, type::Int32, enabled::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerSetSensorEnabled(i8*, i32, i32) nounwind

        define i32 @main(i8* %gamecontroller, i32 %type, i32 %enabled) {
        entry:
            %result = call i32 @SDL_GameControllerSetSensorEnabled(i8* %gamecontroller, i32 %type, i32 %enabled)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_GameController}, Int32, UInt32}, gamecontroller, type, enabled)
    end

    # Original C signature: SDL_GameControllerType SDL_GameControllerTypeForIndex(int joystick_index)
    function llvm_SDL_GameControllerTypeForIndex(joystick_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GameControllerTypeForIndex(i32) nounwind

        define i32 @main(i32 %joystick_index) {
        entry:
            %result = call i32 @SDL_GameControllerTypeForIndex(i32 %joystick_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, joystick_index)
    end

    # Original C signature: void SDL_GameControllerUpdate()
    function llvm_SDL_GameControllerUpdate()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GameControllerUpdate() nounwind

        define void @main() {
        entry:
            call void @SDL_GameControllerUpdate()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_GetAndroidSDKVersion()
    function llvm_SDL_GetAndroidSDKVersion()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetAndroidSDKVersion() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetAndroidSDKVersion()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: SDL_AssertionHandler SDL_GetAssertionHandler(void ** puserdata)
    function llvm_SDL_GetAssertionHandler(puserdata::Ptr{Ptr{Cvoid}})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetAssertionHandler(i8*) nounwind

        define void @main(i8* %puserdata) {
        entry:
            call void @SDL_GetAssertionHandler(i8* %puserdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Ptr{Cvoid}}}, puserdata)
    end

    # Original C signature: const SDL_AssertData * SDL_GetAssertionReport()
    function llvm_SDL_GetAssertionReport()::Ptr{SDL_AssertData}
        Base.llvmcall(("""
        declare i8* @SDL_GetAssertionReport() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetAssertionReport()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_AssertData}, Tuple{}, )
    end

    # Original C signature: int SDL_GetAudioDeviceSpec(int index, int iscapture, SDL_AudioSpec * spec)
    function llvm_SDL_GetAudioDeviceSpec(index::Int32, iscapture::Int32, spec::Ptr{SDL_AudioSpec})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetAudioDeviceSpec(i32, i32, i8*) nounwind

        define i32 @main(i32 %index, i32 %iscapture, i8* %spec) {
        entry:
            %result = call i32 @SDL_GetAudioDeviceSpec(i32 %index, i32 %iscapture, i8* %spec)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, Ptr{SDL_AudioSpec}}, index, iscapture, spec)
    end

    # Original C signature: SDL_AudioStatus SDL_GetAudioDeviceStatus(SDL_AudioDeviceID dev)
    function llvm_SDL_GetAudioDeviceStatus(dev::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetAudioDeviceStatus(i32) nounwind

        define i32 @main(i32 %dev) {
        entry:
            %result = call i32 @SDL_GetAudioDeviceStatus(i32 %dev)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, dev)
    end

    # Original C signature: SDL_AudioStatus SDL_GetAudioStatus()
    function llvm_SDL_GetAudioStatus()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetAudioStatus() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetAudioStatus()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetCPUCacheLineSize()
    function llvm_SDL_GetCPUCacheLineSize()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetCPUCacheLineSize() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetCPUCacheLineSize()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetCPUCount()
    function llvm_SDL_GetCPUCount()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetCPUCount() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetCPUCount()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: void SDL_GetClipRect(SDL_Surface * surface, SDL_Rect * rect)
    function llvm_SDL_GetClipRect(surface::Ptr{SDL_Surface}, rect::Ptr{SDL_Rect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetClipRect(i8*, i8*) nounwind

        define void @main(i8* %surface, i8* %rect) {
        entry:
            call void @SDL_GetClipRect(i8* %surface, i8* %rect)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}}, surface, rect)
    end

    # Original C signature: char * SDL_GetClipboardText()
    function llvm_SDL_GetClipboardText()::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetClipboardText() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetClipboardText()
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{}, )
    end

    # Original C signature: SDL_DisplayMode * SDL_GetClosestDisplayMode(int displayIndex, const SDL_DisplayMode * mode, SDL_DisplayMode * closest)
    function llvm_SDL_GetClosestDisplayMode(displayIndex::Int32, mode::Ptr{SDL_DisplayMode}, closest::Ptr{SDL_DisplayMode})::Ptr{SDL_DisplayMode}
        Base.llvmcall(("""
        declare i8* @SDL_GetClosestDisplayMode(i32, i8*, i8*) nounwind

        define i8* @main(i32 %displayIndex, i8* %mode, i8* %closest) {
        entry:
            %result = call i8* @SDL_GetClosestDisplayMode(i32 %displayIndex, i8* %mode, i8* %closest)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_DisplayMode}, Tuple{Int32, Ptr{SDL_DisplayMode}, Ptr{SDL_DisplayMode}}, displayIndex, mode, closest)
    end

    # Original C signature: int SDL_GetColorKey(SDL_Surface * surface, Uint32 * key)
    function llvm_SDL_GetColorKey(surface::Ptr{SDL_Surface}, key::Ptr{UInt32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetColorKey(i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %key) {
        entry:
            %result = call i32 @SDL_GetColorKey(i8* %surface, i8* %key)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{UInt32}}, surface, key)
    end

    # Original C signature: int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode * mode)
    function llvm_SDL_GetCurrentDisplayMode(displayIndex::Int32, mode::Ptr{SDL_DisplayMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetCurrentDisplayMode(i32, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %mode) {
        entry:
            %result = call i32 @SDL_GetCurrentDisplayMode(i32 %displayIndex, i8* %mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{SDL_DisplayMode}}, displayIndex, mode)
    end

    # Original C signature: SDL_AssertionHandler SDL_GetDefaultAssertionHandler()
    function llvm_SDL_GetDefaultAssertionHandler()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetDefaultAssertionHandler() nounwind

        define void @main() {
        entry:
            call void @SDL_GetDefaultAssertionHandler()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_GetDefaultAudioInfo(char ** name, SDL_AudioSpec * spec, int iscapture)
    function llvm_SDL_GetDefaultAudioInfo(name::Ptr{Ptr{UInt8}}, spec::Ptr{SDL_AudioSpec}, iscapture::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDefaultAudioInfo(i8*, i8*, i32) nounwind

        define i32 @main(i8* %name, i8* %spec, i32 %iscapture) {
        entry:
            %result = call i32 @SDL_GetDefaultAudioInfo(i8* %name, i8* %spec, i32 %iscapture)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Ptr{UInt8}}, Ptr{SDL_AudioSpec}, Int32}, name, spec, iscapture)
    end

    # Original C signature: int SDL_GetDesktopDisplayMode(int displayIndex, SDL_DisplayMode * mode)
    function llvm_SDL_GetDesktopDisplayMode(displayIndex::Int32, mode::Ptr{SDL_DisplayMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDesktopDisplayMode(i32, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %mode) {
        entry:
            %result = call i32 @SDL_GetDesktopDisplayMode(i32 %displayIndex, i8* %mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{SDL_DisplayMode}}, displayIndex, mode)
    end

    # Original C signature: int SDL_GetDisplayBounds(int displayIndex, SDL_Rect * rect)
    function llvm_SDL_GetDisplayBounds(displayIndex::Int32, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDisplayBounds(i32, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %rect) {
        entry:
            %result = call i32 @SDL_GetDisplayBounds(i32 %displayIndex, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{SDL_Rect}}, displayIndex, rect)
    end

    # Original C signature: int SDL_GetDisplayDPI(int displayIndex, float * ddpi, float * hdpi, float * vdpi)
    function llvm_SDL_GetDisplayDPI(displayIndex::Int32, ddpi::Ptr{Float32}, hdpi::Ptr{Float32}, vdpi::Ptr{Float32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDisplayDPI(i32, i8*, i8*, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %ddpi, i8* %hdpi, i8* %vdpi) {
        entry:
            %result = call i32 @SDL_GetDisplayDPI(i32 %displayIndex, i8* %ddpi, i8* %hdpi, i8* %vdpi)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}}, displayIndex, ddpi, hdpi, vdpi)
    end

    # Original C signature: int SDL_GetDisplayMode(int displayIndex, int modeIndex, SDL_DisplayMode * mode)
    function llvm_SDL_GetDisplayMode(displayIndex::Int32, modeIndex::Int32, mode::Ptr{SDL_DisplayMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDisplayMode(i32, i32, i8*) nounwind

        define i32 @main(i32 %displayIndex, i32 %modeIndex, i8* %mode) {
        entry:
            %result = call i32 @SDL_GetDisplayMode(i32 %displayIndex, i32 %modeIndex, i8* %mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, Ptr{SDL_DisplayMode}}, displayIndex, modeIndex, mode)
    end

    # Original C signature: const char * SDL_GetDisplayName(int displayIndex)
    function llvm_SDL_GetDisplayName(displayIndex::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetDisplayName(i32) nounwind

        define i8* @main(i32 %displayIndex) {
        entry:
            %result = call i8* @SDL_GetDisplayName(i32 %displayIndex)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Int32}, displayIndex)
    end

    # Original C signature: SDL_DisplayOrientation SDL_GetDisplayOrientation(int displayIndex)
    function llvm_SDL_GetDisplayOrientation(displayIndex::Int32)::SDL_DisplayOrientation
        Base.llvmcall(("""
        declare i8* @SDL_GetDisplayOrientation(i32) nounwind

        define i8* @main(i32 %displayIndex) {
        entry:
            %result = call i8* @SDL_GetDisplayOrientation(i32 %displayIndex)
            ret i8* %result
        }
        """, "main"), SDL_DisplayOrientation, Tuple{Int32}, displayIndex)
    end

    # Original C signature: int SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect * rect)
    function llvm_SDL_GetDisplayUsableBounds(displayIndex::Int32, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetDisplayUsableBounds(i32, i8*) nounwind

        define i32 @main(i32 %displayIndex, i8* %rect) {
        entry:
            %result = call i32 @SDL_GetDisplayUsableBounds(i32 %displayIndex, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{SDL_Rect}}, displayIndex, rect)
    end

    # Original C signature: char * SDL_GetErrorMsg(char * errstr, int maxlen)
    function llvm_SDL_GetErrorMsg(errstr::Ptr{UInt8}, maxlen::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetErrorMsg(i8*, i32) nounwind

        define i8* @main(i8* %errstr, i32 %maxlen) {
        entry:
            %result = call i8* @SDL_GetErrorMsg(i8* %errstr, i32 %maxlen)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{UInt8}, Int32}, errstr, maxlen)
    end

    # Original C signature: SDL_bool SDL_GetEventFilter(SDL_EventFilter * filter, void ** userdata)
    function llvm_SDL_GetEventFilter(filter::Ptr{SDL_EventFilter}, userdata::Ptr{Ptr{Cvoid}})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetEventFilter(i8*, i8*) nounwind

        define i32 @main(i8* %filter, i8* %userdata) {
        entry:
            %result = call i32 @SDL_GetEventFilter(i8* %filter, i8* %userdata)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_EventFilter}, Ptr{Ptr{Cvoid}}}, filter, userdata)
    end

    # Original C signature: Uint32 SDL_GetGlobalMouseState(int * x, int * y)
    function llvm_SDL_GetGlobalMouseState(x::Ptr{Int32}, y::Ptr{Int32})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetGlobalMouseState(i8*, i8*) nounwind

        define i32 @main(i8* %x, i8* %y) {
        entry:
            %result = call i32 @SDL_GetGlobalMouseState(i8* %x, i8* %y)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{Int32}, Ptr{Int32}}, x, y)
    end

    # Original C signature: SDL_Window * SDL_GetGrabbedWindow()
    function llvm_SDL_GetGrabbedWindow()::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_GetGrabbedWindow() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetGrabbedWindow()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{}, )
    end

    # Original C signature: const char * SDL_GetHint(const char * name)
    function llvm_SDL_GetHint(name::Ptr{UInt8})::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetHint(i8*) nounwind

        define i8* @main(i8* %name) {
        entry:
            %result = call i8* @SDL_GetHint(i8* %name)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{UInt8}}, name)
    end

    # Original C signature: SDL_bool SDL_GetHintBoolean(const char * name, SDL_bool default_value)
    function llvm_SDL_GetHintBoolean(name::Ptr{UInt8}, default_value::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetHintBoolean(i8*, i32) nounwind

        define i32 @main(i8* %name, i32 %default_value) {
        entry:
            %result = call i32 @SDL_GetHintBoolean(i8* %name, i32 %default_value)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}, UInt32}, name, default_value)
    end

    # Original C signature: void SDL_GetJoystickGUIDInfo(SDL_JoystickGUID guid, Uint16 * vendor, Uint16 * product, Uint16 * version, Uint16 * crc16)
    function llvm_SDL_GetJoystickGUIDInfo(guid::SDL_JoystickGUID, vendor::Ptr{UInt16}, product::Ptr{UInt16}, version::Ptr{UInt16}, crc16::Ptr{UInt16})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetJoystickGUIDInfo(i8*, i8*, i8*, i8*, i8*) nounwind

        define void @main(i8* %guid, i8* %vendor, i8* %product, i8* %version, i8* %crc16) {
        entry:
            call void @SDL_GetJoystickGUIDInfo(i8* %guid, i8* %vendor, i8* %product, i8* %version, i8* %crc16)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_JoystickGUID, Ptr{UInt16}, Ptr{UInt16}, Ptr{UInt16}, Ptr{UInt16}}, guid, vendor, product, version, crc16)
    end

    # Original C signature: SDL_Keycode SDL_GetKeyFromName(const char * name)
    function llvm_SDL_GetKeyFromName(name::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetKeyFromName(i8*) nounwind

        define i32 @main(i8* %name) {
        entry:
            %result = call i32 @SDL_GetKeyFromName(i8* %name)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, name)
    end

    # Original C signature: SDL_Keycode SDL_GetKeyFromScancode(SDL_Scancode scancode)
    function llvm_SDL_GetKeyFromScancode(scancode::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetKeyFromScancode(i32) nounwind

        define i32 @main(i32 %scancode) {
        entry:
            %result = call i32 @SDL_GetKeyFromScancode(i32 %scancode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, scancode)
    end

    # Original C signature: SDL_Window * SDL_GetKeyboardFocus()
    function llvm_SDL_GetKeyboardFocus()::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_GetKeyboardFocus() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetKeyboardFocus()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{}, )
    end

    # Original C signature: void SDL_GetMemoryFunctions(SDL_malloc_func * malloc_func, SDL_calloc_func * calloc_func, SDL_realloc_func * realloc_func, SDL_free_func * free_func)
    function llvm_SDL_GetMemoryFunctions(malloc_func::Ptr{SDL_malloc_func}, calloc_func::Ptr{SDL_calloc_func}, realloc_func::Ptr{SDL_realloc_func}, free_func::Ptr{SDL_free_func})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetMemoryFunctions(i8*, i8*, i8*, i8*) nounwind

        define void @main(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func) {
        entry:
            call void @SDL_GetMemoryFunctions(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_malloc_func}, Ptr{SDL_calloc_func}, Ptr{SDL_realloc_func}, Ptr{SDL_free_func}}, malloc_func, calloc_func, realloc_func, free_func)
    end

    # Original C signature: SDL_Window * SDL_GetMouseFocus()
    function llvm_SDL_GetMouseFocus()::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_GetMouseFocus() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetMouseFocus()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumAllocations()
    function llvm_SDL_GetNumAllocations()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumAllocations() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumAllocations()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumAudioDevices(int iscapture)
    function llvm_SDL_GetNumAudioDevices(iscapture::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumAudioDevices(i32) nounwind

        define i32 @main(i32 %iscapture) {
        entry:
            %result = call i32 @SDL_GetNumAudioDevices(i32 %iscapture)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, iscapture)
    end

    # Original C signature: int SDL_GetNumAudioDrivers()
    function llvm_SDL_GetNumAudioDrivers()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumAudioDrivers() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumAudioDrivers()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumDisplayModes(int displayIndex)
    function llvm_SDL_GetNumDisplayModes(displayIndex::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumDisplayModes(i32) nounwind

        define i32 @main(i32 %displayIndex) {
        entry:
            %result = call i32 @SDL_GetNumDisplayModes(i32 %displayIndex)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, displayIndex)
    end

    # Original C signature: int SDL_GetNumRenderDrivers()
    function llvm_SDL_GetNumRenderDrivers()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumRenderDrivers() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumRenderDrivers()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumTouchDevices()
    function llvm_SDL_GetNumTouchDevices()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumTouchDevices() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumTouchDevices()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumTouchFingers(SDL_TouchID touchID)
    function llvm_SDL_GetNumTouchFingers(touchID::Int64)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumTouchFingers(i64) nounwind

        define i32 @main(i64 %touchID) {
        entry:
            %result = call i32 @SDL_GetNumTouchFingers(i64 %touchID)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64}, touchID)
    end

    # Original C signature: int SDL_GetNumVideoDisplays()
    function llvm_SDL_GetNumVideoDisplays()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumVideoDisplays() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumVideoDisplays()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetNumVideoDrivers()
    function llvm_SDL_GetNumVideoDrivers()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetNumVideoDrivers() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetNumVideoDrivers()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: void SDL_GetOriginalMemoryFunctions(SDL_malloc_func * malloc_func, SDL_calloc_func * calloc_func, SDL_realloc_func * realloc_func, SDL_free_func * free_func)
    function llvm_SDL_GetOriginalMemoryFunctions(malloc_func::Ptr{SDL_malloc_func}, calloc_func::Ptr{SDL_calloc_func}, realloc_func::Ptr{SDL_realloc_func}, free_func::Ptr{SDL_free_func})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetOriginalMemoryFunctions(i8*, i8*, i8*, i8*) nounwind

        define void @main(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func) {
        entry:
            call void @SDL_GetOriginalMemoryFunctions(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_malloc_func}, Ptr{SDL_calloc_func}, Ptr{SDL_realloc_func}, Ptr{SDL_free_func}}, malloc_func, calloc_func, realloc_func, free_func)
    end

    # Original C signature: Uint64 SDL_GetPerformanceCounter()
    function llvm_SDL_GetPerformanceCounter()::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GetPerformanceCounter() nounwind

        define i64 @main() {
        entry:
            %result = call i64 @SDL_GetPerformanceCounter()
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{}, )
    end

    # Original C signature: Uint64 SDL_GetPerformanceFrequency()
    function llvm_SDL_GetPerformanceFrequency()::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GetPerformanceFrequency() nounwind

        define i64 @main() {
        entry:
            %result = call i64 @SDL_GetPerformanceFrequency()
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{}, )
    end

    # Original C signature: const char* SDL_GetPixelFormatName(Uint32 format)
    function llvm_SDL_GetPixelFormatName(format::UInt32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetPixelFormatName(i32) nounwind

        define i8* @main(i32 %format) {
        entry:
            %result = call i8* @SDL_GetPixelFormatName(i32 %format)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{UInt32}, format)
    end

    # Original C signature: const char * SDL_GetPlatform()
    function llvm_SDL_GetPlatform()::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetPlatform() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetPlatform()
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{}, )
    end

    # Original C signature: int SDL_GetPointDisplayIndex(const SDL_Point * point)
    function llvm_SDL_GetPointDisplayIndex(point::Ptr{SDL_Point})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetPointDisplayIndex(i8*) nounwind

        define i32 @main(i8* %point) {
        entry:
            %result = call i32 @SDL_GetPointDisplayIndex(i8* %point)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Point}}, point)
    end

    # Original C signature: SDL_PowerState SDL_GetPowerInfo(int * seconds, int * percent)
    function llvm_SDL_GetPowerInfo(seconds::Ptr{Int32}, percent::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetPowerInfo(i8*, i8*) nounwind

        define i32 @main(i8* %seconds, i8* %percent) {
        entry:
            %result = call i32 @SDL_GetPowerInfo(i8* %seconds, i8* %percent)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Int32}, Ptr{Int32}}, seconds, percent)
    end

    # Original C signature: SDL_Locale * SDL_GetPreferredLocales()
    function llvm_SDL_GetPreferredLocales()::Ptr{SDL_Locale}
        Base.llvmcall(("""
        declare i8* @SDL_GetPreferredLocales() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetPreferredLocales()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Locale}, Tuple{}, )
    end

    # Original C signature: char * SDL_GetPrimarySelectionText()
    function llvm_SDL_GetPrimarySelectionText()::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetPrimarySelectionText() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetPrimarySelectionText()
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{}, )
    end

    # Original C signature: Uint32 SDL_GetQueuedAudioSize(SDL_AudioDeviceID dev)
    function llvm_SDL_GetQueuedAudioSize(dev::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetQueuedAudioSize(i32) nounwind

        define i32 @main(i32 %dev) {
        entry:
            %result = call i32 @SDL_GetQueuedAudioSize(i32 %dev)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32}, dev)
    end

    # Original C signature: int SDL_GetRectDisplayIndex(const SDL_Rect * rect)
    function llvm_SDL_GetRectDisplayIndex(rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRectDisplayIndex(i8*) nounwind

        define i32 @main(i8* %rect) {
        entry:
            %result = call i32 @SDL_GetRectDisplayIndex(i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Rect}}, rect)
    end

    # Original C signature: SDL_bool SDL_GetRelativeMouseMode()
    function llvm_SDL_GetRelativeMouseMode()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetRelativeMouseMode() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetRelativeMouseMode()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: int SDL_GetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode * blendMode)
    function llvm_SDL_GetRenderDrawBlendMode(renderer::Ptr{SDL_Renderer}, blendMode::Ptr{UInt32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRenderDrawBlendMode(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %blendMode) {
        entry:
            %result = call i32 @SDL_GetRenderDrawBlendMode(i8* %renderer, i8* %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{UInt32}}, renderer, blendMode)
    end

    # Original C signature: int SDL_GetRenderDrawColor(SDL_Renderer * renderer, Uint8 * r, Uint8 * g, Uint8 * b, Uint8 * a)
    function llvm_SDL_GetRenderDrawColor(renderer::Ptr{SDL_Renderer}, r::Ptr{UInt8}, g::Ptr{UInt8}, b::Ptr{UInt8}, a::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRenderDrawColor(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %r, i8* %g, i8* %b, i8* %a) {
        entry:
            %result = call i32 @SDL_GetRenderDrawColor(i8* %renderer, i8* %r, i8* %g, i8* %b, i8* %a)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}}, renderer, r, g, b, a)
    end

    # Original C signature: int SDL_GetRenderDriverInfo(int index, SDL_RendererInfo * info)
    function llvm_SDL_GetRenderDriverInfo(index::Int32, info::Ptr{SDL_RendererInfo})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRenderDriverInfo(i32, i8*) nounwind

        define i32 @main(i32 %index, i8* %info) {
        entry:
            %result = call i32 @SDL_GetRenderDriverInfo(i32 %index, i8* %info)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{SDL_RendererInfo}}, index, info)
    end

    # Original C signature: SDL_Texture * SDL_GetRenderTarget(SDL_Renderer * renderer)
    function llvm_SDL_GetRenderTarget(renderer::Ptr{SDL_Renderer})::Ptr{SDL_Texture}
        Base.llvmcall(("""
        declare i8* @SDL_GetRenderTarget(i8*) nounwind

        define i8* @main(i8* %renderer) {
        entry:
            %result = call i8* @SDL_GetRenderTarget(i8* %renderer)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Texture}, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: SDL_Renderer * SDL_GetRenderer(SDL_Window * window)
    function llvm_SDL_GetRenderer(window::Ptr{SDL_Window})::Ptr{SDL_Renderer}
        Base.llvmcall(("""
        declare i8* @SDL_GetRenderer(i8*) nounwind

        define i8* @main(i8* %window) {
        entry:
            %result = call i8* @SDL_GetRenderer(i8* %window)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Renderer}, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_GetRendererInfo(SDL_Renderer * renderer, SDL_RendererInfo * info)
    function llvm_SDL_GetRendererInfo(renderer::Ptr{SDL_Renderer}, info::Ptr{SDL_RendererInfo})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRendererInfo(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %info) {
        entry:
            %result = call i32 @SDL_GetRendererInfo(i8* %renderer, i8* %info)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_RendererInfo}}, renderer, info)
    end

    # Original C signature: int SDL_GetRendererOutputSize(SDL_Renderer * renderer, int * w, int * h)
    function llvm_SDL_GetRendererOutputSize(renderer::Ptr{SDL_Renderer}, w::Ptr{Int32}, h::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetRendererOutputSize(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %w, i8* %h) {
        entry:
            %result = call i32 @SDL_GetRendererOutputSize(i8* %renderer, i8* %w, i8* %h)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{Int32}, Ptr{Int32}}, renderer, w, h)
    end

    # Original C signature: SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode key)
    function llvm_SDL_GetScancodeFromKey(key::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetScancodeFromKey(i32) nounwind

        define i32 @main(i32 %key) {
        entry:
            %result = call i32 @SDL_GetScancodeFromKey(i32 %key)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, key)
    end

    # Original C signature: SDL_Scancode SDL_GetScancodeFromName(const char * name)
    function llvm_SDL_GetScancodeFromName(name::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetScancodeFromName(i8*) nounwind

        define i32 @main(i8* %name) {
        entry:
            %result = call i32 @SDL_GetScancodeFromName(i8* %name)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, name)
    end

    # Original C signature: int SDL_GetShapedWindowMode(SDL_Window * window, SDL_WindowShapeMode * shape_mode)
    function llvm_SDL_GetShapedWindowMode(window::Ptr{SDL_Window}, shape_mode::Ptr{SDL_WindowShapeMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetShapedWindowMode(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %shape_mode) {
        entry:
            %result = call i32 @SDL_GetShapedWindowMode(i8* %window, i8* %shape_mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_WindowShapeMode}}, window, shape_mode)
    end

    # Original C signature: int SDL_GetSurfaceAlphaMod(SDL_Surface * surface, Uint8 * alpha)
    function llvm_SDL_GetSurfaceAlphaMod(surface::Ptr{SDL_Surface}, alpha::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetSurfaceAlphaMod(i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %alpha) {
        entry:
            %result = call i32 @SDL_GetSurfaceAlphaMod(i8* %surface, i8* %alpha)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{UInt8}}, surface, alpha)
    end

    # Original C signature: int SDL_GetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode * blendMode)
    function llvm_SDL_GetSurfaceBlendMode(surface::Ptr{SDL_Surface}, blendMode::Ptr{UInt32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetSurfaceBlendMode(i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %blendMode) {
        entry:
            %result = call i32 @SDL_GetSurfaceBlendMode(i8* %surface, i8* %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{UInt32}}, surface, blendMode)
    end

    # Original C signature: int SDL_GetSurfaceColorMod(SDL_Surface * surface, Uint8 * r, Uint8 * g, Uint8 * b)
    function llvm_SDL_GetSurfaceColorMod(surface::Ptr{SDL_Surface}, r::Ptr{UInt8}, g::Ptr{UInt8}, b::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetSurfaceColorMod(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %r, i8* %g, i8* %b) {
        entry:
            %result = call i32 @SDL_GetSurfaceColorMod(i8* %surface, i8* %r, i8* %g, i8* %b)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}}, surface, r, g, b)
    end

    # Original C signature: int SDL_GetSystemRAM()
    function llvm_SDL_GetSystemRAM()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetSystemRAM() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetSystemRAM()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_GetTextureAlphaMod(SDL_Texture * texture, Uint8 * alpha)
    function llvm_SDL_GetTextureAlphaMod(texture::Ptr{SDL_Texture}, alpha::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetTextureAlphaMod(i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %alpha) {
        entry:
            %result = call i32 @SDL_GetTextureAlphaMod(i8* %texture, i8* %alpha)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{UInt8}}, texture, alpha)
    end

    # Original C signature: int SDL_GetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode * blendMode)
    function llvm_SDL_GetTextureBlendMode(texture::Ptr{SDL_Texture}, blendMode::Ptr{UInt32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetTextureBlendMode(i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %blendMode) {
        entry:
            %result = call i32 @SDL_GetTextureBlendMode(i8* %texture, i8* %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{UInt32}}, texture, blendMode)
    end

    # Original C signature: int SDL_GetTextureColorMod(SDL_Texture * texture, Uint8 * r, Uint8 * g, Uint8 * b)
    function llvm_SDL_GetTextureColorMod(texture::Ptr{SDL_Texture}, r::Ptr{UInt8}, g::Ptr{UInt8}, b::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetTextureColorMod(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %r, i8* %g, i8* %b) {
        entry:
            %result = call i32 @SDL_GetTextureColorMod(i8* %texture, i8* %r, i8* %g, i8* %b)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}}, texture, r, g, b)
    end

    # Original C signature: int SDL_GetTextureScaleMode(SDL_Texture * texture, SDL_ScaleMode * scaleMode)
    function llvm_SDL_GetTextureScaleMode(texture::Ptr{SDL_Texture}, scaleMode::Ptr{UInt32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetTextureScaleMode(i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %scaleMode) {
        entry:
            %result = call i32 @SDL_GetTextureScaleMode(i8* %texture, i8* %scaleMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{UInt32}}, texture, scaleMode)
    end

    # Original C signature: void * SDL_GetTextureUserData(SDL_Texture * texture)
    function llvm_SDL_GetTextureUserData(texture::Ptr{SDL_Texture})::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_GetTextureUserData(i8*) nounwind

        define i8* @main(i8* %texture) {
        entry:
            %result = call i8* @SDL_GetTextureUserData(i8* %texture)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{SDL_Texture}}, texture)
    end

    # Original C signature: SDL_threadID SDL_GetThreadID(SDL_Thread * thread)
    function llvm_SDL_GetThreadID(thread::Ptr{SDL_Thread})::SDL_threadID
        Base.llvmcall(("""
        declare i8* @SDL_GetThreadID(i8*) nounwind

        define i8* @main(i8* %thread) {
        entry:
            %result = call i8* @SDL_GetThreadID(i8* %thread)
            ret i8* %result
        }
        """, "main"), SDL_threadID, Tuple{Ptr{SDL_Thread}}, thread)
    end

    # Original C signature: Uint32 SDL_GetTicks()
    function llvm_SDL_GetTicks()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetTicks() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_GetTicks()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: Uint64 SDL_GetTicks64()
    function llvm_SDL_GetTicks64()::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_GetTicks64() nounwind

        define i64 @main() {
        entry:
            %result = call i64 @SDL_GetTicks64()
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{}, )
    end

    # Original C signature: SDL_TouchID SDL_GetTouchDevice(int index)
    function llvm_SDL_GetTouchDevice(index::Int32)::Int64
        Base.llvmcall(("""
        declare i64 @SDL_GetTouchDevice(i32) nounwind

        define i64 @main(i32 %index) {
        entry:
            %result = call i64 @SDL_GetTouchDevice(i32 %index)
            ret i64 %result
        }
        """, "main"), Int64, Tuple{Int32}, index)
    end

    # Original C signature: SDL_TouchDeviceType SDL_GetTouchDeviceType(SDL_TouchID touchID)
    function llvm_SDL_GetTouchDeviceType(touchID::Int64)::SDL_TouchDeviceType
        Base.llvmcall(("""
        declare i8* @SDL_GetTouchDeviceType(i64) nounwind

        define i8* @main(i64 %touchID) {
        entry:
            %result = call i8* @SDL_GetTouchDeviceType(i64 %touchID)
            ret i8* %result
        }
        """, "main"), SDL_TouchDeviceType, Tuple{Int64}, touchID)
    end

    # Original C signature: SDL_Finger * SDL_GetTouchFinger(SDL_TouchID touchID, int index)
    function llvm_SDL_GetTouchFinger(touchID::Int64, index::Int32)::Ptr{SDL_Finger}
        Base.llvmcall(("""
        declare i8* @SDL_GetTouchFinger(i64, i32) nounwind

        define i8* @main(i64 %touchID, i32 %index) {
        entry:
            %result = call i8* @SDL_GetTouchFinger(i64 %touchID, i32 %index)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Finger}, Tuple{Int64, Int32}, touchID, index)
    end

    # Original C signature: const char* SDL_GetTouchName(int index)
    function llvm_SDL_GetTouchName(index::Int32)::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_GetTouchName(i32) nounwind

        define i8* @main(i32 %index) {
        entry:
            %result = call i8* @SDL_GetTouchName(i32 %index)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Int32}, index)
    end

    # Original C signature: void SDL_GetVersion(SDL_version * ver)
    function llvm_SDL_GetVersion(ver::Ptr{SDL_version})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetVersion(i8*) nounwind

        define void @main(i8* %ver) {
        entry:
            call void @SDL_GetVersion(i8* %ver)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_version}}, ver)
    end

    # Original C signature: int SDL_GetWindowBordersSize(SDL_Window * window, int * top, int * left, int * bottom, int * right)
    function llvm_SDL_GetWindowBordersSize(window::Ptr{SDL_Window}, top::Ptr{Int32}, left::Ptr{Int32}, bottom::Ptr{Int32}, right::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowBordersSize(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %top, i8* %left, i8* %bottom, i8* %right) {
        entry:
            %result = call i32 @SDL_GetWindowBordersSize(i8* %window, i8* %top, i8* %left, i8* %bottom, i8* %right)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}}, window, top, left, bottom, right)
    end

    # Original C signature: float SDL_GetWindowBrightness(SDL_Window * window)
    function llvm_SDL_GetWindowBrightness(window::Ptr{SDL_Window})::Float32
        Base.llvmcall(("""
        declare float @SDL_GetWindowBrightness(i8*) nounwind

        define float @main(i8* %window) {
        entry:
            %result = call float @SDL_GetWindowBrightness(i8* %window)
            ret float %result
        }
        """, "main"), Float32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_GetWindowDisplayIndex(SDL_Window * window)
    function llvm_SDL_GetWindowDisplayIndex(window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowDisplayIndex(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowDisplayIndex(i8* %window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_GetWindowDisplayMode(SDL_Window * window, SDL_DisplayMode * mode)
    function llvm_SDL_GetWindowDisplayMode(window::Ptr{SDL_Window}, mode::Ptr{SDL_DisplayMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowDisplayMode(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %mode) {
        entry:
            %result = call i32 @SDL_GetWindowDisplayMode(i8* %window, i8* %mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_DisplayMode}}, window, mode)
    end

    # Original C signature: Uint32 SDL_GetWindowFlags(SDL_Window * window)
    function llvm_SDL_GetWindowFlags(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowFlags(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowFlags(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: SDL_Window * SDL_GetWindowFromID(Uint32 id)
    function llvm_SDL_GetWindowFromID(id::UInt32)::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_GetWindowFromID(i32) nounwind

        define i8* @main(i32 %id) {
        entry:
            %result = call i8* @SDL_GetWindowFromID(i32 %id)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{UInt32}, id)
    end

    # Original C signature: int SDL_GetWindowGammaRamp(SDL_Window * window, Uint16 * red, Uint16 * green, Uint16 * blue)
    function llvm_SDL_GetWindowGammaRamp(window::Ptr{SDL_Window}, red::Ptr{UInt16}, green::Ptr{UInt16}, blue::Ptr{UInt16})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowGammaRamp(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %red, i8* %green, i8* %blue) {
        entry:
            %result = call i32 @SDL_GetWindowGammaRamp(i8* %window, i8* %red, i8* %green, i8* %blue)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{UInt16}, Ptr{UInt16}, Ptr{UInt16}}, window, red, green, blue)
    end

    # Original C signature: SDL_bool SDL_GetWindowGrab(SDL_Window * window)
    function llvm_SDL_GetWindowGrab(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowGrab(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowGrab(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void* SDL_GetWindowICCProfile(SDL_Window * window, size_t* size)
    function llvm_SDL_GetWindowICCProfile(window::Ptr{SDL_Window}, size::Ptr{Csize_t})::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_GetWindowICCProfile(i8*, i8*) nounwind

        define i8* @main(i8* %window, i8* %size) {
        entry:
            %result = call i8* @SDL_GetWindowICCProfile(i8* %window, i8* %size)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{SDL_Window}, Ptr{Csize_t}}, window, size)
    end

    # Original C signature: Uint32 SDL_GetWindowID(SDL_Window * window)
    function llvm_SDL_GetWindowID(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowID(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowID(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: SDL_bool SDL_GetWindowKeyboardGrab(SDL_Window * window)
    function llvm_SDL_GetWindowKeyboardGrab(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowKeyboardGrab(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowKeyboardGrab(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_GetWindowMaximumSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GetWindowMaximumSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowMaximumSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GetWindowMaximumSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: void SDL_GetWindowMinimumSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GetWindowMinimumSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowMinimumSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GetWindowMinimumSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: SDL_bool SDL_GetWindowMouseGrab(SDL_Window * window)
    function llvm_SDL_GetWindowMouseGrab(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowMouseGrab(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowMouseGrab(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: const SDL_Rect * SDL_GetWindowMouseRect(SDL_Window * window)
    function llvm_SDL_GetWindowMouseRect(window::Ptr{SDL_Window})::Ptr{SDL_Rect}
        Base.llvmcall(("""
        declare i8* @SDL_GetWindowMouseRect(i8*) nounwind

        define i8* @main(i8* %window) {
        entry:
            %result = call i8* @SDL_GetWindowMouseRect(i8* %window)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Rect}, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_GetWindowOpacity(SDL_Window * window, float * out_opacity)
    function llvm_SDL_GetWindowOpacity(window::Ptr{SDL_Window}, out_opacity::Ptr{Float32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowOpacity(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %out_opacity) {
        entry:
            %result = call i32 @SDL_GetWindowOpacity(i8* %window, i8* %out_opacity)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{Float32}}, window, out_opacity)
    end

    # Original C signature: Uint32 SDL_GetWindowPixelFormat(SDL_Window * window)
    function llvm_SDL_GetWindowPixelFormat(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowPixelFormat(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_GetWindowPixelFormat(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_GetWindowPosition(SDL_Window * window, int * x, int * y)
    function llvm_SDL_GetWindowPosition(window::Ptr{SDL_Window}, x::Ptr{Int32}, y::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowPosition(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %x, i8* %y) {
        entry:
            call void @SDL_GetWindowPosition(i8* %window, i8* %x, i8* %y)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, x, y)
    end

    # Original C signature: void SDL_GetWindowSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GetWindowSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GetWindowSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: void SDL_GetWindowSizeInPixels(SDL_Window * window, int * w, int * h)
    function llvm_SDL_GetWindowSizeInPixels(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_GetWindowSizeInPixels(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_GetWindowSizeInPixels(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: SDL_Surface * SDL_GetWindowSurface(SDL_Window * window)
    function llvm_SDL_GetWindowSurface(window::Ptr{SDL_Window})::Ptr{SDL_Surface}
        Base.llvmcall(("""
        declare i8* @SDL_GetWindowSurface(i8*) nounwind

        define i8* @main(i8* %window) {
        entry:
            %result = call i8* @SDL_GetWindowSurface(i8* %window)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Surface}, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: SDL_bool SDL_GetWindowWMInfo(SDL_Window * window, SDL_SysWMinfo * info)
    function llvm_SDL_GetWindowWMInfo(window::Ptr{SDL_Window}, info::Ptr{Cvoid})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_GetWindowWMInfo(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %info) {
        entry:
            %result = call i32 @SDL_GetWindowWMInfo(i8* %window, i8* %info)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}, Ptr{Cvoid}}, window, info)
    end

    # Original C signature: SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionMode()
    function llvm_SDL_GetYUVConversionMode()::SDL_YUV_CONVERSION_MODE
        Base.llvmcall(("""
        declare i8* @SDL_GetYUVConversionMode() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_GetYUVConversionMode()
            ret i8* %result
        }
        """, "main"), SDL_YUV_CONVERSION_MODE, Tuple{}, )
    end

    # Original C signature: SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionModeForResolution(int width, int height)
    function llvm_SDL_GetYUVConversionModeForResolution(width::Int32, height::Int32)::SDL_YUV_CONVERSION_MODE
        Base.llvmcall(("""
        declare i8* @SDL_GetYUVConversionModeForResolution(i32, i32) nounwind

        define i8* @main(i32 %width, i32 %height) {
        entry:
            %result = call i8* @SDL_GetYUVConversionModeForResolution(i32 %width, i32 %height)
            ret i8* %result
        }
        """, "main"), SDL_YUV_CONVERSION_MODE, Tuple{Int32, Int32}, width, height)
    end

    # Original C signature: void SDL_HapticClose(SDL_Haptic * haptic)
    function llvm_SDL_HapticClose(haptic::Ptr{SDL_Haptic})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_HapticClose(i8*) nounwind

        define void @main(i8* %haptic) {
        entry:
            call void @SDL_HapticClose(i8* %haptic)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: void SDL_HapticDestroyEffect(SDL_Haptic * haptic, int effect)
    function llvm_SDL_HapticDestroyEffect(haptic::Ptr{SDL_Haptic}, effect::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_HapticDestroyEffect(i8*, i32) nounwind

        define void @main(i8* %haptic, i32 %effect) {
        entry:
            call void @SDL_HapticDestroyEffect(i8* %haptic, i32 %effect)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Haptic}, Int32}, haptic, effect)
    end

    # Original C signature: int SDL_HapticEffectSupported(SDL_Haptic * haptic, SDL_HapticEffect * effect)
    function llvm_SDL_HapticEffectSupported(haptic::Ptr{SDL_Haptic}, effect::Ptr{SDL_HapticEffect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticEffectSupported(i8*, i8*) nounwind

        define i32 @main(i8* %haptic, i8* %effect) {
        entry:
            %result = call i32 @SDL_HapticEffectSupported(i8* %haptic, i8* %effect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Ptr{SDL_HapticEffect}}, haptic, effect)
    end

    # Original C signature: int SDL_HapticGetEffectStatus(SDL_Haptic * haptic, int effect)
    function llvm_SDL_HapticGetEffectStatus(haptic::Ptr{SDL_Haptic}, effect::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticGetEffectStatus(i8*, i32) nounwind

        define i32 @main(i8* %haptic, i32 %effect) {
        entry:
            %result = call i32 @SDL_HapticGetEffectStatus(i8* %haptic, i32 %effect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32}, haptic, effect)
    end

    # Original C signature: int SDL_HapticIndex(SDL_Haptic * haptic)
    function llvm_SDL_HapticIndex(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticIndex(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticIndex(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticNewEffect(SDL_Haptic * haptic, SDL_HapticEffect * effect)
    function llvm_SDL_HapticNewEffect(haptic::Ptr{SDL_Haptic}, effect::Ptr{SDL_HapticEffect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticNewEffect(i8*, i8*) nounwind

        define i32 @main(i8* %haptic, i8* %effect) {
        entry:
            %result = call i32 @SDL_HapticNewEffect(i8* %haptic, i8* %effect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Ptr{SDL_HapticEffect}}, haptic, effect)
    end

    # Original C signature: int SDL_HapticNumAxes(SDL_Haptic * haptic)
    function llvm_SDL_HapticNumAxes(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticNumAxes(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticNumAxes(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticNumEffects(SDL_Haptic * haptic)
    function llvm_SDL_HapticNumEffects(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticNumEffects(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticNumEffects(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticNumEffectsPlaying(SDL_Haptic * haptic)
    function llvm_SDL_HapticNumEffectsPlaying(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticNumEffectsPlaying(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticNumEffectsPlaying(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticOpened(int device_index)
    function llvm_SDL_HapticOpened(device_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticOpened(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_HapticOpened(i32 %device_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, device_index)
    end

    # Original C signature: int SDL_HapticPause(SDL_Haptic * haptic)
    function llvm_SDL_HapticPause(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticPause(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticPause(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: unsigned int SDL_HapticQuery(SDL_Haptic * haptic)
    function llvm_SDL_HapticQuery(haptic::Ptr{SDL_Haptic})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HapticQuery(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticQuery(i8* %haptic)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticRumbleInit(SDL_Haptic * haptic)
    function llvm_SDL_HapticRumbleInit(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticRumbleInit(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticRumbleInit(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticRumblePlay(SDL_Haptic * haptic, float strength, Uint32 length)
    function llvm_SDL_HapticRumblePlay(haptic::Ptr{SDL_Haptic}, strength::Float32, length::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticRumblePlay(i8*, float, i32) nounwind

        define i32 @main(i8* %haptic, float %strength, i32 %length) {
        entry:
            %result = call i32 @SDL_HapticRumblePlay(i8* %haptic, float %strength, i32 %length)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Float32, UInt32}, haptic, strength, length)
    end

    # Original C signature: int SDL_HapticRumbleStop(SDL_Haptic * haptic)
    function llvm_SDL_HapticRumbleStop(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticRumbleStop(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticRumbleStop(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticRumbleSupported(SDL_Haptic * haptic)
    function llvm_SDL_HapticRumbleSupported(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticRumbleSupported(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticRumbleSupported(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticRunEffect(SDL_Haptic * haptic, int effect, Uint32 iterations)
    function llvm_SDL_HapticRunEffect(haptic::Ptr{SDL_Haptic}, effect::Int32, iterations::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticRunEffect(i8*, i32, i32) nounwind

        define i32 @main(i8* %haptic, i32 %effect, i32 %iterations) {
        entry:
            %result = call i32 @SDL_HapticRunEffect(i8* %haptic, i32 %effect, i32 %iterations)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32, UInt32}, haptic, effect, iterations)
    end

    # Original C signature: int SDL_HapticSetAutocenter(SDL_Haptic * haptic, int autocenter)
    function llvm_SDL_HapticSetAutocenter(haptic::Ptr{SDL_Haptic}, autocenter::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticSetAutocenter(i8*, i32) nounwind

        define i32 @main(i8* %haptic, i32 %autocenter) {
        entry:
            %result = call i32 @SDL_HapticSetAutocenter(i8* %haptic, i32 %autocenter)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32}, haptic, autocenter)
    end

    # Original C signature: int SDL_HapticSetGain(SDL_Haptic * haptic, int gain)
    function llvm_SDL_HapticSetGain(haptic::Ptr{SDL_Haptic}, gain::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticSetGain(i8*, i32) nounwind

        define i32 @main(i8* %haptic, i32 %gain) {
        entry:
            %result = call i32 @SDL_HapticSetGain(i8* %haptic, i32 %gain)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32}, haptic, gain)
    end

    # Original C signature: int SDL_HapticStopAll(SDL_Haptic * haptic)
    function llvm_SDL_HapticStopAll(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticStopAll(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticStopAll(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticStopEffect(SDL_Haptic * haptic, int effect)
    function llvm_SDL_HapticStopEffect(haptic::Ptr{SDL_Haptic}, effect::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticStopEffect(i8*, i32) nounwind

        define i32 @main(i8* %haptic, i32 %effect) {
        entry:
            %result = call i32 @SDL_HapticStopEffect(i8* %haptic, i32 %effect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32}, haptic, effect)
    end

    # Original C signature: int SDL_HapticUnpause(SDL_Haptic * haptic)
    function llvm_SDL_HapticUnpause(haptic::Ptr{SDL_Haptic})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticUnpause(i8*) nounwind

        define i32 @main(i8* %haptic) {
        entry:
            %result = call i32 @SDL_HapticUnpause(i8* %haptic)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}}, haptic)
    end

    # Original C signature: int SDL_HapticUpdateEffect(SDL_Haptic * haptic, int effect, SDL_HapticEffect * data)
    function llvm_SDL_HapticUpdateEffect(haptic::Ptr{SDL_Haptic}, effect::Int32, data::Ptr{SDL_HapticEffect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_HapticUpdateEffect(i8*, i32, i8*) nounwind

        define i32 @main(i8* %haptic, i32 %effect, i8* %data) {
        entry:
            %result = call i32 @SDL_HapticUpdateEffect(i8* %haptic, i32 %effect, i8* %data)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Haptic}, Int32, Ptr{SDL_HapticEffect}}, haptic, effect, data)
    end

    # Original C signature: SDL_bool SDL_Has3DNow()
    function llvm_SDL_Has3DNow()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_Has3DNow() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_Has3DNow()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasARMSIMD()
    function llvm_SDL_HasARMSIMD()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasARMSIMD() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasARMSIMD()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasAVX()
    function llvm_SDL_HasAVX()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasAVX() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasAVX()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasAVX2()
    function llvm_SDL_HasAVX2()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasAVX2() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasAVX2()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasAVX512F()
    function llvm_SDL_HasAVX512F()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasAVX512F() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasAVX512F()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasAltiVec()
    function llvm_SDL_HasAltiVec()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasAltiVec() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasAltiVec()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasClipboardText()
    function llvm_SDL_HasClipboardText()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasClipboardText() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasClipboardText()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasColorKey(SDL_Surface * surface)
    function llvm_SDL_HasColorKey(surface::Ptr{SDL_Surface})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasColorKey(i8*) nounwind

        define i32 @main(i8* %surface) {
        entry:
            %result = call i32 @SDL_HasColorKey(i8* %surface)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: SDL_bool SDL_HasEvent(Uint32 type)
    function llvm_SDL_HasEvent(type::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasEvent(i32) nounwind

        define i32 @main(i32 %type) {
        entry:
            %result = call i32 @SDL_HasEvent(i32 %type)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32}, type)
    end

    # Original C signature: SDL_bool SDL_HasEvents(Uint32 minType, Uint32 maxType)
    function llvm_SDL_HasEvents(minType::UInt32, maxType::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasEvents(i32, i32) nounwind

        define i32 @main(i32 %minType, i32 %maxType) {
        entry:
            %result = call i32 @SDL_HasEvents(i32 %minType, i32 %maxType)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32, UInt32}, minType, maxType)
    end

    # Original C signature: SDL_bool SDL_HasIntersection(const SDL_Rect * A, const SDL_Rect * B)
    function llvm_SDL_HasIntersection(A::Ptr{SDL_Rect}, B::Ptr{SDL_Rect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasIntersection(i8*, i8*) nounwind

        define i32 @main(i8* %A, i8* %B) {
        entry:
            %result = call i32 @SDL_HasIntersection(i8* %A, i8* %B)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Rect}, Ptr{SDL_Rect}}, A, B)
    end

    # Original C signature: SDL_bool SDL_HasIntersectionF(const SDL_FRect * A, const SDL_FRect * B)
    function llvm_SDL_HasIntersectionF(A::Ptr{SDL_FRect}, B::Ptr{SDL_FRect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasIntersectionF(i8*, i8*) nounwind

        define i32 @main(i8* %A, i8* %B) {
        entry:
            %result = call i32 @SDL_HasIntersectionF(i8* %A, i8* %B)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_FRect}, Ptr{SDL_FRect}}, A, B)
    end

    # Original C signature: SDL_bool SDL_HasLASX()
    function llvm_SDL_HasLASX()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasLASX() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasLASX()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasLSX()
    function llvm_SDL_HasLSX()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasLSX() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasLSX()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasMMX()
    function llvm_SDL_HasMMX()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasMMX() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasMMX()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasNEON()
    function llvm_SDL_HasNEON()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasNEON() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasNEON()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasPrimarySelectionText()
    function llvm_SDL_HasPrimarySelectionText()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasPrimarySelectionText() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasPrimarySelectionText()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasRDTSC()
    function llvm_SDL_HasRDTSC()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasRDTSC() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasRDTSC()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSSE()
    function llvm_SDL_HasSSE()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSSE() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasSSE()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSSE2()
    function llvm_SDL_HasSSE2()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSSE2() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasSSE2()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSSE3()
    function llvm_SDL_HasSSE3()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSSE3() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasSSE3()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSSE41()
    function llvm_SDL_HasSSE41()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSSE41() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasSSE41()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSSE42()
    function llvm_SDL_HasSSE42()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSSE42() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasSSE42()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasScreenKeyboardSupport()
    function llvm_SDL_HasScreenKeyboardSupport()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasScreenKeyboardSupport() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_HasScreenKeyboardSupport()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_HasSurfaceRLE(SDL_Surface * surface)
    function llvm_SDL_HasSurfaceRLE(surface::Ptr{SDL_Surface})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasSurfaceRLE(i8*) nounwind

        define i32 @main(i8* %surface) {
        entry:
            %result = call i32 @SDL_HasSurfaceRLE(i8* %surface)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: SDL_bool SDL_HasWindowSurface(SDL_Window * window)
    function llvm_SDL_HasWindowSurface(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_HasWindowSurface(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_HasWindowSurface(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_HideWindow(SDL_Window * window)
    function llvm_SDL_HideWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_HideWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_HideWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_Init(Uint32 flags)
    function llvm_SDL_Init(flags::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_Init(i32) nounwind

        define i32 @main(i32 %flags) {
        entry:
            %result = call i32 @SDL_Init(i32 %flags)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, flags)
    end

    # Original C signature: int SDL_InitSubSystem(Uint32 flags)
    function llvm_SDL_InitSubSystem(flags::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_InitSubSystem(i32) nounwind

        define i32 @main(i32 %flags) {
        entry:
            %result = call i32 @SDL_InitSubSystem(i32 %flags)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, flags)
    end

    # Original C signature: SDL_bool SDL_IntersectFRect(const SDL_FRect * A, const SDL_FRect * B, SDL_FRect * result)
    function llvm_SDL_IntersectFRect(A::Ptr{SDL_FRect}, B::Ptr{SDL_FRect}, result::Ptr{SDL_FRect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IntersectFRect(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %A, i8* %B, i8* %result) {
        entry:
            %result = call i32 @SDL_IntersectFRect(i8* %A, i8* %B, i8* %result)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_FRect}, Ptr{SDL_FRect}, Ptr{SDL_FRect}}, A, B, result)
    end

    # Original C signature: SDL_bool SDL_IntersectFRectAndLine(const SDL_FRect * rect, float * X1, float * Y1, float * X2, float * Y2)
    function llvm_SDL_IntersectFRectAndLine(rect::Ptr{SDL_FRect}, X1::Ptr{Float32}, Y1::Ptr{Float32}, X2::Ptr{Float32}, Y2::Ptr{Float32})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IntersectFRectAndLine(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %rect, i8* %X1, i8* %Y1, i8* %X2, i8* %Y2) {
        entry:
            %result = call i32 @SDL_IntersectFRectAndLine(i8* %rect, i8* %X1, i8* %Y1, i8* %X2, i8* %Y2)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_FRect}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}, Ptr{Float32}}, rect, X1, Y1, X2, Y2)
    end

    # Original C signature: SDL_bool SDL_IntersectRect(const SDL_Rect * A, const SDL_Rect * B, SDL_Rect * result)
    function llvm_SDL_IntersectRect(A::Ptr{SDL_Rect}, B::Ptr{SDL_Rect}, result::Ptr{SDL_Rect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IntersectRect(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %A, i8* %B, i8* %result) {
        entry:
            %result = call i32 @SDL_IntersectRect(i8* %A, i8* %B, i8* %result)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Rect}, Ptr{SDL_Rect}, Ptr{SDL_Rect}}, A, B, result)
    end

    # Original C signature: SDL_bool SDL_IntersectRectAndLine(const SDL_Rect * rect, int * X1, int * Y1, int * X2, int * Y2)
    function llvm_SDL_IntersectRectAndLine(rect::Ptr{SDL_Rect}, X1::Ptr{Int32}, Y1::Ptr{Int32}, X2::Ptr{Int32}, Y2::Ptr{Int32})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IntersectRectAndLine(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %rect, i8* %X1, i8* %Y1, i8* %X2, i8* %Y2) {
        entry:
            %result = call i32 @SDL_IntersectRectAndLine(i8* %rect, i8* %X1, i8* %Y1, i8* %X2, i8* %Y2)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Rect}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}}, rect, X1, Y1, X2, Y2)
    end

    # Original C signature: SDL_bool SDL_IsAndroidTV()
    function llvm_SDL_IsAndroidTV()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsAndroidTV() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsAndroidTV()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsChromebook()
    function llvm_SDL_IsChromebook()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsChromebook() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsChromebook()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsDeXMode()
    function llvm_SDL_IsDeXMode()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsDeXMode() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsDeXMode()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsGameController(int joystick_index)
    function llvm_SDL_IsGameController(joystick_index::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsGameController(i32) nounwind

        define i32 @main(i32 %joystick_index) {
        entry:
            %result = call i32 @SDL_IsGameController(i32 %joystick_index)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32}, joystick_index)
    end

    # Original C signature: SDL_bool SDL_IsScreenKeyboardShown(SDL_Window * window)
    function llvm_SDL_IsScreenKeyboardShown(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsScreenKeyboardShown(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_IsScreenKeyboardShown(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: SDL_bool SDL_IsScreenSaverEnabled()
    function llvm_SDL_IsScreenSaverEnabled()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsScreenSaverEnabled() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsScreenSaverEnabled()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsShapedWindow(const SDL_Window * window)
    function llvm_SDL_IsShapedWindow(window::Ptr{SDL_Window})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsShapedWindow(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_IsShapedWindow(i8* %window)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: SDL_bool SDL_IsTablet()
    function llvm_SDL_IsTablet()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsTablet() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsTablet()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsTextInputActive()
    function llvm_SDL_IsTextInputActive()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsTextInputActive() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsTextInputActive()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_IsTextInputShown()
    function llvm_SDL_IsTextInputShown()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_IsTextInputShown() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_IsTextInputShown()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: int SDL_JoystickAttachVirtual(SDL_JoystickType type, int naxes, int nbuttons, int nhats)
    function llvm_SDL_JoystickAttachVirtual(type::Int32, naxes::Int32, nbuttons::Int32, nhats::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickAttachVirtual(i32, i32, i32, i32) nounwind

        define i32 @main(i32 %type, i32 %naxes, i32 %nbuttons, i32 %nhats) {
        entry:
            %result = call i32 @SDL_JoystickAttachVirtual(i32 %type, i32 %naxes, i32 %nbuttons, i32 %nhats)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, Int32, Int32}, type, naxes, nbuttons, nhats)
    end

    # Original C signature: int SDL_JoystickAttachVirtualEx(const SDL_VirtualJoystickDesc * desc)
    function llvm_SDL_JoystickAttachVirtualEx(desc::Ptr{SDL_VirtualJoystickDesc})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickAttachVirtualEx(i8*) nounwind

        define i32 @main(i8* %desc) {
        entry:
            %result = call i32 @SDL_JoystickAttachVirtualEx(i8* %desc)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_VirtualJoystickDesc}}, desc)
    end

    # Original C signature: void SDL_JoystickClose(SDL_Joystick * joystick)
    function llvm_SDL_JoystickClose(joystick::Ptr{SDL_Joystick})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_JoystickClose(i8*) nounwind

        define void @main(i8* %joystick) {
        entry:
            call void @SDL_JoystickClose(i8* %joystick)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_JoystickPowerLevel SDL_JoystickCurrentPowerLevel(SDL_Joystick * joystick)
    function llvm_SDL_JoystickCurrentPowerLevel(joystick::Ptr{SDL_Joystick})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickCurrentPowerLevel(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickCurrentPowerLevel(i8* %joystick)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: int SDL_JoystickDetachVirtual(int device_index)
    function llvm_SDL_JoystickDetachVirtual(device_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickDetachVirtual(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_JoystickDetachVirtual(i32 %device_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, device_index)
    end

    # Original C signature: SDL_bool SDL_JoystickGetAttached(SDL_Joystick * joystick)
    function llvm_SDL_JoystickGetAttached(joystick::Ptr{SDL_Joystick})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickGetAttached(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickGetAttached(i8* %joystick)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_bool SDL_JoystickGetAxisInitialState(SDL_Joystick * joystick, int axis, Sint16 * state)
    function llvm_SDL_JoystickGetAxisInitialState(joystick::Ptr{SDL_Joystick}, axis::Int32, state::Ptr{Int16})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickGetAxisInitialState(i8*, i32, i8*) nounwind

        define i32 @main(i8* %joystick, i32 %axis, i8* %state) {
        entry:
            %result = call i32 @SDL_JoystickGetAxisInitialState(i8* %joystick, i32 %axis, i8* %state)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Joystick}, Int32, Ptr{Int16}}, joystick, axis, state)
    end

    # Original C signature: int SDL_JoystickGetDevicePlayerIndex(int device_index)
    function llvm_SDL_JoystickGetDevicePlayerIndex(device_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickGetDevicePlayerIndex(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_JoystickGetDevicePlayerIndex(i32 %device_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, device_index)
    end

    # Original C signature: Uint16 SDL_JoystickGetFirmwareVersion(SDL_Joystick * joystick)
    function llvm_SDL_JoystickGetFirmwareVersion(joystick::Ptr{SDL_Joystick})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_JoystickGetFirmwareVersion(i8*) nounwind

        define i16 @main(i8* %joystick) {
        entry:
            %result = call i16 @SDL_JoystickGetFirmwareVersion(i8* %joystick)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: int SDL_JoystickGetPlayerIndex(SDL_Joystick * joystick)
    function llvm_SDL_JoystickGetPlayerIndex(joystick::Ptr{SDL_Joystick})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickGetPlayerIndex(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickGetPlayerIndex(i8* %joystick)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: const char * SDL_JoystickGetSerial(SDL_Joystick * joystick)
    function llvm_SDL_JoystickGetSerial(joystick::Ptr{SDL_Joystick})::Ptr{UInt8}
        Base.llvmcall(("""
        declare i8* @SDL_JoystickGetSerial(i8*) nounwind

        define i8* @main(i8* %joystick) {
        entry:
            %result = call i8* @SDL_JoystickGetSerial(i8* %joystick)
            ret i8* %result
        }
        """, "main"), Ptr{UInt8}, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_bool SDL_JoystickHasLED(SDL_Joystick * joystick)
    function llvm_SDL_JoystickHasLED(joystick::Ptr{SDL_Joystick})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickHasLED(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickHasLED(i8* %joystick)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_bool SDL_JoystickHasRumble(SDL_Joystick * joystick)
    function llvm_SDL_JoystickHasRumble(joystick::Ptr{SDL_Joystick})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickHasRumble(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickHasRumble(i8* %joystick)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_bool SDL_JoystickHasRumbleTriggers(SDL_Joystick * joystick)
    function llvm_SDL_JoystickHasRumbleTriggers(joystick::Ptr{SDL_Joystick})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickHasRumbleTriggers(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickHasRumbleTriggers(i8* %joystick)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: int SDL_JoystickIsHaptic(SDL_Joystick * joystick)
    function llvm_SDL_JoystickIsHaptic(joystick::Ptr{SDL_Joystick})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickIsHaptic(i8*) nounwind

        define i32 @main(i8* %joystick) {
        entry:
            %result = call i32 @SDL_JoystickIsHaptic(i8* %joystick)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}}, joystick)
    end

    # Original C signature: SDL_bool SDL_JoystickIsVirtual(int device_index)
    function llvm_SDL_JoystickIsVirtual(device_index::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickIsVirtual(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_JoystickIsVirtual(i32 %device_index)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32}, device_index)
    end

    # Original C signature: int SDL_JoystickRumble(SDL_Joystick * joystick, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
    function llvm_SDL_JoystickRumble(joystick::Ptr{SDL_Joystick}, low_frequency_rumble::UInt16, high_frequency_rumble::UInt16, duration_ms::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickRumble(i8*, i16, i16, i32) nounwind

        define i32 @main(i8* %joystick, i16 %low_frequency_rumble, i16 %high_frequency_rumble, i32 %duration_ms) {
        entry:
            %result = call i32 @SDL_JoystickRumble(i8* %joystick, i16 %low_frequency_rumble, i16 %high_frequency_rumble, i32 %duration_ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, UInt16, UInt16, UInt32}, joystick, low_frequency_rumble, high_frequency_rumble, duration_ms)
    end

    # Original C signature: int SDL_JoystickRumbleTriggers(SDL_Joystick * joystick, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
    function llvm_SDL_JoystickRumbleTriggers(joystick::Ptr{SDL_Joystick}, left_rumble::UInt16, right_rumble::UInt16, duration_ms::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickRumbleTriggers(i8*, i16, i16, i32) nounwind

        define i32 @main(i8* %joystick, i16 %left_rumble, i16 %right_rumble, i32 %duration_ms) {
        entry:
            %result = call i32 @SDL_JoystickRumbleTriggers(i8* %joystick, i16 %left_rumble, i16 %right_rumble, i32 %duration_ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, UInt16, UInt16, UInt32}, joystick, left_rumble, right_rumble, duration_ms)
    end

    # Original C signature: int SDL_JoystickSendEffect(SDL_Joystick * joystick, const void * data, int size)
    function llvm_SDL_JoystickSendEffect(joystick::Ptr{SDL_Joystick}, data::Ptr{Cvoid}, size::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickSendEffect(i8*, i8*, i32) nounwind

        define i32 @main(i8* %joystick, i8* %data, i32 %size) {
        entry:
            %result = call i32 @SDL_JoystickSendEffect(i8* %joystick, i8* %data, i32 %size)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, Ptr{Cvoid}, Int32}, joystick, data, size)
    end

    # Original C signature: int SDL_JoystickSetLED(SDL_Joystick * joystick, Uint8 red, Uint8 green, Uint8 blue)
    function llvm_SDL_JoystickSetLED(joystick::Ptr{SDL_Joystick}, red::UInt8, green::UInt8, blue::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickSetLED(i8*, i8, i8, i8) nounwind

        define i32 @main(i8* %joystick, i8 %red, i8 %green, i8 %blue) {
        entry:
            %result = call i32 @SDL_JoystickSetLED(i8* %joystick, i8 %red, i8 %green, i8 %blue)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, UInt8, UInt8, UInt8}, joystick, red, green, blue)
    end

    # Original C signature: void SDL_JoystickSetPlayerIndex(SDL_Joystick * joystick, int player_index)
    function llvm_SDL_JoystickSetPlayerIndex(joystick::Ptr{SDL_Joystick}, player_index::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_JoystickSetPlayerIndex(i8*, i32) nounwind

        define void @main(i8* %joystick, i32 %player_index) {
        entry:
            call void @SDL_JoystickSetPlayerIndex(i8* %joystick, i32 %player_index)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Joystick}, Int32}, joystick, player_index)
    end

    # Original C signature: int SDL_JoystickSetVirtualAxis(SDL_Joystick * joystick, int axis, Sint16 value)
    function llvm_SDL_JoystickSetVirtualAxis(joystick::Ptr{SDL_Joystick}, axis::Int32, value::Int16)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickSetVirtualAxis(i8*, i32, i16) nounwind

        define i32 @main(i8* %joystick, i32 %axis, i16 %value) {
        entry:
            %result = call i32 @SDL_JoystickSetVirtualAxis(i8* %joystick, i32 %axis, i16 %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, Int32, Int16}, joystick, axis, value)
    end

    # Original C signature: int SDL_JoystickSetVirtualButton(SDL_Joystick * joystick, int button, Uint8 value)
    function llvm_SDL_JoystickSetVirtualButton(joystick::Ptr{SDL_Joystick}, button::Int32, value::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickSetVirtualButton(i8*, i32, i8) nounwind

        define i32 @main(i8* %joystick, i32 %button, i8 %value) {
        entry:
            %result = call i32 @SDL_JoystickSetVirtualButton(i8* %joystick, i32 %button, i8 %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, Int32, UInt8}, joystick, button, value)
    end

    # Original C signature: int SDL_JoystickSetVirtualHat(SDL_Joystick * joystick, int hat, Uint8 value)
    function llvm_SDL_JoystickSetVirtualHat(joystick::Ptr{SDL_Joystick}, hat::Int32, value::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_JoystickSetVirtualHat(i8*, i32, i8) nounwind

        define i32 @main(i8* %joystick, i32 %hat, i8 %value) {
        entry:
            %result = call i32 @SDL_JoystickSetVirtualHat(i8* %joystick, i32 %hat, i8 %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Joystick}, Int32, UInt8}, joystick, hat, value)
    end

    # Original C signature: int SDL_LinuxSetThreadPriority(Sint64 threadID, int priority)
    function llvm_SDL_LinuxSetThreadPriority(threadID::Int64, priority::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LinuxSetThreadPriority(i64, i32) nounwind

        define i32 @main(i64 %threadID, i32 %priority) {
        entry:
            %result = call i32 @SDL_LinuxSetThreadPriority(i64 %threadID, i32 %priority)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64, Int32}, threadID, priority)
    end

    # Original C signature: int SDL_LinuxSetThreadPriorityAndPolicy(Sint64 threadID, int sdlPriority, int schedPolicy)
    function llvm_SDL_LinuxSetThreadPriorityAndPolicy(threadID::Int64, sdlPriority::Int32, schedPolicy::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LinuxSetThreadPriorityAndPolicy(i64, i32, i32) nounwind

        define i32 @main(i64 %threadID, i32 %sdlPriority, i32 %schedPolicy) {
        entry:
            %result = call i32 @SDL_LinuxSetThreadPriorityAndPolicy(i64 %threadID, i32 %sdlPriority, i32 %schedPolicy)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64, Int32, Int32}, threadID, sdlPriority, schedPolicy)
    end

    # Original C signature: int SDL_LoadDollarTemplates(SDL_TouchID touchId, SDL_RWops * src)
    function llvm_SDL_LoadDollarTemplates(touchId::Int64, src::Ptr{SDL_RWops})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LoadDollarTemplates(i64, i8*) nounwind

        define i32 @main(i64 %touchId, i8* %src) {
        entry:
            %result = call i32 @SDL_LoadDollarTemplates(i64 %touchId, i8* %src)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64, Ptr{SDL_RWops}}, touchId, src)
    end

    # Original C signature: void SDL_LockAudio()
    function llvm_SDL_LockAudio()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LockAudio() nounwind

        define void @main() {
        entry:
            call void @SDL_LockAudio()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_LockAudioDevice(SDL_AudioDeviceID dev)
    function llvm_SDL_LockAudioDevice(dev::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LockAudioDevice(i32) nounwind

        define void @main(i32 %dev) {
        entry:
            call void @SDL_LockAudioDevice(i32 %dev)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, dev)
    end

    # Original C signature: void SDL_LockSensors()
    function llvm_SDL_LockSensors()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LockSensors() nounwind

        define void @main() {
        entry:
            call void @SDL_LockSensors()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_LockSurface(SDL_Surface * surface)
    function llvm_SDL_LockSurface(surface::Ptr{SDL_Surface})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LockSurface(i8*) nounwind

        define i32 @main(i8* %surface) {
        entry:
            %result = call i32 @SDL_LockSurface(i8* %surface)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: int SDL_LockTexture(SDL_Texture * texture, const SDL_Rect * rect, void ** pixels, int * pitch)
    function llvm_SDL_LockTexture(texture::Ptr{SDL_Texture}, rect::Ptr{SDL_Rect}, pixels::Ptr{Ptr{Cvoid}}, pitch::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LockTexture(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %rect, i8* %pixels, i8* %pitch) {
        entry:
            %result = call i32 @SDL_LockTexture(i8* %texture, i8* %rect, i8* %pixels, i8* %pitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{Ptr{Cvoid}}, Ptr{Int32}}, texture, rect, pixels, pitch)
    end

    # Original C signature: int SDL_LockTextureToSurface(SDL_Texture * texture, const SDL_Rect * rect, SDL_Surface ** surface)
    function llvm_SDL_LockTextureToSurface(texture::Ptr{SDL_Texture}, rect::Ptr{SDL_Rect}, surface::Ptr{Ptr{SDL_Surface}})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LockTextureToSurface(i8*, i8*, i8**) nounwind

        define i32 @main(i8* %texture, i8* %rect, i8** %surface) {
        entry:
            %result = call i32 @SDL_LockTextureToSurface(i8* %texture, i8* %rect, i8** %surface)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{Ptr{SDL_Surface}}}, texture, rect, surface)
    end

    # Original C signature: void SDL_LogGetOutputFunction(SDL_LogOutputFunction * callback, void ** userdata)
    function llvm_SDL_LogGetOutputFunction(callback::Ptr{Cvoid}, userdata::Ptr{Ptr{Cvoid}})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LogGetOutputFunction(i8*, i8*) nounwind

        define void @main(i8* %callback, i8* %userdata) {
        entry:
            call void @SDL_LogGetOutputFunction(i8* %callback, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Cvoid}, Ptr{Ptr{Cvoid}}}, callback, userdata)
    end

    # Original C signature: SDL_LogPriority SDL_LogGetPriority(int category)
    function llvm_SDL_LogGetPriority(category::Int32)::SDL_LogPriority
        Base.llvmcall(("""
        declare i8* @SDL_LogGetPriority(i32) nounwind

        define i8* @main(i32 %category) {
        entry:
            %result = call i8* @SDL_LogGetPriority(i32 %category)
            ret i8* %result
        }
        """, "main"), SDL_LogPriority, Tuple{Int32}, category)
    end

    # Original C signature: void SDL_LogResetPriorities()
    function llvm_SDL_LogResetPriorities()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LogResetPriorities() nounwind

        define void @main() {
        entry:
            call void @SDL_LogResetPriorities()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_LogSetAllPriority(SDL_LogPriority priority)
    function llvm_SDL_LogSetAllPriority(priority::SDL_LogPriority)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LogSetAllPriority(i8*) nounwind

        define void @main(i8* %priority) {
        entry:
            call void @SDL_LogSetAllPriority(i8* %priority)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_LogPriority}, priority)
    end

    # Original C signature: void SDL_LogSetOutputFunction(SDL_LogOutputFunction callback, void * userdata)
    function llvm_SDL_LogSetOutputFunction(callback::Cvoid, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LogSetOutputFunction(void, i8*) nounwind

        define void @main(void %callback, i8* %userdata) {
        entry:
            call void @SDL_LogSetOutputFunction(void %callback, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Cvoid, Ptr{Cvoid}}, callback, userdata)
    end

    # Original C signature: void SDL_LogSetPriority(int category, SDL_LogPriority priority)
    function llvm_SDL_LogSetPriority(category::Int32, priority::SDL_LogPriority)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_LogSetPriority(i32, i8*) nounwind

        define void @main(i32 %category, i8* %priority) {
        entry:
            call void @SDL_LogSetPriority(i32 %category, i8* %priority)
            ret void
        }
        """, "main"), Cvoid, Tuple{Int32, SDL_LogPriority}, category, priority)
    end

    # Original C signature: int SDL_LowerBlitScaled(SDL_Surface * src, SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)
    function llvm_SDL_LowerBlitScaled(src::Ptr{SDL_Surface}, srcrect::Ptr{SDL_Rect}, dst::Ptr{SDL_Surface}, dstrect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_LowerBlitScaled(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_LowerBlitScaled(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}, Ptr{SDL_Surface}, Ptr{SDL_Rect}}, src, srcrect, dst, dstrect)
    end

    # Original C signature: Uint32 SDL_MasksToPixelFormatEnum(int bpp, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
    function llvm_SDL_MasksToPixelFormatEnum(bpp::Int32, Rmask::UInt32, Gmask::UInt32, Bmask::UInt32, Amask::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_MasksToPixelFormatEnum(i32, i32, i32, i32, i32) nounwind

        define i32 @main(i32 %bpp, i32 %Rmask, i32 %Gmask, i32 %Bmask, i32 %Amask) {
        entry:
            %result = call i32 @SDL_MasksToPixelFormatEnum(i32 %bpp, i32 %Rmask, i32 %Gmask, i32 %Bmask, i32 %Amask)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32, UInt32, UInt32, UInt32, UInt32}, bpp, Rmask, Gmask, Bmask, Amask)
    end

    # Original C signature: void SDL_MaximizeWindow(SDL_Window * window)
    function llvm_SDL_MaximizeWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MaximizeWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_MaximizeWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_MemoryBarrierAcquireFunction()
    function llvm_SDL_MemoryBarrierAcquireFunction()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MemoryBarrierAcquireFunction() nounwind

        define void @main() {
        entry:
            call void @SDL_MemoryBarrierAcquireFunction()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_MemoryBarrierReleaseFunction()
    function llvm_SDL_MemoryBarrierReleaseFunction()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MemoryBarrierReleaseFunction() nounwind

        define void @main() {
        entry:
            call void @SDL_MemoryBarrierReleaseFunction()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: SDL_MetalView SDL_Metal_CreateView(SDL_Window * window)
    function llvm_SDL_Metal_CreateView(window::Ptr{SDL_Window})::SDL_MetalView
        Base.llvmcall(("""
        declare i8* @SDL_Metal_CreateView(i8*) nounwind

        define i8* @main(i8* %window) {
        entry:
            %result = call i8* @SDL_Metal_CreateView(i8* %window)
            ret i8* %result
        }
        """, "main"), SDL_MetalView, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_Metal_DestroyView(SDL_MetalView view)
    function llvm_SDL_Metal_DestroyView(view::SDL_MetalView)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Metal_DestroyView(i8*) nounwind

        define void @main(i8* %view) {
        entry:
            call void @SDL_Metal_DestroyView(i8* %view)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_MetalView}, view)
    end

    # Original C signature: void SDL_Metal_GetDrawableSize(SDL_Window* window, int * w, int * h)
    function llvm_SDL_Metal_GetDrawableSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Metal_GetDrawableSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_Metal_GetDrawableSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: void SDL_MinimizeWindow(SDL_Window * window)
    function llvm_SDL_MinimizeWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MinimizeWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_MinimizeWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_MixAudio(Uint8 * dst, const Uint8 * src, Uint32 len, int volume)
    function llvm_SDL_MixAudio(dst::Ptr{UInt8}, src::Ptr{UInt8}, len::UInt32, volume::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MixAudio(i8*, i8*, i32, i32) nounwind

        define void @main(i8* %dst, i8* %src, i32 %len, i32 %volume) {
        entry:
            call void @SDL_MixAudio(i8* %dst, i8* %src, i32 %len, i32 %volume)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{UInt8}, Ptr{UInt8}, UInt32, Int32}, dst, src, len, volume)
    end

    # Original C signature: void SDL_MixAudioFormat(Uint8 * dst, const Uint8 * src, SDL_AudioFormat format, Uint32 len, int volume)
    function llvm_SDL_MixAudioFormat(dst::Ptr{UInt8}, src::Ptr{UInt8}, format::UInt16, len::UInt32, volume::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_MixAudioFormat(i8*, i8*, i16, i32, i32) nounwind

        define void @main(i8* %dst, i8* %src, i16 %format, i32 %len, i32 %volume) {
        entry:
            call void @SDL_MixAudioFormat(i8* %dst, i8* %src, i16 %format, i32 %len, i32 %volume)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{UInt8}, Ptr{UInt8}, UInt16, UInt32, Int32}, dst, src, format, len, volume)
    end

    # Original C signature: int SDL_MouseIsHaptic()
    function llvm_SDL_MouseIsHaptic()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_MouseIsHaptic() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_MouseIsHaptic()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: SDL_AudioStream * SDL_NewAudioStream(const SDL_AudioFormat src_format, const Uint8 src_channels, const int src_rate, const SDL_AudioFormat dst_format, const Uint8 dst_channels, const int dst_rate)
    function llvm_SDL_NewAudioStream(src_format::UInt16, src_channels::UInt8, src_rate::Int32, dst_format::UInt16, dst_channels::UInt8, dst_rate::Int32)::Ptr{SDL_AudioStream}
        Base.llvmcall(("""
        declare i8* @SDL_NewAudioStream(i16, i8, i32, i16, i8, i32) nounwind

        define i8* @main(i16 %src_format, i8 %src_channels, i32 %src_rate, i16 %dst_format, i8 %dst_channels, i32 %dst_rate) {
        entry:
            %result = call i8* @SDL_NewAudioStream(i16 %src_format, i8 %src_channels, i32 %src_rate, i16 %dst_format, i8 %dst_channels, i32 %dst_rate)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_AudioStream}, Tuple{UInt16, UInt8, Int32, UInt16, UInt8, Int32}, src_format, src_channels, src_rate, dst_format, dst_channels, dst_rate)
    end

    # Original C signature: int SDL_NumHaptics()
    function llvm_SDL_NumHaptics()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_NumHaptics() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_NumHaptics()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_NumJoysticks()
    function llvm_SDL_NumJoysticks()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_NumJoysticks() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_NumJoysticks()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_NumSensors()
    function llvm_SDL_NumSensors()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_NumSensors() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_NumSensors()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationDidBecomeActive()
    function llvm_SDL_OnApplicationDidBecomeActive()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationDidBecomeActive() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationDidBecomeActive()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationDidChangeStatusBarOrientation()
    function llvm_SDL_OnApplicationDidChangeStatusBarOrientation()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationDidChangeStatusBarOrientation() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationDidChangeStatusBarOrientation()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationDidEnterBackground()
    function llvm_SDL_OnApplicationDidEnterBackground()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationDidEnterBackground() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationDidEnterBackground()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationDidReceiveMemoryWarning()
    function llvm_SDL_OnApplicationDidReceiveMemoryWarning()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationDidReceiveMemoryWarning() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationDidReceiveMemoryWarning()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationWillEnterForeground()
    function llvm_SDL_OnApplicationWillEnterForeground()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationWillEnterForeground() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationWillEnterForeground()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationWillResignActive()
    function llvm_SDL_OnApplicationWillResignActive()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationWillResignActive() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationWillResignActive()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_OnApplicationWillTerminate()
    function llvm_SDL_OnApplicationWillTerminate()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_OnApplicationWillTerminate() nounwind

        define void @main() {
        entry:
            call void @SDL_OnApplicationWillTerminate()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_OpenAudio(SDL_AudioSpec * desired, SDL_AudioSpec * obtained)
    function llvm_SDL_OpenAudio(desired::Ptr{SDL_AudioSpec}, obtained::Ptr{SDL_AudioSpec})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_OpenAudio(i8*, i8*) nounwind

        define i32 @main(i8* %desired, i8* %obtained) {
        entry:
            %result = call i32 @SDL_OpenAudio(i8* %desired, i8* %obtained)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_AudioSpec}, Ptr{SDL_AudioSpec}}, desired, obtained)
    end

    # Original C signature: SDL_AudioDeviceID SDL_OpenAudioDevice(const char * device, int iscapture, const SDL_AudioSpec * desired, SDL_AudioSpec * obtained, int allowed_changes)
    function llvm_SDL_OpenAudioDevice(device::Ptr{UInt8}, iscapture::Int32, desired::Ptr{SDL_AudioSpec}, obtained::Ptr{SDL_AudioSpec}, allowed_changes::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_OpenAudioDevice(i8*, i32, i8*, i8*, i32) nounwind

        define i32 @main(i8* %device, i32 %iscapture, i8* %desired, i8* %obtained, i32 %allowed_changes) {
        entry:
            %result = call i32 @SDL_OpenAudioDevice(i8* %device, i32 %iscapture, i8* %desired, i8* %obtained, i32 %allowed_changes)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}, Int32, Ptr{SDL_AudioSpec}, Ptr{SDL_AudioSpec}, Int32}, device, iscapture, desired, obtained, allowed_changes)
    end

    # Original C signature: int SDL_OpenURL(const char * url)
    function llvm_SDL_OpenURL(url::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_OpenURL(i8*) nounwind

        define i32 @main(i8* %url) {
        entry:
            %result = call i32 @SDL_OpenURL(i8* %url)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, url)
    end

    # Original C signature: void SDL_PauseAudio(int pause_on)
    function llvm_SDL_PauseAudio(pause_on::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_PauseAudio(i32) nounwind

        define void @main(i32 %pause_on) {
        entry:
            call void @SDL_PauseAudio(i32 %pause_on)
            ret void
        }
        """, "main"), Cvoid, Tuple{Int32}, pause_on)
    end

    # Original C signature: void SDL_PauseAudioDevice(SDL_AudioDeviceID dev, int pause_on)
    function llvm_SDL_PauseAudioDevice(dev::UInt32, pause_on::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_PauseAudioDevice(i32, i32) nounwind

        define void @main(i32 %dev, i32 %pause_on) {
        entry:
            call void @SDL_PauseAudioDevice(i32 %dev, i32 %pause_on)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32, Int32}, dev, pause_on)
    end

    # Original C signature: int SDL_PeepEvents(SDL_Event * events, int numevents, SDL_eventaction action, Uint32 minType, Uint32 maxType)
    function llvm_SDL_PeepEvents(events::Ptr{SDL_Event}, numevents::Int32, action::SDL_eventaction, minType::UInt32, maxType::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_PeepEvents(i8*, i32, i8*, i32, i32) nounwind

        define i32 @main(i8* %events, i32 %numevents, i8* %action, i32 %minType, i32 %maxType) {
        entry:
            %result = call i32 @SDL_PeepEvents(i8* %events, i32 %numevents, i8* %action, i32 %minType, i32 %maxType)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}, Int32, SDL_eventaction, UInt32, UInt32}, events, numevents, action, minType, maxType)
    end

    # Original C signature: SDL_bool SDL_PixelFormatEnumToMasks(Uint32 format, int * bpp, Uint32 * Rmask, Uint32 * Gmask, Uint32 * Bmask, Uint32 * Amask)
    function llvm_SDL_PixelFormatEnumToMasks(format::UInt32, bpp::Ptr{Int32}, Rmask::Ptr{UInt32}, Gmask::Ptr{UInt32}, Bmask::Ptr{UInt32}, Amask::Ptr{UInt32})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_PixelFormatEnumToMasks(i32, i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i32 %format, i8* %bpp, i8* %Rmask, i8* %Gmask, i8* %Bmask, i8* %Amask) {
        entry:
            %result = call i32 @SDL_PixelFormatEnumToMasks(i32 %format, i8* %bpp, i8* %Rmask, i8* %Gmask, i8* %Bmask, i8* %Amask)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32, Ptr{Int32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}}, format, bpp, Rmask, Gmask, Bmask, Amask)
    end

    # Original C signature: int SDL_PollEvent(SDL_Event * event)
    function llvm_SDL_PollEvent(event::Ptr{SDL_Event})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_PollEvent(i8*) nounwind

        define i32 @main(i8* %event) {
        entry:
            %result = call i32 @SDL_PollEvent(i8* %event)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}}, event)
    end

    # Original C signature: int SDL_PremultiplyAlpha(int width, int height, Uint32 src_format, const void * src, int src_pitch, Uint32 dst_format, void * dst, int dst_pitch)
    function llvm_SDL_PremultiplyAlpha(width::Int32, height::Int32, src_format::UInt32, src::Ptr{Cvoid}, src_pitch::Int32, dst_format::UInt32, dst::Ptr{Cvoid}, dst_pitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_PremultiplyAlpha(i32, i32, i32, i8*, i32, i32, i8*, i32) nounwind

        define i32 @main(i32 %width, i32 %height, i32 %src_format, i8* %src, i32 %src_pitch, i32 %dst_format, i8* %dst, i32 %dst_pitch) {
        entry:
            %result = call i32 @SDL_PremultiplyAlpha(i32 %width, i32 %height, i32 %src_format, i8* %src, i32 %src_pitch, i32 %dst_format, i8* %dst, i32 %dst_pitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, UInt32, Ptr{Cvoid}, Int32, UInt32, Ptr{Cvoid}, Int32}, width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch)
    end

    # Original C signature: void SDL_PumpEvents()
    function llvm_SDL_PumpEvents()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_PumpEvents() nounwind

        define void @main() {
        entry:
            call void @SDL_PumpEvents()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_PushEvent(SDL_Event * event)
    function llvm_SDL_PushEvent(event::Ptr{SDL_Event})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_PushEvent(i8*) nounwind

        define i32 @main(i8* %event) {
        entry:
            %result = call i32 @SDL_PushEvent(i8* %event)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}}, event)
    end

    # Original C signature: int SDL_QueryTexture(SDL_Texture * texture, Uint32 * format, int * access, int * w, int * h)
    function llvm_SDL_QueryTexture(texture::Ptr{SDL_Texture}, format::Ptr{UInt32}, access::Ptr{Int32}, w::Ptr{Int32}, h::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_QueryTexture(i8*, i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %format, i8* %access, i8* %w, i8* %h) {
        entry:
            %result = call i32 @SDL_QueryTexture(i8* %texture, i8* %format, i8* %access, i8* %w, i8* %h)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{UInt32}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}}, texture, format, access, w, h)
    end

    # Original C signature: int SDL_QueueAudio(SDL_AudioDeviceID dev, const void * data, Uint32 len)
    function llvm_SDL_QueueAudio(dev::UInt32, data::Ptr{Cvoid}, len::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_QueueAudio(i32, i8*, i32) nounwind

        define i32 @main(i32 %dev, i8* %data, i32 %len) {
        entry:
            %result = call i32 @SDL_QueueAudio(i32 %dev, i8* %data, i32 %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Ptr{Cvoid}, UInt32}, dev, data, len)
    end

    # Original C signature: void SDL_Quit()
    function llvm_SDL_Quit()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Quit() nounwind

        define void @main() {
        entry:
            call void @SDL_Quit()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_QuitSubSystem(Uint32 flags)
    function llvm_SDL_QuitSubSystem(flags::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_QuitSubSystem(i32) nounwind

        define void @main(i32 %flags) {
        entry:
            call void @SDL_QuitSubSystem(i32 %flags)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, flags)
    end

    # Original C signature: int SDL_RWclose(SDL_RWops * context)
    function llvm_SDL_RWclose(context::Ptr{SDL_RWops})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RWclose(i8*) nounwind

        define i32 @main(i8* %context) {
        entry:
            %result = call i32 @SDL_RWclose(i8* %context)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_RWops}}, context)
    end

    # Original C signature: size_t SDL_RWread(SDL_RWops * context, void * ptr, size_t size, size_t maxnum)
    function llvm_SDL_RWread(context::Ptr{SDL_RWops}, ptr::Ptr{Cvoid}, size::Csize_t, maxnum::Csize_t)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_RWread(i8*, i8*, i8*, i8*) nounwind

        define i8* @main(i8* %context, i8* %ptr, i8* %size, i8* %maxnum) {
        entry:
            %result = call i8* @SDL_RWread(i8* %context, i8* %ptr, i8* %size, i8* %maxnum)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, Ptr{Cvoid}, Csize_t, Csize_t}, context, ptr, size, maxnum)
    end

    # Original C signature: Sint64 SDL_RWseek(SDL_RWops * context, Sint64 offset, int whence)
    function llvm_SDL_RWseek(context::Ptr{SDL_RWops}, offset::Int64, whence::Int32)::Int64
        Base.llvmcall(("""
        declare i64 @SDL_RWseek(i8*, i64, i32) nounwind

        define i64 @main(i8* %context, i64 %offset, i32 %whence) {
        entry:
            %result = call i64 @SDL_RWseek(i8* %context, i64 %offset, i32 %whence)
            ret i64 %result
        }
        """, "main"), Int64, Tuple{Ptr{SDL_RWops}, Int64, Int32}, context, offset, whence)
    end

    # Original C signature: Sint64 SDL_RWsize(SDL_RWops * context)
    function llvm_SDL_RWsize(context::Ptr{SDL_RWops})::Int64
        Base.llvmcall(("""
        declare i64 @SDL_RWsize(i8*) nounwind

        define i64 @main(i8* %context) {
        entry:
            %result = call i64 @SDL_RWsize(i8* %context)
            ret i64 %result
        }
        """, "main"), Int64, Tuple{Ptr{SDL_RWops}}, context)
    end

    # Original C signature: Sint64 SDL_RWtell(SDL_RWops * context)
    function llvm_SDL_RWtell(context::Ptr{SDL_RWops})::Int64
        Base.llvmcall(("""
        declare i64 @SDL_RWtell(i8*) nounwind

        define i64 @main(i8* %context) {
        entry:
            %result = call i64 @SDL_RWtell(i8* %context)
            ret i64 %result
        }
        """, "main"), Int64, Tuple{Ptr{SDL_RWops}}, context)
    end

    # Original C signature: size_t SDL_RWwrite(SDL_RWops * context, const void * ptr, size_t size, size_t num)
    function llvm_SDL_RWwrite(context::Ptr{SDL_RWops}, ptr::Ptr{Cvoid}, size::Csize_t, num::Csize_t)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_RWwrite(i8*, i8*, i8*, i8*) nounwind

        define i8* @main(i8* %context, i8* %ptr, i8* %size, i8* %num) {
        entry:
            %result = call i8* @SDL_RWwrite(i8* %context, i8* %ptr, i8* %size, i8* %num)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, Ptr{Cvoid}, Csize_t, Csize_t}, context, ptr, size, num)
    end

    # Original C signature: void SDL_RaiseWindow(SDL_Window * window)
    function llvm_SDL_RaiseWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RaiseWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_RaiseWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: Uint16 SDL_ReadBE16(SDL_RWops * src)
    function llvm_SDL_ReadBE16(src::Ptr{SDL_RWops})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_ReadBE16(i8*) nounwind

        define i16 @main(i8* %src) {
        entry:
            %result = call i16 @SDL_ReadBE16(i8* %src)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint32 SDL_ReadBE32(SDL_RWops * src)
    function llvm_SDL_ReadBE32(src::Ptr{SDL_RWops})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_ReadBE32(i8*) nounwind

        define i32 @main(i8* %src) {
        entry:
            %result = call i32 @SDL_ReadBE32(i8* %src)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint64 SDL_ReadBE64(SDL_RWops * src)
    function llvm_SDL_ReadBE64(src::Ptr{SDL_RWops})::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_ReadBE64(i8*) nounwind

        define i64 @main(i8* %src) {
        entry:
            %result = call i64 @SDL_ReadBE64(i8* %src)
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint16 SDL_ReadLE16(SDL_RWops * src)
    function llvm_SDL_ReadLE16(src::Ptr{SDL_RWops})::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_ReadLE16(i8*) nounwind

        define i16 @main(i8* %src) {
        entry:
            %result = call i16 @SDL_ReadLE16(i8* %src)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint32 SDL_ReadLE32(SDL_RWops * src)
    function llvm_SDL_ReadLE32(src::Ptr{SDL_RWops})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_ReadLE32(i8*) nounwind

        define i32 @main(i8* %src) {
        entry:
            %result = call i32 @SDL_ReadLE32(i8* %src)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint64 SDL_ReadLE64(SDL_RWops * src)
    function llvm_SDL_ReadLE64(src::Ptr{SDL_RWops})::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_ReadLE64(i8*) nounwind

        define i64 @main(i8* %src) {
        entry:
            %result = call i64 @SDL_ReadLE64(i8* %src)
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: Uint8 SDL_ReadU8(SDL_RWops * src)
    function llvm_SDL_ReadU8(src::Ptr{SDL_RWops})::UInt8
        Base.llvmcall(("""
        declare i8 @SDL_ReadU8(i8*) nounwind

        define i8 @main(i8* %src) {
        entry:
            %result = call i8 @SDL_ReadU8(i8* %src)
            ret i8 %result
        }
        """, "main"), UInt8, Tuple{Ptr{SDL_RWops}}, src)
    end

    # Original C signature: int SDL_RecordGesture(SDL_TouchID touchId)
    function llvm_SDL_RecordGesture(touchId::Int64)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RecordGesture(i64) nounwind

        define i32 @main(i64 %touchId) {
        entry:
            %result = call i32 @SDL_RecordGesture(i64 %touchId)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64}, touchId)
    end

    # Original C signature: int SDL_RegisterApp(const char * name, Uint32 style, void * hInst)
    function llvm_SDL_RegisterApp(name::Ptr{UInt8}, style::UInt32, hInst::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RegisterApp(i8*, i32, i8*) nounwind

        define i32 @main(i8* %name, i32 %style, i8* %hInst) {
        entry:
            %result = call i32 @SDL_RegisterApp(i8* %name, i32 %style, i8* %hInst)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, UInt32, Ptr{Cvoid}}, name, style, hInst)
    end

    # Original C signature: Uint32 SDL_RegisterEvents(int numevents)
    function llvm_SDL_RegisterEvents(numevents::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_RegisterEvents(i32) nounwind

        define i32 @main(i32 %numevents) {
        entry:
            %result = call i32 @SDL_RegisterEvents(i32 %numevents)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32}, numevents)
    end

    # Original C signature: SDL_bool SDL_RemoveTimer(SDL_TimerID id)
    function llvm_SDL_RemoveTimer(id::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_RemoveTimer(i32) nounwind

        define i32 @main(i32 %id) {
        entry:
            %result = call i32 @SDL_RemoveTimer(i32 %id)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32}, id)
    end

    # Original C signature: int SDL_RenderClear(SDL_Renderer * renderer)
    function llvm_SDL_RenderClear(renderer::Ptr{SDL_Renderer})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderClear(i8*) nounwind

        define i32 @main(i8* %renderer) {
        entry:
            %result = call i32 @SDL_RenderClear(i8* %renderer)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: int SDL_RenderCopy(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_Rect * dstrect)
    function llvm_SDL_RenderCopy(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, srcrect::Ptr{SDL_Rect}, dstrect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderCopy(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_RenderCopy(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{SDL_Rect}}, renderer, texture, srcrect, dstrect)
    end

    # Original C signature: int SDL_RenderCopyEx(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_Rect * dstrect, const double angle, const SDL_Point * center, const SDL_RendererFlip flip)
    function llvm_SDL_RenderCopyEx(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, srcrect::Ptr{SDL_Rect}, dstrect::Ptr{SDL_Rect}, angle::Float64, center::Ptr{SDL_Point}, flip::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderCopyEx(i8*, i8*, i8*, i8*, double, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect, double %angle, i8* %center, i32 %flip) {
        entry:
            %result = call i32 @SDL_RenderCopyEx(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect, double %angle, i8* %center, i32 %flip)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{SDL_Rect}, Float64, Ptr{SDL_Point}, UInt32}, renderer, texture, srcrect, dstrect, angle, center, flip)
    end

    # Original C signature: int SDL_RenderCopyExF(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_FRect * dstrect, const double angle, const SDL_FPoint * center, const SDL_RendererFlip flip)
    function llvm_SDL_RenderCopyExF(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, srcrect::Ptr{SDL_Rect}, dstrect::Ptr{SDL_FRect}, angle::Float64, center::Ptr{SDL_FPoint}, flip::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderCopyExF(i8*, i8*, i8*, i8*, double, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect, double %angle, i8* %center, i32 %flip) {
        entry:
            %result = call i32 @SDL_RenderCopyExF(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect, double %angle, i8* %center, i32 %flip)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{SDL_FRect}, Float64, Ptr{SDL_FPoint}, UInt32}, renderer, texture, srcrect, dstrect, angle, center, flip)
    end

    # Original C signature: int SDL_RenderCopyF(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_FRect * dstrect)
    function llvm_SDL_RenderCopyF(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, srcrect::Ptr{SDL_Rect}, dstrect::Ptr{SDL_FRect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderCopyF(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_RenderCopyF(i8* %renderer, i8* %texture, i8* %srcrect, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{SDL_FRect}}, renderer, texture, srcrect, dstrect)
    end

    # Original C signature: int SDL_RenderDrawLine(SDL_Renderer * renderer, int x1, int y1, int x2, int y2)
    function llvm_SDL_RenderDrawLine(renderer::Ptr{SDL_Renderer}, x1::Int32, y1::Int32, x2::Int32, y2::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawLine(i8*, i32, i32, i32, i32) nounwind

        define i32 @main(i8* %renderer, i32 %x1, i32 %y1, i32 %x2, i32 %y2) {
        entry:
            %result = call i32 @SDL_RenderDrawLine(i8* %renderer, i32 %x1, i32 %y1, i32 %x2, i32 %y2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Int32, Int32, Int32, Int32}, renderer, x1, y1, x2, y2)
    end

    # Original C signature: int SDL_RenderDrawLineF(SDL_Renderer * renderer, float x1, float y1, float x2, float y2)
    function llvm_SDL_RenderDrawLineF(renderer::Ptr{SDL_Renderer}, x1::Float32, y1::Float32, x2::Float32, y2::Float32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawLineF(i8*, float, float, float, float) nounwind

        define i32 @main(i8* %renderer, float %x1, float %y1, float %x2, float %y2) {
        entry:
            %result = call i32 @SDL_RenderDrawLineF(i8* %renderer, float %x1, float %y1, float %x2, float %y2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Float32, Float32, Float32, Float32}, renderer, x1, y1, x2, y2)
    end

    # Original C signature: int SDL_RenderDrawLines(SDL_Renderer * renderer, const SDL_Point * points, int count)
    function llvm_SDL_RenderDrawLines(renderer::Ptr{SDL_Renderer}, points::Ptr{SDL_Point}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawLines(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %points, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawLines(i8* %renderer, i8* %points, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Point}, Int32}, renderer, points, count)
    end

    # Original C signature: int SDL_RenderDrawLinesF(SDL_Renderer * renderer, const SDL_FPoint * points, int count)
    function llvm_SDL_RenderDrawLinesF(renderer::Ptr{SDL_Renderer}, points::Ptr{SDL_FPoint}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawLinesF(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %points, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawLinesF(i8* %renderer, i8* %points, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FPoint}, Int32}, renderer, points, count)
    end

    # Original C signature: int SDL_RenderDrawPoint(SDL_Renderer * renderer, int x, int y)
    function llvm_SDL_RenderDrawPoint(renderer::Ptr{SDL_Renderer}, x::Int32, y::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawPoint(i8*, i32, i32) nounwind

        define i32 @main(i8* %renderer, i32 %x, i32 %y) {
        entry:
            %result = call i32 @SDL_RenderDrawPoint(i8* %renderer, i32 %x, i32 %y)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Int32, Int32}, renderer, x, y)
    end

    # Original C signature: int SDL_RenderDrawPointF(SDL_Renderer * renderer, float x, float y)
    function llvm_SDL_RenderDrawPointF(renderer::Ptr{SDL_Renderer}, x::Float32, y::Float32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawPointF(i8*, float, float) nounwind

        define i32 @main(i8* %renderer, float %x, float %y) {
        entry:
            %result = call i32 @SDL_RenderDrawPointF(i8* %renderer, float %x, float %y)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Float32, Float32}, renderer, x, y)
    end

    # Original C signature: int SDL_RenderDrawPoints(SDL_Renderer * renderer, const SDL_Point * points, int count)
    function llvm_SDL_RenderDrawPoints(renderer::Ptr{SDL_Renderer}, points::Ptr{SDL_Point}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawPoints(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %points, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawPoints(i8* %renderer, i8* %points, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Point}, Int32}, renderer, points, count)
    end

    # Original C signature: int SDL_RenderDrawPointsF(SDL_Renderer * renderer, const SDL_FPoint * points, int count)
    function llvm_SDL_RenderDrawPointsF(renderer::Ptr{SDL_Renderer}, points::Ptr{SDL_FPoint}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawPointsF(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %points, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawPointsF(i8* %renderer, i8* %points, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FPoint}, Int32}, renderer, points, count)
    end

    # Original C signature: int SDL_RenderDrawRect(SDL_Renderer * renderer, const SDL_Rect * rect)
    function llvm_SDL_RenderDrawRect(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawRect(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderDrawRect(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: int SDL_RenderDrawRectF(SDL_Renderer * renderer, const SDL_FRect * rect)
    function llvm_SDL_RenderDrawRectF(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_FRect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawRectF(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderDrawRectF(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FRect}}, renderer, rect)
    end

    # Original C signature: int SDL_RenderDrawRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count)
    function llvm_SDL_RenderDrawRects(renderer::Ptr{SDL_Renderer}, rects::Ptr{SDL_Rect}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawRects(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %rects, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawRects(i8* %renderer, i8* %rects, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}, Int32}, renderer, rects, count)
    end

    # Original C signature: int SDL_RenderDrawRectsF(SDL_Renderer * renderer, const SDL_FRect * rects, int count)
    function llvm_SDL_RenderDrawRectsF(renderer::Ptr{SDL_Renderer}, rects::Ptr{SDL_FRect}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderDrawRectsF(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %rects, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderDrawRectsF(i8* %renderer, i8* %rects, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FRect}, Int32}, renderer, rects, count)
    end

    # Original C signature: int SDL_RenderFillRect(SDL_Renderer * renderer, const SDL_Rect * rect)
    function llvm_SDL_RenderFillRect(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFillRect(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderFillRect(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: int SDL_RenderFillRectF(SDL_Renderer * renderer, const SDL_FRect * rect)
    function llvm_SDL_RenderFillRectF(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_FRect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFillRectF(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderFillRectF(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FRect}}, renderer, rect)
    end

    # Original C signature: int SDL_RenderFillRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count)
    function llvm_SDL_RenderFillRects(renderer::Ptr{SDL_Renderer}, rects::Ptr{SDL_Rect}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFillRects(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %rects, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderFillRects(i8* %renderer, i8* %rects, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}, Int32}, renderer, rects, count)
    end

    # Original C signature: int SDL_RenderFillRectsF(SDL_Renderer * renderer, const SDL_FRect * rects, int count)
    function llvm_SDL_RenderFillRectsF(renderer::Ptr{SDL_Renderer}, rects::Ptr{SDL_FRect}, count::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFillRectsF(i8*, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %rects, i32 %count) {
        entry:
            %result = call i32 @SDL_RenderFillRectsF(i8* %renderer, i8* %rects, i32 %count)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_FRect}, Int32}, renderer, rects, count)
    end

    # Original C signature: int SDL_RenderFlush(SDL_Renderer * renderer)
    function llvm_SDL_RenderFlush(renderer::Ptr{SDL_Renderer})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderFlush(i8*) nounwind

        define i32 @main(i8* %renderer) {
        entry:
            %result = call i32 @SDL_RenderFlush(i8* %renderer)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: int SDL_RenderGeometry(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Vertex * vertices, int num_vertices, const int * indices, int num_indices)
    function llvm_SDL_RenderGeometry(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, vertices::Ptr{SDL_Vertex}, num_vertices::Int32, indices::Ptr{Int32}, num_indices::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderGeometry(i8*, i8*, i8*, i32, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %vertices, i32 %num_vertices, i8* %indices, i32 %num_indices) {
        entry:
            %result = call i32 @SDL_RenderGeometry(i8* %renderer, i8* %texture, i8* %vertices, i32 %num_vertices, i8* %indices, i32 %num_indices)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{SDL_Vertex}, Int32, Ptr{Int32}, Int32}, renderer, texture, vertices, num_vertices, indices, num_indices)
    end

    # Original C signature: int SDL_RenderGeometryRaw(SDL_Renderer * renderer, SDL_Texture * texture, const float * xy, int xy_stride, const SDL_Color * color, int color_stride, const float * uv, int uv_stride, int num_vertices, const void * indices, int num_indices, int size_indices)
    function llvm_SDL_RenderGeometryRaw(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture}, xy::Ptr{Float32}, xy_stride::Int32, color::Ptr{SDL_Color}, color_stride::Int32, uv::Ptr{Float32}, uv_stride::Int32, num_vertices::Int32, indices::Ptr{Cvoid}, num_indices::Int32, size_indices::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderGeometryRaw(i8*, i8*, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i32, i32) nounwind

        define i32 @main(i8* %renderer, i8* %texture, i8* %xy, i32 %xy_stride, i8* %color, i32 %color_stride, i8* %uv, i32 %uv_stride, i32 %num_vertices, i8* %indices, i32 %num_indices, i32 %size_indices) {
        entry:
            %result = call i32 @SDL_RenderGeometryRaw(i8* %renderer, i8* %texture, i8* %xy, i32 %xy_stride, i8* %color, i32 %color_stride, i8* %uv, i32 %uv_stride, i32 %num_vertices, i8* %indices, i32 %num_indices, i32 %size_indices)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}, Ptr{Float32}, Int32, Ptr{SDL_Color}, Int32, Ptr{Float32}, Int32, Int32, Ptr{Cvoid}, Int32, Int32}, renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, indices, num_indices, size_indices)
    end

    # Original C signature: void SDL_RenderGetClipRect(SDL_Renderer * renderer, SDL_Rect * rect)
    function llvm_SDL_RenderGetClipRect(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderGetClipRect(i8*, i8*) nounwind

        define void @main(i8* %renderer, i8* %rect) {
        entry:
            call void @SDL_RenderGetClipRect(i8* %renderer, i8* %rect)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: ID3D11Device* SDL_RenderGetD3D11Device(SDL_Renderer * renderer)
    function llvm_SDL_RenderGetD3D11Device(renderer::Ptr{SDL_Renderer})::Ptr{ID3D11Device}
        Base.llvmcall(("""
        declare i8* @SDL_RenderGetD3D11Device(i8*) nounwind

        define i8* @main(i8* %renderer) {
        entry:
            %result = call i8* @SDL_RenderGetD3D11Device(i8* %renderer)
            ret i8* %result
        }
        """, "main"), Ptr{ID3D11Device}, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: ID3D12Device* SDL_RenderGetD3D12Device(SDL_Renderer* renderer)
    function llvm_SDL_RenderGetD3D12Device(renderer::Ptr{SDL_Renderer})::Ptr{ID3D12Device}
        Base.llvmcall(("""
        declare i8* @SDL_RenderGetD3D12Device(i8*) nounwind

        define i8* @main(i8* %renderer) {
        entry:
            %result = call i8* @SDL_RenderGetD3D12Device(i8* %renderer)
            ret i8* %result
        }
        """, "main"), Ptr{ID3D12Device}, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: IDirect3DDevice9* SDL_RenderGetD3D9Device(SDL_Renderer * renderer)
    function llvm_SDL_RenderGetD3D9Device(renderer::Ptr{SDL_Renderer})::Ptr{IDirect3DDevice9}
        Base.llvmcall(("""
        declare i8* @SDL_RenderGetD3D9Device(i8*) nounwind

        define i8* @main(i8* %renderer) {
        entry:
            %result = call i8* @SDL_RenderGetD3D9Device(i8* %renderer)
            ret i8* %result
        }
        """, "main"), Ptr{IDirect3DDevice9}, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: SDL_bool SDL_RenderGetIntegerScale(SDL_Renderer * renderer)
    function llvm_SDL_RenderGetIntegerScale(renderer::Ptr{SDL_Renderer})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_RenderGetIntegerScale(i8*) nounwind

        define i32 @main(i8* %renderer) {
        entry:
            %result = call i32 @SDL_RenderGetIntegerScale(i8* %renderer)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: void SDL_RenderGetLogicalSize(SDL_Renderer * renderer, int * w, int * h)
    function llvm_SDL_RenderGetLogicalSize(renderer::Ptr{SDL_Renderer}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderGetLogicalSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %renderer, i8* %w, i8* %h) {
        entry:
            call void @SDL_RenderGetLogicalSize(i8* %renderer, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Ptr{Int32}, Ptr{Int32}}, renderer, w, h)
    end

    # Original C signature: void SDL_RenderGetScale(SDL_Renderer * renderer, float * scaleX, float * scaleY)
    function llvm_SDL_RenderGetScale(renderer::Ptr{SDL_Renderer}, scaleX::Ptr{Float32}, scaleY::Ptr{Float32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderGetScale(i8*, i8*, i8*) nounwind

        define void @main(i8* %renderer, i8* %scaleX, i8* %scaleY) {
        entry:
            call void @SDL_RenderGetScale(i8* %renderer, i8* %scaleX, i8* %scaleY)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Ptr{Float32}, Ptr{Float32}}, renderer, scaleX, scaleY)
    end

    # Original C signature: void SDL_RenderGetViewport(SDL_Renderer * renderer, SDL_Rect * rect)
    function llvm_SDL_RenderGetViewport(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderGetViewport(i8*, i8*) nounwind

        define void @main(i8* %renderer, i8* %rect) {
        entry:
            call void @SDL_RenderGetViewport(i8* %renderer, i8* %rect)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: SDL_Window * SDL_RenderGetWindow(SDL_Renderer * renderer)
    function llvm_SDL_RenderGetWindow(renderer::Ptr{SDL_Renderer})::Ptr{SDL_Window}
        Base.llvmcall(("""
        declare i8* @SDL_RenderGetWindow(i8*) nounwind

        define i8* @main(i8* %renderer) {
        entry:
            %result = call i8* @SDL_RenderGetWindow(i8* %renderer)
            ret i8* %result
        }
        """, "main"), Ptr{SDL_Window}, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: SDL_bool SDL_RenderIsClipEnabled(SDL_Renderer * renderer)
    function llvm_SDL_RenderIsClipEnabled(renderer::Ptr{SDL_Renderer})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_RenderIsClipEnabled(i8*) nounwind

        define i32 @main(i8* %renderer) {
        entry:
            %result = call i32 @SDL_RenderIsClipEnabled(i8* %renderer)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: void SDL_RenderLogicalToWindow(SDL_Renderer * renderer, float logicalX, float logicalY, int * windowX, int * windowY)
    function llvm_SDL_RenderLogicalToWindow(renderer::Ptr{SDL_Renderer}, logicalX::Float32, logicalY::Float32, windowX::Ptr{Int32}, windowY::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderLogicalToWindow(i8*, float, float, i8*, i8*) nounwind

        define void @main(i8* %renderer, float %logicalX, float %logicalY, i8* %windowX, i8* %windowY) {
        entry:
            call void @SDL_RenderLogicalToWindow(i8* %renderer, float %logicalX, float %logicalY, i8* %windowX, i8* %windowY)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Float32, Float32, Ptr{Int32}, Ptr{Int32}}, renderer, logicalX, logicalY, windowX, windowY)
    end

    # Original C signature: void SDL_RenderPresent(SDL_Renderer * renderer)
    function llvm_SDL_RenderPresent(renderer::Ptr{SDL_Renderer})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderPresent(i8*) nounwind

        define void @main(i8* %renderer) {
        entry:
            call void @SDL_RenderPresent(i8* %renderer)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: int SDL_RenderReadPixels(SDL_Renderer * renderer, const SDL_Rect * rect, Uint32 format, void * pixels, int pitch)
    function llvm_SDL_RenderReadPixels(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect}, format::UInt32, pixels::Ptr{Cvoid}, pitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderReadPixels(i8*, i8*, i32, i8*, i32) nounwind

        define i32 @main(i8* %renderer, i8* %rect, i32 %format, i8* %pixels, i32 %pitch) {
        entry:
            %result = call i32 @SDL_RenderReadPixels(i8* %renderer, i8* %rect, i32 %format, i8* %pixels, i32 %pitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}, UInt32, Ptr{Cvoid}, Int32}, renderer, rect, format, pixels, pitch)
    end

    # Original C signature: int SDL_RenderSetClipRect(SDL_Renderer * renderer, const SDL_Rect * rect)
    function llvm_SDL_RenderSetClipRect(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetClipRect(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderSetClipRect(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: int SDL_RenderSetIntegerScale(SDL_Renderer * renderer, SDL_bool enable)
    function llvm_SDL_RenderSetIntegerScale(renderer::Ptr{SDL_Renderer}, enable::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetIntegerScale(i8*, i32) nounwind

        define i32 @main(i8* %renderer, i32 %enable) {
        entry:
            %result = call i32 @SDL_RenderSetIntegerScale(i8* %renderer, i32 %enable)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, UInt32}, renderer, enable)
    end

    # Original C signature: int SDL_RenderSetLogicalSize(SDL_Renderer * renderer, int w, int h)
    function llvm_SDL_RenderSetLogicalSize(renderer::Ptr{SDL_Renderer}, w::Int32, h::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetLogicalSize(i8*, i32, i32) nounwind

        define i32 @main(i8* %renderer, i32 %w, i32 %h) {
        entry:
            %result = call i32 @SDL_RenderSetLogicalSize(i8* %renderer, i32 %w, i32 %h)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Int32, Int32}, renderer, w, h)
    end

    # Original C signature: int SDL_RenderSetScale(SDL_Renderer * renderer, float scaleX, float scaleY)
    function llvm_SDL_RenderSetScale(renderer::Ptr{SDL_Renderer}, scaleX::Float32, scaleY::Float32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetScale(i8*, float, float) nounwind

        define i32 @main(i8* %renderer, float %scaleX, float %scaleY) {
        entry:
            %result = call i32 @SDL_RenderSetScale(i8* %renderer, float %scaleX, float %scaleY)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Float32, Float32}, renderer, scaleX, scaleY)
    end

    # Original C signature: int SDL_RenderSetVSync(SDL_Renderer* renderer, int vsync)
    function llvm_SDL_RenderSetVSync(renderer::Ptr{SDL_Renderer}, vsync::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetVSync(i8*, i32) nounwind

        define i32 @main(i8* %renderer, i32 %vsync) {
        entry:
            %result = call i32 @SDL_RenderSetVSync(i8* %renderer, i32 %vsync)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Int32}, renderer, vsync)
    end

    # Original C signature: int SDL_RenderSetViewport(SDL_Renderer * renderer, const SDL_Rect * rect)
    function llvm_SDL_RenderSetViewport(renderer::Ptr{SDL_Renderer}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_RenderSetViewport(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %rect) {
        entry:
            %result = call i32 @SDL_RenderSetViewport(i8* %renderer, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Rect}}, renderer, rect)
    end

    # Original C signature: SDL_bool SDL_RenderTargetSupported(SDL_Renderer * renderer)
    function llvm_SDL_RenderTargetSupported(renderer::Ptr{SDL_Renderer})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_RenderTargetSupported(i8*) nounwind

        define i32 @main(i8* %renderer) {
        entry:
            %result = call i32 @SDL_RenderTargetSupported(i8* %renderer)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Renderer}}, renderer)
    end

    # Original C signature: void SDL_RenderWindowToLogical(SDL_Renderer * renderer, int windowX, int windowY, float * logicalX, float * logicalY)
    function llvm_SDL_RenderWindowToLogical(renderer::Ptr{SDL_Renderer}, windowX::Int32, windowY::Int32, logicalX::Ptr{Float32}, logicalY::Ptr{Float32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RenderWindowToLogical(i8*, i32, i32, i8*, i8*) nounwind

        define void @main(i8* %renderer, i32 %windowX, i32 %windowY, i8* %logicalX, i8* %logicalY) {
        entry:
            call void @SDL_RenderWindowToLogical(i8* %renderer, i32 %windowX, i32 %windowY, i8* %logicalX, i8* %logicalY)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Renderer}, Int32, Int32, Ptr{Float32}, Ptr{Float32}}, renderer, windowX, windowY, logicalX, logicalY)
    end

    # Original C signature: void SDL_ResetAssertionReport()
    function llvm_SDL_ResetAssertionReport()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ResetAssertionReport() nounwind

        define void @main() {
        entry:
            call void @SDL_ResetAssertionReport()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: SDL_bool SDL_ResetHint(const char * name)
    function llvm_SDL_ResetHint(name::Ptr{UInt8})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_ResetHint(i8*) nounwind

        define i32 @main(i8* %name) {
        entry:
            %result = call i32 @SDL_ResetHint(i8* %name)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}}, name)
    end

    # Original C signature: void SDL_ResetHints()
    function llvm_SDL_ResetHints()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ResetHints() nounwind

        define void @main() {
        entry:
            call void @SDL_ResetHints()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_ResetKeyboard()
    function llvm_SDL_ResetKeyboard()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ResetKeyboard() nounwind

        define void @main() {
        entry:
            call void @SDL_ResetKeyboard()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_RestoreWindow(SDL_Window * window)
    function llvm_SDL_RestoreWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_RestoreWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_RestoreWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void * SDL_SIMDAlloc(const size_t len)
    function llvm_SDL_SIMDAlloc(len::Csize_t)::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_SIMDAlloc(i8*) nounwind

        define i8* @main(i8* %len) {
        entry:
            %result = call i8* @SDL_SIMDAlloc(i8* %len)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Csize_t}, len)
    end

    # Original C signature: void SDL_SIMDFree(void * ptr)
    function llvm_SDL_SIMDFree(ptr::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SIMDFree(i8*) nounwind

        define void @main(i8* %ptr) {
        entry:
            call void @SDL_SIMDFree(i8* %ptr)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Cvoid}}, ptr)
    end

    # Original C signature: size_t SDL_SIMDGetAlignment()
    function llvm_SDL_SIMDGetAlignment()::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_SIMDGetAlignment() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_SIMDGetAlignment()
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{}, )
    end

    # Original C signature: void * SDL_SIMDRealloc(void * mem, const size_t len)
    function llvm_SDL_SIMDRealloc(mem::Ptr{Cvoid}, len::Csize_t)::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_SIMDRealloc(i8*, i8*) nounwind

        define i8* @main(i8* %mem, i8* %len) {
        entry:
            %result = call i8* @SDL_SIMDRealloc(i8* %mem, i8* %len)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{Cvoid}, Csize_t}, mem, len)
    end

    # Original C signature: int SDL_SaveAllDollarTemplates(SDL_RWops * dst)
    function llvm_SDL_SaveAllDollarTemplates(dst::Ptr{SDL_RWops})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SaveAllDollarTemplates(i8*) nounwind

        define i32 @main(i8* %dst) {
        entry:
            %result = call i32 @SDL_SaveAllDollarTemplates(i8* %dst)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_RWops}}, dst)
    end

    # Original C signature: int SDL_SaveBMP_RW(SDL_Surface * surface, SDL_RWops * dst, int freedst)
    function llvm_SDL_SaveBMP_RW(surface::Ptr{SDL_Surface}, dst::Ptr{SDL_RWops}, freedst::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SaveBMP_RW(i8*, i8*, i32) nounwind

        define i32 @main(i8* %surface, i8* %dst, i32 %freedst) {
        entry:
            %result = call i32 @SDL_SaveBMP_RW(i8* %surface, i8* %dst, i32 %freedst)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_RWops}, Int32}, surface, dst, freedst)
    end

    # Original C signature: int SDL_SaveDollarTemplate(SDL_GestureID gestureId, SDL_RWops * dst)
    function llvm_SDL_SaveDollarTemplate(gestureId::Int64, dst::Ptr{SDL_RWops})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SaveDollarTemplate(i64, i8*) nounwind

        define i32 @main(i64 %gestureId, i8* %dst) {
        entry:
            %result = call i32 @SDL_SaveDollarTemplate(i64 %gestureId, i8* %dst)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int64, Ptr{SDL_RWops}}, gestureId, dst)
    end

    # Original C signature: int SDL_SemPost(SDL_sem * sem)
    function llvm_SDL_SemPost(sem::Ptr{SDL_sem})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SemPost(i8*) nounwind

        define i32 @main(i8* %sem) {
        entry:
            %result = call i32 @SDL_SemPost(i8* %sem)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_sem}}, sem)
    end

    # Original C signature: int SDL_SemTryWait(SDL_sem * sem)
    function llvm_SDL_SemTryWait(sem::Ptr{SDL_sem})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SemTryWait(i8*) nounwind

        define i32 @main(i8* %sem) {
        entry:
            %result = call i32 @SDL_SemTryWait(i8* %sem)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_sem}}, sem)
    end

    # Original C signature: Uint32 SDL_SemValue(SDL_sem * sem)
    function llvm_SDL_SemValue(sem::Ptr{SDL_sem})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_SemValue(i8*) nounwind

        define i32 @main(i8* %sem) {
        entry:
            %result = call i32 @SDL_SemValue(i8* %sem)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_sem}}, sem)
    end

    # Original C signature: int SDL_SemWait(SDL_sem * sem)
    function llvm_SDL_SemWait(sem::Ptr{SDL_sem})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SemWait(i8*) nounwind

        define i32 @main(i8* %sem) {
        entry:
            %result = call i32 @SDL_SemWait(i8* %sem)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_sem}}, sem)
    end

    # Original C signature: int SDL_SemWaitTimeout(SDL_sem * sem, Uint32 timeout)
    function llvm_SDL_SemWaitTimeout(sem::Ptr{SDL_sem}, timeout::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SemWaitTimeout(i8*, i32) nounwind

        define i32 @main(i8* %sem, i32 %timeout) {
        entry:
            %result = call i32 @SDL_SemWaitTimeout(i8* %sem, i32 %timeout)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_sem}, UInt32}, sem, timeout)
    end

    # Original C signature: void SDL_SensorClose(SDL_Sensor * sensor)
    function llvm_SDL_SensorClose(sensor::Ptr{SDL_Sensor})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SensorClose(i8*) nounwind

        define void @main(i8* %sensor) {
        entry:
            call void @SDL_SensorClose(i8* %sensor)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Sensor}}, sensor)
    end

    # Original C signature: int SDL_SensorGetData(SDL_Sensor * sensor, float * data, int num_values)
    function llvm_SDL_SensorGetData(sensor::Ptr{SDL_Sensor}, data::Ptr{Float32}, num_values::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetData(i8*, i8*, i32) nounwind

        define i32 @main(i8* %sensor, i8* %data, i32 %num_values) {
        entry:
            %result = call i32 @SDL_SensorGetData(i8* %sensor, i8* %data, i32 %num_values)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Sensor}, Ptr{Float32}, Int32}, sensor, data, num_values)
    end

    # Original C signature: int SDL_SensorGetDataWithTimestamp(SDL_Sensor * sensor, Uint64 * timestamp, float * data, int num_values)
    function llvm_SDL_SensorGetDataWithTimestamp(sensor::Ptr{SDL_Sensor}, timestamp::Ptr{UInt64}, data::Ptr{Float32}, num_values::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetDataWithTimestamp(i8*, i8*, i8*, i32) nounwind

        define i32 @main(i8* %sensor, i8* %timestamp, i8* %data, i32 %num_values) {
        entry:
            %result = call i32 @SDL_SensorGetDataWithTimestamp(i8* %sensor, i8* %timestamp, i8* %data, i32 %num_values)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Sensor}, Ptr{UInt64}, Ptr{Float32}, Int32}, sensor, timestamp, data, num_values)
    end

    # Original C signature: SDL_SensorID SDL_SensorGetDeviceInstanceID(int device_index)
    function llvm_SDL_SensorGetDeviceInstanceID(device_index::Int32)::SDL_SensorID
        Base.llvmcall(("""
        declare i8* @SDL_SensorGetDeviceInstanceID(i32) nounwind

        define i8* @main(i32 %device_index) {
        entry:
            %result = call i8* @SDL_SensorGetDeviceInstanceID(i32 %device_index)
            ret i8* %result
        }
        """, "main"), SDL_SensorID, Tuple{Int32}, device_index)
    end

    # Original C signature: int SDL_SensorGetDeviceNonPortableType(int device_index)
    function llvm_SDL_SensorGetDeviceNonPortableType(device_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetDeviceNonPortableType(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_SensorGetDeviceNonPortableType(i32 %device_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, device_index)
    end

    # Original C signature: SDL_SensorType SDL_SensorGetDeviceType(int device_index)
    function llvm_SDL_SensorGetDeviceType(device_index::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetDeviceType(i32) nounwind

        define i32 @main(i32 %device_index) {
        entry:
            %result = call i32 @SDL_SensorGetDeviceType(i32 %device_index)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, device_index)
    end

    # Original C signature: SDL_SensorID SDL_SensorGetInstanceID(SDL_Sensor * sensor)
    function llvm_SDL_SensorGetInstanceID(sensor::Ptr{SDL_Sensor})::SDL_SensorID
        Base.llvmcall(("""
        declare i8* @SDL_SensorGetInstanceID(i8*) nounwind

        define i8* @main(i8* %sensor) {
        entry:
            %result = call i8* @SDL_SensorGetInstanceID(i8* %sensor)
            ret i8* %result
        }
        """, "main"), SDL_SensorID, Tuple{Ptr{SDL_Sensor}}, sensor)
    end

    # Original C signature: int SDL_SensorGetNonPortableType(SDL_Sensor * sensor)
    function llvm_SDL_SensorGetNonPortableType(sensor::Ptr{SDL_Sensor})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetNonPortableType(i8*) nounwind

        define i32 @main(i8* %sensor) {
        entry:
            %result = call i32 @SDL_SensorGetNonPortableType(i8* %sensor)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Sensor}}, sensor)
    end

    # Original C signature: SDL_SensorType SDL_SensorGetType(SDL_Sensor * sensor)
    function llvm_SDL_SensorGetType(sensor::Ptr{SDL_Sensor})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SensorGetType(i8*) nounwind

        define i32 @main(i8* %sensor) {
        entry:
            %result = call i32 @SDL_SensorGetType(i8* %sensor)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Sensor}}, sensor)
    end

    # Original C signature: void SDL_SensorUpdate()
    function llvm_SDL_SensorUpdate()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SensorUpdate() nounwind

        define void @main() {
        entry:
            call void @SDL_SensorUpdate()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_SetAssertionHandler(SDL_AssertionHandler handler, void * userdata)
    function llvm_SDL_SetAssertionHandler(handler::Cvoid, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetAssertionHandler(void, i8*) nounwind

        define void @main(void %handler, i8* %userdata) {
        entry:
            call void @SDL_SetAssertionHandler(void %handler, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Cvoid, Ptr{Cvoid}}, handler, userdata)
    end

    # Original C signature: SDL_bool SDL_SetClipRect(SDL_Surface * surface, const SDL_Rect * rect)
    function llvm_SDL_SetClipRect(surface::Ptr{SDL_Surface}, rect::Ptr{SDL_Rect})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_SetClipRect(i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %rect) {
        entry:
            %result = call i32 @SDL_SetClipRect(i8* %surface, i8* %rect)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}}, surface, rect)
    end

    # Original C signature: int SDL_SetClipboardText(const char * text)
    function llvm_SDL_SetClipboardText(text::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetClipboardText(i8*) nounwind

        define i32 @main(i8* %text) {
        entry:
            %result = call i32 @SDL_SetClipboardText(i8* %text)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, text)
    end

    # Original C signature: int SDL_SetColorKey(SDL_Surface * surface, int flag, Uint32 key)
    function llvm_SDL_SetColorKey(surface::Ptr{SDL_Surface}, flag::Int32, key::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetColorKey(i8*, i32, i32) nounwind

        define i32 @main(i8* %surface, i32 %flag, i32 %key) {
        entry:
            %result = call i32 @SDL_SetColorKey(i8* %surface, i32 %flag, i32 %key)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Int32, UInt32}, surface, flag, key)
    end

    # Original C signature: void SDL_SetCursor(SDL_Cursor * cursor)
    function llvm_SDL_SetCursor(cursor::Ptr{SDL_Cursor})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetCursor(i8*) nounwind

        define void @main(i8* %cursor) {
        entry:
            call void @SDL_SetCursor(i8* %cursor)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Cursor}}, cursor)
    end

    # Original C signature: void SDL_SetEventFilter(SDL_EventFilter filter, void * userdata)
    function llvm_SDL_SetEventFilter(filter::SDL_EventFilter, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetEventFilter(i8*, i8*) nounwind

        define void @main(i8* %filter, i8* %userdata) {
        entry:
            call void @SDL_SetEventFilter(i8* %filter, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_EventFilter, Ptr{Cvoid}}, filter, userdata)
    end

    # Original C signature: SDL_bool SDL_SetHint(const char * name, const char * value)
    function llvm_SDL_SetHint(name::Ptr{UInt8}, value::Ptr{UInt8})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_SetHint(i8*, i8*) nounwind

        define i32 @main(i8* %name, i8* %value) {
        entry:
            %result = call i32 @SDL_SetHint(i8* %name, i8* %value)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}, Ptr{UInt8}}, name, value)
    end

    # Original C signature: SDL_bool SDL_SetHintWithPriority(const char * name, const char * value, SDL_HintPriority priority)
    function llvm_SDL_SetHintWithPriority(name::Ptr{UInt8}, value::Ptr{UInt8}, priority::SDL_HintPriority)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_SetHintWithPriority(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %name, i8* %value, i8* %priority) {
        entry:
            %result = call i32 @SDL_SetHintWithPriority(i8* %name, i8* %value, i8* %priority)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}, Ptr{UInt8}, SDL_HintPriority}, name, value, priority)
    end

    # Original C signature: void SDL_SetMainReady()
    function llvm_SDL_SetMainReady()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetMainReady() nounwind

        define void @main() {
        entry:
            call void @SDL_SetMainReady()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_SetMemoryFunctions(SDL_malloc_func malloc_func, SDL_calloc_func calloc_func, SDL_realloc_func realloc_func, SDL_free_func free_func)
    function llvm_SDL_SetMemoryFunctions(malloc_func::SDL_malloc_func, calloc_func::SDL_calloc_func, realloc_func::SDL_realloc_func, free_func::SDL_free_func)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetMemoryFunctions(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func) {
        entry:
            %result = call i32 @SDL_SetMemoryFunctions(i8* %malloc_func, i8* %calloc_func, i8* %realloc_func, i8* %free_func)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{SDL_malloc_func, SDL_calloc_func, SDL_realloc_func, SDL_free_func}, malloc_func, calloc_func, realloc_func, free_func)
    end

    # Original C signature: int SDL_SetPaletteColors(SDL_Palette * palette, const SDL_Color * colors, int firstcolor, int ncolors)
    function llvm_SDL_SetPaletteColors(palette::Ptr{SDL_Palette}, colors::Ptr{SDL_Color}, firstcolor::Int32, ncolors::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetPaletteColors(i8*, i8*, i32, i32) nounwind

        define i32 @main(i8* %palette, i8* %colors, i32 %firstcolor, i32 %ncolors) {
        entry:
            %result = call i32 @SDL_SetPaletteColors(i8* %palette, i8* %colors, i32 %firstcolor, i32 %ncolors)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Palette}, Ptr{SDL_Color}, Int32, Int32}, palette, colors, firstcolor, ncolors)
    end

    # Original C signature: int SDL_SetPixelFormatPalette(SDL_PixelFormat * format, SDL_Palette * palette)
    function llvm_SDL_SetPixelFormatPalette(format::Ptr{SDL_PixelFormat}, palette::Ptr{SDL_Palette})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetPixelFormatPalette(i8*, i8*) nounwind

        define i32 @main(i8* %format, i8* %palette) {
        entry:
            %result = call i32 @SDL_SetPixelFormatPalette(i8* %format, i8* %palette)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_PixelFormat}, Ptr{SDL_Palette}}, format, palette)
    end

    # Original C signature: int SDL_SetPrimarySelectionText(const char * text)
    function llvm_SDL_SetPrimarySelectionText(text::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetPrimarySelectionText(i8*) nounwind

        define i32 @main(i8* %text) {
        entry:
            %result = call i32 @SDL_SetPrimarySelectionText(i8* %text)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, text)
    end

    # Original C signature: int SDL_SetRelativeMouseMode(SDL_bool enabled)
    function llvm_SDL_SetRelativeMouseMode(enabled::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetRelativeMouseMode(i32) nounwind

        define i32 @main(i32 %enabled) {
        entry:
            %result = call i32 @SDL_SetRelativeMouseMode(i32 %enabled)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32}, enabled)
    end

    # Original C signature: int SDL_SetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode blendMode)
    function llvm_SDL_SetRenderDrawBlendMode(renderer::Ptr{SDL_Renderer}, blendMode::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetRenderDrawBlendMode(i8*, i32) nounwind

        define i32 @main(i8* %renderer, i32 %blendMode) {
        entry:
            %result = call i32 @SDL_SetRenderDrawBlendMode(i8* %renderer, i32 %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, UInt32}, renderer, blendMode)
    end

    # Original C signature: int SDL_SetRenderDrawColor(SDL_Renderer * renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
    function llvm_SDL_SetRenderDrawColor(renderer::Ptr{SDL_Renderer}, r::UInt8, g::UInt8, b::UInt8, a::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetRenderDrawColor(i8*, i8, i8, i8, i8) nounwind

        define i32 @main(i8* %renderer, i8 %r, i8 %g, i8 %b, i8 %a) {
        entry:
            %result = call i32 @SDL_SetRenderDrawColor(i8* %renderer, i8 %r, i8 %g, i8 %b, i8 %a)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, UInt8, UInt8, UInt8, UInt8}, renderer, r, g, b, a)
    end

    # Original C signature: int SDL_SetRenderTarget(SDL_Renderer * renderer, SDL_Texture * texture)
    function llvm_SDL_SetRenderTarget(renderer::Ptr{SDL_Renderer}, texture::Ptr{SDL_Texture})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetRenderTarget(i8*, i8*) nounwind

        define i32 @main(i8* %renderer, i8* %texture) {
        entry:
            %result = call i32 @SDL_SetRenderTarget(i8* %renderer, i8* %texture)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Renderer}, Ptr{SDL_Texture}}, renderer, texture)
    end

    # Original C signature: int SDL_SetSurfaceAlphaMod(SDL_Surface * surface, Uint8 alpha)
    function llvm_SDL_SetSurfaceAlphaMod(surface::Ptr{SDL_Surface}, alpha::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetSurfaceAlphaMod(i8*, i8) nounwind

        define i32 @main(i8* %surface, i8 %alpha) {
        entry:
            %result = call i32 @SDL_SetSurfaceAlphaMod(i8* %surface, i8 %alpha)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, UInt8}, surface, alpha)
    end

    # Original C signature: int SDL_SetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode blendMode)
    function llvm_SDL_SetSurfaceBlendMode(surface::Ptr{SDL_Surface}, blendMode::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetSurfaceBlendMode(i8*, i32) nounwind

        define i32 @main(i8* %surface, i32 %blendMode) {
        entry:
            %result = call i32 @SDL_SetSurfaceBlendMode(i8* %surface, i32 %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, UInt32}, surface, blendMode)
    end

    # Original C signature: int SDL_SetSurfaceColorMod(SDL_Surface * surface, Uint8 r, Uint8 g, Uint8 b)
    function llvm_SDL_SetSurfaceColorMod(surface::Ptr{SDL_Surface}, r::UInt8, g::UInt8, b::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetSurfaceColorMod(i8*, i8, i8, i8) nounwind

        define i32 @main(i8* %surface, i8 %r, i8 %g, i8 %b) {
        entry:
            %result = call i32 @SDL_SetSurfaceColorMod(i8* %surface, i8 %r, i8 %g, i8 %b)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, UInt8, UInt8, UInt8}, surface, r, g, b)
    end

    # Original C signature: int SDL_SetSurfacePalette(SDL_Surface * surface, SDL_Palette * palette)
    function llvm_SDL_SetSurfacePalette(surface::Ptr{SDL_Surface}, palette::Ptr{SDL_Palette})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetSurfacePalette(i8*, i8*) nounwind

        define i32 @main(i8* %surface, i8* %palette) {
        entry:
            %result = call i32 @SDL_SetSurfacePalette(i8* %surface, i8* %palette)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Palette}}, surface, palette)
    end

    # Original C signature: int SDL_SetSurfaceRLE(SDL_Surface * surface, int flag)
    function llvm_SDL_SetSurfaceRLE(surface::Ptr{SDL_Surface}, flag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetSurfaceRLE(i8*, i32) nounwind

        define i32 @main(i8* %surface, i32 %flag) {
        entry:
            %result = call i32 @SDL_SetSurfaceRLE(i8* %surface, i32 %flag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Int32}, surface, flag)
    end

    # Original C signature: void SDL_SetTextInputRect(const SDL_Rect * rect)
    function llvm_SDL_SetTextInputRect(rect::Ptr{SDL_Rect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetTextInputRect(i8*) nounwind

        define void @main(i8* %rect) {
        entry:
            call void @SDL_SetTextInputRect(i8* %rect)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Rect}}, rect)
    end

    # Original C signature: int SDL_SetTextureAlphaMod(SDL_Texture * texture, Uint8 alpha)
    function llvm_SDL_SetTextureAlphaMod(texture::Ptr{SDL_Texture}, alpha::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetTextureAlphaMod(i8*, i8) nounwind

        define i32 @main(i8* %texture, i8 %alpha) {
        entry:
            %result = call i32 @SDL_SetTextureAlphaMod(i8* %texture, i8 %alpha)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, UInt8}, texture, alpha)
    end

    # Original C signature: int SDL_SetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode blendMode)
    function llvm_SDL_SetTextureBlendMode(texture::Ptr{SDL_Texture}, blendMode::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetTextureBlendMode(i8*, i32) nounwind

        define i32 @main(i8* %texture, i32 %blendMode) {
        entry:
            %result = call i32 @SDL_SetTextureBlendMode(i8* %texture, i32 %blendMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, UInt32}, texture, blendMode)
    end

    # Original C signature: int SDL_SetTextureColorMod(SDL_Texture * texture, Uint8 r, Uint8 g, Uint8 b)
    function llvm_SDL_SetTextureColorMod(texture::Ptr{SDL_Texture}, r::UInt8, g::UInt8, b::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetTextureColorMod(i8*, i8, i8, i8) nounwind

        define i32 @main(i8* %texture, i8 %r, i8 %g, i8 %b) {
        entry:
            %result = call i32 @SDL_SetTextureColorMod(i8* %texture, i8 %r, i8 %g, i8 %b)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, UInt8, UInt8, UInt8}, texture, r, g, b)
    end

    # Original C signature: int SDL_SetTextureScaleMode(SDL_Texture * texture, SDL_ScaleMode scaleMode)
    function llvm_SDL_SetTextureScaleMode(texture::Ptr{SDL_Texture}, scaleMode::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetTextureScaleMode(i8*, i32) nounwind

        define i32 @main(i8* %texture, i32 %scaleMode) {
        entry:
            %result = call i32 @SDL_SetTextureScaleMode(i8* %texture, i32 %scaleMode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, UInt32}, texture, scaleMode)
    end

    # Original C signature: int SDL_SetTextureUserData(SDL_Texture * texture, void * userdata)
    function llvm_SDL_SetTextureUserData(texture::Ptr{SDL_Texture}, userdata::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetTextureUserData(i8*, i8*) nounwind

        define i32 @main(i8* %texture, i8* %userdata) {
        entry:
            %result = call i32 @SDL_SetTextureUserData(i8* %texture, i8* %userdata)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{Cvoid}}, texture, userdata)
    end

    # Original C signature: int SDL_SetThreadPriority(SDL_ThreadPriority priority)
    function llvm_SDL_SetThreadPriority(priority::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetThreadPriority(i32) nounwind

        define i32 @main(i32 %priority) {
        entry:
            %result = call i32 @SDL_SetThreadPriority(i32 %priority)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, priority)
    end

    # Original C signature: void SDL_SetWindowAlwaysOnTop(SDL_Window * window, SDL_bool on_top)
    function llvm_SDL_SetWindowAlwaysOnTop(window::Ptr{SDL_Window}, on_top::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowAlwaysOnTop(i8*, i32) nounwind

        define void @main(i8* %window, i32 %on_top) {
        entry:
            call void @SDL_SetWindowAlwaysOnTop(i8* %window, i32 %on_top)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, on_top)
    end

    # Original C signature: void SDL_SetWindowBordered(SDL_Window * window, SDL_bool bordered)
    function llvm_SDL_SetWindowBordered(window::Ptr{SDL_Window}, bordered::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowBordered(i8*, i32) nounwind

        define void @main(i8* %window, i32 %bordered) {
        entry:
            call void @SDL_SetWindowBordered(i8* %window, i32 %bordered)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, bordered)
    end

    # Original C signature: int SDL_SetWindowBrightness(SDL_Window * window, float brightness)
    function llvm_SDL_SetWindowBrightness(window::Ptr{SDL_Window}, brightness::Float32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowBrightness(i8*, float) nounwind

        define i32 @main(i8* %window, float %brightness) {
        entry:
            %result = call i32 @SDL_SetWindowBrightness(i8* %window, float %brightness)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Float32}, window, brightness)
    end

    # Original C signature: void* SDL_SetWindowData(SDL_Window * window, const char * name, void * userdata)
    function llvm_SDL_SetWindowData(window::Ptr{SDL_Window}, name::Ptr{UInt8}, userdata::Ptr{Cvoid})::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_SetWindowData(i8*, i8*, i8*) nounwind

        define i8* @main(i8* %window, i8* %name, i8* %userdata) {
        entry:
            %result = call i8* @SDL_SetWindowData(i8* %window, i8* %name, i8* %userdata)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Ptr{SDL_Window}, Ptr{UInt8}, Ptr{Cvoid}}, window, name, userdata)
    end

    # Original C signature: int SDL_SetWindowDisplayMode(SDL_Window * window, const SDL_DisplayMode * mode)
    function llvm_SDL_SetWindowDisplayMode(window::Ptr{SDL_Window}, mode::Ptr{SDL_DisplayMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowDisplayMode(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %mode) {
        entry:
            %result = call i32 @SDL_SetWindowDisplayMode(i8* %window, i8* %mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_DisplayMode}}, window, mode)
    end

    # Original C signature: int SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags)
    function llvm_SDL_SetWindowFullscreen(window::Ptr{SDL_Window}, flags::UInt32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowFullscreen(i8*, i32) nounwind

        define i32 @main(i8* %window, i32 %flags) {
        entry:
            %result = call i32 @SDL_SetWindowFullscreen(i8* %window, i32 %flags)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, UInt32}, window, flags)
    end

    # Original C signature: int SDL_SetWindowGammaRamp(SDL_Window * window, const Uint16 * red, const Uint16 * green, const Uint16 * blue)
    function llvm_SDL_SetWindowGammaRamp(window::Ptr{SDL_Window}, red::Ptr{UInt16}, green::Ptr{UInt16}, blue::Ptr{UInt16})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowGammaRamp(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %red, i8* %green, i8* %blue) {
        entry:
            %result = call i32 @SDL_SetWindowGammaRamp(i8* %window, i8* %red, i8* %green, i8* %blue)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{UInt16}, Ptr{UInt16}, Ptr{UInt16}}, window, red, green, blue)
    end

    # Original C signature: void SDL_SetWindowGrab(SDL_Window * window, SDL_bool grabbed)
    function llvm_SDL_SetWindowGrab(window::Ptr{SDL_Window}, grabbed::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowGrab(i8*, i32) nounwind

        define void @main(i8* %window, i32 %grabbed) {
        entry:
            call void @SDL_SetWindowGrab(i8* %window, i32 %grabbed)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, grabbed)
    end

    # Original C signature: int SDL_SetWindowHitTest(SDL_Window * window, SDL_HitTest callback, void * callback_data)
    function llvm_SDL_SetWindowHitTest(window::Ptr{SDL_Window}, callback::Cvoid, callback_data::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowHitTest(i8*, void, i8*) nounwind

        define i32 @main(i8* %window, void %callback, i8* %callback_data) {
        entry:
            %result = call i32 @SDL_SetWindowHitTest(i8* %window, void %callback, i8* %callback_data)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Cvoid, Ptr{Cvoid}}, window, callback, callback_data)
    end

    # Original C signature: void SDL_SetWindowIcon(SDL_Window * window, SDL_Surface * icon)
    function llvm_SDL_SetWindowIcon(window::Ptr{SDL_Window}, icon::Ptr{SDL_Surface})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowIcon(i8*, i8*) nounwind

        define void @main(i8* %window, i8* %icon) {
        entry:
            call void @SDL_SetWindowIcon(i8* %window, i8* %icon)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{SDL_Surface}}, window, icon)
    end

    # Original C signature: int SDL_SetWindowInputFocus(SDL_Window * window)
    function llvm_SDL_SetWindowInputFocus(window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowInputFocus(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_SetWindowInputFocus(i8* %window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: void SDL_SetWindowKeyboardGrab(SDL_Window * window, SDL_bool grabbed)
    function llvm_SDL_SetWindowKeyboardGrab(window::Ptr{SDL_Window}, grabbed::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowKeyboardGrab(i8*, i32) nounwind

        define void @main(i8* %window, i32 %grabbed) {
        entry:
            call void @SDL_SetWindowKeyboardGrab(i8* %window, i32 %grabbed)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, grabbed)
    end

    # Original C signature: void SDL_SetWindowMaximumSize(SDL_Window * window, int max_w, int max_h)
    function llvm_SDL_SetWindowMaximumSize(window::Ptr{SDL_Window}, max_w::Int32, max_h::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowMaximumSize(i8*, i32, i32) nounwind

        define void @main(i8* %window, i32 %max_w, i32 %max_h) {
        entry:
            call void @SDL_SetWindowMaximumSize(i8* %window, i32 %max_w, i32 %max_h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, max_w, max_h)
    end

    # Original C signature: void SDL_SetWindowMinimumSize(SDL_Window * window, int min_w, int min_h)
    function llvm_SDL_SetWindowMinimumSize(window::Ptr{SDL_Window}, min_w::Int32, min_h::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowMinimumSize(i8*, i32, i32) nounwind

        define void @main(i8* %window, i32 %min_w, i32 %min_h) {
        entry:
            call void @SDL_SetWindowMinimumSize(i8* %window, i32 %min_w, i32 %min_h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, min_w, min_h)
    end

    # Original C signature: int SDL_SetWindowModalFor(SDL_Window * modal_window, SDL_Window * parent_window)
    function llvm_SDL_SetWindowModalFor(modal_window::Ptr{SDL_Window}, parent_window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowModalFor(i8*, i8*) nounwind

        define i32 @main(i8* %modal_window, i8* %parent_window) {
        entry:
            %result = call i32 @SDL_SetWindowModalFor(i8* %modal_window, i8* %parent_window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_Window}}, modal_window, parent_window)
    end

    # Original C signature: void SDL_SetWindowMouseGrab(SDL_Window * window, SDL_bool grabbed)
    function llvm_SDL_SetWindowMouseGrab(window::Ptr{SDL_Window}, grabbed::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowMouseGrab(i8*, i32) nounwind

        define void @main(i8* %window, i32 %grabbed) {
        entry:
            call void @SDL_SetWindowMouseGrab(i8* %window, i32 %grabbed)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, grabbed)
    end

    # Original C signature: int SDL_SetWindowMouseRect(SDL_Window * window, const SDL_Rect * rect)
    function llvm_SDL_SetWindowMouseRect(window::Ptr{SDL_Window}, rect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowMouseRect(i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %rect) {
        entry:
            %result = call i32 @SDL_SetWindowMouseRect(i8* %window, i8* %rect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_Rect}}, window, rect)
    end

    # Original C signature: int SDL_SetWindowOpacity(SDL_Window * window, float opacity)
    function llvm_SDL_SetWindowOpacity(window::Ptr{SDL_Window}, opacity::Float32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowOpacity(i8*, float) nounwind

        define i32 @main(i8* %window, float %opacity) {
        entry:
            %result = call i32 @SDL_SetWindowOpacity(i8* %window, float %opacity)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Float32}, window, opacity)
    end

    # Original C signature: void SDL_SetWindowPosition(SDL_Window * window, int x, int y)
    function llvm_SDL_SetWindowPosition(window::Ptr{SDL_Window}, x::Int32, y::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowPosition(i8*, i32, i32) nounwind

        define void @main(i8* %window, i32 %x, i32 %y) {
        entry:
            call void @SDL_SetWindowPosition(i8* %window, i32 %x, i32 %y)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, x, y)
    end

    # Original C signature: void SDL_SetWindowResizable(SDL_Window * window, SDL_bool resizable)
    function llvm_SDL_SetWindowResizable(window::Ptr{SDL_Window}, resizable::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowResizable(i8*, i32) nounwind

        define void @main(i8* %window, i32 %resizable) {
        entry:
            call void @SDL_SetWindowResizable(i8* %window, i32 %resizable)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, UInt32}, window, resizable)
    end

    # Original C signature: int SDL_SetWindowShape(SDL_Window * window, SDL_Surface * shape, SDL_WindowShapeMode * shape_mode)
    function llvm_SDL_SetWindowShape(window::Ptr{SDL_Window}, shape::Ptr{SDL_Surface}, shape_mode::Ptr{SDL_WindowShapeMode})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SetWindowShape(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %shape, i8* %shape_mode) {
        entry:
            %result = call i32 @SDL_SetWindowShape(i8* %window, i8* %shape, i8* %shape_mode)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_Surface}, Ptr{SDL_WindowShapeMode}}, window, shape, shape_mode)
    end

    # Original C signature: void SDL_SetWindowSize(SDL_Window * window, int w, int h)
    function llvm_SDL_SetWindowSize(window::Ptr{SDL_Window}, w::Int32, h::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowSize(i8*, i32, i32) nounwind

        define void @main(i8* %window, i32 %w, i32 %h) {
        entry:
            call void @SDL_SetWindowSize(i8* %window, i32 %w, i32 %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, w, h)
    end

    # Original C signature: void SDL_SetWindowTitle(SDL_Window * window, const char * title)
    function llvm_SDL_SetWindowTitle(window::Ptr{SDL_Window}, title::Ptr{UInt8})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowTitle(i8*, i8*) nounwind

        define void @main(i8* %window, i8* %title) {
        entry:
            call void @SDL_SetWindowTitle(i8* %window, i8* %title)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{UInt8}}, window, title)
    end

    # Original C signature: void SDL_SetWindowsMessageHook(SDL_WindowsMessageHook callback, void * userdata)
    function llvm_SDL_SetWindowsMessageHook(callback::Cvoid, userdata::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetWindowsMessageHook(void, i8*) nounwind

        define void @main(void %callback, i8* %userdata) {
        entry:
            call void @SDL_SetWindowsMessageHook(void %callback, i8* %userdata)
            ret void
        }
        """, "main"), Cvoid, Tuple{Cvoid, Ptr{Cvoid}}, callback, userdata)
    end

    # Original C signature: void SDL_SetYUVConversionMode(SDL_YUV_CONVERSION_MODE mode)
    function llvm_SDL_SetYUVConversionMode(mode::SDL_YUV_CONVERSION_MODE)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_SetYUVConversionMode(i8*) nounwind

        define void @main(i8* %mode) {
        entry:
            call void @SDL_SetYUVConversionMode(i8* %mode)
            ret void
        }
        """, "main"), Cvoid, Tuple{SDL_YUV_CONVERSION_MODE}, mode)
    end

    # Original C signature: int SDL_ShowCursor(int toggle)
    function llvm_SDL_ShowCursor(toggle::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ShowCursor(i32) nounwind

        define i32 @main(i32 %toggle) {
        entry:
            %result = call i32 @SDL_ShowCursor(i32 %toggle)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, toggle)
    end

    # Original C signature: int SDL_ShowMessageBox(const SDL_MessageBoxData * messageboxdata, int * buttonid)
    function llvm_SDL_ShowMessageBox(messageboxdata::Ptr{SDL_MessageBoxData}, buttonid::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ShowMessageBox(i8*, i8*) nounwind

        define i32 @main(i8* %messageboxdata, i8* %buttonid) {
        entry:
            %result = call i32 @SDL_ShowMessageBox(i8* %messageboxdata, i8* %buttonid)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_MessageBoxData}, Ptr{Int32}}, messageboxdata, buttonid)
    end

    # Original C signature: int SDL_ShowSimpleMessageBox(Uint32 flags, const char * title, const char * message, SDL_Window * window)
    function llvm_SDL_ShowSimpleMessageBox(flags::UInt32, title::Ptr{UInt8}, message::Ptr{UInt8}, window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ShowSimpleMessageBox(i32, i8*, i8*, i8*) nounwind

        define i32 @main(i32 %flags, i8* %title, i8* %message, i8* %window) {
        entry:
            %result = call i32 @SDL_ShowSimpleMessageBox(i32 %flags, i8* %title, i8* %message, i8* %window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{UInt32, Ptr{UInt8}, Ptr{UInt8}, Ptr{SDL_Window}}, flags, title, message, window)
    end

    # Original C signature: void SDL_ShowWindow(SDL_Window * window)
    function llvm_SDL_ShowWindow(window::Ptr{SDL_Window})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_ShowWindow(i8*) nounwind

        define void @main(i8* %window) {
        entry:
            call void @SDL_ShowWindow(i8* %window)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_SoftStretch(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect)
    function llvm_SDL_SoftStretch(src::Ptr{SDL_Surface}, srcrect::Ptr{SDL_Rect}, dst::Ptr{SDL_Surface}, dstrect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SoftStretch(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_SoftStretch(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}, Ptr{SDL_Surface}, Ptr{SDL_Rect}}, src, srcrect, dst, dstrect)
    end

    # Original C signature: int SDL_SoftStretchLinear(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect)
    function llvm_SDL_SoftStretchLinear(src::Ptr{SDL_Surface}, srcrect::Ptr{SDL_Rect}, dst::Ptr{SDL_Surface}, dstrect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_SoftStretchLinear(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_SoftStretchLinear(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}, Ptr{SDL_Surface}, Ptr{SDL_Rect}}, src, srcrect, dst, dstrect)
    end

    # Original C signature: void SDL_StartTextInput()
    function llvm_SDL_StartTextInput()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_StartTextInput() nounwind

        define void @main() {
        entry:
            call void @SDL_StartTextInput()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_StopTextInput()
    function llvm_SDL_StopTextInput()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_StopTextInput() nounwind

        define void @main() {
        entry:
            call void @SDL_StopTextInput()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_TLSCleanup()
    function llvm_SDL_TLSCleanup()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_TLSCleanup() nounwind

        define void @main() {
        entry:
            call void @SDL_TLSCleanup()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: SDL_TLSID SDL_TLSCreate()
    function llvm_SDL_TLSCreate()::SDL_TLSID
        Base.llvmcall(("""
        declare i8* @SDL_TLSCreate() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_TLSCreate()
            ret i8* %result
        }
        """, "main"), SDL_TLSID, Tuple{}, )
    end

    # Original C signature: void * SDL_TLSGet(SDL_TLSID id)
    function llvm_SDL_TLSGet(id::SDL_TLSID)::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @SDL_TLSGet(i8*) nounwind

        define i8* @main(i8* %id) {
        entry:
            %result = call i8* @SDL_TLSGet(i8* %id)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{SDL_TLSID}, id)
    end

    # Original C signature: SDL_threadID SDL_ThreadID()
    function llvm_SDL_ThreadID()::SDL_threadID
        Base.llvmcall(("""
        declare i8* @SDL_ThreadID() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_ThreadID()
            ret i8* %result
        }
        """, "main"), SDL_threadID, Tuple{}, )
    end

    # Original C signature: void SDL_UnionFRect(const SDL_FRect * A, const SDL_FRect * B, SDL_FRect * result)
    function llvm_SDL_UnionFRect(A::Ptr{SDL_FRect}, B::Ptr{SDL_FRect}, result::Ptr{SDL_FRect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnionFRect(i8*, i8*, i8*) nounwind

        define void @main(i8* %A, i8* %B, i8* %result) {
        entry:
            call void @SDL_UnionFRect(i8* %A, i8* %B, i8* %result)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_FRect}, Ptr{SDL_FRect}, Ptr{SDL_FRect}}, A, B, result)
    end

    # Original C signature: void SDL_UnionRect(const SDL_Rect * A, const SDL_Rect * B, SDL_Rect * result)
    function llvm_SDL_UnionRect(A::Ptr{SDL_Rect}, B::Ptr{SDL_Rect}, result::Ptr{SDL_Rect})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnionRect(i8*, i8*, i8*) nounwind

        define void @main(i8* %A, i8* %B, i8* %result) {
        entry:
            call void @SDL_UnionRect(i8* %A, i8* %B, i8* %result)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Rect}, Ptr{SDL_Rect}, Ptr{SDL_Rect}}, A, B, result)
    end

    # Original C signature: void SDL_UnloadObject(void * handle)
    function llvm_SDL_UnloadObject(handle::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnloadObject(i8*) nounwind

        define void @main(i8* %handle) {
        entry:
            call void @SDL_UnloadObject(i8* %handle)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Cvoid}}, handle)
    end

    # Original C signature: void SDL_UnlockAudio()
    function llvm_SDL_UnlockAudio()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnlockAudio() nounwind

        define void @main() {
        entry:
            call void @SDL_UnlockAudio()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_UnlockAudioDevice(SDL_AudioDeviceID dev)
    function llvm_SDL_UnlockAudioDevice(dev::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnlockAudioDevice(i32) nounwind

        define void @main(i32 %dev) {
        entry:
            call void @SDL_UnlockAudioDevice(i32 %dev)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, dev)
    end

    # Original C signature: void SDL_UnlockSensors()
    function llvm_SDL_UnlockSensors()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnlockSensors() nounwind

        define void @main() {
        entry:
            call void @SDL_UnlockSensors()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_UnlockSurface(SDL_Surface * surface)
    function llvm_SDL_UnlockSurface(surface::Ptr{SDL_Surface})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnlockSurface(i8*) nounwind

        define void @main(i8* %surface) {
        entry:
            call void @SDL_UnlockSurface(i8* %surface)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Surface}}, surface)
    end

    # Original C signature: void SDL_UnlockTexture(SDL_Texture * texture)
    function llvm_SDL_UnlockTexture(texture::Ptr{SDL_Texture})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnlockTexture(i8*) nounwind

        define void @main(i8* %texture) {
        entry:
            call void @SDL_UnlockTexture(i8* %texture)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Texture}}, texture)
    end

    # Original C signature: void SDL_UnregisterApp()
    function llvm_SDL_UnregisterApp()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_UnregisterApp() nounwind

        define void @main() {
        entry:
            call void @SDL_UnregisterApp()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_UpdateNVTexture(SDL_Texture * texture, const SDL_Rect * rect, const Uint8 * Yplane, int Ypitch, const Uint8 * UVplane, int UVpitch)
    function llvm_SDL_UpdateNVTexture(texture::Ptr{SDL_Texture}, rect::Ptr{SDL_Rect}, Yplane::Ptr{UInt8}, Ypitch::Int32, UVplane::Ptr{UInt8}, UVpitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpdateNVTexture(i8*, i8*, i8*, i32, i8*, i32) nounwind

        define i32 @main(i8* %texture, i8* %rect, i8* %Yplane, i32 %Ypitch, i8* %UVplane, i32 %UVpitch) {
        entry:
            %result = call i32 @SDL_UpdateNVTexture(i8* %texture, i8* %rect, i8* %Yplane, i32 %Ypitch, i8* %UVplane, i32 %UVpitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{UInt8}, Int32, Ptr{UInt8}, Int32}, texture, rect, Yplane, Ypitch, UVplane, UVpitch)
    end

    # Original C signature: int SDL_UpdateTexture(SDL_Texture * texture, const SDL_Rect * rect, const void * pixels, int pitch)
    function llvm_SDL_UpdateTexture(texture::Ptr{SDL_Texture}, rect::Ptr{SDL_Rect}, pixels::Ptr{Cvoid}, pitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpdateTexture(i8*, i8*, i8*, i32) nounwind

        define i32 @main(i8* %texture, i8* %rect, i8* %pixels, i32 %pitch) {
        entry:
            %result = call i32 @SDL_UpdateTexture(i8* %texture, i8* %rect, i8* %pixels, i32 %pitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{Cvoid}, Int32}, texture, rect, pixels, pitch)
    end

    # Original C signature: int SDL_UpdateWindowSurface(SDL_Window * window)
    function llvm_SDL_UpdateWindowSurface(window::Ptr{SDL_Window})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpdateWindowSurface(i8*) nounwind

        define i32 @main(i8* %window) {
        entry:
            %result = call i32 @SDL_UpdateWindowSurface(i8* %window)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}}, window)
    end

    # Original C signature: int SDL_UpdateWindowSurfaceRects(SDL_Window * window, const SDL_Rect * rects, int numrects)
    function llvm_SDL_UpdateWindowSurfaceRects(window::Ptr{SDL_Window}, rects::Ptr{SDL_Rect}, numrects::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpdateWindowSurfaceRects(i8*, i8*, i32) nounwind

        define i32 @main(i8* %window, i8* %rects, i32 %numrects) {
        entry:
            %result = call i32 @SDL_UpdateWindowSurfaceRects(i8* %window, i8* %rects, i32 %numrects)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Window}, Ptr{SDL_Rect}, Int32}, window, rects, numrects)
    end

    # Original C signature: int SDL_UpdateYUVTexture(SDL_Texture * texture, const SDL_Rect * rect, const Uint8 * Yplane, int Ypitch, const Uint8 * Uplane, int Upitch, const Uint8 * Vplane, int Vpitch)
    function llvm_SDL_UpdateYUVTexture(texture::Ptr{SDL_Texture}, rect::Ptr{SDL_Rect}, Yplane::Ptr{UInt8}, Ypitch::Int32, Uplane::Ptr{UInt8}, Upitch::Int32, Vplane::Ptr{UInt8}, Vpitch::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpdateYUVTexture(i8*, i8*, i8*, i32, i8*, i32, i8*, i32) nounwind

        define i32 @main(i8* %texture, i8* %rect, i8* %Yplane, i32 %Ypitch, i8* %Uplane, i32 %Upitch, i8* %Vplane, i32 %Vpitch) {
        entry:
            %result = call i32 @SDL_UpdateYUVTexture(i8* %texture, i8* %rect, i8* %Yplane, i32 %Ypitch, i8* %Uplane, i32 %Upitch, i8* %Vplane, i32 %Vpitch)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Texture}, Ptr{SDL_Rect}, Ptr{UInt8}, Int32, Ptr{UInt8}, Int32, Ptr{UInt8}, Int32}, texture, rect, Yplane, Ypitch, Uplane, Upitch, Vplane, Vpitch)
    end

    # Original C signature: int SDL_UpperBlitScaled(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect)
    function llvm_SDL_UpperBlitScaled(src::Ptr{SDL_Surface}, srcrect::Ptr{SDL_Rect}, dst::Ptr{SDL_Surface}, dstrect::Ptr{SDL_Rect})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_UpperBlitScaled(i8*, i8*, i8*, i8*) nounwind

        define i32 @main(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect) {
        entry:
            %result = call i32 @SDL_UpperBlitScaled(i8* %src, i8* %srcrect, i8* %dst, i8* %dstrect)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Surface}, Ptr{SDL_Rect}, Ptr{SDL_Surface}, Ptr{SDL_Rect}}, src, srcrect, dst, dstrect)
    end

    # Original C signature: int SDL_VideoInit(const char * driver_name)
    function llvm_SDL_VideoInit(driver_name::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_VideoInit(i8*) nounwind

        define i32 @main(i8* %driver_name) {
        entry:
            %result = call i32 @SDL_VideoInit(i8* %driver_name)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, driver_name)
    end

    # Original C signature: void SDL_VideoQuit()
    function llvm_SDL_VideoQuit()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_VideoQuit() nounwind

        define void @main() {
        entry:
            call void @SDL_VideoQuit()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void SDL_Vulkan_GetDrawableSize(SDL_Window * window, int * w, int * h)
    function llvm_SDL_Vulkan_GetDrawableSize(window::Ptr{SDL_Window}, w::Ptr{Int32}, h::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Vulkan_GetDrawableSize(i8*, i8*, i8*) nounwind

        define void @main(i8* %window, i8* %w, i8* %h) {
        entry:
            call void @SDL_Vulkan_GetDrawableSize(i8* %window, i8* %w, i8* %h)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Ptr{Int32}, Ptr{Int32}}, window, w, h)
    end

    # Original C signature: SDL_bool SDL_Vulkan_GetInstanceExtensions(SDL_Window * window, unsigned int * pCount, const char ** pNames)
    function llvm_SDL_Vulkan_GetInstanceExtensions(window::Ptr{SDL_Window}, pCount::Ptr{UInt32}, pNames::Ptr{Ptr{UInt8}})::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_Vulkan_GetInstanceExtensions(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %window, i8* %pCount, i8* %pNames) {
        entry:
            %result = call i32 @SDL_Vulkan_GetInstanceExtensions(i8* %window, i8* %pCount, i8* %pNames)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{SDL_Window}, Ptr{UInt32}, Ptr{Ptr{UInt8}}}, window, pCount, pNames)
    end

    # Original C signature: int SDL_Vulkan_LoadLibrary(const char * path)
    function llvm_SDL_Vulkan_LoadLibrary(path::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_Vulkan_LoadLibrary(i8*) nounwind

        define i32 @main(i8* %path) {
        entry:
            %result = call i32 @SDL_Vulkan_LoadLibrary(i8* %path)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, path)
    end

    # Original C signature: void SDL_Vulkan_UnloadLibrary()
    function llvm_SDL_Vulkan_UnloadLibrary()::Cvoid
        Base.llvmcall(("""
        declare void @SDL_Vulkan_UnloadLibrary() nounwind

        define void @main() {
        entry:
            call void @SDL_Vulkan_UnloadLibrary()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int SDL_WaitEvent(SDL_Event * event)
    function llvm_SDL_WaitEvent(event::Ptr{SDL_Event})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_WaitEvent(i8*) nounwind

        define i32 @main(i8* %event) {
        entry:
            %result = call i32 @SDL_WaitEvent(i8* %event)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}}, event)
    end

    # Original C signature: int SDL_WaitEventTimeout(SDL_Event * event, int timeout)
    function llvm_SDL_WaitEventTimeout(event::Ptr{SDL_Event}, timeout::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_WaitEventTimeout(i8*, i32) nounwind

        define i32 @main(i8* %event, i32 %timeout) {
        entry:
            %result = call i32 @SDL_WaitEventTimeout(i8* %event, i32 %timeout)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_Event}, Int32}, event, timeout)
    end

    # Original C signature: void SDL_WaitThread(SDL_Thread * thread, int * status)
    function llvm_SDL_WaitThread(thread::Ptr{SDL_Thread}, status::Ptr{Int32})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_WaitThread(i8*, i8*) nounwind

        define void @main(i8* %thread, i8* %status) {
        entry:
            call void @SDL_WaitThread(i8* %thread, i8* %status)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Thread}, Ptr{Int32}}, thread, status)
    end

    # Original C signature: int SDL_WarpMouseGlobal(int x, int y)
    function llvm_SDL_WarpMouseGlobal(x::Int32, y::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_WarpMouseGlobal(i32, i32) nounwind

        define i32 @main(i32 %x, i32 %y) {
        entry:
            %result = call i32 @SDL_WarpMouseGlobal(i32 %x, i32 %y)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, x, y)
    end

    # Original C signature: void SDL_WarpMouseInWindow(SDL_Window * window, int x, int y)
    function llvm_SDL_WarpMouseInWindow(window::Ptr{SDL_Window}, x::Int32, y::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_WarpMouseInWindow(i8*, i32, i32) nounwind

        define void @main(i8* %window, i32 %x, i32 %y) {
        entry:
            call void @SDL_WarpMouseInWindow(i8* %window, i32 %x, i32 %y)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_Window}, Int32, Int32}, window, x, y)
    end

    # Original C signature: Uint32 SDL_WasInit(Uint32 flags)
    function llvm_SDL_WasInit(flags::UInt32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_WasInit(i32) nounwind

        define i32 @main(i32 %flags) {
        entry:
            %result = call i32 @SDL_WasInit(i32 %flags)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32}, flags)
    end

    # Original C signature: SDL_WinRT_DeviceFamily SDL_WinRTGetDeviceFamily()
    function llvm_SDL_WinRTGetDeviceFamily()::SDL_WinRT_DeviceFamily
        Base.llvmcall(("""
        declare i8* @SDL_WinRTGetDeviceFamily() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @SDL_WinRTGetDeviceFamily()
            ret i8* %result
        }
        """, "main"), SDL_WinRT_DeviceFamily, Tuple{}, )
    end

    # Original C signature: int SDL_WinRTRunApp(SDL_main_func mainFunction, void * reserved)
    function llvm_SDL_WinRTRunApp(mainFunction::SDL_main_func, reserved::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_WinRTRunApp(i8*, i8*) nounwind

        define i32 @main(i8* %mainFunction, i8* %reserved) {
        entry:
            %result = call i32 @SDL_WinRTRunApp(i8* %mainFunction, i8* %reserved)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{SDL_main_func, Ptr{Cvoid}}, mainFunction, reserved)
    end

    # Original C signature: size_t SDL_WriteBE16(SDL_RWops * dst, Uint16 value)
    function llvm_SDL_WriteBE16(dst::Ptr{SDL_RWops}, value::UInt16)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteBE16(i8*, i16) nounwind

        define i8* @main(i8* %dst, i16 %value) {
        entry:
            %result = call i8* @SDL_WriteBE16(i8* %dst, i16 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt16}, dst, value)
    end

    # Original C signature: size_t SDL_WriteBE32(SDL_RWops * dst, Uint32 value)
    function llvm_SDL_WriteBE32(dst::Ptr{SDL_RWops}, value::UInt32)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteBE32(i8*, i32) nounwind

        define i8* @main(i8* %dst, i32 %value) {
        entry:
            %result = call i8* @SDL_WriteBE32(i8* %dst, i32 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt32}, dst, value)
    end

    # Original C signature: size_t SDL_WriteBE64(SDL_RWops * dst, Uint64 value)
    function llvm_SDL_WriteBE64(dst::Ptr{SDL_RWops}, value::UInt64)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteBE64(i8*, i64) nounwind

        define i8* @main(i8* %dst, i64 %value) {
        entry:
            %result = call i8* @SDL_WriteBE64(i8* %dst, i64 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt64}, dst, value)
    end

    # Original C signature: size_t SDL_WriteLE16(SDL_RWops * dst, Uint16 value)
    function llvm_SDL_WriteLE16(dst::Ptr{SDL_RWops}, value::UInt16)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteLE16(i8*, i16) nounwind

        define i8* @main(i8* %dst, i16 %value) {
        entry:
            %result = call i8* @SDL_WriteLE16(i8* %dst, i16 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt16}, dst, value)
    end

    # Original C signature: size_t SDL_WriteLE32(SDL_RWops * dst, Uint32 value)
    function llvm_SDL_WriteLE32(dst::Ptr{SDL_RWops}, value::UInt32)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteLE32(i8*, i32) nounwind

        define i8* @main(i8* %dst, i32 %value) {
        entry:
            %result = call i8* @SDL_WriteLE32(i8* %dst, i32 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt32}, dst, value)
    end

    # Original C signature: size_t SDL_WriteLE64(SDL_RWops * dst, Uint64 value)
    function llvm_SDL_WriteLE64(dst::Ptr{SDL_RWops}, value::UInt64)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteLE64(i8*, i64) nounwind

        define i8* @main(i8* %dst, i64 %value) {
        entry:
            %result = call i8* @SDL_WriteLE64(i8* %dst, i64 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt64}, dst, value)
    end

    # Original C signature: size_t SDL_WriteU8(SDL_RWops * dst, Uint8 value)
    function llvm_SDL_WriteU8(dst::Ptr{SDL_RWops}, value::UInt8)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_WriteU8(i8*, i8) nounwind

        define i8* @main(i8* %dst, i8 %value) {
        entry:
            %result = call i8* @SDL_WriteU8(i8* %dst, i8 %value)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{SDL_RWops}, UInt8}, dst, value)
    end

    # Original C signature: int SDL_abs(int x)
    function llvm_SDL_abs(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_abs(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_abs(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: double SDL_acos(double x)
    function llvm_SDL_acos(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_acos(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_acos(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_acosf(float x)
    function llvm_SDL_acosf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_acosf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_acosf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_asin(double x)
    function llvm_SDL_asin(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_asin(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_asin(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_asinf(float x)
    function llvm_SDL_asinf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_asinf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_asinf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_atan(double x)
    function llvm_SDL_atan(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_atan(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_atan(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: double SDL_atan2(double y, double x)
    function llvm_SDL_atan2(y::Float64, x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_atan2(double, double) nounwind

        define double @main(double %y, double %x) {
        entry:
            %result = call double @SDL_atan2(double %y, double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64, Float64}, y, x)
    end

    # Original C signature: float SDL_atan2f(float y, float x)
    function llvm_SDL_atan2f(y::Float32, x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_atan2f(float, float) nounwind

        define float @main(float %y, float %x) {
        entry:
            %result = call float @SDL_atan2f(float %y, float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32, Float32}, y, x)
    end

    # Original C signature: float SDL_atanf(float x)
    function llvm_SDL_atanf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_atanf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_atanf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_atof(const char * str)
    function llvm_SDL_atof(str::Ptr{UInt8})::Float64
        Base.llvmcall(("""
        declare double @SDL_atof(i8*) nounwind

        define double @main(i8* %str) {
        entry:
            %result = call double @SDL_atof(i8* %str)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: int SDL_atoi(const char * str)
    function llvm_SDL_atoi(str::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_atoi(i8*) nounwind

        define i32 @main(i8* %str) {
        entry:
            %result = call i32 @SDL_atoi(i8* %str)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: double SDL_ceil(double x)
    function llvm_SDL_ceil(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_ceil(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_ceil(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_ceilf(float x)
    function llvm_SDL_ceilf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_ceilf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_ceilf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_copysign(double x, double y)
    function llvm_SDL_copysign(x::Float64, y::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_copysign(double, double) nounwind

        define double @main(double %x, double %y) {
        entry:
            %result = call double @SDL_copysign(double %x, double %y)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64, Float64}, x, y)
    end

    # Original C signature: float SDL_copysignf(float x, float y)
    function llvm_SDL_copysignf(x::Float32, y::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_copysignf(float, float) nounwind

        define float @main(float %x, float %y) {
        entry:
            %result = call float @SDL_copysignf(float %x, float %y)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32, Float32}, x, y)
    end

    # Original C signature: double SDL_cos(double x)
    function llvm_SDL_cos(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_cos(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_cos(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_cosf(float x)
    function llvm_SDL_cosf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_cosf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_cosf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: Uint16 SDL_crc16(Uint16 crc, const void * data, size_t len)
    function llvm_SDL_crc16(crc::UInt16, data::Ptr{Cvoid}, len::Csize_t)::UInt16
        Base.llvmcall(("""
        declare i16 @SDL_crc16(i16, i8*, i8*) nounwind

        define i16 @main(i16 %crc, i8* %data, i8* %len) {
        entry:
            %result = call i16 @SDL_crc16(i16 %crc, i8* %data, i8* %len)
            ret i16 %result
        }
        """, "main"), UInt16, Tuple{UInt16, Ptr{Cvoid}, Csize_t}, crc, data, len)
    end

    # Original C signature: Uint32 SDL_crc32(Uint32 crc, const void * data, size_t len)
    function llvm_SDL_crc32(crc::UInt32, data::Ptr{Cvoid}, len::Csize_t)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_crc32(i32, i8*, i8*) nounwind

        define i32 @main(i32 %crc, i8* %data, i8* %len) {
        entry:
            %result = call i32 @SDL_crc32(i32 %crc, i8* %data, i8* %len)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{UInt32, Ptr{Cvoid}, Csize_t}, crc, data, len)
    end

    # Original C signature: double SDL_exp(double x)
    function llvm_SDL_exp(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_exp(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_exp(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_expf(float x)
    function llvm_SDL_expf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_expf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_expf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_fabs(double x)
    function llvm_SDL_fabs(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_fabs(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_fabs(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_fabsf(float x)
    function llvm_SDL_fabsf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_fabsf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_fabsf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_floor(double x)
    function llvm_SDL_floor(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_floor(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_floor(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_floorf(float x)
    function llvm_SDL_floorf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_floorf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_floorf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_fmod(double x, double y)
    function llvm_SDL_fmod(x::Float64, y::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_fmod(double, double) nounwind

        define double @main(double %x, double %y) {
        entry:
            %result = call double @SDL_fmod(double %x, double %y)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64, Float64}, x, y)
    end

    # Original C signature: float SDL_fmodf(float x, float y)
    function llvm_SDL_fmodf(x::Float32, y::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_fmodf(float, float) nounwind

        define float @main(float %x, float %y) {
        entry:
            %result = call float @SDL_fmodf(float %x, float %y)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32, Float32}, x, y)
    end

    # Original C signature: void SDL_free(void * mem)
    function llvm_SDL_free(mem::Ptr{Cvoid})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_free(i8*) nounwind

        define void @main(i8* %mem) {
        entry:
            call void @SDL_free(i8* %mem)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Cvoid}}, mem)
    end

    # Original C signature: void SDL_hid_ble_scan(SDL_bool active)
    function llvm_SDL_hid_ble_scan(active::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_hid_ble_scan(i32) nounwind

        define void @main(i32 %active) {
        entry:
            call void @SDL_hid_ble_scan(i32 %active)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, active)
    end

    # Original C signature: void SDL_hid_close(SDL_hid_device * dev)
    function llvm_SDL_hid_close(dev::Ptr{SDL_hid_device})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_hid_close(i8*) nounwind

        define void @main(i8* %dev) {
        entry:
            call void @SDL_hid_close(i8* %dev)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_hid_device}}, dev)
    end

    # Original C signature: Uint32 SDL_hid_device_change_count()
    function llvm_SDL_hid_device_change_count()::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_hid_device_change_count() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_hid_device_change_count()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: int SDL_hid_exit()
    function llvm_SDL_hid_exit()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_exit() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_hid_exit()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: void SDL_hid_free_enumeration(SDL_hid_device_info * devs)
    function llvm_SDL_hid_free_enumeration(devs::Ptr{SDL_hid_device_info})::Cvoid
        Base.llvmcall(("""
        declare void @SDL_hid_free_enumeration(i8*) nounwind

        define void @main(i8* %devs) {
        entry:
            call void @SDL_hid_free_enumeration(i8* %devs)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{SDL_hid_device_info}}, devs)
    end

    # Original C signature: int SDL_hid_get_indexed_string(SDL_hid_device * dev, int string_index, wchar_t * string, size_t maxlen)
    function llvm_SDL_hid_get_indexed_string(dev::Ptr{SDL_hid_device}, string_index::Int32, string::Ptr{Cwchar_t}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_get_indexed_string(i8*, i32, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i32 %string_index, i8* %string, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_hid_get_indexed_string(i8* %dev, i32 %string_index, i8* %string, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Int32, Ptr{Cwchar_t}, Csize_t}, dev, string_index, string, maxlen)
    end

    # Original C signature: int SDL_hid_get_manufacturer_string(SDL_hid_device * dev, wchar_t * string, size_t maxlen)
    function llvm_SDL_hid_get_manufacturer_string(dev::Ptr{SDL_hid_device}, string::Ptr{Cwchar_t}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_get_manufacturer_string(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %string, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_hid_get_manufacturer_string(i8* %dev, i8* %string, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{Cwchar_t}, Csize_t}, dev, string, maxlen)
    end

    # Original C signature: int SDL_hid_get_product_string(SDL_hid_device * dev, wchar_t * string, size_t maxlen)
    function llvm_SDL_hid_get_product_string(dev::Ptr{SDL_hid_device}, string::Ptr{Cwchar_t}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_get_product_string(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %string, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_hid_get_product_string(i8* %dev, i8* %string, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{Cwchar_t}, Csize_t}, dev, string, maxlen)
    end

    # Original C signature: int SDL_hid_get_serial_number_string(SDL_hid_device * dev, wchar_t * string, size_t maxlen)
    function llvm_SDL_hid_get_serial_number_string(dev::Ptr{SDL_hid_device}, string::Ptr{Cwchar_t}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_get_serial_number_string(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %string, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_hid_get_serial_number_string(i8* %dev, i8* %string, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{Cwchar_t}, Csize_t}, dev, string, maxlen)
    end

    # Original C signature: int SDL_hid_init()
    function llvm_SDL_hid_init()::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_init() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @SDL_hid_init()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int SDL_hid_read(SDL_hid_device * dev, unsigned char * data, size_t length)
    function llvm_SDL_hid_read(dev::Ptr{SDL_hid_device}, data::Ptr{UInt8}, length::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_read(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %data, i8* %length) {
        entry:
            %result = call i32 @SDL_hid_read(i8* %dev, i8* %data, i8* %length)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{UInt8}, Csize_t}, dev, data, length)
    end

    # Original C signature: int SDL_hid_read_timeout(SDL_hid_device * dev, unsigned char * data, size_t length, int milliseconds)
    function llvm_SDL_hid_read_timeout(dev::Ptr{SDL_hid_device}, data::Ptr{UInt8}, length::Csize_t, milliseconds::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_read_timeout(i8*, i8*, i8*, i32) nounwind

        define i32 @main(i8* %dev, i8* %data, i8* %length, i32 %milliseconds) {
        entry:
            %result = call i32 @SDL_hid_read_timeout(i8* %dev, i8* %data, i8* %length, i32 %milliseconds)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{UInt8}, Csize_t, Int32}, dev, data, length, milliseconds)
    end

    # Original C signature: int SDL_hid_send_feature_report(SDL_hid_device * dev, const unsigned char * data, size_t length)
    function llvm_SDL_hid_send_feature_report(dev::Ptr{SDL_hid_device}, data::Ptr{UInt8}, length::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_send_feature_report(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %data, i8* %length) {
        entry:
            %result = call i32 @SDL_hid_send_feature_report(i8* %dev, i8* %data, i8* %length)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{UInt8}, Csize_t}, dev, data, length)
    end

    # Original C signature: int SDL_hid_set_nonblocking(SDL_hid_device * dev, int nonblock)
    function llvm_SDL_hid_set_nonblocking(dev::Ptr{SDL_hid_device}, nonblock::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_set_nonblocking(i8*, i32) nounwind

        define i32 @main(i8* %dev, i32 %nonblock) {
        entry:
            %result = call i32 @SDL_hid_set_nonblocking(i8* %dev, i32 %nonblock)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Int32}, dev, nonblock)
    end

    # Original C signature: int SDL_hid_write(SDL_hid_device * dev, const unsigned char * data, size_t length)
    function llvm_SDL_hid_write(dev::Ptr{SDL_hid_device}, data::Ptr{UInt8}, length::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_hid_write(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %dev, i8* %data, i8* %length) {
        entry:
            %result = call i32 @SDL_hid_write(i8* %dev, i8* %data, i8* %length)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{SDL_hid_device}, Ptr{UInt8}, Csize_t}, dev, data, length)
    end

    # Original C signature: void SDL_iPhoneSetEventPump(SDL_bool enabled)
    function llvm_SDL_iPhoneSetEventPump(enabled::UInt32)::Cvoid
        Base.llvmcall(("""
        declare void @SDL_iPhoneSetEventPump(i32) nounwind

        define void @main(i32 %enabled) {
        entry:
            call void @SDL_iPhoneSetEventPump(i32 %enabled)
            ret void
        }
        """, "main"), Cvoid, Tuple{UInt32}, enabled)
    end

    # Original C signature: size_t SDL_iconv(SDL_iconv_t cd, const char ** inbuf, size_t * inbytesleft, char ** outbuf, size_t * outbytesleft)
    function llvm_SDL_iconv(cd::SDL_iconv_t, inbuf::Ptr{Ptr{UInt8}}, inbytesleft::Ptr{Csize_t}, outbuf::Ptr{Ptr{UInt8}}, outbytesleft::Ptr{Csize_t})::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_iconv(i8*, i8*, i8*, i8*, i8*) nounwind

        define i8* @main(i8* %cd, i8* %inbuf, i8* %inbytesleft, i8* %outbuf, i8* %outbytesleft) {
        entry:
            %result = call i8* @SDL_iconv(i8* %cd, i8* %inbuf, i8* %inbytesleft, i8* %outbuf, i8* %outbytesleft)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{SDL_iconv_t, Ptr{Ptr{UInt8}}, Ptr{Csize_t}, Ptr{Ptr{UInt8}}, Ptr{Csize_t}}, cd, inbuf, inbytesleft, outbuf, outbytesleft)
    end

    # Original C signature: int SDL_iconv_close(SDL_iconv_t cd)
    function llvm_SDL_iconv_close(cd::SDL_iconv_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_iconv_close(i8*) nounwind

        define i32 @main(i8* %cd) {
        entry:
            %result = call i32 @SDL_iconv_close(i8* %cd)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{SDL_iconv_t}, cd)
    end

    # Original C signature: SDL_iconv_t SDL_iconv_open(const char * tocode, const char * fromcode)
    function llvm_SDL_iconv_open(tocode::Ptr{UInt8}, fromcode::Ptr{UInt8})::SDL_iconv_t
        Base.llvmcall(("""
        declare i8* @SDL_iconv_open(i8*, i8*) nounwind

        define i8* @main(i8* %tocode, i8* %fromcode) {
        entry:
            %result = call i8* @SDL_iconv_open(i8* %tocode, i8* %fromcode)
            ret i8* %result
        }
        """, "main"), SDL_iconv_t, Tuple{Ptr{UInt8}, Ptr{UInt8}}, tocode, fromcode)
    end

    # Original C signature: int SDL_isalnum(int x)
    function llvm_SDL_isalnum(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isalnum(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isalnum(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isalpha(int x)
    function llvm_SDL_isalpha(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isalpha(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isalpha(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isblank(int x)
    function llvm_SDL_isblank(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isblank(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isblank(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_iscntrl(int x)
    function llvm_SDL_iscntrl(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_iscntrl(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_iscntrl(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isdigit(int x)
    function llvm_SDL_isdigit(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isdigit(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isdigit(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isgraph(int x)
    function llvm_SDL_isgraph(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isgraph(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isgraph(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_islower(int x)
    function llvm_SDL_islower(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_islower(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_islower(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isprint(int x)
    function llvm_SDL_isprint(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isprint(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isprint(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_ispunct(int x)
    function llvm_SDL_ispunct(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_ispunct(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_ispunct(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isspace(int x)
    function llvm_SDL_isspace(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isspace(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isspace(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isupper(int x)
    function llvm_SDL_isupper(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isupper(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isupper(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_isxdigit(int x)
    function llvm_SDL_isxdigit(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_isxdigit(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_isxdigit(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: double SDL_log(double x)
    function llvm_SDL_log(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_log(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_log(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: double SDL_log10(double x)
    function llvm_SDL_log10(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_log10(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_log10(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_log10f(float x)
    function llvm_SDL_log10f(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_log10f(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_log10f(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: float SDL_logf(float x)
    function llvm_SDL_logf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_logf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_logf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: long SDL_lround(double x)
    function llvm_SDL_lround(x::Float64)::long
        Base.llvmcall(("""
        declare i8* @SDL_lround(double) nounwind

        define i8* @main(double %x) {
        entry:
            %result = call i8* @SDL_lround(double %x)
            ret i8* %result
        }
        """, "main"), long, Tuple{Float64}, x)
    end

    # Original C signature: long SDL_lroundf(float x)
    function llvm_SDL_lroundf(x::Float32)::long
        Base.llvmcall(("""
        declare i8* @SDL_lroundf(float) nounwind

        define i8* @main(float %x) {
        entry:
            %result = call i8* @SDL_lroundf(float %x)
            ret i8* %result
        }
        """, "main"), long, Tuple{Float32}, x)
    end

    # Original C signature: int SDL_memcmp(const void * s1, const void * s2, size_t len)
    function llvm_SDL_memcmp(s1::Ptr{Cvoid}, s2::Ptr{Cvoid}, len::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_memcmp(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %s1, i8* %s2, i8* %len) {
        entry:
            %result = call i32 @SDL_memcmp(i8* %s1, i8* %s2, i8* %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}, Ptr{Cvoid}, Csize_t}, s1, s2, len)
    end

    # Original C signature: double SDL_pow(double x, double y)
    function llvm_SDL_pow(x::Float64, y::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_pow(double, double) nounwind

        define double @main(double %x, double %y) {
        entry:
            %result = call double @SDL_pow(double %x, double %y)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64, Float64}, x, y)
    end

    # Original C signature: float SDL_powf(float x, float y)
    function llvm_SDL_powf(x::Float32, y::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_powf(float, float) nounwind

        define float @main(float %x, float %y) {
        entry:
            %result = call float @SDL_powf(float %x, float %y)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32, Float32}, x, y)
    end

    # Original C signature: double SDL_round(double x)
    function llvm_SDL_round(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_round(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_round(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_roundf(float x)
    function llvm_SDL_roundf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_roundf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_roundf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_scalbn(double x, int n)
    function llvm_SDL_scalbn(x::Float64, n::Int32)::Float64
        Base.llvmcall(("""
        declare double @SDL_scalbn(double, i32) nounwind

        define double @main(double %x, i32 %n) {
        entry:
            %result = call double @SDL_scalbn(double %x, i32 %n)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64, Int32}, x, n)
    end

    # Original C signature: float SDL_scalbnf(float x, int n)
    function llvm_SDL_scalbnf(x::Float32, n::Int32)::Float32
        Base.llvmcall(("""
        declare float @SDL_scalbnf(float, i32) nounwind

        define float @main(float %x, i32 %n) {
        entry:
            %result = call float @SDL_scalbnf(float %x, i32 %n)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32, Int32}, x, n)
    end

    # Original C signature: int SDL_setenv(const char * name, const char * value, int overwrite)
    function llvm_SDL_setenv(name::Ptr{UInt8}, value::Ptr{UInt8}, overwrite::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_setenv(i8*, i8*, i32) nounwind

        define i32 @main(i8* %name, i8* %value, i32 %overwrite) {
        entry:
            %result = call i32 @SDL_setenv(i8* %name, i8* %value, i32 %overwrite)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Ptr{UInt8}, Int32}, name, value, overwrite)
    end

    # Original C signature: double SDL_sin(double x)
    function llvm_SDL_sin(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_sin(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_sin(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_sinf(float x)
    function llvm_SDL_sinf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_sinf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_sinf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: double SDL_sqrt(double x)
    function llvm_SDL_sqrt(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_sqrt(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_sqrt(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_sqrtf(float x)
    function llvm_SDL_sqrtf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_sqrtf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_sqrtf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: int SDL_strcasecmp(const char * str1, const char * str2)
    function llvm_SDL_strcasecmp(str1::Ptr{UInt8}, str2::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_strcasecmp(i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2) {
        entry:
            %result = call i32 @SDL_strcasecmp(i8* %str1, i8* %str2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Ptr{UInt8}}, str1, str2)
    end

    # Original C signature: int SDL_strcmp(const char * str1, const char * str2)
    function llvm_SDL_strcmp(str1::Ptr{UInt8}, str2::Ptr{UInt8})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_strcmp(i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2) {
        entry:
            %result = call i32 @SDL_strcmp(i8* %str1, i8* %str2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Ptr{UInt8}}, str1, str2)
    end

    # Original C signature: size_t SDL_strlen(const char * str)
    function llvm_SDL_strlen(str::Ptr{UInt8})::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_strlen(i8*) nounwind

        define i8* @main(i8* %str) {
        entry:
            %result = call i8* @SDL_strlen(i8* %str)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: int SDL_strncasecmp(const char * str1, const char * str2, size_t len)
    function llvm_SDL_strncasecmp(str1::Ptr{UInt8}, str2::Ptr{UInt8}, len::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_strncasecmp(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2, i8* %len) {
        entry:
            %result = call i32 @SDL_strncasecmp(i8* %str1, i8* %str2, i8* %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Ptr{UInt8}, Csize_t}, str1, str2, len)
    end

    # Original C signature: int SDL_strncmp(const char * str1, const char * str2, size_t maxlen)
    function llvm_SDL_strncmp(str1::Ptr{UInt8}, str2::Ptr{UInt8}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_strncmp(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_strncmp(i8* %str1, i8* %str2, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{UInt8}, Ptr{UInt8}, Csize_t}, str1, str2, maxlen)
    end

    # Original C signature: double SDL_strtod(const char * str, char ** endp)
    function llvm_SDL_strtod(str::Ptr{UInt8}, endp::Ptr{Ptr{UInt8}})::Float64
        Base.llvmcall(("""
        declare double @SDL_strtod(i8*, i8*) nounwind

        define double @main(i8* %str, i8* %endp) {
        entry:
            %result = call double @SDL_strtod(i8* %str, i8* %endp)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{UInt8}, Ptr{Ptr{UInt8}}}, str, endp)
    end

    # Original C signature: long SDL_strtol(const char * str, char ** endp, int base)
    function llvm_SDL_strtol(str::Ptr{UInt8}, endp::Ptr{Ptr{UInt8}}, base::Int32)::long
        Base.llvmcall(("""
        declare i8* @SDL_strtol(i8*, i8*, i32) nounwind

        define i8* @main(i8* %str, i8* %endp, i32 %base) {
        entry:
            %result = call i8* @SDL_strtol(i8* %str, i8* %endp, i32 %base)
            ret i8* %result
        }
        """, "main"), long, Tuple{Ptr{UInt8}, Ptr{Ptr{UInt8}}, Int32}, str, endp, base)
    end

    # Original C signature: Sint64 SDL_strtoll(const char * str, char ** endp, int base)
    function llvm_SDL_strtoll(str::Ptr{UInt8}, endp::Ptr{Ptr{UInt8}}, base::Int32)::Int64
        Base.llvmcall(("""
        declare i64 @SDL_strtoll(i8*, i8*, i32) nounwind

        define i64 @main(i8* %str, i8* %endp, i32 %base) {
        entry:
            %result = call i64 @SDL_strtoll(i8* %str, i8* %endp, i32 %base)
            ret i64 %result
        }
        """, "main"), Int64, Tuple{Ptr{UInt8}, Ptr{Ptr{UInt8}}, Int32}, str, endp, base)
    end

    # Original C signature: unsigned long SDL_strtoul(const char * str, char ** endp, int base)
    function llvm_SDL_strtoul(str::Ptr{UInt8}, endp::Ptr{Ptr{UInt8}}, base::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @SDL_strtoul(i8*, i8*, i32) nounwind

        define i32 @main(i8* %str, i8* %endp, i32 %base) {
        entry:
            %result = call i32 @SDL_strtoul(i8* %str, i8* %endp, i32 %base)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{UInt8}, Ptr{Ptr{UInt8}}, Int32}, str, endp, base)
    end

    # Original C signature: Uint64 SDL_strtoull(const char * str, char ** endp, int base)
    function llvm_SDL_strtoull(str::Ptr{UInt8}, endp::Ptr{Ptr{UInt8}}, base::Int32)::UInt64
        Base.llvmcall(("""
        declare i64 @SDL_strtoull(i8*, i8*, i32) nounwind

        define i64 @main(i8* %str, i8* %endp, i32 %base) {
        entry:
            %result = call i64 @SDL_strtoull(i8* %str, i8* %endp, i32 %base)
            ret i64 %result
        }
        """, "main"), UInt64, Tuple{Ptr{UInt8}, Ptr{Ptr{UInt8}}, Int32}, str, endp, base)
    end

    # Original C signature: double SDL_tan(double x)
    function llvm_SDL_tan(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_tan(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_tan(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_tanf(float x)
    function llvm_SDL_tanf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_tanf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_tanf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: int SDL_tolower(int x)
    function llvm_SDL_tolower(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_tolower(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_tolower(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: int SDL_toupper(int x)
    function llvm_SDL_toupper(x::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_toupper(i32) nounwind

        define i32 @main(i32 %x) {
        entry:
            %result = call i32 @SDL_toupper(i32 %x)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, x)
    end

    # Original C signature: double SDL_trunc(double x)
    function llvm_SDL_trunc(x::Float64)::Float64
        Base.llvmcall(("""
        declare double @SDL_trunc(double) nounwind

        define double @main(double %x) {
        entry:
            %result = call double @SDL_trunc(double %x)
            ret double %result
        }
        """, "main"), Float64, Tuple{Float64}, x)
    end

    # Original C signature: float SDL_truncf(float x)
    function llvm_SDL_truncf(x::Float32)::Float32
        Base.llvmcall(("""
        declare float @SDL_truncf(float) nounwind

        define float @main(float %x) {
        entry:
            %result = call float @SDL_truncf(float %x)
            ret float %result
        }
        """, "main"), Float32, Tuple{Float32}, x)
    end

    # Original C signature: size_t SDL_utf8strlen(const char * str)
    function llvm_SDL_utf8strlen(str::Ptr{UInt8})::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_utf8strlen(i8*) nounwind

        define i8* @main(i8* %str) {
        entry:
            %result = call i8* @SDL_utf8strlen(i8* %str)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{UInt8}}, str)
    end

    # Original C signature: size_t SDL_utf8strnlen(const char * str, size_t bytes)
    function llvm_SDL_utf8strnlen(str::Ptr{UInt8}, bytes::Csize_t)::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_utf8strnlen(i8*, i8*) nounwind

        define i8* @main(i8* %str, i8* %bytes) {
        entry:
            %result = call i8* @SDL_utf8strnlen(i8* %str, i8* %bytes)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{UInt8}, Csize_t}, str, bytes)
    end

    # Original C signature: int SDL_wcscasecmp(const wchar_t * str1, const wchar_t * str2)
    function llvm_SDL_wcscasecmp(str1::Ptr{Cwchar_t}, str2::Ptr{Cwchar_t})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_wcscasecmp(i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2) {
        entry:
            %result = call i32 @SDL_wcscasecmp(i8* %str1, i8* %str2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cwchar_t}, Ptr{Cwchar_t}}, str1, str2)
    end

    # Original C signature: int SDL_wcscmp(const wchar_t * str1, const wchar_t * str2)
    function llvm_SDL_wcscmp(str1::Ptr{Cwchar_t}, str2::Ptr{Cwchar_t})::Int32
        Base.llvmcall(("""
        declare i32 @SDL_wcscmp(i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2) {
        entry:
            %result = call i32 @SDL_wcscmp(i8* %str1, i8* %str2)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cwchar_t}, Ptr{Cwchar_t}}, str1, str2)
    end

    # Original C signature: size_t SDL_wcslen(const wchar_t * wstr)
    function llvm_SDL_wcslen(wstr::Ptr{Cwchar_t})::Csize_t
        Base.llvmcall(("""
        declare i8* @SDL_wcslen(i8*) nounwind

        define i8* @main(i8* %wstr) {
        entry:
            %result = call i8* @SDL_wcslen(i8* %wstr)
            ret i8* %result
        }
        """, "main"), Csize_t, Tuple{Ptr{Cwchar_t}}, wstr)
    end

    # Original C signature: int SDL_wcsncasecmp(const wchar_t * str1, const wchar_t * str2, size_t len)
    function llvm_SDL_wcsncasecmp(str1::Ptr{Cwchar_t}, str2::Ptr{Cwchar_t}, len::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_wcsncasecmp(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2, i8* %len) {
        entry:
            %result = call i32 @SDL_wcsncasecmp(i8* %str1, i8* %str2, i8* %len)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cwchar_t}, Ptr{Cwchar_t}, Csize_t}, str1, str2, len)
    end

    # Original C signature: int SDL_wcsncmp(const wchar_t * str1, const wchar_t * str2, size_t maxlen)
    function llvm_SDL_wcsncmp(str1::Ptr{Cwchar_t}, str2::Ptr{Cwchar_t}, maxlen::Csize_t)::Int32
        Base.llvmcall(("""
        declare i32 @SDL_wcsncmp(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %str1, i8* %str2, i8* %maxlen) {
        entry:
            %result = call i32 @SDL_wcsncmp(i8* %str1, i8* %str2, i8* %maxlen)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cwchar_t}, Ptr{Cwchar_t}, Csize_t}, str1, str2, maxlen)
    end