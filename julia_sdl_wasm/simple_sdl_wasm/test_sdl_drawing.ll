; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define i32 @test_sdl_drawing() local_unnamed_addr {
top:
  store atomic {}* inttoptr (i64 140506237381984 to {}*), {}** inttoptr (i64 140506294854192 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506237381984 to {}*), {}** inttoptr (i64 140506294854432 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  call fastcc void @julia_println_2118({}* inttoptr (i64 140506323632200 to {}*))
  call fastcc void @julia_clear_screen_2123(i32 signext 0)
  call fastcc void @julia_draw_rect_2120(i32 signext 100, i32 signext 100, i32 signext 50, i32 signext 50, i32 signext 5)
  call fastcc void @julia_present_frame_2115()
  ret i32 0
}

declare nonnull {}* @ijl_box_int32(i32 signext) local_unnamed_addr

define internal fastcc void @julia_present_frame_2115() unnamed_addr {
top:
  %0 = alloca {}*, align 8
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %drawing_enabled = load atomic {}*, {}** inttoptr (i64 140506294854432 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %drawing_enabled, {}** %1, align 8
  store {}* %drawing_enabled, {}** %0, align 8
  %2 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506102030896 to {}*), {}** nonnull %0, i32 1)
  %3 = bitcast {}* %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 -1
  %5 = load atomic i64, i64* %4 unordered, align 8, !tbaa !15, !range !17
  %6 = and i64 %5, -16
  %7 = inttoptr i64 %6 to {}*
  %exactly_isa = icmp eq {}* %7, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

common.ret:                                       ; preds = %pass, %L6
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

L6:                                               ; preds = %pass
  call fastcc void @julia_println_2118({}* inttoptr (i64 140506323633152 to {}*))
  br label %common.ret

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %2)
  unreachable

pass:                                             ; preds = %top
  %8 = icmp eq {}* %2, inttoptr (i64 140506237382000 to {}*)
  br i1 %8, label %L6, label %common.ret
}

declare nonnull {}* @ijl_apply_generic({}*, {}** noalias nocapture noundef readonly, i32) local_unnamed_addr

; Function Attrs: noreturn
declare void @ijl_type_error(i8*, {}*, {}*) local_unnamed_addr #0

define internal fastcc void @julia_draw_rect_2120(i32 signext %0, i32 signext %1, i32 signext %2, i32 signext %3, i32 signext %4) unnamed_addr {
top:
  %5 = alloca [10 x {}*], align 8
  %.sub = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 5)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 5)
  %drawing_enabled = load atomic {}*, {}** inttoptr (i64 140506294854432 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  %6 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %drawing_enabled, {}** %6, align 8
  store {}* %drawing_enabled, {}** %.sub, align 8
  %7 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506102030896 to {}*), {}** nonnull %.sub, i32 1)
  %8 = bitcast {}* %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 -1
  %10 = load atomic i64, i64* %9 unordered, align 8, !tbaa !15, !range !17
  %11 = and i64 %10, -16
  %12 = inttoptr i64 %11 to {}*
  %exactly_isa = icmp eq {}* %12, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

common.ret:                                       ; preds = %pass8, %pass
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

L6:                                               ; preds = %pass
  %13 = call nonnull {}* inttoptr (i64 140506669958944 to {}* ({}*, i64)*)({}* inttoptr (i64 140506096990144 to {}*), i64 5)
  %14 = bitcast {}* %13 to { i8*, i64, i16, i16, i32 }*
  %15 = bitcast {}* %13 to {}***
  %arrayptr13 = load {}**, {}*** %15, align 8, !tbaa !18, !nonnull !21
  store atomic {}* inttoptr (i64 140506323632592 to {}*), {}** %arrayptr13 release, align 8, !tbaa !22
  %16 = getelementptr inbounds {}*, {}** %arrayptr13, i64 1
  store atomic {}* inttoptr (i64 140506323632648 to {}*), {}** %16 release, align 8, !tbaa !22
  %17 = getelementptr inbounds {}*, {}** %arrayptr13, i64 2
  store atomic {}* inttoptr (i64 140506323632704 to {}*), {}** %17 release, align 8, !tbaa !22
  %18 = getelementptr inbounds {}*, {}** %arrayptr13, i64 3
  store atomic {}* inttoptr (i64 140506323632760 to {}*), {}** %18 release, align 8, !tbaa !22
  %19 = getelementptr inbounds {}*, {}** %arrayptr13, i64 4
  store atomic {}* inttoptr (i64 140506323632816 to {}*), {}** %19 release, align 8, !tbaa !22, !alias.scope !7, !noalias !10
  %20 = sext i32 %4 to i64
  %arraylen_ptr = getelementptr inbounds { i8*, i64, i16, i16, i32 }, { i8*, i64, i16, i16, i32 }* %14, i64 0, i32 1
  %arraylen = load i64, i64* %arraylen_ptr, align 8, !tbaa !24, !range !26, !alias.scope !27, !noalias !28
  %inbounds = icmp ugt i64 %arraylen, %20
  br i1 %inbounds, label %idxend, label %oob

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %7)
  unreachable

