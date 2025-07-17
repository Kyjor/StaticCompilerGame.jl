; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

%struct.SDL_Rect = type { i32, i32, i32, i32 }

@_j_const3 = private unnamed_addr constant [9 x i8] c"Jumping\0A\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [9 x i8], align 16
  %.sub = getelementptr inbounds [9 x i8], [9 x i8]* %3, i64 0, i64 0
  %4 = call fastcc float @julia_draw_game_frame_1019u1021()
  %5 = call fastcc i32 @julia_draw_game_frame_1019u1022(i32 %0)
  %6 = call fastcc i8* @julia_draw_game_frame_1019u1023(i32 16)
  %memcpy_refined_dst = bitcast i8* %6 to i32*
  store i32 0, i32* %memcpy_refined_dst, align 1
  %coercion1 = getelementptr i8, i8* %6, i64 4
  %memcpy_refined_dst3 = bitcast i8* %coercion1 to i32*
  store i32 0, i32* %memcpy_refined_dst3, align 1
  %coercion4 = getelementptr i8, i8* %6, i64 8
  %memcpy_refined_dst6 = bitcast i8* %coercion4 to i32*
  store i32 100, i32* %memcpy_refined_dst6, align 1
  %coercion7 = getelementptr i8, i8* %6, i64 12
  %memcpy_refined_dst9 = bitcast i8* %coercion7 to i32*
  store i32 100, i32* %memcpy_refined_dst9, align 1
  %7 = bitcast i8* %6 to %struct.SDL_Rect*
  call fastcc void @julia_draw_game_frame_1019u1024(%struct.SDL_Rect* %7)
  call fastcc void @julia_draw_game_frame_1019u1025(i8* %6)
  %8 = call fastcc float @julia_draw_game_frame_1019u1026(i32 1)
  %9 = call fastcc float @julia_draw_game_frame_1019u1026(i32 2)
  %10 = call fastcc float @julia_draw_game_frame_1019u1026(i32 3)
  %11 = call fastcc float @julia_draw_game_frame_1019u1026(i32 4)
  %12 = call fastcc i32 @julia_draw_game_frame_1019u1030(i32 5)
  %13 = call fastcc float @julia_draw_game_frame_1019u1026(i32 6)
  %14 = call fastcc float @julia_draw_game_frame_1019u1026(i32 7)
  %15 = call fastcc i32 @julia_draw_game_frame_1019u1030(i32 8)
  %.not = icmp eq i32 %12, 1
  %16 = fsub float %13, %4
  %value_phi = select i1 %.not, float 0x3FB99999A0000000, float %16
  %.not42 = icmp eq i32 %5, 5
  %17 = fsub float %14, %4
  %value_phi10 = select i1 %.not42, float 0x3FB99999A0000000, float %17
  %.not43 = icmp eq i32 %5, 1
  %.not44 = icmp eq i32 %5, 2
  %. = select i1 %.not44, float 4.000000e+02, float 0.000000e+00
  %value_phi11 = select i1 %.not43, float -4.000000e+02, float %.
  br i1 %.not, label %L97, label %L128

L97:                                              ; preds = %top
  %18 = fmul float %4, 8.000000e+02
  %19 = fcmp uge float %10, %value_phi11
  br i1 %19, label %L112, label %L101

L101:                                             ; preds = %L97
  %20 = fadd float %18, %10
  %21 = fsub float %20, %value_phi11
  %bitcast_coercion = bitcast float %21 to i32
  %22 = icmp slt i32 %bitcast_coercion, 0
  %23 = select i1 %22, float %20, float %value_phi11
  %24 = fcmp ord float %20, 0.000000e+00
  %25 = select i1 %24, float %23, float %21
  br label %L159

L112:                                             ; preds = %L97
  %26 = fcmp uge float %value_phi11, %10
  br i1 %26, label %L159, label %L114

L114:                                             ; preds = %L112
  %27 = fsub float %10, %18
  %28 = fsub float %27, %value_phi11
  %bitcast_coercion29 = bitcast float %28 to i32
  %29 = icmp slt i32 %bitcast_coercion29, 0
  %30 = select i1 %29, float %value_phi11, float %27
  %31 = fcmp ord float %27, 0.000000e+00
  %32 = select i1 %31, float %30, float %28
  br label %L159

