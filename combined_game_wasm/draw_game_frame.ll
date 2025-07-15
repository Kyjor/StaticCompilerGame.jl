; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = call fastcc float @julia_draw_game_frame_1013u1015()
  %4 = call fastcc i32 @julia_draw_game_frame_1013u1016(i32 %0)
  %5 = call fastcc float @julia_draw_game_frame_1013u1017(i32 1)
  %6 = call fastcc float @julia_draw_game_frame_1013u1017(i32 2)
  %7 = call fastcc float @julia_draw_game_frame_1013u1017(i32 3)
  %8 = call fastcc float @julia_draw_game_frame_1013u1017(i32 4)
  %9 = call fastcc i32 @julia_draw_game_frame_1013u1021(i32 5)
  %10 = call fastcc float @julia_draw_game_frame_1013u1017(i32 6)
  %11 = call fastcc float @julia_draw_game_frame_1013u1017(i32 7)
  %12 = call fastcc i32 @julia_draw_game_frame_1013u1021(i32 8)
  %.not = icmp eq i32 %9, 1
  %13 = fsub float %10, %3
  %value_phi = select i1 %.not, float 0x3FB99999A0000000, float %13
  %.not42 = icmp eq i32 %4, 5
  %14 = fsub float %11, %3
  %value_phi1 = select i1 %.not42, float 0x3FB99999A0000000, float %14
  %.not43 = icmp eq i32 %4, 1
  %.not44 = icmp eq i32 %4, 2
  %. = select i1 %.not44, float 2.000000e+03, float 0.000000e+00
  %value_phi2 = select i1 %.not43, float -2.000000e+03, float %.
  br i1 %.not, label %L71, label %L147

L71:                                              ; preds = %top
  %15 = fcmp oeq float %value_phi2, 0.000000e+00
  br i1 %15, label %L114, label %L73

L73:                                              ; preds = %L71
  %16 = fcmp ule float %value_phi2, 0.000000e+00
  %17 = select i1 %16, float %value_phi2, float 1.000000e+00
  %18 = select i1 %.not43, float -1.000000e+00, float %17
  %19 = fcmp uge float %7, 0.000000e+00
  %20 = fcmp ule float %7, 0.000000e+00
  %21 = select i1 %20, float %7, float 1.000000e+00
  %22 = select i1 %19, float %21, float -1.000000e+00
  %23 = fcmp une float %18, %22
  br i1 %23, label %L114, label %L83

L83:                                              ; preds = %L73
  %24 = fmul float %3, 2.000000e+03
  %25 = fcmp uge float %7, %value_phi2
  br i1 %25, label %L98, label %L87

L87:                                              ; preds = %L83
  %26 = fadd float %24, %7
  %27 = fsub float %26, %value_phi2
  %bitcast_coercion = bitcast float %27 to i32
  %28 = icmp slt i32 %bitcast_coercion, 0
  %29 = select i1 %28, float %26, float %value_phi2
  %30 = fcmp ord float %26, 0.000000e+00
  %31 = select i1 %30, float %29, float %27
  br label %L178

L98:                                              ; preds = %L83
  %32 = fcmp uge float %value_phi2, %7
  br i1 %32, label %L178, label %L100

L100:                                             ; preds = %L98
  %33 = fsub float %7, %24
  %34 = fsub float %33, %value_phi2
  %bitcast_coercion22 = bitcast float %34 to i32
  %35 = icmp slt i32 %bitcast_coercion22, 0
  %36 = select i1 %35, float %value_phi2, float %33
  %37 = fcmp ord float %33, 0.000000e+00
  %38 = select i1 %37, float %36, float %34
  br label %L178

L114:                                             ; preds = %L73, %L71
  %39 = fmul float %3, 8.000000e+01
  %40 = fcmp uge float %7, %value_phi2
  br i1 %40, label %L129, label %L118

L118:                                             ; preds = %L114
  %41 = fadd float %39, %7
  %42 = fsub float %41, %value_phi2
  %bitcast_coercion25 = bitcast float %42 to i32
  %43 = icmp slt i32 %bitcast_coercion25, 0
  %44 = select i1 %43, float %41, float %value_phi2
  %45 = fcmp ord float %41, 0.000000e+00
  %46 = select i1 %45, float %44, float %42
  br label %L178

L129:                                             ; preds = %L114
  %47 = fcmp uge float %value_phi2, %7
  br i1 %47, label %L178, label %L131

L131:                                             ; preds = %L129
  %48 = fsub float %7, %39
  %49 = fsub float %48, %value_phi2
  %bitcast_coercion29 = bitcast float %49 to i32
  %50 = icmp slt i32 %bitcast_coercion29, 0
  %51 = select i1 %50, float %value_phi2, float %48
  %52 = fcmp ord float %48, 0.000000e+00
  %53 = select i1 %52, float %51, float %49
  br label %L178

L147:                                             ; preds = %top
  %54 = fmul float %3, 3.000000e+01
  %55 = fcmp uge float %7, %value_phi2
  br i1 %55, label %L162, label %L151

L151:                                             ; preds = %L147
  %56 = fadd float %54, %7
  %57 = fsub float %56, %value_phi2
  %bitcast_coercion32 = bitcast float %57 to i32
  %58 = icmp slt i32 %bitcast_coercion32, 0
  %59 = select i1 %58, float %56, float %value_phi2
  %60 = fcmp ord float %56, 0.000000e+00
  %61 = select i1 %60, float %59, float %57
  br label %L178

L162:                                             ; preds = %L147
  %62 = fcmp uge float %value_phi2, %7
  br i1 %62, label %L178, label %L164

