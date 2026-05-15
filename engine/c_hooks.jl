# Calls into game code defined in host.c (linked at build time).

function llvm_game_load()
    Base.llvmcall(("""
    declare void @game_load() nounwind

    define void @main() {
    entry:
        call void @game_load()
        ret void
    }
    """, "main"), Cvoid, Tuple{},)
end

function llvm_game_update()
    Base.llvmcall(("""
    declare void @game_update() nounwind

    define void @main() {
    entry:
        call void @game_update()
        ret void
    }
    """, "main"), Cvoid, Tuple{},)
end

function llvm_game_draw()
    Base.llvmcall(("""
    declare void @game_draw() nounwind

    define void @main() {
    entry:
        call void @game_draw()
        ret void
    }
    """, "main"), Cvoid, Tuple{},)
end

function llvm_game_should_continue()::Int32
    Base.llvmcall(("""
    declare i32 @game_should_continue() nounwind

    define i32 @main() {
    entry:
        %r = call i32 @game_should_continue()
        ret i32 %r
    }
    """, "main"), Int32, Tuple{},)
end

function llvm_game_shutdown()
    Base.llvmcall(("""
    declare void @game_shutdown() nounwind

    define void @main() {
    entry:
        call void @game_shutdown()
        ret void
    }
    """, "main"), Cvoid, Tuple{},)
end
