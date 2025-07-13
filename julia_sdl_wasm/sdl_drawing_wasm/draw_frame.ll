; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define void @draw_frame() local_unnamed_addr {
top:
  %0 = alloca [5 x {}*], align 8
  %.sub = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 2)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 2)
  %square_x = load atomic {}*, {}** inttoptr (i64 140467239592592 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x, {}** %1, align 8
  store {}* %square_x, {}** %.sub, align 8
  %2 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467057419968 to {}*), {}** nonnull %.sub, i32 1)
  %3 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %2, {}** %3, align 8
  store {}* %2, {}** %.sub, align 8
  %4 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467114163552 to {}*), {}** nonnull %.sub, i32 1)
  %square_y = load atomic {}*, {}** inttoptr (i64 140467239592832 to {}**) unordered, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  %5 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_y, {}** %5, align 8
  %6 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %4, {}** %6, align 8
  store {}* %square_y, {}** %.sub, align 8
  %7 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467057419968 to {}*), {}** nonnull %.sub, i32 1)
  %8 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %7, {}** %8, align 8
  store {}* %7, {}** %.sub, align 8
  %9 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467114163552 to {}*), {}** nonnull %.sub, i32 1)
  %on_ground = load atomic {}*, {}** inttoptr (i64 140467239593600 to {}**) unordered, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  %10 = bitcast {}* %on_ground to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 -1
  %12 = load atomic i64, i64* %11 unordered, align 8, !tbaa !15, !range !17
  %13 = and i64 %12, -16
  %14 = inttoptr i64 %13 to {}*
  %exactly_isa = icmp eq {}* %14, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

L9:                                               ; preds = %pass
  br i1 %38, label %L14, label %L25

L14:                                              ; preds = %L9
  %15 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %9, {}** %15, align 8
  store {}* %4, {}** %.sub, align 8
  %16 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 1
  store {}* %9, {}** %16, align 8
  %17 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 2
  store {}* inttoptr (i64 140467270476816 to {}*), {}** %17, align 8
  %18 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 3
  store {}* inttoptr (i64 140467270476816 to {}*), {}** %18, align 8
  %19 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 4
  store {}* inttoptr (i64 140467270468464 to {}*), {}** %19, align 8
  %20 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140465293225216 to {}*), {}** nonnull %.sub, i32 5)
  br label %L25

L17:                                              ; preds = %pass
  br i1 %38, label %L22, label %L25

L22:                                              ; preds = %L17
  %21 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %9, {}** %21, align 8
  store {}* %4, {}** %.sub, align 8
  %22 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 1
  store {}* %9, {}** %22, align 8
  %23 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 2
  store {}* inttoptr (i64 140467270476816 to {}*), {}** %23, align 8
  %24 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 3
  store {}* inttoptr (i64 140467270476816 to {}*), {}** %24, align 8
  %25 = getelementptr inbounds [5 x {}*], [5 x {}*]* %0, i64 0, i64 4
  store {}* inttoptr (i64 140467270468176 to {}*), {}** %25, align 8
  %26 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140465293225216 to {}*), {}** nonnull %.sub, i32 5)
  br label %L25

L25:                                              ; preds = %L22, %L17, %L14, %L9
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140467114163424 to {}*), {}* %on_ground)
  unreachable

pass:                                             ; preds = %top
  %27 = icmp eq {}* %on_ground, inttoptr (i64 140467182120304 to {}*)
  %28 = bitcast {}* %4 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 -1
  %30 = load atomic i64, i64* %29 unordered, align 8, !tbaa !15, !range !17
  %31 = and i64 %30, -16
  %32 = inttoptr i64 %31 to {}*
  %exactly_isa6 = icmp ne {}* %32, inttoptr (i64 240 to {}*)
  %33 = bitcast {}* %9 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 -1
  %35 = load atomic i64, i64* %34 unordered, align 8, !tbaa !15, !range !17
  %36 = and i64 %35, -16
  %37 = inttoptr i64 %36 to {}*
  %exactly_isa8 = icmp ne {}* %37, inttoptr (i64 240 to {}*)
  %38 = or i1 %exactly_isa6, %exactly_isa8
  br i1 %27, label %L17, label %L9
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
