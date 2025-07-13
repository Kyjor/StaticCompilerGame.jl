; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [11 x i8] c"typeassert\00", align 1

define i8 @check_on_ground() local_unnamed_addr {
top:
  %0 = alloca [2 x {}*], align 8
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %on_ground = load atomic {}*, {}** inttoptr (i64 140506294853952 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = bitcast {}* %on_ground to i64*
  %2 = getelementptr inbounds i64, i64* %1, i64 -1
  %3 = load atomic i64, i64* %2 unordered, align 8, !tbaa !15, !range !17
  %4 = and i64 %3, -16
  %5 = inttoptr i64 %4 to {}*
  %exactly_isa.not = icmp eq {}* %5, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa.not, label %L8, label %L5

L5:                                               ; preds = %top
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 0
  %6 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %on_ground, {}** %6, align 8
  store {}* inttoptr (i64 140506169425120 to {}*), {}** %.sub, align 8
  %7 = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 1
  store {}* %on_ground, {}** %7, align 8
  %8 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506098541952 to {}*), {}** nonnull %.sub, i32 2)
  %9 = bitcast {}* %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 -1
  %11 = load atomic i64, i64* %10 unordered, align 8, !tbaa !15, !range !17
  %12 = and i64 %11, -16
  %13 = inttoptr i64 %12 to {}*
  %exactly_isa2 = icmp eq {}* %13, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa2, label %L8, label %fail

L8:                                               ; preds = %L5, %top
  %value_phi = phi {}* [ %on_ground, %top ], [ %8, %L5 ]
  %14 = bitcast {}* %value_phi to i8*
  %unbox = load i8, i8* %14, align 1, !tbaa !18, !range !20, !alias.scope !7, !noalias !10
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret i8 %unbox

fail:                                             ; preds = %L5
  call void @ijl_type_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %8)
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
!20 = !{i8 0, i8 2}
