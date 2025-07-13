; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-apple-darwin"

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = call fastcc i32 @julia_draw_game_frame_1125u1127(i32 %0)
  ret i32 %3
}

define internal fastcc i32 @julia_draw_game_frame_1125u1127(i32 %0) unnamed_addr {
entry:
  %result = call i32 @draw_rect(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @draw_rect(i32) local_unnamed_addr #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
