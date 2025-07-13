; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_str1 = private unnamed_addr constant [3 x i8] c"if\00", align 1

define void @update_platformer_physics() local_unnamed_addr {
top:
  %0 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 2)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 2)
  %square_vel_y = load atomic {}*, {}** inttoptr (i64 139807058169280 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %1 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y, {}** %1, align 8
  store {}* %square_vel_y, {}** %.sub, align 8
  %2 = getelementptr inbounds [2 x {}*], [2 x {}*]* %0, i64 0, i64 1
  store {}* inttoptr (i64 139807085474080 to {}*), {}** %2, align 8
  %3 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806861458576 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %3, {}** inttoptr (i64 139807058169280 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %key_left = load atomic {}*, {}** inttoptr (i64 139807058169808 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %4 = bitcast {}* %key_left to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 -1
  %6 = load atomic i64, i64* %5 unordered, align 8, !tbaa !15, !range !17
  %7 = and i64 %6, -16
  %8 = inttoptr i64 %7 to {}*
  %exactly_isa = icmp eq {}* %8, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa, label %pass, label %fail

L6:                                               ; preds = %pass
  store atomic {}* inttoptr (i64 139807061586016 to {}*), {}** inttoptr (i64 139807058168992 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L16

L9:                                               ; preds = %pass
  %key_right = load atomic {}*, {}** inttoptr (i64 139807058170048 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %9 = bitcast {}* %key_right to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 -1
  %11 = load atomic i64, i64* %10 unordered, align 8, !tbaa !15, !range !17
  %12 = and i64 %11, -16
  %13 = inttoptr i64 %12 to {}*
  %exactly_isa26 = icmp eq {}* %13, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa26, label %pass28, label %fail27

L11:                                              ; preds = %pass28
  store atomic {}* inttoptr (i64 139807085474032 to {}*), {}** inttoptr (i64 139807058168992 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L16

L14:                                              ; preds = %pass28
  store atomic {}* inttoptr (i64 139806920912544 to {}*), {}** inttoptr (i64 139807058168992 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L16

L16:                                              ; preds = %L14, %L11, %L6
  %square_vel_x30 = phi {}* [ inttoptr (i64 139806920912544 to {}*), %L14 ], [ inttoptr (i64 139807085474032 to {}*), %L11 ], [ inttoptr (i64 139807061586016 to {}*), %L6 ]
  %key_space = load atomic {}*, {}** inttoptr (i64 139807058170288 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %14 = bitcast {}* %key_space to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 -1
  %16 = load atomic i64, i64* %15 unordered, align 8, !tbaa !15, !range !17
  %17 = and i64 %16, -16
  %18 = inttoptr i64 %17 to {}*
  %exactly_isa2 = icmp eq {}* %18, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa2, label %pass4, label %fail3

L18:                                              ; preds = %pass4
  %on_ground = load atomic {}*, {}** inttoptr (i64 139807058169520 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %19 = bitcast {}* %on_ground to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 -1
  %21 = load atomic i64, i64* %20 unordered, align 8, !tbaa !15, !range !17
  %22 = and i64 %21, -16
  %23 = inttoptr i64 %22 to {}*
  %exactly_isa6 = icmp eq {}* %23, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa6, label %pass8, label %fail7

L20:                                              ; preds = %pass8
  store atomic {}* inttoptr (i64 139807085474128 to {}*), {}** inttoptr (i64 139807058169280 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139807000767856 to {}*), {}** inttoptr (i64 139807058169520 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_x.pre = load atomic {}*, {}** inttoptr (i64 139807058168992 to {}**) unordered, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L23

L23:                                              ; preds = %pass8, %pass4, %L20
  %square_vel_x = phi {}* [ %square_vel_x.pre, %L20 ], [ %square_vel_x30, %pass8 ], [ %square_vel_x30, %pass4 ]
  %square_x = load atomic {}*, {}** inttoptr (i64 139807058168512 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %24 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_x, {}** %24, align 8
  %25 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_x, {}** %25, align 8
  store {}* %square_x, {}** %.sub, align 8
  store {}* %square_vel_x, {}** %2, align 8
  %26 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806861458576 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %26, {}** inttoptr (i64 139807058168512 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %square_y = load atomic {}*, {}** inttoptr (i64 139807058168752 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_vel_y9 = load atomic {}*, {}** inttoptr (i64 139807058169280 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %27 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 1)
  store {}* %square_y, {}** %27, align 8
  %28 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_vel_y9, {}** %28, align 8
  store {}* %square_y, {}** %.sub, align 8
  store {}* %square_vel_y9, {}** %2, align 8
  %29 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806861458576 to {}*), {}** nonnull %.sub, i32 2)
  store atomic {}* %29, {}** inttoptr (i64 139807058168752 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %square_x10 = load atomic {}*, {}** inttoptr (i64 139807058168512 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %30 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x10, {}** %30, align 8
  store {}* %square_x10, {}** %.sub, align 8
  store {}* inttoptr (i64 139806920912544 to {}*), {}** %2, align 8
  %31 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806865353344 to {}*), {}** nonnull %.sub, i32 2)
  %32 = bitcast {}* %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 -1
  %34 = load atomic i64, i64* %33 unordered, align 8, !tbaa !15, !range !17
  %35 = and i64 %34, -16
  %36 = inttoptr i64 %35 to {}*
  %exactly_isa12 = icmp eq {}* %36, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa12, label %pass14, label %fail13

L34:                                              ; preds = %pass14
  store atomic {}* inttoptr (i64 139806920912544 to {}*), {}** inttoptr (i64 139807058168512 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L42

L37:                                              ; preds = %pass14
  %square_x20 = load atomic {}*, {}** inttoptr (i64 139807058168512 to {}**) unordered, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  %37 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_x20, {}** %37, align 8
  store {}* %square_x20, {}** %.sub, align 8
  store {}* inttoptr (i64 139807061586144 to {}*), {}** %2, align 8
  %38 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806867105040 to {}*), {}** nonnull %.sub, i32 2)
  %39 = bitcast {}* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 -1
  %41 = load atomic i64, i64* %40 unordered, align 8, !tbaa !15, !range !17
  %42 = and i64 %41, -16
  %43 = inttoptr i64 %42 to {}*
  %exactly_isa22 = icmp eq {}* %43, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa22, label %pass24, label %fail23

L40:                                              ; preds = %pass24
  store atomic {}* inttoptr (i64 139807061586144 to {}*), {}** inttoptr (i64 139807058168512 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L42

L42:                                              ; preds = %pass24, %L40, %L34
  %square_y15 = load atomic {}*, {}** inttoptr (i64 139807058168752 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %44 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %square_y15, {}** %44, align 8
  store {}* %square_y15, {}** %.sub, align 8
  store {}* inttoptr (i64 139807061586176 to {}*), {}** %2, align 8
  %45 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 139806860368752 to {}*), {}** nonnull %.sub, i32 2)
  %46 = bitcast {}* %45 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 -1
  %48 = load atomic i64, i64* %47 unordered, align 8, !tbaa !15, !range !17
  %49 = and i64 %48, -16
  %50 = inttoptr i64 %49 to {}*
  %exactly_isa17 = icmp eq {}* %50, inttoptr (i64 192 to {}*)
  br i1 %exactly_isa17, label %pass19, label %fail18

L45:                                              ; preds = %pass19
  store atomic {}* inttoptr (i64 139807061586176 to {}*), {}** inttoptr (i64 139807058168752 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139806920912544 to {}*), {}** inttoptr (i64 139807058169280 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 139807000767840 to {}*), {}** inttoptr (i64 139807058169520 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  br label %L49

L49:                                              ; preds = %pass19, %L45
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void

fail:                                             ; preds = %top
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %key_left)
  unreachable

pass:                                             ; preds = %top
  %51 = icmp eq {}* %key_left, inttoptr (i64 139807000767856 to {}*)
  br i1 %51, label %L9, label %L6

fail3:                                            ; preds = %L16
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %key_space)
  unreachable

pass4:                                            ; preds = %L16
  %52 = icmp eq {}* %key_space, inttoptr (i64 139807000767856 to {}*)
  br i1 %52, label %L23, label %L18

fail7:                                            ; preds = %L18
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %on_ground)
  unreachable

pass8:                                            ; preds = %L18
  %53 = icmp eq {}* %on_ground, inttoptr (i64 139807000767856 to {}*)
  br i1 %53, label %L23, label %L20

fail13:                                           ; preds = %L23
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %31)
  unreachable

pass14:                                           ; preds = %L23
  %54 = icmp eq {}* %31, inttoptr (i64 139807000767856 to {}*)
  br i1 %54, label %L37, label %L34

fail18:                                           ; preds = %L42
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %45)
  unreachable

pass19:                                           ; preds = %L42
  %55 = icmp eq {}* %45, inttoptr (i64 139807000767856 to {}*)
  br i1 %55, label %L49, label %L45

fail23:                                           ; preds = %L37
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %38)
  unreachable

pass24:                                           ; preds = %L37
  %56 = icmp eq {}* %38, inttoptr (i64 139807000767856 to {}*)
  br i1 %56, label %L42, label %L40

fail27:                                           ; preds = %L9
  call void @ijl_type_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_j_str1, i64 0, i64 0), {}* inttoptr (i64 139806932810976 to {}*), {}* %key_right)
  unreachable

pass28:                                           ; preds = %L9
  %57 = icmp eq {}* %key_right, inttoptr (i64 139807000767856 to {}*)
  br i1 %57, label %L14, label %L11
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
