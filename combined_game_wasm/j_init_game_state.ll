; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [25 x i8] c"Initializing game state\0A\00", align 1
@_j_const2 = private unnamed_addr constant [65 x i8] c"=== Julia set_game_state_simple called: key_id=%d, value=%d ===\0A\00", align 1
@_j_const3 = private unnamed_addr constant [62 x i8] c"=== LLVM call_set_game_state_simple: key_id=%d, value=%d ===\0A\00", align 1

define i32 @j_init_game_state() local_unnamed_addr {
top:
  %0 = alloca [25 x i8], align 16
  %.sub = getelementptr inbounds [25 x i8], [25 x i8]* %0, i64 0, i64 0
  %1 = alloca [65 x i8], align 16
  %.sub51 = getelementptr inbounds [65 x i8], [65 x i8]* %1, i64 0, i64 0
  %2 = alloca [62 x i8], align 16
  %.sub52 = getelementptr inbounds [62 x i8], [62 x i8]* %2, i64 0, i64 0
  %3 = alloca [65 x i8], align 16
  %.sub53 = getelementptr inbounds [65 x i8], [65 x i8]* %3, i64 0, i64 0
  %4 = alloca [62 x i8], align 16
  %.sub54 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  %5 = alloca [65 x i8], align 16
  %.sub55 = getelementptr inbounds [65 x i8], [65 x i8]* %5, i64 0, i64 0
  %6 = alloca [62 x i8], align 16
  %.sub56 = getelementptr inbounds [62 x i8], [62 x i8]* %6, i64 0, i64 0
  %7 = alloca [65 x i8], align 16
  %.sub57 = getelementptr inbounds [65 x i8], [65 x i8]* %7, i64 0, i64 0
  %8 = alloca [62 x i8], align 16
  %.sub58 = getelementptr inbounds [62 x i8], [62 x i8]* %8, i64 0, i64 0
  %9 = alloca [65 x i8], align 16
  %.sub59 = getelementptr inbounds [65 x i8], [65 x i8]* %9, i64 0, i64 0
  %10 = alloca [62 x i8], align 16
  %.sub60 = getelementptr inbounds [62 x i8], [62 x i8]* %10, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(25) %.sub, i8* noundef nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @_j_const1, i64 0, i64 0), i64 25, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub) #0
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %.sub)
  call fastcc void @julia_j_init_game_state_1689u1692()
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub51)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub51, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i32 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub51, i32 1, i32 5) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub51)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub52)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub52, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i34 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub52, i32 1, i32 5) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub52)
  call fastcc void @julia_j_init_game_state_1689u1695(i32 1, i32 5)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub53)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub53, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i36 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub53, i32 2, i32 5) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub53)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub54)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub54, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i38 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub54, i32 2, i32 5) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub54)
  call fastcc void @julia_j_init_game_state_1689u1695(i32 2, i32 5)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub55)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub55, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i40 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub55, i32 3, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub55)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub56)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub56, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i42 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub56, i32 3, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub56)
  call fastcc void @julia_j_init_game_state_1689u1695(i32 3, i32 0)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub57)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub57, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i44 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub57, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub57)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub58)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub58, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i46 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub58, i32 4, i32 0) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub58)
  call fastcc void @julia_j_init_game_state_1689u1695(i32 4, i32 0)
  call void @llvm.lifetime.start.p0i8(i64 65, i8* nonnull %.sub59)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(65) %.sub59, i8* noundef nonnull align 1 dereferenceable(65) getelementptr inbounds ([65 x i8], [65 x i8]* @_j_const2, i64 0, i64 0), i64 65, i1 false)
  %status.i48 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub59, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 65, i8* nonnull %.sub59)
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %.sub60)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %.sub60, i8* noundef nonnull align 1 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @_j_const3, i64 0, i64 0), i64 62, i1 false)
  %status.i50 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub60, i32 5, i32 1) #0
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %.sub60)
  %11 = call fastcc i32 @julia_j_init_game_state_1689u1707(i32 5, i32 1)
  ret i32 %11
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_j_init_game_state_1689u1692() unnamed_addr {
entry:
  %result = call i32 @init_game_state()
  ret void
}

; Function Attrs: nounwind
declare i32 @init_game_state() local_unnamed_addr #0

define internal fastcc void @julia_j_init_game_state_1689u1695(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc i32 @julia_j_init_game_state_1689u1707(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret i32 %result
}

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
