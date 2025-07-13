; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define void @update_physics() local_unnamed_addr {
top:
  %0 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 2)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 2)
  %square_vel_y = load atomic {}*, {}** inttoptr (i64 140506294853712 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y, {}** %1, align 8
  store {}* %square_vel_y, {}** %.sub, align 8
  %2 = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 1
  store {}* inttoptr (i64 140506153702480 to {}*), {}** %2, align 8
  %3 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506098072720 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %3, {}** inttoptr (i64 140506294853712 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_x = load atomic {}*, {}** inttoptr (i64 140506294852944 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_x = load atomic {}*, {}** inttoptr (i64 140506294853424 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %4 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_x, {}** %4, align 8
  %5 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_x, {}** %5, align 8
  store {}* %square_x, {}** %.sub, align 8
  store {}* %square_vel_x, {}** %2, align 8
  %6 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506098072720 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %6, {}** inttoptr (i64 140506294852944 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_y = load atomic {}*, {}** inttoptr (i64 140506294853184 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_y1 = load atomic {}*, {}** inttoptr (i64 140506294853712 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %7 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_y, {}** %7, align 8
  %8 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y1, {}** %8, align 8
  store {}* %square_y, {}** %.sub, align 8
  store {}* %square_vel_y1, {}** %2, align 8
  %9 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506098072720 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %9, {}** inttoptr (i64 140506294853184 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %10 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %9, {}** %10, align 8
  store {}* %9, {}** %.sub, align 8
  store {}* inttoptr (i64 140506275390096 to {}*), {}** %2, align 8
  %11 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506103719184 to {}*), {}** nonnull %.sub, i32 2)
  %12 = bitcast {}* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 -1
  %14 = load atomic i64, i64* %13 unordered, align 8, !tbaa !15, !range !17
  %15 = and i64 %14, -16
  %16 = inttoptr i64 %15 to {}*
  %exactly_isa = icmp eq {}* %16, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

L15:                                              ; preds = %pass
  store atomic {}* inttoptr (i64 140506275390096 to {}*), {}** inttoptr (i64 140506294853184 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506157526688 to {}*), {}** inttoptr (i64 140506294853712 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506237381984 to {}*), {}** inttoptr (i64 140506294853952 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L22

L20:                                              ; preds = %pass
  store atomic {}* inttoptr (i64 140506237382000 to {}*), {}** inttoptr (i64 140506294853952 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L22

L22:                                              ; preds = %L20, %L15
  %square_x3 = load atomic {}*, {}** inttoptr (i64 140506294852944 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %17 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x3, {}** %17, align 8
  store {}* %square_x3, {}** %.sub, align 8
  store {}* inttoptr (i64 140506157526688 to {}*), {}** %2, align 8
  %18 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506101967488 to {}*), {}** nonnull %.sub, i32 2)
  %19 = bitcast {}* %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 -1
  %21 = load atomic i64, i64* %20 unordered, align 8, !tbaa !15, !range !17
  %22 = and i64 %21, -16
  %23 = inttoptr i64 %22 to {}*
  %exactly_isa5 = icmp eq {}* %23, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa5, label %pass7, label %fail6

L25:                                              ; preds = %pass7
  store atomic {}* inttoptr (i64 140506157526688 to {}*), {}** inttoptr (i64 140506294852944 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L33

L28:                                              ; preds = %pass7
  %square_x8 = load atomic {}*, {}** inttoptr (i64 140506294852944 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %24 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x8, {}** %24, align 8
  store {}* %square_x8, {}** %.sub, align 8
  store {}* inttoptr (i64 140506275390208 to {}*), {}** %2, align 8
  %25 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506103719184 to {}*), {}** nonnull %.sub, i32 2)
  %26 = bitcast {}* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 -1
  %28 = load atomic i64, i64* %27 unordered, align 8, !tbaa !15, !range !17
  %29 = and i64 %28, -16
  %30 = inttoptr i64 %29 to {}*
  %exactly_isa10 = icmp eq {}* %30, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa10, label %pass12, label %fail11

L31:                                              ; preds = %pass12
  store atomic {}* inttoptr (i64 140506275390208 to {}*), {}** inttoptr (i64 140506294852944 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L33

L33:                                              ; preds = %pass12, %L31, %L25
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %11)
  unreachable

pass:                                             ; preds = %top
  %31 = icmp eq {}* %11, inttoptr (i64 140506237382000 to {}*)
  br i1 %31, label %L20, label %L15

fail6:                                            ; preds = %L22
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %18)
  unreachable

pass7:                                            ; preds = %L22
  %32 = icmp eq {}* %18, inttoptr (i64 140506237382000 to {}*)
  br i1 %32, label %L28, label %L25

fail11:                                           ; preds = %L28
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %25)
  unreachable

pass12:                                           ; preds = %L28
  %33 = icmp eq {}* %25, inttoptr (i64 140506237382000 to {}*)
  br i1 %33, label %L33, label %L31
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
