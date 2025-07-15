; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [9 x i8] c"Jumping\0A\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [9 x i8], align 16
  %.sub = getelementptr inbounds [9 x i8], [9 x i8]* %3, i64 0, i64 0
  %4 = call fastcc float @julia_draw_game_frame_1013u1015()
  %5 = call fastcc i32 @julia_draw_game_frame_1013u1016(i32 %0)
  %6 = call fastcc float @julia_draw_game_frame_1013u1017(i32 1)
  %7 = call fastcc float @julia_draw_game_frame_1013u1017(i32 2)
  %8 = call fastcc float @julia_draw_game_frame_1013u1017(i32 3)
  %9 = call fastcc float @julia_draw_game_frame_1013u1017(i32 4)
  %10 = call fastcc i32 @julia_draw_game_frame_1013u1021(i32 5)
  %11 = call fastcc float @julia_draw_game_frame_1013u1017(i32 6)
  %12 = call fastcc float @julia_draw_game_frame_1013u1017(i32 7)
  %13 = call fastcc i32 @julia_draw_game_frame_1013u1021(i32 8)
  %.not = icmp eq i32 %10, 1
  %14 = fsub float %11, %4
  %value_phi = select i1 %.not, float 0x3FB99999A0000000, float %14
  %.not45 = icmp eq i32 %5, 5
  %15 = fsub float %12, %4
  %value_phi1 = select i1 %.not45, float 0x3FB99999A0000000, float %15
  %.not46 = icmp eq i32 %5, 1
  %.not47 = icmp eq i32 %5, 2
  %. = select i1 %.not47, float 2.000000e+03, float 0.000000e+00
  %value_phi2 = select i1 %.not46, float -2.000000e+03, float %.
  br i1 %.not, label %L71, label %L147

L71:                                              ; preds = %top
  %16 = fcmp oeq float %value_phi2, 0.000000e+00
  br i1 %16, label %L114, label %L73

L73:                                              ; preds = %L71
  %17 = fcmp ule float %value_phi2, 0.000000e+00
  %18 = select i1 %17, float %value_phi2, float 1.000000e+00
  %19 = select i1 %.not46, float -1.000000e+00, float %18
  %20 = fcmp uge float %8, 0.000000e+00
  %21 = fcmp ule float %8, 0.000000e+00
  %22 = select i1 %21, float %8, float 1.000000e+00
  %23 = select i1 %20, float %22, float -1.000000e+00
  %24 = fcmp une float %19, %23
  br i1 %24, label %L114, label %L83

L83:                                              ; preds = %L73
  %25 = fmul float %4, 2.000000e+03
  %26 = fcmp uge float %8, %value_phi2
  br i1 %26, label %L98, label %L87

L87:                                              ; preds = %L83
  %27 = fadd float %25, %8
  %28 = fsub float %27, %value_phi2
  %bitcast_coercion = bitcast float %28 to i32
  %29 = icmp slt i32 %bitcast_coercion, 0
  %30 = select i1 %29, float %27, float %value_phi2
  %31 = fcmp ord float %27, 0.000000e+00
  %32 = select i1 %31, float %30, float %28
  br label %L178

L98:                                              ; preds = %L83
  %33 = fcmp uge float %value_phi2, %8
  br i1 %33, label %L178, label %L100

L100:                                             ; preds = %L98
  %34 = fsub float %8, %25
  %35 = fsub float %34, %value_phi2
  %bitcast_coercion25 = bitcast float %35 to i32
  %36 = icmp slt i32 %bitcast_coercion25, 0
  %37 = select i1 %36, float %value_phi2, float %34
  %38 = fcmp ord float %34, 0.000000e+00
  %39 = select i1 %38, float %37, float %35
  br label %L178

L114:                                             ; preds = %L73, %L71
  %40 = fmul float %4, 8.000000e+01
  %41 = fcmp uge float %8, %value_phi2
  br i1 %41, label %L129, label %L118

