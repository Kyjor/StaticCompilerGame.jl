; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define void @handle_key_input(i32 signext %0, i32 signext %1) local_unnamed_addr {
top:
  %.not5 = icmp eq i32 %1, 0
  switch i32 %0, label %L17 [
    i32 37, label %L5
    i32 39, label %L10
    i32 32, label %L15
  ]

L5:                                               ; preds = %top
  %2 = select i1 %.not5, {}* inttoptr (i64 139926490197360 to {}*), {}* inttoptr (i64 139926490197344 to {}*)
  store atomic {}* %2, {}** inttoptr (i64 139926547665376 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L17

L10:                                              ; preds = %top
  %3 = select i1 %.not5, {}* inttoptr (i64 139926490197360 to {}*), {}* inttoptr (i64 139926490197344 to {}*)
  store atomic {}* %3, {}** inttoptr (i64 139926547665616 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L17

L15:                                              ; preds = %top
  %4 = select i1 %.not5, {}* inttoptr (i64 139926490197360 to {}*), {}* inttoptr (i64 139926490197344 to {}*)
  store atomic {}* %4, {}** inttoptr (i64 139926547665904 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L17

L17:                                              ; preds = %L15, %L10, %L5, %top
  ret void
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"jtbaa_binding", !4, i64 0}
!4 = !{!"jtbaa_data", !5, i64 0}
!5 = !{!"jtbaa", !6, i64 0}
!6 = !{!"jtbaa"}
!7 = !{!8}
!8 = !{!"jnoalias_data", !9}
!9 = !{!"jnoalias"}
!10 = !{!11, !12, !13, !14}
!11 = !{!"jnoalias_gcframe", !9}
!12 = !{!"jnoalias_stack", !9}
!13 = !{!"jnoalias_typemd", !9}
!14 = !{!"jnoalias_const", !9}
