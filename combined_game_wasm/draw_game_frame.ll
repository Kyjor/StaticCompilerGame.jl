; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [65 x i8] c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\0A\00", align 1
@_j_const2 = private unnamed_addr constant [62 x i8] c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\0A\00", align 1
@_j_const3 = private unnamed_addr constant [9 x i8] c"val: %d\0A\00", align 1
@_j_const4 = private unnamed_addr constant [11 x i8] c"Input: %d\0A\00", align 1
@_j_const5 = private unnamed_addr constant [19 x i8] c"Inexact conversion\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [65 x i8], align 16
  %4 = alloca [62 x i8], align 16
  %5 = alloca [65 x i8], align 16
  %6 = alloca [62 x i8], align 16
  %7 = alloca [65 x i8], align 16
  %.sub103 = getelementptr inbounds [65 x i8], [65 x i8]* %7, i64 0, i64 0
  %8 = alloca [62 x i8], align 16
  %.sub104 = getelementptr inbounds [62 x i8], [62 x i8]* %8, i64 0, i64 0
  %9 = alloca [65 x i8], align 16
  %.sub105 = getelementptr inbounds [65 x i8], [65 x i8]* %9, i64 0, i64 0
  %10 = alloca [62 x i8], align 16
  %.sub106 = getelementptr inbounds [62 x i8], [62 x i8]* %10, i64 0, i64 0
  %11 = alloca [65 x i8], align 16
  %.sub107 = getelementptr inbounds [65 x i8], [65 x i8]* %11, i64 0, i64 0
  %12 = alloca [62 x i8], align 16
  %.sub108 = getelementptr inbounds [62 x i8], [62 x i8]* %12, i64 0, i64 0
  %13 = alloca [65 x i8], align 16
  %.sub109 = getelementptr inbounds [65 x i8], [65 x i8]* %13, i64 0, i64 0
  %14 = alloca [62 x i8], align 16
  %.sub110 = getelementptr inbounds [62 x i8], [62 x i8]* %14, i64 0, i64 0
  %15 = alloca [65 x i8], align 16
  %.sub111 = getelementptr inbounds [65 x i8], [65 x i8]* %15, i64 0, i64 0
  %16 = alloca [62 x i8], align 16
  %.sub112 = getelementptr inbounds [62 x i8], [62 x i8]* %16, i64 0, i64 0
  %17 = alloca [65 x i8], align 16
  %.sub113 = getelementptr inbounds [65 x i8], [65 x i8]* %17, i64 0, i64 0
  %18 = alloca [62 x i8], align 16
  %.sub114 = getelementptr inbounds [62 x i8], [62 x i8]* %18, i64 0, i64 0
  %19 = alloca [65 x i8], align 16
  %.sub115 = getelementptr inbounds [65 x i8], [65 x i8]* %19, i64 0, i64 0
  %20 = alloca [62 x i8], align 16
  %.sub116 = getelementptr inbounds [62 x i8], [62 x i8]* %20, i64 0, i64 0
  %21 = alloca [9 x i8], align 16
  %.sub117 = getelementptr inbounds [9 x i8], [9 x i8]* %21, i64 0, i64 0
  %22 = alloca [11 x i8], align 16
  %.sub118 = getelementptr inbounds [11 x i8], [11 x i8]* %22, i64 0, i64 0
  %23 = call fastcc i32 @julia_draw_game_frame_1039u1041(i32 %0)
  %24 = call fastcc i32 @julia_draw_game_frame_1039u1042(i32 1)
  %25 = call fastcc i32 @julia_draw_game_frame_1039u1042(i32 2)
  call fastcc void @julia_draw_game_frame_1039u1044(i32 3)
  %26 = call fastcc i32 @julia_draw_game_frame_1039u1042(i32 4)
  %27 = call fastcc i32 @julia_draw_game_frame_1039u1042(i32 5)
  switch i32 %23, label %L116 [
    i32 1, label %L15
    i32 2, label %L67
  ]

L15:                                              ; preds = %top
  %.sub100 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  %.sub = getelementptr inbounds [65 x i8], [65 x i8]* %3, i64 0, i64 0
  %28 = sext i32 %24 to i64
  %29 = add nsw i64 %28, -1
  %30 = call fastcc i32 @julia_toInt32_1078(i64 signext %29)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, i32 1, i32 %30) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub100)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub100, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i62 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub100, i32 1, i32 %30) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub100)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 1, i32 %30)
  br label %L212

L67:                                              ; preds = %top
  %.sub102 = getelementptr inbounds [62 x i8], [62 x i8]* %6, i64 0, i64 0
  %.sub101 = getelementptr inbounds [65 x i8], [65 x i8]* %5, i64 0, i64 0
  %31 = sext i32 %24 to i64
  %32 = add nsw i64 %31, 1
  %33 = call fastcc i32 @julia_toInt32_1078(i64 signext %32)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub101)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub101, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i64 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub101, i32 1, i32 %33) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub101)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub102)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub102, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i66 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub102, i32 1, i32 %33) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub102)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 1, i32 %33)
  br label %L212