pass:                                             ; preds = %top
  %21 = icmp eq {}* %7, inttoptr (i64 140506237382000 to {}*)
  br i1 %21, label %L6, label %common.ret

oob:                                              ; preds = %L6
  %22 = add nsw i64 %20, 1
  %errorbox = alloca i64, align 8
  store i64 %22, i64* %errorbox, align 8
  call void @ijl_bounds_error_ints({}* %13, i64* nonnull %errorbox, i64 1)
  unreachable

idxend:                                           ; preds = %L6
  %23 = getelementptr inbounds {}*, {}** %arrayptr13, i64 %20
  %arrayref = load {}*, {}** %23, align 8, !tbaa !22, !alias.scope !7, !noalias !10
  %.not10 = icmp eq {}* %arrayref, null
  br i1 %.not10, label %fail7, label %pass8

fail7:                                            ; preds = %idxend
  call void @ijl_throw({}* inttoptr (i64 140506168282176 to {}*))
  unreachable

pass8:                                            ; preds = %idxend
  %24 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 4)
  store {}* %arrayref, {}** %24, align 8
  %25 = call nonnull {}* @ijl_box_int32(i32 signext %0)
  %26 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 3)
  store {}* %25, {}** %26, align 8
  %27 = call nonnull {}* @ijl_box_int32(i32 signext %1)
  %28 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 2)
  store {}* %27, {}** %28, align 8
  %29 = call nonnull {}* @ijl_box_int32(i32 signext %2)
  %30 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %29, {}** %30, align 8
  %31 = call nonnull {}* @ijl_box_int32(i32 signext %3)
  %32 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %31, {}** %32, align 8
  store {}* inttoptr (i64 140506323632872 to {}*), {}** %.sub, align 8
  %33 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 1
  store {}* %25, {}** %33, align 8
  %34 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 2
  store {}* inttoptr (i64 140506323632928 to {}*), {}** %34, align 8
  %35 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 3
  store {}* %27, {}** %35, align 8
  %36 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 4
  store {}* inttoptr (i64 140506323632928 to {}*), {}** %36, align 8
  %37 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 5
  store {}* %29, {}** %37, align 8
  %38 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 6
  store {}* inttoptr (i64 140506323632928 to {}*), {}** %38, align 8
  %39 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 7
  store {}* %31, {}** %39, align 8
  %40 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 8
  store {}* inttoptr (i64 140506323633096 to {}*), {}** %40, align 8
  %41 = getelementptr inbounds [10 x {}*], [10 x {}*]* %5, i64 0, i64 9
  store {}* %arrayref, {}** %41, align 8
  %42 = call nonnull {}* @ijl_invoke({}* inttoptr (i64 140506099447824 to {}*), {}** nonnull %.sub, i32 10, {}* inttoptr (i64 140506152679344 to {}*))
  %43 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %42, {}** %43, align 8
  call fastcc void @julia_println_2118({}* %42)
  br label %common.ret
}

; Function Attrs: noreturn
declare void @ijl_bounds_error_ints({}*, i64*, i64) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @ijl_throw({}*) local_unnamed_addr #0

declare nonnull {}* @ijl_invoke({}*, {}** nocapture readonly, i32, {}*) local_unnamed_addr

define internal fastcc void @julia_clear_screen_2123(i32 signext %0) unnamed_addr {
top:
  %1 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %drawing_enabled = load atomic {}*, {}** inttoptr (i64 140506294854432 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  %2 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %drawing_enabled, {}** %2, align 8
  store {}* %drawing_enabled, {}** %.sub, align 8
  %3 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506102030896 to {}*), {}** nonnull %.sub, i32 1)
  %4 = bitcast {}* %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 -1
  %6 = load atomic i64, i64* %5 unordered, align 8, !tbaa !15, !range !17
  %7 = and i64 %6, -16
  %8 = inttoptr i64 %7 to {}*
  %exactly_isa = icmp eq {}* %8, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

common.ret:                                       ; preds = %pass8, %pass
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

