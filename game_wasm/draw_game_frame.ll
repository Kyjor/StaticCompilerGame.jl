; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [27 x i8] c"test_rect: %d, %d, %d, %d\0A\00", align 1
@_j_const2 = private unnamed_addr constant [9 x i8] c"Jumping\0A\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [27 x i8], align 16
  %.sub = getelementptr inbounds [27 x i8], [27 x i8]* %3, i64 0, i64 0
  %4 = alloca [9 x i8], align 16
  %.sub36 = getelementptr inbounds [9 x i8], [9 x i8]* %4, i64 0, i64 0
  %5 = call fastcc float @julia_draw_game_frame_1049u1051()
  %6 = call fastcc i32 @julia_draw_game_frame_1049u1052(i32 %0)
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(27) %.sub, i8* noundef nonnull align 1 dereferenceable(27) getelementptr inbounds ([27 x i8], [27 x i8]* @_j_const1, i64 0, i64 0), i64 27, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, i32 0, i32 0, i32 100, i32 100) #0
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %.sub)
  %7 = call fastcc float @julia_draw_game_frame_1049u1054(i32 1)
  %8 = call fastcc float @julia_draw_game_frame_1049u1054(i32 2)
  %9 = call fastcc float @julia_draw_game_frame_1049u1054(i32 3)
  %10 = call fastcc float @julia_draw_game_frame_1049u1054(i32 4)
  %11 = call fastcc i32 @julia_draw_game_frame_1049u1058(i32 5)
  %12 = call fastcc float @julia_draw_game_frame_1049u1054(i32 6)
  %13 = call fastcc float @julia_draw_game_frame_1049u1054(i32 7)
  %14 = call fastcc i32 @julia_draw_game_frame_1049u1058(i32 8)
  %.not = icmp eq i32 %11, 1
  %15 = fsub float %12, %5
  %value_phi = select i1 %.not, float 0x3FB99999A0000000, float %15
  %.not37 = icmp eq i32 %6, 5
  %16 = fsub float %13, %5
  %value_phi2 = select i1 %.not37, float 0x3FB99999A0000000, float %16
  %.not38 = icmp eq i32 %6, 1
  %.not39 = icmp eq i32 %6, 2
  %. = select i1 %.not39, float 4.000000e+02, float 0.000000e+00
  %value_phi3 = select i1 %.not38, float -4.000000e+02, float %.
  br i1 %.not, label %L91, label %L122

L91:                                              ; preds = %top
  %17 = fmul float %5, 8.000000e+02
  %18 = fcmp uge float %9, %value_phi3
  br i1 %18, label %L106, label %L95

L95:                                              ; preds = %L91
  %19 = fadd float %17, %9
  %20 = fsub float %19, %value_phi3
  %bitcast_coercion4 = bitcast float %20 to i32
  %21 = icmp slt i32 %bitcast_coercion4, 0
  %22 = select i1 %21, float %19, float %value_phi3
  %23 = fcmp ord float %19, 0.000000e+00
  %24 = select i1 %23, float %22, float %20
  br label %L153

L106:                                             ; preds = %L91
  %25 = fcmp uge float %value_phi3, %9
  br i1 %25, label %L153, label %L108

L108:                                             ; preds = %L106
  %26 = fsub float %9, %17
  %27 = fsub float %26, %value_phi3
  %bitcast_coercion23 = bitcast float %27 to i32
  %28 = icmp slt i32 %bitcast_coercion23, 0
  %29 = select i1 %28, float %value_phi3, float %26
  %30 = fcmp ord float %26, 0.000000e+00
  %31 = select i1 %30, float %29, float %27
  br label %L153

L122:                                             ; preds = %top
  %32 = fmul float %5, 4.000000e+02
  %33 = fcmp uge float %9, %value_phi3
  br i1 %33, label %L137, label %L126

L126:                                             ; preds = %L122
  %34 = fadd float %32, %9
  %35 = fsub float %34, %value_phi3
  %bitcast_coercion26 = bitcast float %35 to i32
  %36 = icmp slt i32 %bitcast_coercion26, 0
  %37 = select i1 %36, float %34, float %value_phi3
  %38 = fcmp ord float %34, 0.000000e+00
  %39 = select i1 %38, float %37, float %35
  br label %L153

L137:                                             ; preds = %L122
  %40 = fcmp uge float %value_phi3, %9
  br i1 %40, label %L153, label %L139

L139:                                             ; preds = %L137
  %41 = fsub float %9, %32
  %42 = fsub float %41, %value_phi3
  %bitcast_coercion30 = bitcast float %42 to i32
  %43 = icmp slt i32 %bitcast_coercion30, 0
  %44 = select i1 %43, float %value_phi3, float %41
  %45 = fcmp ord float %41, 0.000000e+00
  %46 = select i1 %45, float %44, float %42
  br label %L153

L153:                                             ; preds = %L139, %L137, %L126, %L108, %L106, %L95
  %value_phi7 = phi float [ %24, %L95 ], [ %31, %L108 ], [ %value_phi3, %L106 ], [ %39, %L126 ], [ %46, %L139 ], [ %value_phi3, %L137 ]
  call fastcc void @julia_draw_game_frame_1049u1062(i32 3, float %value_phi7)
  %47 = icmp ne i32 %11, 1
  %48 = fcmp ule float %value_phi, 0.000000e+00
  %or.cond = select i1 %47, i1 %48, i1 false
  br i1 %or.cond, label %L202, label %L170

