; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const5 = private unnamed_addr constant [19 x i8] c"Inexact conversion\00", align 1
@_j_const1 = private unnamed_addr constant [65 x i8] c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\0A\00", align 1
@_j_const2 = private unnamed_addr constant [62 x i8] c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\0A\00", align 1
@_j_const3 = private unnamed_addr constant [9 x i8] c"val: %d\0A\00", align 1
@_j_const4 = private unnamed_addr constant [11 x i8] c"Input: %d\0A\00", align 1

; Function Attrs: noinline
define internal fastcc void @_throw_inexacterror_1556() unnamed_addr #0 {
top:
  %0 = alloca [19 x i8], align 16
  %.sub = getelementptr inbounds [19 x i8], [19 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %.sub, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @_j_const5, i64 0, i64 0), i64 19, i1 false)
  %status.i = call i32 @puts(i8* noundef nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %.sub)
  call void @exit(i32 1) #1
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) local_unnamed_addr #1

declare void @exit(i32) local_unnamed_addr

define internal fastcc i32 @julia_checked_trunc_sint_1553(i64 signext %0) unnamed_addr {
top:
  %1 = add i64 %0, -2147483648
  %2 = icmp ult i64 %1, -4294967296
  br i1 %2, label %L6, label %L7

L6:                                               ; preds = %top
  call fastcc void @_throw_inexacterror_1556()
  br label %L7

L7:                                               ; preds = %L6, %top
  %3 = trunc i64 %0 to i32
  ret i32 %3
}

define internal fastcc i32 @julia_toInt32_1550(i64 signext %0) unnamed_addr {
top:
  %1 = call fastcc i32 @julia_checked_trunc_sint_1553(i64 signext %0)
  ret i32 %1
}

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [65 x i8], align 16
  %4 = alloca [62 x i8], align 16
  %5 = alloca [65 x i8], align 16
  %6 = alloca [62 x i8], align 16
  %7 = alloca [65 x i8], align 16
  %8 = alloca [62 x i8], align 16
  %9 = alloca [65 x i8], align 16
  %10 = alloca [62 x i8], align 16
  %11 = alloca [65 x i8], align 16
  %12 = alloca [62 x i8], align 16
  %13 = alloca [9 x i8], align 16
  %.sub66 = getelementptr inbounds [9 x i8], [9 x i8]* %13, i64 0, i64 0
  %14 = alloca [11 x i8], align 16
  %.sub67 = getelementptr inbounds [11 x i8], [11 x i8]* %14, i64 0, i64 0
  %15 = call fastcc i32 @julia_draw_game_frame_1523u1525(i32 %0)
  %16 = call fastcc i32 @julia_draw_game_frame_1523u1526(i32 1)
  %17 = call fastcc i32 @julia_draw_game_frame_1523u1526(i32 2)
  call fastcc void @julia_draw_game_frame_1523u1528(i32 3)
  call fastcc void @julia_draw_game_frame_1523u1528(i32 4)
  call fastcc void @julia_draw_game_frame_1523u1528(i32 5)
  switch i32 %15, label %L269 [
    i32 1, label %L15
    i32 2, label %L67
    i32 3, label %L119
    i32 4, label %L171
    i32 5, label %L223
  ]

L15:                                              ; preds = %top
  %.sub57 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  %.sub = getelementptr inbounds [65 x i8], [65 x i8]* %3, i64 0, i64 0
  %18 = sext i32 %16 to i64
  %19 = add nsw i64 %18, -1
  %20 = call fastcc i32 @julia_toInt32_1550(i64 signext %19)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, i32 1, i32 %20) #1
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub57)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub57, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i36 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub57, i32 1, i32 %20) #1
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub57)
  call fastcc void @julia_draw_game_frame_1523u1534(i32 1, i32 %20)
  br label %L269