L6:                                               ; preds = %pass
  %9 = call nonnull {}* inttoptr (i64 140506669958944 to {}* ({}*, i64)*)({}* inttoptr (i64 140506096990144 to {}*), i64 5)
  %10 = bitcast {}* %9 to { i8*, i64, i16, i16, i32 }*
  %11 = bitcast {}* %9 to {}***
  %arrayptr13 = load {}**, {}*** %11, align 8, !tbaa !18, !nonnull !21
  store atomic {}* inttoptr (i64 140506323632256 to {}*), {}** %arrayptr13 release, align 8, !tbaa !22
  %12 = getelementptr inbounds {}*, {}** %arrayptr13, i64 1
  store atomic {}* inttoptr (i64 140506323632312 to {}*), {}** %12 release, align 8, !tbaa !22
  %13 = getelementptr inbounds {}*, {}** %arrayptr13, i64 2
  store atomic {}* inttoptr (i64 140506323632368 to {}*), {}** %13 release, align 8, !tbaa !22
  %14 = getelementptr inbounds {}*, {}** %arrayptr13, i64 3
  store atomic {}* inttoptr (i64 140506323632424 to {}*), {}** %14 release, align 8, !tbaa !22
  %15 = getelementptr inbounds {}*, {}** %arrayptr13, i64 4
  store atomic {}* inttoptr (i64 140506323632480 to {}*), {}** %15 release, align 8, !tbaa !22, !alias.scope !7, !noalias !10
  %16 = sext i32 %0 to i64
  %arraylen_ptr = getelementptr inbounds { i8*, i64, i16, i16, i32 }, { i8*, i64, i16, i16, i32 }* %10, i64 0, i32 1
  %arraylen = load i64, i64* %arraylen_ptr, align 8, !tbaa !24, !range !26, !alias.scope !27, !noalias !28
  %inbounds = icmp ugt i64 %arraylen, %16
  br i1 %inbounds, label %idxend, label %oob

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 140506169425120 to {}*), {}* %3)
  unreachable

pass:                                             ; preds = %top
  %17 = icmp eq {}* %3, inttoptr (i64 140506237382000 to {}*)
  br i1 %17, label %L6, label %common.ret

oob:                                              ; preds = %L6
  %18 = add nsw i64 %16, 1
  %errorbox = alloca i64, align 8
  store i64 %18, i64* %errorbox, align 8
  call void @ijl_bounds_error_ints({}* %9, i64* nonnull %errorbox, i64 1)
  unreachable

idxend:                                           ; preds = %L6
  %19 = getelementptr inbounds {}*, {}** %arrayptr13, i64 %16
  %arrayref = load {}*, {}** %19, align 8, !tbaa !22, !alias.scope !7, !noalias !10
  %.not10 = icmp eq {}* %arrayref, null
  br i1 %.not10, label %fail7, label %pass8

fail7:                                            ; preds = %idxend
  call void @ijl_throw({}* inttoptr (i64 140506168282176 to {}*))
  unreachable

pass8:                                            ; preds = %idxend
  %20 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %arrayref, {}** %20, align 8
  store {}* inttoptr (i64 140506323632536 to {}*), {}** %.sub, align 8
  %21 = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 1
  store {}* %arrayref, {}** %21, align 8
  %22 = call nonnull {}* @ijl_invoke({}* inttoptr (i64 140506100852688 to {}*), {}** nonnull %.sub, i32 2, {}* inttoptr (i64 140506153700320 to {}*))
  %23 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %22, {}** %23, align 8
  call fastcc void @julia_println_2118({}* %22)
  br label %common.ret
}

define internal fastcc void @julia_println_2118({}* noundef nonnull %0) unnamed_addr {
top:
  %1 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %stdout = load atomic {}*, {}** inttoptr (i64 140506099633904 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %2 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %stdout, {}** %2, align 8
  store {}* %stdout, {}** %.sub, align 8
  %3 = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 1
  store {}* %0, {}** %3, align 8
  %4 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506097226288 to {}*), {}** nonnull %.sub, i32 2)
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void
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
!18 = !{!19, !19, i64 0}
!19 = !{!"jtbaa_arrayptr", !20, i64 0}
!20 = !{!"jtbaa_array", !5, i64 0}
!21 = !{}
!22 = !{!23, !23, i64 0}
!23 = !{!"jtbaa_ptrarraybuf", !4, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"jtbaa_arraylen", !20, i64 0}
!26 = !{i64 0, i64 9223372036854775807}
!27 = !{!13}
!28 = !{!11, !12, !8, !14}