L118:                                             ; preds = %L114
  %42 = fadd float %40, %8
  %43 = fsub float %42, %value_phi2
  %bitcast_coercion28 = bitcast float %43 to i32
  %44 = icmp slt i32 %bitcast_coercion28, 0
  %45 = select i1 %44, float %42, float %value_phi2
  %46 = fcmp ord float %42, 0.000000e+00
  %47 = select i1 %46, float %45, float %43
  br label %L178

L129:                                             ; preds = %L114
  %48 = fcmp uge float %value_phi2, %8
  br i1 %48, label %L178, label %L131

L131:                                             ; preds = %L129
  %49 = fsub float %8, %40
  %50 = fsub float %49, %value_phi2
  %bitcast_coercion32 = bitcast float %50 to i32
  %51 = icmp slt i32 %bitcast_coercion32, 0
  %52 = select i1 %51, float %value_phi2, float %49
  %53 = fcmp ord float %49, 0.000000e+00
  %54 = select i1 %53, float %52, float %50
  br label %L178

L147:                                             ; preds = %top
  %55 = fmul float %4, 3.000000e+01
  %56 = fcmp uge float %8, %value_phi2
  br i1 %56, label %L162, label %L151

L151:                                             ; preds = %L147
  %57 = fadd float %55, %8
  %58 = fsub float %57, %value_phi2
  %bitcast_coercion35 = bitcast float %58 to i32
  %59 = icmp slt i32 %bitcast_coercion35, 0
  %60 = select i1 %59, float %57, float %value_phi2
  %61 = fcmp ord float %57, 0.000000e+00
  %62 = select i1 %61, float %60, float %58
  br label %L178

L162:                                             ; preds = %L147
  %63 = fcmp uge float %value_phi2, %8
  br i1 %63, label %L178, label %L164

L164:                                             ; preds = %L162
  %64 = fsub float %8, %55
  %65 = fsub float %64, %value_phi2
  %bitcast_coercion39 = bitcast float %65 to i32
  %66 = icmp slt i32 %bitcast_coercion39, 0
  %67 = select i1 %66, float %value_phi2, float %64
  %68 = fcmp ord float %64, 0.000000e+00
  %69 = select i1 %68, float %67, float %65
  br label %L178

L178:                                             ; preds = %L164, %L162, %L151, %L131, %L129, %L118, %L100, %L98, %L87
  %value_phi10 = phi float [ %32, %L87 ], [ %39, %L100 ], [ %value_phi2, %L98 ], [ %47, %L118 ], [ %54, %L131 ], [ %value_phi2, %L129 ], [ %62, %L151 ], [ %69, %L164 ], [ %value_phi2, %L162 ]
  call fastcc void @julia_draw_game_frame_1013u1025(i32 3, float %value_phi10)
  %70 = icmp ne i32 %10, 1
  %71 = fcmp ule float %value_phi, 0.000000e+00
  %or.cond = select i1 %70, i1 %71, i1 false
  br i1 %or.cond, label %L227, label %L195

L195:                                             ; preds = %L178
  %.not49 = icmp eq i32 %13, 1
  %72 = fcmp olt float %9, 0.000000e+00
  %narrow = select i1 %.not49, i1 %72, i1 false
  %73 = icmp ne i32 %5, 5
  %narrow50 = select i1 %narrow, i1 true, i1 %73
  %74 = fcmp ule float %value_phi1, 0.000000e+00
  %narrow54 = select i1 %70, i1 true, i1 %74
  %or.cond59 = select i1 %narrow50, i1 %narrow54, i1 false
  br i1 %or.cond59, label %L227, label %L210

L210:                                             ; preds = %L195
  call void @llvm.lifetime.start.p0i8(i64 9, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(9) %.sub, i8* noundef nonnull align 1 dereferenceable(9) getelementptr inbounds ([9 x i8], [9 x i8]* @_j_const1, i64 0, i64 0), i64 9, i1 false)
  call fastcc void @julia_draw_game_frame_1013u1026(i8* nonnull %.sub)
  call void @llvm.lifetime.end.p0i8(i64 9, i8* nonnull %.sub)
  call fastcc void @julia_draw_game_frame_1013u1026(i8* nonnull %.sub)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float -1.200000e+01)
  call fastcc void @julia_draw_game_frame_1013u1029(i32 5, i32 0)
  call fastcc void @julia_draw_game_frame_1013u1029(i32 8, i32 1)
  br label %L227