L116:                                             ; preds = %top
  %34 = icmp ne i32 %23, 5
  %35 = icmp ne i32 %27, 1
  %or.cond = select i1 %34, i1 true, i1 %35
  br i1 %or.cond, label %L212, label %L212.thread

L212.thread:                                      ; preds = %L116
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub103)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub103, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i68 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub103, i32 4, i32 -2) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub103)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub104)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub104, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i70 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub104, i32 4, i32 -2) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub104)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 4, i32 -2)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub105)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub105, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i72 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub105, i32 5, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub105)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub106)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub106, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i74 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub106, i32 5, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub106)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 5, i32 0)
  br label %L262

L212:                                             ; preds = %L116, %L67, %L15
  %.not119 = icmp eq i32 %27, 0
  br i1 %.not119, label %L215, label %L262

L215:                                             ; preds = %L212
  %36 = add i32 %26, 1
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub107)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub107, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i76 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub107, i32 4, i32 %36) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub107)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub108)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub108, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i78 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub108, i32 4, i32 %36) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub108)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 4, i32 %36)
  br label %L262

L262:                                             ; preds = %L215, %L212, %L212.thread
  %value_phi23 = phi i32 [ %36, %L215 ], [ %26, %L212 ], [ -2, %L212.thread ]
  %37 = add i32 %value_phi23, %25
  %38 = icmp slt i32 %37, 5
  br i1 %38, label %L359, label %L266

L266:                                             ; preds = %L262
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub109)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub109, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i80 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub109, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub109)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub110)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub110, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i82 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub110, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub110)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 5, i32 1)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub111)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub111, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i84 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub111, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub111)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub112)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub112, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i86 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub112, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub112)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 4, i32 0)
  br label %L405

L359:                                             ; preds = %L262
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub113)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub113, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i88 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub113, i32 5, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub113)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub114)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub114, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i90 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub114, i32 5, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub114)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 5, i32 0)
  br label %L405

L405:                                             ; preds = %L359, %L266
  %value_phi36 = phi i32 [ 5, %L266 ], [ %37, %L359 ]
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub115)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub115, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const1, i64 0, i64 0), i64 65, i1 false)
  %status.i92 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub115, i32 2, i32 %value_phi36) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub115)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub116)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub116, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const2, i64 0, i64 0), i64 62, i1 false)
  %status.i94 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub116, i32 2, i32 %value_phi36) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub116)
  call fastcc void @julia_draw_game_frame_1039u1050(i32 2, i32 %value_phi36)
  %39 = call fastcc i32 @julia_draw_game_frame_1039u1069(i32 255, i32 0, i32 0, i32 255, i32 %24, i32 %value_phi36, i32 64, i32 64)
  call void @llvm.lifetime.start.p0i8(i64 9, i8* nonnull %.sub117)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(9) %.sub117, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @_j_const3, i64 0, i64 0), i64 9, i1 false)
  %status.i96 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub117, i32 %39) #0
  %.not120 = icmp eq i32 %23, 0
  br i1 %.not120, label %L504, label %L481

L481:                                             ; preds = %L405
  call void @llvm.lifetime.end.p0i8(i64 9, i8* nonnull %.sub117)
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %.sub118)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(11) %.sub118, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @_j_const4, i64 0, i64 0), i64 11, i1 false)
  %status.i98 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub118, i32 %23) #0
  br label %L504

L504:                                             ; preds = %L481, %L405
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %.sub118)
  ret i32 0
}

define internal fastcc i32 @julia_draw_game_frame_1039u1041(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1039u1042(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1039u1044(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_draw_game_frame_1039u1050(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1039u1069(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) unnamed_addr {
entry:
  %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @render_rect(i32, i32, i32, i32, i32, i32, i32, i32) local_unnamed_addr #0

define internal fastcc i32 @julia_checked_trunc_sint_1081(i64 signext %0) unnamed_addr {
top:
  %1 = add i64 %0, -2147483648
  %2 = icmp ult i64 %1, -4294967296
  br i1 %2, label %L6, label %L7

L6:                                               ; preds = %top
  call fastcc void @julia__throw_inexacterror_1084()
  br label %L7

L7:                                               ; preds = %L6, %top
  %3 = trunc i64 %0 to i32
  ret i32 %3
}

define internal fastcc i32 @julia_toInt32_1078(i64 signext %0) unnamed_addr {
top:
  %1 = call fastcc i32 @julia_checked_trunc_sint_1081(i64 signext %0)
  ret i32 %1
}

; Function Attrs: noinline
define internal fastcc void @julia__throw_inexacterror_1084() unnamed_addr #1 {
top:
  %0 = alloca [19 x i8], align 16
  %.sub = getelementptr inbounds [19 x i8], [19 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %.sub, i8* noundef nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @_j_const5, i64 0, i64 0), i64 19, i1 false)
  %status.i = call i32 @puts(i8* noundef nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %.sub)
  call void @exit(i32 1) #0
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) local_unnamed_addr #0

declare void @exit(i32) local_unnamed_addr

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