L164:                                             ; preds = %L162
  %63 = fsub float %7, %54
  %64 = fsub float %63, %value_phi2
  %bitcast_coercion36 = bitcast float %64 to i32
  %65 = icmp slt i32 %bitcast_coercion36, 0
  %66 = select i1 %65, float %value_phi2, float %63
  %67 = fcmp ord float %63, 0.000000e+00
  %68 = select i1 %67, float %66, float %64
  br label %L178

L178:                                             ; preds = %L164, %L162, %L151, %L131, %L129, %L118, %L100, %L98, %L87
  %value_phi10 = phi float [ %31, %L87 ], [ %38, %L100 ], [ %value_phi2, %L98 ], [ %46, %L118 ], [ %53, %L131 ], [ %value_phi2, %L129 ], [ %61, %L151 ], [ %68, %L164 ], [ %value_phi2, %L162 ]
  call fastcc void @julia_draw_game_frame_1013u1025(i32 3, float %value_phi10)
  %69 = icmp ne i32 %9, 1
  %70 = fcmp ule float %value_phi, 0.000000e+00
  %or.cond = select i1 %69, i1 %70, i1 false
  br i1 %or.cond, label %L219, label %L195

L195:                                             ; preds = %L178
  %.not46 = icmp eq i32 %12, 1
  %71 = fcmp olt float %8, 0.000000e+00
  %narrow = select i1 %.not46, i1 %71, i1 false
  %72 = icmp ne i32 %4, 5
  %narrow47 = select i1 %narrow, i1 true, i1 %72
  %73 = fcmp ule float %value_phi1, 0.000000e+00
  %narrow51 = select i1 %69, i1 true, i1 %73
  %or.cond56 = select i1 %narrow47, i1 %narrow51, i1 false
  br i1 %or.cond56, label %L219, label %L210

L210:                                             ; preds = %L195
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float -1.200000e+01)
  call fastcc void @julia_draw_game_frame_1013u1027(i32 5, i32 0)
  call fastcc void @julia_draw_game_frame_1013u1027(i32 8, i32 1)
  br label %L219

L219:                                             ; preds = %L210, %L195, %L178
  %value_phi14 = phi float [ -1.200000e+01, %L210 ], [ %8, %L178 ], [ %8, %L195 ]
  %value_phi15 = phi float [ 0.000000e+00, %L210 ], [ %value_phi1, %L178 ], [ %value_phi1, %L195 ]
  %value_phi16 = phi float [ 0.000000e+00, %L210 ], [ %value_phi, %L178 ], [ %value_phi, %L195 ]
  %74 = icmp ne i32 %12, 1
  %75 = fcmp uge float %value_phi14, 0.000000e+00
  %or.cond41 = select i1 %74, i1 true, i1 %75
  %brmerge = select i1 %or.cond41, i1 true, i1 %.not42
  br i1 %brmerge, label %L232, label %L229

L229:                                             ; preds = %L219
  %76 = fmul float %value_phi14, 5.000000e-01
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float %76)
  br label %L232

L232:                                             ; preds = %L229, %L219
  %value_phi17 = phi float [ %76, %L229 ], [ %value_phi14, %L219 ]
  %.not49 = icmp eq i32 %9, 0
  br i1 %.not49, label %L235, label %L241

L235:                                             ; preds = %L232
  %77 = fmul float %3, 1.500000e+01
  %78 = fadd float %77, %value_phi17
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float %78)
  br label %L244

L241:                                             ; preds = %L232
  call fastcc void @julia_draw_game_frame_1013u1027(i32 8, i32 0)
  br label %L244

L244:                                             ; preds = %L241, %L235
  %value_phi18 = phi float [ %78, %L235 ], [ %value_phi17, %L241 ]
  %value_phi19 = phi i32 [ %12, %L235 ], [ 0, %L241 ]
  %79 = fmul float %3, %value_phi18
  %80 = fadd float %6, %79
  %81 = fcmp ult float %80, 5.000000e+00
  br i1 %81, label %L263, label %L256

L256:                                             ; preds = %L244
  call fastcc void @julia_draw_game_frame_1013u1027(i32 5, i32 1)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 4, float 0.000000e+00)
  br label %L265

L263:                                             ; preds = %L244
  call fastcc void @julia_draw_game_frame_1013u1027(i32 5, i32 0)
  br label %L265

L265:                                             ; preds = %L263, %L256
  %value_phi20 = phi float [ 5.000000e+00, %L256 ], [ %80, %L263 ]
  %82 = fmul float %3, %value_phi10
  %83 = fadd float %5, %82
  call fastcc void @julia_draw_game_frame_1013u1025(i32 1, float %83)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 2, float %value_phi20)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 6, float %value_phi16)
  call fastcc void @julia_draw_game_frame_1013u1025(i32 7, float %value_phi15)
  call fastcc void @julia_draw_game_frame_1013u1027(i32 8, i32 %value_phi19)
  call fastcc void @julia_draw_game_frame_1013u1038(i32 255, i32 0, i32 0, i32 255, float %83, float %value_phi20, i32 64, i32 64)
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

define internal fastcc void @julia_draw_game_frame_1013u1027(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_draw_game_frame_1013u1038(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7) unnamed_addr {
entry:
  %result = call i32 @render_rect(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, i32 %6, i32 %7)
  ret void
}

; Function Attrs: nounwind
declare i32 @render_rect(i32, i32, i32, i32, float, float, i32, i32) local_unnamed_addr #0

attributes #0 = { nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
