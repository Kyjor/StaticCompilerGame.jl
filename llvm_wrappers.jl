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

    function llvm_get_error()::Int32
        Base.llvmcall(("""
            declare i32 @get_error() nounwind
            define i32 @main() {
            entry:
                %result = call i32 @get_error()
                ret i32 %result
            }
        """, "main"), Int32, Tuple{}, ())
    end