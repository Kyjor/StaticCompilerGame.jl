; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [25 x i8] c"Initializing game state\0A\00", align 1

define i32 @j_init_game_state() local_unnamed_addr {
top:
  %0 = alloca [25 x i8], align 16
  %.sub = getelementptr inbounds [25 x i8], [25 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(25) %.sub, i8* noundef nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @_j_const1, i64 0, i64 0), i64 25, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub) #0
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %.sub)
  call fastcc void @julia_j_init_game_state_1611u1614()
  call fastcc void @julia_j_init_game_state_1611u1615(i32 1, i32 5)
  call fastcc void @julia_j_init_game_state_1611u1615(i32 2, i32 5)
  call fastcc void @julia_j_init_game_state_1611u1615(i32 3, i32 0)
  call fastcc void @julia_j_init_game_state_1611u1615(i32 4, i32 0)
  %1 = call fastcc i32 @julia_j_init_game_state_1611u1619(i32 5, i32 1)
  ret i32 %1
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_j_init_game_state_1611u1614() unnamed_addr {
entry:
  %result = call i32 @init_game_state()
  ret void
}

; Function Attrs: nounwind
declare i32 @init_game_state() local_unnamed_addr #0

define internal fastcc void @julia_j_init_game_state_1611u1615(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc i32 @julia_j_init_game_state_1611u1619(i32 %0, i32 %1) unnamed_addr {
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