L128:                                             ; preds = %top
  %33 = fmul float %4, 4.000000e+02
  %34 = fcmp uge float %10, %value_phi11
  br i1 %34, label %L143, label %L132

L132:                                             ; preds = %L128
  %35 = fadd float %33, %10
  %36 = fsub float %35, %value_phi11
  %bitcast_coercion32 = bitcast float %36 to i32
  %37 = icmp slt i32 %bitcast_coercion32, 0
  %38 = select i1 %37, float %35, float %value_phi11
  %39 = fcmp ord float %35, 0.000000e+00
  %40 = select i1 %39, float %38, float %36
  br label %L159

L143:                                             ; preds = %L128
  %41 = fcmp uge float %value_phi11, %10
  br i1 %41, label %L159, label %L145

L145:                                             ; preds = %L143
  %42 = fsub float %10, %33
  %43 = fsub float %42, %value_phi11
  %bitcast_coercion36 = bitcast float %43 to i32
  %44 = icmp slt i32 %bitcast_coercion36, 0
  %45 = select i1 %44, float %value_phi11, float %42
  %46 = fcmp ord float %42, 0.000000e+00
  %47 = select i1 %46, float %45, float %43
  br label %L159

L159:                                             ; preds = %L145, %L143, %L132, %L114, %L112, %L101
  %value_phi14 = phi float [ %25, %L101 ], [ %32, %L114 ], [ %value_phi11, %L112 ], [ %40, %L132 ], [ %47, %L145 ], [ %value_phi11, %L143 ]
  call fastcc void @julia_draw_game_frame_1019u1034(i32 3, float %value_phi14)
  %48 = icmp ne i32 %12, 1
  %49 = fcmp ule float %value_phi, 0.000000e+00
  %or.cond = select i1 %48, i1 %49, i1 false
  br i1 %or.cond, label %L208, label %L176

L176:                                             ; preds = %L159
  %.not46 = icmp eq i32 %15, 1
  %50 = fcmp olt float %11, 0.000000e+00
  %narrow = select i1 %.not46, i1 %50, i1 false
  %51 = icmp ne i32 %5, 5
  %narrow47 = select i1 %narrow, i1 true, i1 %51
  %52 = fcmp ule float %value_phi10, 0.000000e+00
  %narrow51 = select i1 %48, i1 true, i1 %52
  %or.cond56 = select i1 %narrow47, i1 %narrow51, i1 false
  br i1 %or.cond56, label %L208, label %L191

L191:                                             ; preds = %L176
  call void @llvm.lifetime.start.p0i8(i64 9, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(9) %.sub, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @_j_const3, i64 0, i64 0), i64 9, i1 false)
  call fastcc void @julia_draw_game_frame_1019u1035(i8* nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 9, i8* nonnull %.sub)
  call fastcc void @julia_draw_game_frame_1019u1035(i8* nonnull %.sub)
  call fastcc void @julia_draw_game_frame_1019u1034(i32 4, float -1.200000e+01)
  call fastcc void @julia_draw_game_frame_1019u1038(i32 5, i32 0)
  call fastcc void @julia_draw_game_frame_1019u1038(i32 8, i32 1)
  br label %L208

L208:                                             ; preds = %L191, %L176, %L159
  %value_phi21 = phi float [ -1.200000e+01, %L191 ], [ %11, %L159 ], [ %11, %L176 ]
  %value_phi22 = phi float [ 0.000000e+00, %L191 ], [ %value_phi10, %L159 ], [ %value_phi10, %L176 ]
  %value_phi23 = phi float [ 0.000000e+00, %L191 ], [ %value_phi, %L159 ], [ %value_phi, %L176 ]
  %53 = icmp ne i32 %15, 1
  %54 = fcmp uge float %value_phi21, 0.000000e+00
  %or.cond41 = select i1 %53, i1 true, i1 %54
  %brmerge = select i1 %or.cond41, i1 true, i1 %.not42
  br i1 %brmerge, label %L221, label %L218