L67:                                              ; preds = %top
  %.sub59 = getelementptr inbounds [62 x i8], [62 x i8]* %6, i64 0, i64 0
  %.sub58 = getelementptr inbounds [65 x i8], [65 x i8]* %5, i64 0, i64 0
  %21 = sext i32 %16 to i64
  %22 = add nsw i64 %21, 1
  %23 = call fastcc i32 @julia_toInt32_1550(i64 signext %22)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub58)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub58, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i38 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub58, i32 1, i32 %23) #1
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub58)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub59)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub59, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i40 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub59, i32 1, i32 %23) #1
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub59)
  call fastcc void @julia_draw_game_frame_1523u1534(i32 1, i32 %23)
  br label %L269

L119:                                             ; preds = %top
  %.sub61 = getelementptr inbounds [62 x i8], [62 x i8]* %8, i64 0, i64 0
  %.sub60 = getelementptr inbounds [65 x i8], [65 x i8]* %7, i64 0, i64 0
  %24 = sext i32 %17 to i64
  %25 = add nsw i64 %24, -1
  %26 = call fastcc i32 @julia_toInt32_1550(i64 signext %25)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub60)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub60, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i42 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub60, i32 2, i32 %26) #1
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub60)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub61)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub61, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i44 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub61, i32 2, i32 %26) #1
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub61)
  call fastcc void @julia_draw_game_frame_1523u1534(i32 2, i32 %26)
  br label %L269

L171:                                             ; preds = %top
  %.sub63 = getelementptr inbounds [62 x i8], [62 x i8]* %10, i64 0, i64 0
  %.sub62 = getelementptr inbounds [65 x i8], [65 x i8]* %9, i64 0, i64 0
  %27 = sext i32 %17 to i64
  %28 = add nsw i64 %27, 1
  %29 = call fastcc i32 @julia_toInt32_1550(i64 signext %28)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub62)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub62, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i46 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub62, i32 2, i32 %29) #1
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub62)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub63)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub63, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i48 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub63, i32 2, i32 %29) #1
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub63)
  call fastcc void @julia_draw_game_frame_1523u1534(i32 2, i32 %29)
  br label %L269

L223:                                             ; preds = %top
  %.sub65 = getelementptr inbounds [62 x i8], [62 x i8]* %12, i64 0, i64 0
  %.sub64 = getelementptr inbounds [65 x i8], [65 x i8]* %11, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub64)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub64, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i50 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub64, i32 5, i32 1) #1
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub64)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub65)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub65, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i52 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub65, i32 5, i32 1) #1
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub65)
  call fastcc void @julia_draw_game_frame_1523u1534(i32 5, i32 1)
  br label %L269

L269:                                             ; preds = %L223, %L171, %L119, %L67, %L15, %top
  %30 = call fastcc i32 @julia_draw_game_frame_1523u1535(i32 255, i32 0, i32 0, i32 255, i32 %16, i32 %17, i32 64, i32 64)
  call void @llvm.lifetime.start.p0i8(i64 9, i8* nonnull %.sub66)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(9) %.sub66, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @_j_const3, i64 0, i64 0), i64 9, i1 false)
  %status.i54 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub66, i32 %30) #1
  %.not68 = icmp eq i32 %15, 0
  br i1 %.not68, label %L321, label %L298

L298:                                             ; preds = %L269
  call void @llvm.lifetime.end.p0i8(i64 9, i8* nonnull %.sub66)
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %.sub67)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(11) %.sub67, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @_j_const4, i64 0, i64 0), i64 11, i1 false)
  %status.i56 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub67, i32 %15) #1
  br label %L321

L321:                                             ; preds = %L298, %L269
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %.sub67)
  ret i32 0
}

define internal fastcc i32 @julia_draw_game_frame_1523u1525(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #1

define internal fastcc i32 @julia_draw_game_frame_1523u1526(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #1

define internal fastcc void @julia_draw_game_frame_1523u1528(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_draw_game_frame_1523u1534(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #1

define internal fastcc i32 @julia_draw_game_frame_1523u1535(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) unnamed_addr {
entry:
  %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @render_rect(i32, i32, i32, i32, i32, i32, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
