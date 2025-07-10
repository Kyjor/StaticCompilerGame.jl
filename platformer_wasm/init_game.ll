; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @init_platformer_game() local_unnamed_addr {
top:
  store atomic {}* inttoptr (i64 139926411058608 to {}*), {}** inttoptr (i64 139926547664176 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139924562662560 to {}*), {}** inttoptr (i64 139926547664416 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926410342048 to {}*), {}** inttoptr (i64 139926547664656 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926410342048 to {}*), {}** inttoptr (i64 139926547664896 to {}**) release, align 4096, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926490197360 to {}*), {}** inttoptr (i64 139926547665136 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926490197360 to {}*), {}** inttoptr (i64 139926547665376 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926490197360 to {}*), {}** inttoptr (i64 139926547665616 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139926490197360 to {}*), {}** inttoptr (i64 139926547665904 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  ret i32 0
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
