function j_load_sound(file_path::Ptr{UInt8})::Ptr{Mix_Chunk}
    sound::Ptr{Mix_Chunk} = llvm_Mix_LoadWAV(file_path)
    if sound == Ptr{Mix_Chunk}(C_NULL)
        printf(c"Failed to load sound\n")
        print_error_message()
        return Ptr{Mix_Chunk}(C_NULL)
    end
    return sound
end

function j_play_sound(sound::Ptr{Mix_Chunk})::Int32
    if llvm_Mix_PlayChannel(Int32(-1), sound, Int32(0)) == Int32(-1)
        printf(c"Failed to play sound\n")
        print_error_message()
        return Int32(-1)
    end
    return Int32(0)
end