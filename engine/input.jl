const SDL_EVENT_BYTES = UInt32(56)
const SDL_EVENT_QUIT = UInt32(256)
const SDL_EVENT_KEYDOWN = UInt32(768)
const SDL_EVENT_KEYUP = UInt32(769)

function poll_events()::Int32
    event_ptr::Ptr{SDL_Event} = Ptr{SDL_Event}(wasm_malloc(SDL_EVENT_BYTES))
    quit::Int32 = Int32(0)
    while llvm_SDL_PollEvent(event_ptr) != Int32(0)
        event_type::UInt32 = event_ptr.type
        key::Int32 = Int32(0)
        if event_type == SDL_EVENT_QUIT
            # Emscripten may deliver spurious QUIT before the first present
            if llvm_sc_get_frames_rendered() != Int32(0)
                quit = Int32(1)
            end
        elseif event_type == SDL_EVENT_KEYDOWN
            key = Int32(event_ptr.key.keysym.sym)
            llvm_game_key_pressed(key)
        elseif event_type == SDL_EVENT_KEYUP
            key = Int32(event_ptr.key.keysym.sym)
            llvm_game_key_released(key)
        end
    end
    wasm_free(Ptr{Cvoid}(event_ptr))
    return quit
end
