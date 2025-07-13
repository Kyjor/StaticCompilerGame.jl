; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define i32 @get_square_state() local_unnamed_addr {
top:
  %key_space = load atomic {}*, {}** inttoptr (i64 139807058170288 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %0 = bitcast {}* %key_space to i64*
  %1 = getelementptr inbounds i64, i64* %0, i64 -1
  %2 = load atomic i64, i64* %1 unordered, align 8, !tbaa !15, !range !17
  %3 = and i64 %2, -16
  %4 = inttoptr i64 %3 to {}*
  %exactly_isa = icmp eq {}* %4, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

common.ret:                                       ; preds = %pass4, %pass
  %common.ret.op = phi i32 [ 2, %pass ], [ %spec.select, %pass4 ]
  ret i32 %common.ret.op

L5:                                               ; preds = %pass
  %on_ground = load atomic {}*, {}** inttoptr (i64 139807058169520 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %5 = bitcast {}* %on_ground to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 -1
  %7 = load atomic i64, i64* %6 unordered, align 8, !tbaa !15, !range !17
  %8 = and i64 %7, -16
  %9 = inttoptr i64 %8 to {}*
  %exactly_isa2 = icmp eq {}* %9, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa2, label %pass4, label %fail3

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %key_space)
  unreachable

pass:                                             ; preds = %top
  %10 = icmp eq {}* %key_space, inttoptr (i64 139807000767856 to {}*)
  br i1 %10, label %L5, label %common.ret

fail3:                                            ; preds = %L5
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %on_ground)
  unreachable

pass4:                                            ; preds = %L5
  %11 = icmp ne {}* %on_ground, inttoptr (i64 139807000767856 to {}*)
  %spec.select = zext i1 %11 to i32
  br label %common.ret
}

; Function Attrs: noreturn
declare void @ijl_type_error(i8*, {}*, {}*) local_unnamed_addr #0

attributes #0 = { noreturn }

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
!15 = !{!16, !16, i64 0}
!16 = !{!"jtbaa_tag", !4, i64 0}
!17 = !{i64 16, i64 0}
