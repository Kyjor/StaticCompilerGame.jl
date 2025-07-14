; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [25 x i8] c"Initializing game state\0A\00", align 1
@_j_const2 = private unnamed_addr constant [65 x i8] c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\0A\00", align 1
@_j_const3 = private unnamed_addr constant [62 x i8] c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\0A\00", align 1
@_j_const4 = private unnamed_addr constant [26 x i8] c"Initializing game states\0A\00", align 1
@_j_const5 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

define i32 @j_init_game_state() local_unnamed_addr {
top:
  %0 = alloca [25 x i8], align 16
  %.sub = getelementptr inbounds [25 x i8], [25 x i8]* %0, i64 0, i64 0
  %1 = alloca [65 x i8], align 16
  %.sub81 = getelementptr inbounds [65 x i8], [65 x i8]* %1, i64 0, i64 0
  %2 = alloca [62 x i8], align 16
  %.sub82 = getelementptr inbounds [62 x i8], [62 x i8]* %2, i64 0, i64 0
  %3 = alloca [26 x i8], align 16
  %.sub83 = getelementptr inbounds [26 x i8], [26 x i8]* %3, i64 0, i64 0
  %4 = alloca [12 x i8], align 16
  %.sub84 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 0
  %5 = alloca [65 x i8], align 16
  %.sub85 = getelementptr inbounds [65 x i8], [65 x i8]* %5, i64 0, i64 0
  %6 = alloca [62 x i8], align 16
  %.sub86 = getelementptr inbounds [62 x i8], [62 x i8]* %6, i64 0, i64 0
  %7 = alloca [12 x i8], align 16
  %.sub87 = getelementptr inbounds [12 x i8], [12 x i8]* %7, i64 0, i64 0
  %8 = alloca [65 x i8], align 16
  %.sub88 = getelementptr inbounds [65 x i8], [65 x i8]* %8, i64 0, i64 0
  %9 = alloca [62 x i8], align 16
  %.sub89 = getelementptr inbounds [62 x i8], [62 x i8]* %9, i64 0, i64 0
  %10 = alloca [12 x i8], align 16
  %.sub90 = getelementptr inbounds [12 x i8], [12 x i8]* %10, i64 0, i64 0
  %11 = alloca [65 x i8], align 16
  %.sub91 = getelementptr inbounds [65 x i8], [65 x i8]* %11, i64 0, i64 0
  %12 = alloca [62 x i8], align 16
  %.sub92 = getelementptr inbounds [62 x i8], [62 x i8]* %12, i64 0, i64 0
  %13 = alloca [12 x i8], align 16
  %.sub93 = getelementptr inbounds [12 x i8], [12 x i8]* %13, i64 0, i64 0
  %14 = alloca [65 x i8], align 16
  %.sub94 = getelementptr inbounds [65 x i8], [65 x i8]* %14, i64 0, i64 0
  %15 = alloca [62 x i8], align 16
  %.sub95 = getelementptr inbounds [62 x i8], [62 x i8]* %15, i64 0, i64 0
  %16 = alloca [12 x i8], align 16
  %.sub96 = getelementptr inbounds [12 x i8], [12 x i8]* %16, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(25) %.sub, i8* noundef nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @_j_const1, i64 0, i64 0), i64 25, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub) #0
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %.sub)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub81)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub81, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i50 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub81, i32 1, i32 320) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub81)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub82)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub82, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i52 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub82, i32 1, i32 320) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub82)
  %17 = call fastcc i32 @julia_j_init_game_state_1660u1665(i32 1, i32 320)
  call fastcc void @julia_j_init_game_state_1660u1666()
  call void @llvm.lifetime.start.p0i8(i64 26, i8* nonnull %.sub83)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(26) %.sub83, i8* noundef nonnull align 1 dereferenceable(26) getelementptr inbounds ([26 x i8], [26 x i8]* @_j_const4, i64 0, i64 0), i64 26, i1 false)
  %status.i54 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub83) #0
  call void @llvm.lifetime.end.p0i8(i64 26, i8* nonnull %.sub83)
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %.sub84)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(12) %.sub84, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @_j_const5, i64 0, i64 0), i64 12, i1 false)
  %status.i56 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub84, i32 %17) #0
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %.sub84)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub85)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub85, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i58 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub85, i32 2, i32 448) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub85)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub86)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub86, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i60 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub86, i32 2, i32 448) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub86)
  %18 = call fastcc i32 @julia_j_init_game_state_1660u1665(i32 2, i32 448)
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %.sub87)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(12) %.sub87, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @_j_const5, i64 0, i64 0), i64 12, i1 false)
  %status.i62 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub87, i32 %18) #0
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %.sub87)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub88)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub88, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i64 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub88, i32 3, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub88)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub89)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub89, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i66 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub89, i32 3, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub89)
  %19 = call fastcc i32 @julia_j_init_game_state_1660u1665(i32 3, i32 0)
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %.sub90)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(12) %.sub90, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @_j_const5, i64 0, i64 0), i64 12, i1 false)
  %status.i68 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub90, i32 %19) #0
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %.sub90)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub91)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub91, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i70 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub91, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub91)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub92)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub92, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i72 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub92, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub92)
  %20 = call fastcc i32 @julia_j_init_game_state_1660u1665(i32 4, i32 0)
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %.sub93)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(12) %.sub93, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @_j_const5, i64 0, i64 0), i64 12, i1 false)
  %status.i74 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub93, i32 %20) #0
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %.sub93)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub94)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub94, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i76 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub94, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub94)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub95)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub95, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i78 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub95, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub95)
  %21 = call fastcc i32 @julia_j_init_game_state_1660u1665(i32 5, i32 1)
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %.sub96)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(12) %.sub96, i8* noundef nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @_j_const5, i64 0, i64 0), i64 12, i1 false)
  %status.i80 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub96, i32 %21) #0
  ret i32 %21
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc i32 @julia_j_init_game_state_1660u1665(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret i32 %result
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc void @julia_j_init_game_state_1660u1666() unnamed_addr {
entry:
  %result = call i32 @init_game_state()
  ret void
}

; Function Attrs: nounwind
declare i32 @init_game_state() local_unnamed_addr #0

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
