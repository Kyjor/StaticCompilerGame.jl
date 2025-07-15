; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [16 x i8] c"delta_time: %f\0A\00", align 1
@_j_const2 = private unnamed_addr constant [19 x i8] c"Inexact conversion\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [16 x i8], align 16
  %.sub = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0
  %4 = call fastcc float @julia_draw_game_frame_1039u1041()
  %5 = fpext float %4 to double
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %.sub, i8* noundef nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @_j_const1, i64 0, i64 0), i64 16, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, double %5) #0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %.sub)
  %6 = call fastcc i32 @julia_draw_game_frame_1039u1043(i32 %0)
  %7 = call fastcc i32 @julia_draw_game_frame_1039u1044(i32 1)
  %8 = call fastcc i32 @julia_draw_game_frame_1039u1044(i32 2)
  call fastcc void @julia_draw_game_frame_1039u1046(i32 3)
  %9 = call fastcc i32 @julia_draw_game_frame_1039u1044(i32 4)
  %10 = call fastcc i32 @julia_draw_game_frame_1039u1044(i32 5)
  %11 = sitofp i32 %7 to float
  call fastcc void @julia_draw_game_frame_1039u1049(i32 1, float %11)
  switch i32 %6, label %L57 [
    i32 1, label %L44
    i32 2, label %L52
  ]

L44:                                              ; preds = %top
  %12 = sext i32 %7 to i64
  %13 = add nsw i64 %12, -1
  %14 = call fastcc i32 @julia_toInt32_1061(i64 signext %13)
  call fastcc void @julia_draw_game_frame_1039u1051(i32 1, i32 %14)
  br label %L65

L52:                                              ; preds = %top
  %15 = sext i32 %7 to i64
  %16 = add nsw i64 %15, 1
  %17 = call fastcc i32 @julia_toInt32_1061(i64 signext %16)
  call fastcc void @julia_draw_game_frame_1039u1051(i32 1, i32 %17)
  br label %L65

L57:                                              ; preds = %top
  %18 = icmp ne i32 %6, 5
  %19 = icmp ne i32 %10, 1
  %or.cond = select i1 %18, i1 true, i1 %19
  br i1 %or.cond, label %L65, label %L65.thread

L65.thread:                                       ; preds = %L57
  call fastcc void @julia_draw_game_frame_1039u1051(i32 4, i32 -2)
  call fastcc void @julia_draw_game_frame_1039u1051(i32 5, i32 0)
  br label %L71

L65:                                              ; preds = %L57, %L52, %L44
  %.not5 = icmp eq i32 %10, 0
  br i1 %.not5, label %L68, label %L71

L68:                                              ; preds = %L65
  %20 = add i32 %9, 1
  call fastcc void @julia_draw_game_frame_1039u1051(i32 4, i32 %20)
  br label %L71

L71:                                              ; preds = %L68, %L65, %L65.thread
  %value_phi2 = phi i32 [ %20, %L68 ], [ %9, %L65 ], [ -2, %L65.thread ]
  %21 = add i32 %value_phi2, %8
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %L80, label %L75

L75:                                              ; preds = %L71
  call fastcc void @julia_draw_game_frame_1039u1051(i32 5, i32 1)
  call fastcc void @julia_draw_game_frame_1039u1051(i32 4, i32 0)
  br label %L82

L80:                                              ; preds = %L71
  call fastcc void @julia_draw_game_frame_1039u1051(i32 5, i32 0)
  br label %L82

L82:                                              ; preds = %L80, %L75
  %value_phi3 = phi i32 [ 5, %L75 ], [ %21, %L80 ]
  call fastcc void @julia_draw_game_frame_1039u1051(i32 2, i32 %value_phi3)
  call fastcc void @julia_draw_game_frame_1039u1058(i32 255, i32 0, i32 0, i32 255, i32 %7, i32 %value_phi3, i32 64, i32 64)
  ret i32 0
}

define internal fastcc float @julia_draw_game_frame_1039u1041() unnamed_addr {
entry:
  %result = call float @get_delta_time()
  ret float %result
}

; Function Attrs: nounwind
declare float @get_delta_time() local_unnamed_addr #0

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc i32 @julia_draw_game_frame_1039u1043(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1039u1044(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1039u1046(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret void
}

define internal fastcc void @julia_draw_game_frame_1039u1049(i32 %0, float %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple_float(i32, float) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1039u1051(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1039u1058(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) unnamed_addr {
entry:
  %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
  ret void
}

; Function Attrs: nounwind
declare i32 @render_rect(i32, i32, i32, i32, i32, i32, i32, i32) local_unnamed_addr #0

; Function Attrs: noinline
define internal fastcc void @julia__throw_inexacterror_1067() unnamed_addr #1 {
top:
  %0 = alloca [19 x i8], align 16
  %.sub = getelementptr inbounds [19 x i8], [19 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %.sub, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @_j_const2, i64 0, i64 0), i64 19, i1 false)
  %status.i = call i32 @puts(i8* noundef nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %.sub)
  call void @exit(i32 1) #0
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) local_unnamed_addr #0

declare void @exit(i32) local_unnamed_addr

define internal fastcc i32 @julia_checked_trunc_sint_1064(i64 signext %0) unnamed_addr {
top:
  %1 = add i64 %0, -2147483648
  %2 = icmp ult i64 %1, -4294967296
  br i1 %2, label %L6, label %L7

L6:                                               ; preds = %top
  call fastcc void @julia__throw_inexacterror_1067()
  br label %L7

L7:                                               ; preds = %L6, %top
  %3 = trunc i64 %0 to i32
  ret i32 %3
}

define internal fastcc i32 @julia_toInt32_1061(i64 signext %0) unnamed_addr {
top:
  %1 = call fastcc i32 @julia_checked_trunc_sint_1064(i64 signext %0)
  ret i32 %1
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { nounwind }
attributes #1 = { noinline }
attributes #2 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