L227:                                             ; preds = %L210, %L195, %L178
  %value_phi17 = phi float [ -1.200000e+01, %L210 ], [ %9, %L178 ], [ %9, %L195 ]
  %value_phi18 = phi float [ 0.000000e+00, %L210 ], [ %value_phi1, %L178 ], [ %value_phi1, %L195 ]
  %value_phi19 = phi float [ 0.000000e+00, %L210 ], [ %value_phi, %L178 ], [ %value_phi, %L195 ]
  %75 = icmp ne i32 %13, 1
  %76 = fcmp uge float %value_phi17, 0.000000e+00
  %or.cond44 = select i1 %75, i1 true, i1 %76
  %brmerge = select i1 %or.cond44, i1 true, i1 %.not45
  br i1 %brmerge, label %L240, label %L237

L237:                                             ; preds = %L227
  %77 = fmul float %value_phi17, 5.000000e-01
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float %77)
  br label %L240

L240:                                             ; preds = %L237, %L227
  %value_phi20 = phi float [ %77, %L237 ], [ %value_phi17, %L227 ]
  %.not52 = icmp eq i32 %10, 0
  br i1 %.not52, label %L243, label %L249

L243:                                             ; preds = %L240
  %78 = fmul float %4, 1.500000e+01
  %79 = fadd float %78, %value_phi20
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float %79)
  br label %L252

L249:                                             ; preds = %L240
  call fastcc void @julia_draw_game_frame_1013u1029(i32 8, i32 0)
  br label %L252

L252:                                             ; preds = %L249, %L243
  %value_phi21 = phi float [ %79, %L243 ], [ %value_phi20, %L249 ]
  %value_phi22 = phi i32 [ %13, %L243 ], [ 0, %L249 ]
  %80 = fmul float %4, %value_phi21
  %81 = fadd float %7, %80
  %82 = fcmp ult float %81, 5.000000e+00
  br i1 %82, label %L271, label %L264

L264:                                             ; preds = %L252
  call fastcc void @julia_draw_game_frame_1013u1029(i32 5, i32 1)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float 0.000000e+00)
  br label %L273

L271:                                             ; preds = %L252
  call fastcc void @julia_draw_game_frame_1013u1029(i32 5, i32 0)
  br label %L273

L273:                                             ; preds = %L271, %L264
  %value_phi23 = phi float [ 5.000000e+00, %L264 ], [ %81, %L271 ]
  %83 = fmul float %4, %value_phi10
  %84 = fadd float %6, %83
  call fastcc void @julia_draw_game_frame_1013u1025(i32 1, float %84)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 2, float %value_phi23)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 6, float %value_phi19)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 7, float %value_phi18)
  call fastcc void @julia_draw_game_frame_1013u1029(i32 8, i32 %value_phi22)
  call fastcc void @julia_draw_game_frame_1013u1040(i32 255, i32 0, i32 0, i32 255, float %84, float %value_phi23, i32 64, i32 64)
  ret i32 0
}

define internal fastcc float @julia_draw_game_frame_1013u1015() unnamed_addr {
entry:
  %result = call float @get_delta_time()
  ret float %result
}

; Function Attrs: nounwind
declare float @get_delta_time() local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1013u1016(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

define internal fastcc float @julia_draw_game_frame_1013u1017(i32 %0) unnamed_addr {
entry:
  %result = call float @get_game_state_simple_float(i32 %0)
  ret float %result
}

; Function Attrs: nounwind
declare float @get_game_state_simple_float(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1013u1021(i32 %0) unnamed_addr {
entry:
  %result = call i32 @get_game_state_simple(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @get_game_state_simple(i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1013u1025(i32 %0, float %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple_float(i32, float) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1013u1026(i8* %0) unnamed_addr {
entry:
  %result = call i32 @print_string(i8* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @print_string(i8*) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1013u1029(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1013u1040(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7) unnamed_addr {
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
