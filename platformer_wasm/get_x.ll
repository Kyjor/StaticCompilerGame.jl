; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [11 x i8] c"typeassert\00", align 1

define i32 @get_square_x() local_unnamed_addr {
top:
  %0 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %square_x = load atomic {}*, {}** inttoptr (i64 139926547664176 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x, {}** %1, align 8
  store {}* %square_x, {}** %.sub, align 8
  %2 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139926365497024 to {}*), {}** nonnull %.sub, i32 1)
  %3 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %2, {}** %3, align 8
  store {}* %2, {}** %.sub, align 8
  %4 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139926422240608 to {}*), {}** nonnull %.sub, i32 1)
  %5 = bitcast {}* %4 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 -1
  %7 = load atomic i64, i64* %6 unordered, align 8, !tbaa !15, !range !17
  %8 = and i64 %7, -16
  %9 = inttoptr i64 %8 to {}*
  %exactly_isa.not = icmp eq {}* %9, inttoptr (i64 240 to {}*)
  br i1 %exactly_isa.not, label %L10, label %L7

L7:                                               ; preds = %top
  %10 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %4, {}** %10, align 8
  store {}* inttoptr (i64 139926422240608 to {}*), {}** %.sub, align 8
  %11 = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 1
  store {}* %4, {}** %11, align 8
  %12 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139926351357312 to {}*), {}** nonnull %.sub, i32 2)
  %13 = bitcast {}* %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 -1
  %15 = load atomic i64, i64* %14 unordered, align 8, !tbaa !15, !range !17
  %16 = and i64 %15, -16
  %17 = inttoptr i64 %16 to {}*
  %exactly_isa2 = icmp eq {}* %17, inttoptr (i64 240 to {}*)
  br i1 %exactly_isa2, label %L10, label %fail

L10:                                              ; preds = %L7, %top
  %value_phi = phi {}* [ %4, %top ], [ %12, %L7 ]
  %18 = bitcast {}* %value_phi to i32*
  %unbox = load i32, i32* %18, align 4, !tbaa !18, !alias.scope !7, !noalias !10
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret i32 %unbox

fail:                                             ; preds = %L7
  call void @ijl_type_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139926422240608 to {}*), {}* %12)
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
!18 = !{!19, !19, i64 0}
!19 = !{!"jtbaa_value", !4, i64 0}