L218:                                             ; preds = %L208
  %55 = fmul float %value_phi21, 5.000000e-01
  call fastcc void @julia_draw_game_frame_1019u1034(i32 4, float %55)
  br label %L221

L221:                                             ; preds = %L218, %L208
  %value_phi24 = phi float [ %55, %L218 ], [ %value_phi21, %L208 ]
  %.not49 = icmp eq i32 %12, 0
  br i1 %.not49, label %L224, label %L230

L224:                                             ; preds = %L221
  %56 = fmul float %4, 1.500000e+01
  %57 = fadd float %56, %value_phi24
  call fastcc void @julia_draw_game_frame_1019u1034(i32 4, float %57)
  br label %L233

L230:                                             ; preds = %L221
  call fastcc void @julia_draw_game_frame_1019u1038(i32 8, i32 0)
  br label %L233

L233:                                             ; preds = %L230, %L224
  %value_phi25 = phi float [ %57, %L224 ], [ %value_phi24, %L230 ]
  %value_phi26 = phi i32 [ %15, %L224 ], [ 0, %L230 ]
  %58 = fmul float %4, %value_phi25
  %59 = fadd float %9, %58
  %60 = fcmp ult float %59, 5.000000e+00
  br i1 %60, label %L252, label %L245

L245:                                             ; preds = %L233
  call fastcc void @julia_draw_game_frame_1019u1038(i32 5, i32 1)
  call fastcc void @julia_draw_game_frame_1019u1034(i32 4, float 0.000000e+00)
  br label %L254

L252:                                             ; preds = %L233
  call fastcc void @julia_draw_game_frame_1019u1038(i32 5, i32 0)
  br label %L254

L254:                                             ; preds = %L252, %L245
  %value_phi27 = phi float [ 5.000000e+00, %L245 ], [ %59, %L252 ]
  %61 = fmul float %4, %value_phi14
  %62 = fadd float %8, %61
  call fastcc void @julia_draw_game_frame_1019u1034(i32 1, float %62)
  call fastcc void @julia_draw_game_frame_1019u1034(i32 2, float %value_phi27)
  call fastcc void @julia_draw_game_frame_1019u1034(i32 6, float %value_phi23)
  call fastcc void @julia_draw_game_frame_1019u1034(i32 7, float %value_phi22)
  call fastcc void @julia_draw_game_frame_1019u1038(i32 8, i32 %value_phi26)
  call fastcc void @julia_draw_game_frame_1019u1049(i32 255, i32 0, i32 0, i32 255, float %62, float %value_phi27, i32 64, i32 64)
  ret i32 0
}

define internal fastcc float @julia_draw_game_frame_1019u1021() unnamed_addr {
entry:
  %result = call float @get_delta_time()
  ret float %result
}

; Function Attrs: nounwind
declare float @get_delta_time() local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1019u1022(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

define internal fastcc i8* @julia_draw_game_frame_1019u1023(i32 %size) unnamed_addr {
entry:
  %ptr = call noalias i8* @malloc(i32 %size)
  ret i8* %ptr
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1024(%struct.SDL_Rect* %0) unnamed_addr {
entry:
  %result = call i32 @draw_rect_1(%struct.SDL_Rect* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @draw_rect_1(%struct.SDL_Rect*) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1025(i8* %ptr) unnamed_addr {
entry:
  call void @free(i8* %ptr)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #0

define internal fastcc float @julia_draw_game_frame_1019u1026(i32 %0) unnamed_addr {
entry:
  %result = call float @get_game_state_simple_float(i32 %0)
  ret float %result
}

; Function Attrs: nounwind
declare float @get_game_state_simple_float(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1019u1030(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1034(i32 %0, float %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple_float(i32, float) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1035(i8* %0) unnamed_addr {
entry:
  %result = call i32 @print_string(i8* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @print_string(i8*) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1038(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1019u1049(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7) unnamed_addr {
entry:
  %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7)
  ret void
}

; Function Attrs: nounwind
declare i32 @render_rect(i32, i32, i32, i32, float, float, i32, i32) local_unnamed_addr #0

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nounwind }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
