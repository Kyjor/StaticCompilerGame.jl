# Auto-generated SDL bindings using llvmcall
# Headers: emsdk/upstream/emscripten/cache/ports/sdl2_mixer/SDL_mixer-release-2.8.0/include



    # Original C signature: int Mix_AllocateChannels(int numchans)
    function llvm_Mix_AllocateChannels(numchans::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_AllocateChannels(i32) nounwind

        define i32 @main(i32 %numchans) {
        entry:
            %result = call i32 @Mix_AllocateChannels(i32 %numchans)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, numchans)
    end

    # Original C signature: void Mix_CloseAudio()
    function llvm_Mix_CloseAudio()::Cvoid
        Base.llvmcall(("""
        declare void @Mix_CloseAudio() nounwind

        define void @main() {
        entry:
            call void @Mix_CloseAudio()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int Mix_ExpireChannel(int channel, int ticks)
    function llvm_Mix_ExpireChannel(channel::Int32, ticks::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_ExpireChannel(i32, i32) nounwind

        define i32 @main(i32 %channel, i32 %ticks) {
        entry:
            %result = call i32 @Mix_ExpireChannel(i32 %channel, i32 %ticks)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, channel, ticks)
    end

    # Original C signature: int Mix_FadeInChannel(int channel, Mix_Chunk * chunk, int loops, int ms)
    function llvm_Mix_FadeInChannel(channel::Int32, chunk::Ptr{Mix_Chunk}, loops::Int32, ms::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeInChannel(i32, i8*, i32, i32) nounwind

        define i32 @main(i32 %channel, i8* %chunk, i32 %loops, i32 %ms) {
        entry:
            %result = call i32 @Mix_FadeInChannel(i32 %channel, i8* %chunk, i32 %loops, i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{Mix_Chunk}, Int32, Int32}, channel, chunk, loops, ms)
    end

    # Original C signature: int Mix_FadeInChannelTimed(int channel, Mix_Chunk * chunk, int loops, int ms, int ticks)
    function llvm_Mix_FadeInChannelTimed(channel::Int32, chunk::Ptr{Mix_Chunk}, loops::Int32, ms::Int32, ticks::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeInChannelTimed(i32, i8*, i32, i32, i32) nounwind

        define i32 @main(i32 %channel, i8* %chunk, i32 %loops, i32 %ms, i32 %ticks) {
        entry:
            %result = call i32 @Mix_FadeInChannelTimed(i32 %channel, i8* %chunk, i32 %loops, i32 %ms, i32 %ticks)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{Mix_Chunk}, Int32, Int32, Int32}, channel, chunk, loops, ms, ticks)
    end

    # Original C signature: int Mix_FadeInMusic(Mix_Music * music, int loops, int ms)
    function llvm_Mix_FadeInMusic(music::Ptr{Mix_Music}, loops::Int32, ms::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeInMusic(i8*, i32, i32) nounwind

        define i32 @main(i8* %music, i32 %loops, i32 %ms) {
        entry:
            %result = call i32 @Mix_FadeInMusic(i8* %music, i32 %loops, i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}, Int32, Int32}, music, loops, ms)
    end

    # Original C signature: int Mix_FadeInMusicPos(Mix_Music * music, int loops, int ms, double position)
    function llvm_Mix_FadeInMusicPos(music::Ptr{Mix_Music}, loops::Int32, ms::Int32, position::Float64)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeInMusicPos(i8*, i32, i32, double) nounwind

        define i32 @main(i8* %music, i32 %loops, i32 %ms, double %position) {
        entry:
            %result = call i32 @Mix_FadeInMusicPos(i8* %music, i32 %loops, i32 %ms, double %position)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}, Int32, Int32, Float64}, music, loops, ms, position)
    end

    # Original C signature: int Mix_FadeOutChannel(int which, int ms)
    function llvm_Mix_FadeOutChannel(which::Int32, ms::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeOutChannel(i32, i32) nounwind

        define i32 @main(i32 %which, i32 %ms) {
        entry:
            %result = call i32 @Mix_FadeOutChannel(i32 %which, i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, which, ms)
    end

    # Original C signature: int Mix_FadeOutGroup(int tag, int ms)
    function llvm_Mix_FadeOutGroup(tag::Int32, ms::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeOutGroup(i32, i32) nounwind

        define i32 @main(i32 %tag, i32 %ms) {
        entry:
            %result = call i32 @Mix_FadeOutGroup(i32 %tag, i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, tag, ms)
    end

    # Original C signature: int Mix_FadeOutMusic(int ms)
    function llvm_Mix_FadeOutMusic(ms::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_FadeOutMusic(i32) nounwind

        define i32 @main(i32 %ms) {
        entry:
            %result = call i32 @Mix_FadeOutMusic(i32 %ms)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, ms)
    end

    # Original C signature: Mix_Fading Mix_FadingChannel(int which)
    function llvm_Mix_FadingChannel(which::Int32)::UInt32
        Base.llvmcall(("""
        declare i32 @Mix_FadingChannel(i32) nounwind

        define i32 @main(i32 %which) {
        entry:
            %result = call i32 @Mix_FadingChannel(i32 %which)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Int32}, which)
    end

    # Original C signature: Mix_Fading Mix_FadingMusic()
    function llvm_Mix_FadingMusic()::UInt32
        Base.llvmcall(("""
        declare i32 @Mix_FadingMusic() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_FadingMusic()
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{}, )
    end

    # Original C signature: void Mix_FreeChunk(Mix_Chunk * chunk)
    function llvm_Mix_FreeChunk(chunk::Ptr{Mix_Chunk})::Cvoid
        Base.llvmcall(("""
        declare void @Mix_FreeChunk(i8*) nounwind

        define void @main(i8* %chunk) {
        entry:
            call void @Mix_FreeChunk(i8* %chunk)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Mix_Chunk}}, chunk)
    end

    # Original C signature: void Mix_FreeMusic(Mix_Music * music)
    function llvm_Mix_FreeMusic(music::Ptr{Mix_Music})::Cvoid
        Base.llvmcall(("""
        declare void @Mix_FreeMusic(i8*) nounwind

        define void @main(i8* %music) {
        entry:
            call void @Mix_FreeMusic(i8* %music)
            ret void
        }
        """, "main"), Cvoid, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: Mix_Chunk * Mix_GetChunk(int channel)
    function llvm_Mix_GetChunk(channel::Int32)::Ptr{Mix_Chunk}
        Base.llvmcall(("""
        declare i8* @Mix_GetChunk(i32) nounwind

        define i8* @main(i32 %channel) {
        entry:
            %result = call i8* @Mix_GetChunk(i32 %channel)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Chunk}, Tuple{Int32}, channel)
    end

    # Original C signature: const char * Mix_GetChunkDecoder(int index)
    function llvm_Mix_GetChunkDecoder(index::Int32)::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @Mix_GetChunkDecoder(i32) nounwind

        define i8* @main(i32 %index) {
        entry:
            %result = call i8* @Mix_GetChunkDecoder(i32 %index)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Int32}, index)
    end

    # Original C signature: const char * Mix_GetMusicDecoder(int index)
    function llvm_Mix_GetMusicDecoder(index::Int32)::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @Mix_GetMusicDecoder(i32) nounwind

        define i8* @main(i32 %index) {
        entry:
            %result = call i8* @Mix_GetMusicDecoder(i32 %index)
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{Int32}, index)
    end

    # Original C signature: void * Mix_GetMusicHookData()
    function llvm_Mix_GetMusicHookData()::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @Mix_GetMusicHookData() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @Mix_GetMusicHookData()
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{}, )
    end

    # Original C signature: double Mix_GetMusicLoopEndTime(Mix_Music * music)
    function llvm_Mix_GetMusicLoopEndTime(music::Ptr{Mix_Music})::Float64
        Base.llvmcall(("""
        declare double @Mix_GetMusicLoopEndTime(i8*) nounwind

        define double @main(i8* %music) {
        entry:
            %result = call double @Mix_GetMusicLoopEndTime(i8* %music)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: double Mix_GetMusicLoopLengthTime(Mix_Music * music)
    function llvm_Mix_GetMusicLoopLengthTime(music::Ptr{Mix_Music})::Float64
        Base.llvmcall(("""
        declare double @Mix_GetMusicLoopLengthTime(i8*) nounwind

        define double @main(i8* %music) {
        entry:
            %result = call double @Mix_GetMusicLoopLengthTime(i8* %music)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: double Mix_GetMusicLoopStartTime(Mix_Music * music)
    function llvm_Mix_GetMusicLoopStartTime(music::Ptr{Mix_Music})::Float64
        Base.llvmcall(("""
        declare double @Mix_GetMusicLoopStartTime(i8*) nounwind

        define double @main(i8* %music) {
        entry:
            %result = call double @Mix_GetMusicLoopStartTime(i8* %music)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: double Mix_GetMusicPosition(Mix_Music * music)
    function llvm_Mix_GetMusicPosition(music::Ptr{Mix_Music})::Float64
        Base.llvmcall(("""
        declare double @Mix_GetMusicPosition(i8*) nounwind

        define double @main(i8* %music) {
        entry:
            %result = call double @Mix_GetMusicPosition(i8* %music)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: Mix_MusicType Mix_GetMusicType(const Mix_Music * music)
    function llvm_Mix_GetMusicType(music::Ptr{Mix_Music})::UInt32
        Base.llvmcall(("""
        declare i32 @Mix_GetMusicType(i8*) nounwind

        define i32 @main(i8* %music) {
        entry:
            %result = call i32 @Mix_GetMusicType(i8* %music)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: int Mix_GetMusicVolume(Mix_Music * music)
    function llvm_Mix_GetMusicVolume(music::Ptr{Mix_Music})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GetMusicVolume(i8*) nounwind

        define i32 @main(i8* %music) {
        entry:
            %result = call i32 @Mix_GetMusicVolume(i8* %music)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: int Mix_GetNumChunkDecoders()
    function llvm_Mix_GetNumChunkDecoders()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GetNumChunkDecoders() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_GetNumChunkDecoders()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int Mix_GetNumMusicDecoders()
    function llvm_Mix_GetNumMusicDecoders()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GetNumMusicDecoders() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_GetNumMusicDecoders()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int Mix_GetNumTracks(Mix_Music * music)
    function llvm_Mix_GetNumTracks(music::Ptr{Mix_Music})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GetNumTracks(i8*) nounwind

        define i32 @main(i8* %music) {
        entry:
            %result = call i32 @Mix_GetNumTracks(i8* %music)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: const char* Mix_GetSoundFonts()
    function llvm_Mix_GetSoundFonts()::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @Mix_GetSoundFonts() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @Mix_GetSoundFonts()
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{}, )
    end

    # Original C signature: int Mix_GetSynchroValue()
    function llvm_Mix_GetSynchroValue()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GetSynchroValue() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_GetSynchroValue()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: const char* Mix_GetTimidityCfg()
    function llvm_Mix_GetTimidityCfg()::Ptr{Cvoid}
        Base.llvmcall(("""
        declare i8* @Mix_GetTimidityCfg() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @Mix_GetTimidityCfg()
            ret i8* %result
        }
        """, "main"), Ptr{Cvoid}, Tuple{}, )
    end

    # Original C signature: int Mix_GroupAvailable(int tag)
    function llvm_Mix_GroupAvailable(tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupAvailable(i32) nounwind

        define i32 @main(i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupAvailable(i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, tag)
    end

    # Original C signature: int Mix_GroupChannel(int which, int tag)
    function llvm_Mix_GroupChannel(which::Int32, tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupChannel(i32, i32) nounwind

        define i32 @main(i32 %which, i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupChannel(i32 %which, i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, which, tag)
    end

    # Original C signature: int Mix_GroupChannels(int from, int to, int tag)
    function llvm_Mix_GroupChannels(from::Int32, to::Int32, tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupChannels(i32, i32, i32) nounwind

        define i32 @main(i32 %from, i32 %to, i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupChannels(i32 %from, i32 %to, i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32, Int32}, from, to, tag)
    end

    # Original C signature: int Mix_GroupCount(int tag)
    function llvm_Mix_GroupCount(tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupCount(i32) nounwind

        define i32 @main(i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupCount(i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, tag)
    end

    # Original C signature: int Mix_GroupNewer(int tag)
    function llvm_Mix_GroupNewer(tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupNewer(i32) nounwind

        define i32 @main(i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupNewer(i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, tag)
    end

    # Original C signature: int Mix_GroupOldest(int tag)
    function llvm_Mix_GroupOldest(tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_GroupOldest(i32) nounwind

        define i32 @main(i32 %tag) {
        entry:
            %result = call i32 @Mix_GroupOldest(i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, tag)
    end

    # Original C signature: int Mix_HaltChannel(int channel)
    function llvm_Mix_HaltChannel(channel::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_HaltChannel(i32) nounwind

        define i32 @main(i32 %channel) {
        entry:
            %result = call i32 @Mix_HaltChannel(i32 %channel)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, channel)
    end

    # Original C signature: int Mix_HaltGroup(int tag)
    function llvm_Mix_HaltGroup(tag::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_HaltGroup(i32) nounwind

        define i32 @main(i32 %tag) {
        entry:
            %result = call i32 @Mix_HaltGroup(i32 %tag)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, tag)
    end

    # Original C signature: int Mix_HaltMusic()
    function llvm_Mix_HaltMusic()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_HaltMusic() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_HaltMusic()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: SDL_bool Mix_HasChunkDecoder(const char * name)
    function llvm_Mix_HasChunkDecoder(name::Ptr{Cvoid})::UInt32
        Base.llvmcall(("""
        declare i32 @Mix_HasChunkDecoder(i8*) nounwind

        define i32 @main(i8* %name) {
        entry:
            %result = call i32 @Mix_HasChunkDecoder(i8* %name)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{Cvoid}}, name)
    end

    # Original C signature: SDL_bool Mix_HasMusicDecoder(const char * name)
    function llvm_Mix_HasMusicDecoder(name::Ptr{Cvoid})::UInt32
        Base.llvmcall(("""
        declare i32 @Mix_HasMusicDecoder(i8*) nounwind

        define i32 @main(i8* %name) {
        entry:
            %result = call i32 @Mix_HasMusicDecoder(i8* %name)
            ret i32 %result
        }
        """, "main"), UInt32, Tuple{Ptr{Cvoid}}, name)
    end

    # Original C signature: int Mix_Init(int flags)
    function llvm_Mix_Init(flags::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_Init(i32) nounwind

        define i32 @main(i32 %flags) {
        entry:
            %result = call i32 @Mix_Init(i32 %flags)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, flags)
    end

    # Original C signature: const SDL_version * Mix_Linked_Version()
    function llvm_Mix_Linked_Version()::Ptr{SDL_version}
        Base.llvmcall(("""
        declare i8* @Mix_Linked_Version() nounwind

        define i8* @main() {
        entry:
            %result = call i8* @Mix_Linked_Version()
            ret i8* %result
        }
        """, "main"), Ptr{SDL_version}, Tuple{}, )
    end

    # Original C signature: Mix_Music * Mix_LoadMUS(const char * file)
    function llvm_Mix_LoadMUS(file::Ptr{Cvoid})::Ptr{Mix_Music}
        Base.llvmcall(("""
        declare i8* @Mix_LoadMUS(i8*) nounwind

        define i8* @main(i8* %file) {
        entry:
            %result = call i8* @Mix_LoadMUS(i8* %file)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Music}, Tuple{Ptr{Cvoid}}, file)
    end

    # Original C signature: Mix_Music * Mix_LoadMUSType_RW(SDL_RWops * src, Mix_MusicType type, int freesrc)
    function llvm_Mix_LoadMUSType_RW(src::Ptr{SDL_RWops}, type::UInt32, freesrc::Int32)::Ptr{Mix_Music}
        Base.llvmcall(("""
        declare i8* @Mix_LoadMUSType_RW(i8*, i32, i32) nounwind

        define i8* @main(i8* %src, i32 %type, i32 %freesrc) {
        entry:
            %result = call i8* @Mix_LoadMUSType_RW(i8* %src, i32 %type, i32 %freesrc)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Music}, Tuple{Ptr{SDL_RWops}, UInt32, Int32}, src, type, freesrc)
    end

    # Original C signature: Mix_Music * Mix_LoadMUS_RW(SDL_RWops * src, int freesrc)
    function llvm_Mix_LoadMUS_RW(src::Ptr{SDL_RWops}, freesrc::Int32)::Ptr{Mix_Music}
        Base.llvmcall(("""
        declare i8* @Mix_LoadMUS_RW(i8*, i32) nounwind

        define i8* @main(i8* %src, i32 %freesrc) {
        entry:
            %result = call i8* @Mix_LoadMUS_RW(i8* %src, i32 %freesrc)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Music}, Tuple{Ptr{SDL_RWops}, Int32}, src, freesrc)
    end

    # Original C signature: Mix_Chunk * Mix_LoadWAV(const char * file)
    function llvm_Mix_LoadWAV(file::Ptr{Cvoid})::Ptr{Mix_Chunk}
        Base.llvmcall(("""
        declare i8* @Mix_LoadWAV(i8*) nounwind

        define i8* @main(i8* %file) {
        entry:
            %result = call i8* @Mix_LoadWAV(i8* %file)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Chunk}, Tuple{Ptr{Cvoid}}, file)
    end

    # Original C signature: Mix_Chunk * Mix_LoadWAV_RW(SDL_RWops * src, int freesrc)
    function llvm_Mix_LoadWAV_RW(src::Ptr{SDL_RWops}, freesrc::Int32)::Ptr{Mix_Chunk}
        Base.llvmcall(("""
        declare i8* @Mix_LoadWAV_RW(i8*, i32) nounwind

        define i8* @main(i8* %src, i32 %freesrc) {
        entry:
            %result = call i8* @Mix_LoadWAV_RW(i8* %src, i32 %freesrc)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Chunk}, Tuple{Ptr{SDL_RWops}, Int32}, src, freesrc)
    end

    # Original C signature: int Mix_MasterVolume(int volume)
    function llvm_Mix_MasterVolume(volume::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_MasterVolume(i32) nounwind

        define i32 @main(i32 %volume) {
        entry:
            %result = call i32 @Mix_MasterVolume(i32 %volume)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, volume)
    end

    # Original C signature: int Mix_ModMusicJumpToOrder(int order)
    function llvm_Mix_ModMusicJumpToOrder(order::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_ModMusicJumpToOrder(i32) nounwind

        define i32 @main(i32 %order) {
        entry:
            %result = call i32 @Mix_ModMusicJumpToOrder(i32 %order)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, order)
    end

    # Original C signature: double Mix_MusicDuration(Mix_Music * music)
    function llvm_Mix_MusicDuration(music::Ptr{Mix_Music})::Float64
        Base.llvmcall(("""
        declare double @Mix_MusicDuration(i8*) nounwind

        define double @main(i8* %music) {
        entry:
            %result = call double @Mix_MusicDuration(i8* %music)
            ret double %result
        }
        """, "main"), Float64, Tuple{Ptr{Mix_Music}}, music)
    end

    # Original C signature: int Mix_OpenAudio(int frequency, Uint16 format, int channels, int chunksize)
    function llvm_Mix_OpenAudio(frequency::Int32, format::UInt16, channels::Int32, chunksize::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_OpenAudio(i32, i16, i32, i32) nounwind

        define i32 @main(i32 %frequency, i16 %format, i32 %channels, i32 %chunksize) {
        entry:
            %result = call i32 @Mix_OpenAudio(i32 %frequency, i16 %format, i32 %channels, i32 %chunksize)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, UInt16, Int32, Int32}, frequency, format, channels, chunksize)
    end

    # Original C signature: int Mix_OpenAudioDevice(int frequency, Uint16 format, int channels, int chunksize, const char* device, int allowed_changes)
    function llvm_Mix_OpenAudioDevice(frequency::Int32, format::UInt16, channels::Int32, chunksize::Int32, device::Ptr{Cvoid}, allowed_changes::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_OpenAudioDevice(i32, i16, i32, i32, i8*, i32) nounwind

        define i32 @main(i32 %frequency, i16 %format, i32 %channels, i32 %chunksize, i8* %device, i32 %allowed_changes) {
        entry:
            %result = call i32 @Mix_OpenAudioDevice(i32 %frequency, i16 %format, i32 %channels, i32 %chunksize, i8* %device, i32 %allowed_changes)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, UInt16, Int32, Int32, Ptr{Cvoid}, Int32}, frequency, format, channels, chunksize, device, allowed_changes)
    end

    # Original C signature: void Mix_Pause(int channel)
    function llvm_Mix_Pause(channel::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @Mix_Pause(i32) nounwind

        define void @main(i32 %channel) {
        entry:
            call void @Mix_Pause(i32 %channel)
            ret void
        }
        """, "main"), Cvoid, Tuple{Int32}, channel)
    end

    # Original C signature: void Mix_PauseAudio(int pause_on)
    function llvm_Mix_PauseAudio(pause_on::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @Mix_PauseAudio(i32) nounwind

        define void @main(i32 %pause_on) {
        entry:
            call void @Mix_PauseAudio(i32 %pause_on)
            ret void
        }
        """, "main"), Cvoid, Tuple{Int32}, pause_on)
    end

    # Original C signature: void Mix_PauseMusic()
    function llvm_Mix_PauseMusic()::Cvoid
        Base.llvmcall(("""
        declare void @Mix_PauseMusic() nounwind

        define void @main() {
        entry:
            call void @Mix_PauseMusic()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int Mix_Paused(int channel)
    function llvm_Mix_Paused(channel::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_Paused(i32) nounwind

        define i32 @main(i32 %channel) {
        entry:
            %result = call i32 @Mix_Paused(i32 %channel)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, channel)
    end

    # Original C signature: int Mix_PausedMusic()
    function llvm_Mix_PausedMusic()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_PausedMusic() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_PausedMusic()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int Mix_PlayChannel(int channel, Mix_Chunk * chunk, int loops)
    function llvm_Mix_PlayChannel(channel::Int32, chunk::Ptr{Mix_Chunk}, loops::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_PlayChannel(i32, i8*, i32) nounwind

        define i32 @main(i32 %channel, i8* %chunk, i32 %loops) {
        entry:
            %result = call i32 @Mix_PlayChannel(i32 %channel, i8* %chunk, i32 %loops)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{Mix_Chunk}, Int32}, channel, chunk, loops)
    end

    # Original C signature: int Mix_PlayChannelTimed(int channel, Mix_Chunk * chunk, int loops, int ticks)
    function llvm_Mix_PlayChannelTimed(channel::Int32, chunk::Ptr{Mix_Chunk}, loops::Int32, ticks::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_PlayChannelTimed(i32, i8*, i32, i32) nounwind

        define i32 @main(i32 %channel, i8* %chunk, i32 %loops, i32 %ticks) {
        entry:
            %result = call i32 @Mix_PlayChannelTimed(i32 %channel, i8* %chunk, i32 %loops, i32 %ticks)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Ptr{Mix_Chunk}, Int32, Int32}, channel, chunk, loops, ticks)
    end

    # Original C signature: int Mix_PlayMusic(Mix_Music * music, int loops)
    function llvm_Mix_PlayMusic(music::Ptr{Mix_Music}, loops::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_PlayMusic(i8*, i32) nounwind

        define i32 @main(i8* %music, i32 %loops) {
        entry:
            %result = call i32 @Mix_PlayMusic(i8* %music, i32 %loops)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}, Int32}, music, loops)
    end

    # Original C signature: int Mix_Playing(int channel)
    function llvm_Mix_Playing(channel::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_Playing(i32) nounwind

        define i32 @main(i32 %channel) {
        entry:
            %result = call i32 @Mix_Playing(i32 %channel)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, channel)
    end

    # Original C signature: int Mix_PlayingMusic()
    function llvm_Mix_PlayingMusic()::Int32
        Base.llvmcall(("""
        declare i32 @Mix_PlayingMusic() nounwind

        define i32 @main() {
        entry:
            %result = call i32 @Mix_PlayingMusic()
            ret i32 %result
        }
        """, "main"), Int32, Tuple{}, )
    end

    # Original C signature: int Mix_QuerySpec(int * frequency, Uint16 * format, int * channels)
    function llvm_Mix_QuerySpec(frequency::Ptr{Int32}, format::Ptr{UInt16}, channels::Ptr{Int32})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_QuerySpec(i8*, i8*, i8*) nounwind

        define i32 @main(i8* %frequency, i8* %format, i8* %channels) {
        entry:
            %result = call i32 @Mix_QuerySpec(i8* %frequency, i8* %format, i8* %channels)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Int32}, Ptr{UInt16}, Ptr{Int32}}, frequency, format, channels)
    end

    # Original C signature: Mix_Chunk * Mix_QuickLoad_RAW(Uint8 * mem, Uint32 len)
    function llvm_Mix_QuickLoad_RAW(mem::Ptr{UInt8}, len::UInt32)::Ptr{Mix_Chunk}
        Base.llvmcall(("""
        declare i8* @Mix_QuickLoad_RAW(i8*, i32) nounwind

        define i8* @main(i8* %mem, i32 %len) {
        entry:
            %result = call i8* @Mix_QuickLoad_RAW(i8* %mem, i32 %len)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Chunk}, Tuple{Ptr{UInt8}, UInt32}, mem, len)
    end

    # Original C signature: Mix_Chunk * Mix_QuickLoad_WAV(Uint8 * mem)
    function llvm_Mix_QuickLoad_WAV(mem::Ptr{UInt8})::Ptr{Mix_Chunk}
        Base.llvmcall(("""
        declare i8* @Mix_QuickLoad_WAV(i8*) nounwind

        define i8* @main(i8* %mem) {
        entry:
            %result = call i8* @Mix_QuickLoad_WAV(i8* %mem)
            ret i8* %result
        }
        """, "main"), Ptr{Mix_Chunk}, Tuple{Ptr{UInt8}}, mem)
    end

    # Original C signature: void Mix_Quit()
    function llvm_Mix_Quit()::Cvoid
        Base.llvmcall(("""
        declare void @Mix_Quit() nounwind

        define void @main() {
        entry:
            call void @Mix_Quit()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int Mix_RegisterEffect(int chan, Mix_EffectFunc_t f, Mix_EffectDone_t d, void * arg)
    function llvm_Mix_RegisterEffect(chan::Int32, f::Mix_EffectFunc_t, d::Mix_EffectDone_t, arg::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_RegisterEffect(i32, i8*, i8*, i8*) nounwind

        define i32 @main(i32 %chan, i8* %f, i8* %d, i8* %arg) {
        entry:
            %result = call i32 @Mix_RegisterEffect(i32 %chan, i8* %f, i8* %d, i8* %arg)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Mix_EffectFunc_t, Mix_EffectDone_t, Ptr{Cvoid}}, chan, f, d, arg)
    end

    # Original C signature: int Mix_ReserveChannels(int num)
    function llvm_Mix_ReserveChannels(num::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_ReserveChannels(i32) nounwind

        define i32 @main(i32 %num) {
        entry:
            %result = call i32 @Mix_ReserveChannels(i32 %num)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, num)
    end

    # Original C signature: void Mix_Resume(int channel)
    function llvm_Mix_Resume(channel::Int32)::Cvoid
        Base.llvmcall(("""
        declare void @Mix_Resume(i32) nounwind

        define void @main(i32 %channel) {
        entry:
            call void @Mix_Resume(i32 %channel)
            ret void
        }
        """, "main"), Cvoid, Tuple{Int32}, channel)
    end

    # Original C signature: void Mix_ResumeMusic()
    function llvm_Mix_ResumeMusic()::Cvoid
        Base.llvmcall(("""
        declare void @Mix_ResumeMusic() nounwind

        define void @main() {
        entry:
            call void @Mix_ResumeMusic()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: void Mix_RewindMusic()
    function llvm_Mix_RewindMusic()::Cvoid
        Base.llvmcall(("""
        declare void @Mix_RewindMusic() nounwind

        define void @main() {
        entry:
            call void @Mix_RewindMusic()
            ret void
        }
        """, "main"), Cvoid, Tuple{}, )
    end

    # Original C signature: int Mix_SetDistance(int channel, Uint8 distance)
    function llvm_Mix_SetDistance(channel::Int32, distance::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetDistance(i32, i8) nounwind

        define i32 @main(i32 %channel, i8 %distance) {
        entry:
            %result = call i32 @Mix_SetDistance(i32 %channel, i8 %distance)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, UInt8}, channel, distance)
    end

    # Original C signature: int Mix_SetMusicCMD(const char * command)
    function llvm_Mix_SetMusicCMD(command::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetMusicCMD(i8*) nounwind

        define i32 @main(i8* %command) {
        entry:
            %result = call i32 @Mix_SetMusicCMD(i8* %command)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}}, command)
    end

    # Original C signature: int Mix_SetMusicPosition(double position)
    function llvm_Mix_SetMusicPosition(position::Float64)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetMusicPosition(double) nounwind

        define i32 @main(double %position) {
        entry:
            %result = call i32 @Mix_SetMusicPosition(double %position)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Float64}, position)
    end

    # Original C signature: int Mix_SetPanning(int channel, Uint8 left, Uint8 right)
    function llvm_Mix_SetPanning(channel::Int32, left::UInt8, right::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetPanning(i32, i8, i8) nounwind

        define i32 @main(i32 %channel, i8 %left, i8 %right) {
        entry:
            %result = call i32 @Mix_SetPanning(i32 %channel, i8 %left, i8 %right)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, UInt8, UInt8}, channel, left, right)
    end

    # Original C signature: int Mix_SetPosition(int channel, Sint16 angle, Uint8 distance)
    function llvm_Mix_SetPosition(channel::Int32, angle::Int16, distance::UInt8)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetPosition(i32, i16, i8) nounwind

        define i32 @main(i32 %channel, i16 %angle, i8 %distance) {
        entry:
            %result = call i32 @Mix_SetPosition(i32 %channel, i16 %angle, i8 %distance)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int16, UInt8}, channel, angle, distance)
    end

    # Original C signature: int Mix_SetReverseStereo(int channel, int flip)
    function llvm_Mix_SetReverseStereo(channel::Int32, flip::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetReverseStereo(i32, i32) nounwind

        define i32 @main(i32 %channel, i32 %flip) {
        entry:
            %result = call i32 @Mix_SetReverseStereo(i32 %channel, i32 %flip)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, channel, flip)
    end

    # Original C signature: int Mix_SetSoundFonts(const char * paths)
    function llvm_Mix_SetSoundFonts(paths::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetSoundFonts(i8*) nounwind

        define i32 @main(i8* %paths) {
        entry:
            %result = call i32 @Mix_SetSoundFonts(i8* %paths)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}}, paths)
    end

    # Original C signature: int Mix_SetSynchroValue(int value)
    function llvm_Mix_SetSynchroValue(value::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetSynchroValue(i32) nounwind

        define i32 @main(i32 %value) {
        entry:
            %result = call i32 @Mix_SetSynchroValue(i32 %value)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, value)
    end

    # Original C signature: int Mix_SetTimidityCfg(const char * path)
    function llvm_Mix_SetTimidityCfg(path::Ptr{Cvoid})::Int32
        Base.llvmcall(("""
        declare i32 @Mix_SetTimidityCfg(i8*) nounwind

        define i32 @main(i8* %path) {
        entry:
            %result = call i32 @Mix_SetTimidityCfg(i8* %path)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Cvoid}}, path)
    end

    # Original C signature: int Mix_StartTrack(Mix_Music * music, int track)
    function llvm_Mix_StartTrack(music::Ptr{Mix_Music}, track::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_StartTrack(i8*, i32) nounwind

        define i32 @main(i8* %music, i32 %track) {
        entry:
            %result = call i32 @Mix_StartTrack(i8* %music, i32 %track)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Music}, Int32}, music, track)
    end

    # Original C signature: int Mix_UnregisterAllEffects(int channel)
    function llvm_Mix_UnregisterAllEffects(channel::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_UnregisterAllEffects(i32) nounwind

        define i32 @main(i32 %channel) {
        entry:
            %result = call i32 @Mix_UnregisterAllEffects(i32 %channel)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, channel)
    end

    # Original C signature: int Mix_UnregisterEffect(int channel, Mix_EffectFunc_t f)
    function llvm_Mix_UnregisterEffect(channel::Int32, f::Mix_EffectFunc_t)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_UnregisterEffect(i32, i8*) nounwind

        define i32 @main(i32 %channel, i8* %f) {
        entry:
            %result = call i32 @Mix_UnregisterEffect(i32 %channel, i8* %f)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Mix_EffectFunc_t}, channel, f)
    end

    # Original C signature: int Mix_Volume(int channel, int volume)
    function llvm_Mix_Volume(channel::Int32, volume::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_Volume(i32, i32) nounwind

        define i32 @main(i32 %channel, i32 %volume) {
        entry:
            %result = call i32 @Mix_Volume(i32 %channel, i32 %volume)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32, Int32}, channel, volume)
    end

    # Original C signature: int Mix_VolumeChunk(Mix_Chunk * chunk, int volume)
    function llvm_Mix_VolumeChunk(chunk::Ptr{Mix_Chunk}, volume::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_VolumeChunk(i8*, i32) nounwind

        define i32 @main(i8* %chunk, i32 %volume) {
        entry:
            %result = call i32 @Mix_VolumeChunk(i8* %chunk, i32 %volume)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Ptr{Mix_Chunk}, Int32}, chunk, volume)
    end

    # Original C signature: int Mix_VolumeMusic(int volume)
    function llvm_Mix_VolumeMusic(volume::Int32)::Int32
        Base.llvmcall(("""
        declare i32 @Mix_VolumeMusic(i32) nounwind

        define i32 @main(i32 %volume) {
        entry:
            %result = call i32 @Mix_VolumeMusic(i32 %volume)
            ret i32 %result
        }
        """, "main"), Int32, Tuple{Int32}, volume)
    end