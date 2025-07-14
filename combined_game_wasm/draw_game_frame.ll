; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [65 x i8] c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\0A\00", align 1
@_j_const2 = private unnamed_addr constant [62 x i8] c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\0A\00", align 1
@_j_const3 = private unnamed_addr constant [11 x i8] c"Input: %d\0A\00", align 1
@_j_const4 = private unnamed_addr constant [19 x i8] c"Inexact conversion\00", align 1

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
  %13 = alloca [11 x i8], align 16
  %.sub61 = getelementptr inbounds [11 x i8], [11 x i8]* %13, i64 0, i64 0
  call fastcc void @julia_draw_game_frame_1523u1525(i32 %0)
  %14 = call fastcc i32 @julia_draw_game_frame_1523u1526(i32 %0)
  %15 = call fastcc i32 @julia_draw_game_frame_1523u1527(i32 1)
  %16 = call fastcc i32 @julia_draw_game_frame_1523u1527(i32 2)
  call fastcc void @julia_draw_game_frame_1523u1529(i32 3)
  call fastcc void @julia_draw_game_frame_1523u1529(i32 4)
  call fastcc void @julia_draw_game_frame_1523u1529(i32 5)
  switch i32 %14, label %L275 [
    i32 1, label %L17
    i32 2, label %L69
    i32 3, label %L121
    i32 4, label %L173
    i32 5, label %L225
    i32 0, label %L298
  ]

L17:                                              ; preds = %top
  %.sub52 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  %.sub = getelementptr inbounds [65 x i8], [65 x i8]* %3, i64 0, i64 0
  %17 = sext i32 %15 to i64
  %18 = add nsw i64 %17, -1
  %19 = call fastcc i32 @julia_toInt32_1549(i64 signext %18)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, i32 1, i32 %19) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub52)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub52, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i33 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub52, i32 1, i32 %19) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub52)
  call fastcc void @julia_draw_game_frame_1523u1535(i32 1, i32 %19)
  br label %L275

L69:                                              ; preds = %top
  %.sub54 = getelementptr inbounds [62 x i8], [62 x i8]* %6, i64 0, i64 0
  %.sub53 = getelementptr inbounds [65 x i8], [65 x i8]* %5, i64 0, i64 0
  %20 = sext i32 %15 to i64
  %21 = add nsw i64 %20, 1
  %22 = call fastcc i32 @julia_toInt32_1549(i64 signext %21)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub53)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub53, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i35 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub53, i32 1, i32 %22) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub53)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub54)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub54, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i37 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub54, i32 1, i32 %22) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub54)
  call fastcc void @julia_draw_game_frame_1523u1535(i32 1, i32 %22)
  br label %L275

L121:                                             ; preds = %top
  %.sub56 = getelementptr inbounds [62 x i8], [62 x i8]* %8, i64 0, i64 0
  %.sub55 = getelementptr inbounds [65 x i8], [65 x i8]* %7, i64 0, i64 0
  %23 = sext i32 %16 to i64
  %24 = add nsw i64 %23, -1
  %25 = call fastcc i32 @julia_toInt32_1549(i64 signext %24)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub55)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub55, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i39 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub55, i32 2, i32 %25) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub55)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub56)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub56, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i41 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub56, i32 2, i32 %25) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub56)
  call fastcc void @julia_draw_game_frame_1523u1535(i32 2, i32 %25)
  br label %L275

L173:                                             ; preds = %top
  %.sub58 = getelementptr inbounds [62 x i8], [62 x i8]* %10, i64 0, i64 0
  %.sub57 = getelementptr inbounds [65 x i8], [65 x i8]* %9, i64 0, i64 0
  %26 = sext i32 %16 to i64
  %27 = add nsw i64 %26, 1
  %28 = call fastcc i32 @julia_toInt32_1549(i64 signext %27)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub57)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub57, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i43 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub57, i32 2, i32 %28) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub57)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub58)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub58, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i45 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub58, i32 2, i32 %28) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub58)
  call fastcc void @julia_draw_game_frame_1523u1535(i32 2, i32 %28)
  br label %L275

L225:                                             ; preds = %top
  %.sub60 = getelementptr inbounds [62 x i8], [62 x i8]* %12, i64 0, i64 0
  %.sub59 = getelementptr inbounds [65 x i8], [65 x i8]* %11, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub59)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub59, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i47 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub59, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub59)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub60)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub60, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i49 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub60, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub60)
  call fastcc void @julia_draw_game_frame_1523u1535(i32 5, i32 1)
  br label %L275

L275:                                             ; preds = %L225, %L173, %L121, %L69, %L17, %top
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %.sub61)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(11) %.sub61, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @_j_const3, i64 0, i64 0), i64 11, i1 false)
  %status.i51 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub61, i32 %14) #0
  br label %L298

L298:                                             ; preds = %L275, %top
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %.sub61)
  ret i32 0
}

define internal fastcc void @julia_draw_game_frame_1523u1525(i32 %0) unnamed_addr {
entry:
  %result = call i32 @draw_rect(i32 %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @draw_rect(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1523u1526(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1523u1527(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1523u1529(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_draw_game_frame_1523u1535(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

; Function Attrs: noinline
define internal fastcc void @julia__throw_inexacterror_1555() unnamed_addr #1 {
top:
  %0 = alloca [19 x i8], align 16
  %.sub = getelementptr inbounds [19 x i8], [19 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %.sub, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @_j_const4, i64 0, i64 0), i64 19, i1 false)
  %status.i = call i32 @puts(i8* noundef nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %.sub)
  call void @exit(i32 1) #0
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) local_unnamed_addr #0

declare void @exit(i32) local_unnamed_addr

define internal fastcc i32 @julia_checked_trunc_sint_1552(i64 signext %0) unnamed_addr {
top:
  %1 = add i64 %0, -2147483648
  %2 = icmp ult i64 %1, -4294967296
  br i1 %2, label %L6, label %L7

L6:                                               ; preds = %top
  call fastcc void @julia__throw_inexacterror_1555()
  br label %L7

L7:                                               ; preds = %L6, %top
  %3 = trunc i64 %0 to i32
  ret i32 %3
}

define internal fastcc i32 @julia_toInt32_1549(i64 signext %0) unnamed_addr {
top:
  %1 = call fastcc i32 @julia_checked_trunc_sint_1552(i64 signext %0)
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
