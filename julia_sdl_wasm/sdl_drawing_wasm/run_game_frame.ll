; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define internal fastcc void @update_physics_1856() unnamed_addr {
top:
  %0 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 2)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 2)
  %square_vel_y = load atomic {}*, {}** inttoptr (i64 140467239593360 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y, {}** %1, align 8
  store {}* %square_vel_y, {}** %.sub, align 8
  %2 = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 1
  store {}* inttoptr (i64 140467098440784 to {}*), {}** %2, align 8
  %3 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467042811024 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %3, {}** inttoptr (i64 140467239593360 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_x = load atomic {}*, {}** inttoptr (i64 140467239592592 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_x = load atomic {}*, {}** inttoptr (i64 140467239593120 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  %4 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_x, {}** %4, align 8
  %5 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_x, {}** %5, align 8
  store {}* %square_x, {}** %.sub, align 8
  store {}* %square_vel_x, {}** %2, align 8
  %6 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467042811024 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %6, {}** inttoptr (i64 140467239592592 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_y = load atomic {}*, {}** inttoptr (i64 140467239592832 to {}**) unordered, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_y1 = load atomic {}*, {}** inttoptr (i64 140467239593360 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %7 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_y, {}** %7, align 8
  %8 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y1, {}** %8, align 8
  store {}* %square_y, {}** %.sub, align 8
  store {}* %square_vel_y1, {}** %2, align 8
  %9 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467042811024 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %9, {}** inttoptr (i64 140467239592832 to {}**) release, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  %10 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %9, {}** %10, align 8
  store {}* %9, {}** %.sub, align 8
  store {}* inttoptr (i64 140467222827520 to {}*), {}** %2, align 8
  %11 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467048457488 to {}*), {}** nonnull %.sub, i32 2)
  %12 = bitcast {}* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 -1
  %14 = load atomic i64, i64* %13 unordered, align 8, !tbaa !15, !range !17
  %15 = and i64 %14, -16
  %16 = inttoptr i64 %15 to {}*
  %exactly_isa = icmp eq {}* %16, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

L15:                                              ; preds = %pass
  store atomic {}* inttoptr (i64 140467222827520 to {}*), {}** inttoptr (i64 140467239592832 to {}**) release, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140467102264992 to {}*), {}** inttoptr (i64 140467239593360 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140467182120288 to {}*), {}** inttoptr (i64 140467239593600 to {}**) release, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L22

L20:                                              ; preds = %pass
  store atomic {}* inttoptr (i64 140467182120304 to {}*), {}** inttoptr (i64 140467239593600 to {}**) release, align 128, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L22

L22:                                              ; preds = %L20, %L15
  %square_x3 = load atomic {}*, {}** inttoptr (i64 140467239592592 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %17 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x3, {}** %17, align 8
  store {}* %square_x3, {}** %.sub, align 8
  store {}* inttoptr (i64 140467102264992 to {}*), {}** %2, align 8
  %18 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467046705792 to {}*), {}** nonnull %.sub, i32 2)
  %19 = bitcast {}* %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 -1
  %21 = load atomic i64, i64* %20 unordered, align 8, !tbaa !15, !range !17
  %22 = and i64 %21, -16
  %23 = inttoptr i64 %22 to {}*
  %exactly_isa5 = icmp eq {}* %23, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa5, label %pass7, label %fail6

L25:                                              ; preds = %pass7
  store atomic {}* inttoptr (i64 140467102264992 to {}*), {}** inttoptr (i64 140467239592592 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L33

L28:                                              ; preds = %pass7
  %square_x8 = load atomic {}*, {}** inttoptr (i64 140467239592592 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %24 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x8, {}** %24, align 8
  store {}* %square_x8, {}** %.sub, align 8
  store {}* inttoptr (i64 140467222827632 to {}*), {}** %2, align 8
  %25 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140467048457488 to {}*), {}** nonnull %.sub, i32 2)
  %26 = bitcast {}* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 -1
  %28 = load atomic i64, i64* %27 unordered, align 8, !tbaa !15, !range !17
  %29 = and i64 %28, -16
  %30 = inttoptr i64 %29 to {}*
  %exactly_isa10 = icmp eq {}* %30, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa10, label %pass12, label %fail11

L31:                                              ; preds = %pass12
  store atomic {}* inttoptr (i64 140467222827632 to {}*), {}** inttoptr (i64 140467239592592 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L33

L33:                                              ; preds = %pass12, %L31, %L25
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140467114163424 to {}*), {}* %11)
  unreachable

pass:                                             ; preds = %top
  %31 = icmp eq {}* %11, inttoptr (i64 140467182120304 to {}*)
  br i1 %31, label %L20, label %L15

fail6:                                            ; preds = %L22
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140467114163424 to {}*), {}* %18)
  unreachable

pass7:                                            ; preds = %L22
  %32 = icmp eq {}* %18, inttoptr (i64 140467182120304 to {}*)
  br i1 %32, label %L28, label %L25

fail11:                                           ; preds = %L28
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140467114163424 to {}*), {}* %25)
  unreachable

pass12:                                           ; preds = %L28
  %33 = icmp eq {}* %25, inttoptr (i64 140467182120304 to {}*)
  br i1 %33, label %L33, label %L31
}

declare nonnull {}* @ijl_apply_generic({}*, {}** noalias nocapture noundef readonly, i32) local_unnamed_addr

; Function Attrs: noreturn
declare void @ijl_type_error(i8*, {}*, {}*) local_unnamed_addr #0

define internal fastcc void @julia_draw_frame_1854() unnamed_addr {
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

define i32 @run_game_frame() local_unnamed_addr {
top:
  call fastcc void @update_physics_1856()
  call fastcc void @julia_draw_frame_1854()
  ret i32 0
}

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