L170:                                             ; preds = %L153
  %.not41 = icmp eq i32 %14, 1
  %49 = fcmp olt float %10, 0.000000e+00
  %narrow = select i1 %.not41, i1 %49, i1 false
  %50 = icmp ne i32 %6, 5
  %narrow42 = select i1 %narrow, i1 true, i1 %50
  %51 = fcmp ule float %value_phi2, 0.000000e+00
  %narrow46 = select i1 %47, i1 true, i1 %51
  %or.cond51 = select i1 %narrow42, i1 %narrow46, i1 false
  br i1 %or.cond51, label %L202, label %L185

L185:                                             ; preds = %L170
  call void @llvm.lifetime.start.p0i8(i64 9, i8* nonnull %.sub36)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(9) %.sub36, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @_j_const2, i64 0, i64 0), i64 9, i1 false)
  call fastcc void @julia_draw_game_frame_1049u1063(i8* nonnull %.sub36)
  call void @llvm.lifetime.end.p0i8(i64 9, i8* nonnull %.sub36)
  call fastcc void @julia_draw_game_frame_1049u1063(i8* nonnull %.sub36)
  call fastcc void @julia_draw_game_frame_1049u1062(i32 4, float -1.200000e+01)
  call fastcc void @julia_draw_game_frame_1049u1066(i32 5, i32 0)
  call fastcc void @julia_draw_game_frame_1049u1066(i32 8, i32 1)
  br label %L202

L202:                                             ; preds = %L185, %L170, %L153
  %value_phi15 = phi float [ -1.200000e+01, %L185 ], [ %10, %L153 ], [ %10, %L170 ]
  %value_phi16 = phi float [ 0.000000e+00, %L185 ], [ %value_phi2, %L153 ], [ %value_phi2, %L170 ]
  %value_phi17 = phi float [ 0.000000e+00, %L185 ], [ %value_phi, %L153 ], [ %value_phi, %L170 ]
  %52 = icmp ne i32 %14, 1
  %53 = fcmp uge float %value_phi15, 0.000000e+00
  %or.cond35 = select i1 %52, i1 true, i1 %53
  %brmerge = select i1 %or.cond35, i1 true, i1 %.not37
  br i1 %brmerge, label %L215, label %L212

L212:                                             ; preds = %L202
  %54 = fmul float %value_phi15, 5.000000e-01
  call fastcc void @julia_draw_game_frame_1049u1062(i32 4, float %54)
  br label %L215

L215:                                             ; preds = %L212, %L202
  %value_phi18 = phi float [ %54, %L212 ], [ %value_phi15, %L202 ]
  %.not44 = icmp eq i32 %11, 0
  br i1 %.not44, label %L218, label %L224

L218:                                             ; preds = %L215
  %55 = fmul float %5, 1.500000e+01
  %56 = fadd float %55, %value_phi18
  call fastcc void @julia_draw_game_frame_1049u1062(i32 4, float %56)
  br label %L227

L224:                                             ; preds = %L215
  call fastcc void @julia_draw_game_frame_1049u1066(i32 8, i32 0)
  br label %L227

L227:                                             ; preds = %L224, %L218
  %value_phi19 = phi float [ %56, %L218 ], [ %value_phi18, %L224 ]
  %value_phi20 = phi i32 [ %14, %L218 ], [ 0, %L224 ]
  %57 = fmul float %5, %value_phi19
  %58 = fadd float %8, %57
  %59 = fcmp ult float %58, 5.000000e+00
  br i1 %59, label %L246, label %L239

L239:                                             ; preds = %L227
  call fastcc void @julia_draw_game_frame_1049u1066(i32 5, i32 1)
  call fastcc void @julia_draw_game_frame_1049u1062(i32 4, float 0.000000e+00)
  br label %L248

L246:                                             ; preds = %L227
  call fastcc void @julia_draw_game_frame_1049u1066(i32 5, i32 0)
  br label %L248

L248:                                             ; preds = %L246, %L239
  %value_phi21 = phi float [ 5.000000e+00, %L239 ], [ %58, %L246 ]
  %60 = fmul float %5, %value_phi7
  %61 = fadd float %7, %60
  call fastcc void @julia_draw_game_frame_1049u1062(i32 1, float %61)
  call fastcc void @julia_draw_game_frame_1049u1062(i32 2, float %value_phi21)
  call fastcc void @julia_draw_game_frame_1049u1062(i32 6, float %value_phi17)
  call fastcc void @julia_draw_game_frame_1049u1062(i32 7, float %value_phi16)
  call fastcc void @julia_draw_game_frame_1049u1066(i32 8, i32 %value_phi20)
  call fastcc void @julia_draw_game_frame_1049u1077(i32 255, i32 0, i32 0, i32 255, float %61, float %value_phi21, i32 64, i32 64)
  ret i32 0
}

define internal fastcc float @julia_draw_game_frame_1049u1051() unnamed_addr {
entry:
  %result = call float @get_delta_time()
  ret float %result
}

; Function Attrs: nounwind
declare float @get_delta_time() local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1049u1052(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc float @julia_draw_game_frame_1049u1054(i32 %0) unnamed_addr {
entry:
  %result = call float @get_game_state_simple_float(i32 %0)
  ret float %result
}

; Function Attrs: nounwind
declare float @get_game_state_simple_float(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1049u1058(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1049u1062(i32 %0, float %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple_float(i32, float) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1049u1063(i8* %0) unnamed_addr {
entry:
  %result = call i32 @print_string(i8* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @print_string(i8*) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1049u1066(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1049u1077(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7) unnamed_addr {
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
