; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [11 x i8] c"Input: %d\0A\00", align 1

define i32 @draw_game_frame(i32 signext %0, i32 signext %1, i32 signext %2) local_unnamed_addr {
top:
  %3 = alloca [11 x i8], align 16
  %.sub = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  call fastcc void @julia_draw_game_frame_1520u1522(i32 %0)
  %4 = call fastcc i32 @julia_draw_game_frame_1520u1523(i32 %0)
  %.not = icmp eq i32 %4, 0
  br i1 %.not, label %L32, label %L9

L9:                                               ; preds = %top
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(11) %.sub, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([11 x i8], [11 x i8]* @_j_const1, i64 0, i64 0), i64 11, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub, i32 %4) #0
  br label %L32

L32:                                              ; preds = %L9, %top
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %.sub)
  ret i32 %4
}

define internal fastcc void @julia_draw_game_frame_1520u1522(i32 %0) unnamed_addr {
entry:
  %result = call i32 @draw_rect(i32 %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @draw_rect(i32) local_unnamed_addr #0

define internal fastcc i32 @julia_draw_game_frame_1520u1523(i32 %0) unnamed_addr {
entry:
  %result = call i32 @update_input(i32 %0)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @update_input(i32) local_unnamed_addr #0

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

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
