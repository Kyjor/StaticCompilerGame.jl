; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define i32 @handle_events() local_unnamed_addr {
top:
  %0 = alloca {}*, align 8
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %drawing_enabled = load atomic {}*, {}** inttoptr (i64 140506294854432 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %drawing_enabled, {}** %1, align 8
  store {}* %drawing_enabled, {}** %0, align 8
  %2 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506102030896 to {}*), {}** nonnull %0, i32 1)
  %3 = bitcast {}* %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 -1
  %5 = load atomic i64, i64* %4 unordered, align 8, !tbaa !15, !range !17
  %6 = and i64 %5, -16
  %7 = inttoptr i64 %6 to {}*
  %exactly_isa = icmp eq {}* %7, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %common.ret, label %fail

common.ret:                                       ; preds = %top
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret i32 0

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %2)
  unreachable
}

declare nonnull {}* @ijl_apply_generic({}*, {}** noalias nocapture noundef readonly, i32) local_unnamed_addr

; Function Attrs: noreturn
declare void @ijl_type_error(i8*, {}*, {}*) local_unnamed_addr #0

declare noalias nonnull {}** @julia.new_gc_frame(i32) local_unnamed_addr

declare void @julia.push_gc_frame({}**, i32) local_unnamed_addr

declare {}** @julia.get_gc_frame_slot({}**, i32) local_unnamed_addr

declare void @julia.pop_gc_frame({}**) local_unnamed_addr

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
