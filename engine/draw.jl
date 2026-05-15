function j_fill_rect(
    x::Int32, y::Int32, w::Int32, h::Int32,
    r::Int32, g::Int32, b::Int32, a::Int32,
)::Int32
    Base.llvmcall(("""
    declare i32 @sc_fill_rect(i32, i32, i32, i32, i32, i32, i32, i32) nounwind

    define i32 @main(i32 %x, i32 %y, i32 %w, i32 %h, i32 %r, i32 %g, i32 %b, i32 %a) {
    entry:
        %ret = call i32 @sc_fill_rect(i32 %x, i32 %y, i32 %w, i32 %h, i32 %r, i32 %g, i32 %b, i32 %a)
        ret i32 %ret
    }
    """, "main"), Int32,
        Tuple{Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32},
        x, y, w, h, r, g, b, a,
    )
end
