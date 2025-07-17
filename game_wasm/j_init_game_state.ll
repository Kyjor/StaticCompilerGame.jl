; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

@_j_const1 = private unnamed_addr constant [25 x i8] c"Initializing game state\0A\00", align 1
@_j_const2 = private unnamed_addr constant [18 x i8] c"SDL_CreateWindow\0A\00", align 1
@_j_const3 = private unnamed_addr constant [23 x i8] c"SDL_CreateWindow done\0A\00", align 1

define i32 @j_init_game_state() local_unnamed_addr {
top:
  %0 = alloca [25 x i8], align 16
  %.sub = getelementptr inbounds [25 x i8], [25 x i8]* %0, i64 0, i64 0
  %1 = alloca [18 x i8], align 16
  %.sub12 = getelementptr inbounds [18 x i8], [18 x i8]* %1, i64 0, i64 0
  %2 = alloca [23 x i8], align 16
  %.sub13 = getelementptr inbounds [23 x i8], [23 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(25) %.sub, i8* noundef nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @_j_const1, i64 0, i64 0), i64 25, i1 false)
  %status.i = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub) #0
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %.sub)
  call fastcc void @julia_j_init_game_state_1590u1593()
  call fastcc void @julia_j_init_game_state_1590u1594(i32 1, float 5.000000e+00)
  call fastcc void @julia_j_init_game_state_1590u1594(i32 2, float 5.000000e+00)
  call fastcc void @julia_j_init_game_state_1590u1594(i32 3, float 0.000000e+00)
  call fastcc void @julia_j_init_game_state_1590u1594(i32 4, float 0.000000e+00)
  call fastcc void @julia_j_init_game_state_1590u1598(i32 5, i32 1)
  call fastcc void @julia_j_init_game_state_1590u1594(i32 6, float 0.000000e+00)
  call fastcc void @julia_j_init_game_state_1590u1594(i32 7, float 0.000000e+00)
  %3 = call fastcc i32 @julia_j_init_game_state_1590u1601(i32 8, i32 0)
  call void @llvm.lifetime.start.p0i8(i64 18, i8* nonnull %.sub12)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(18) %.sub12, i8* noundef nonnull align 1 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @_j_const2, i64 0, i64 0), i64 18, i1 false)
  %status.i9 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub12) #0
  call void @llvm.lifetime.end.p0i8(i64 18, i8* nonnull %.sub12)
  call fastcc void @julia_j_init_game_state_1590u1603()
  call void @llvm.lifetime.start.p0i8(i64 23, i8* nonnull %.sub13)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(23) %.sub13, i8* noundef nonnull align 1 dereferenceable(23) getelementptr inbounds ([23 x i8], [23 x i8]* @_j_const3, i64 0, i64 0), i64 23, i1 false)
  %status.i11 = call i32 (i8*, ...) @printf(i8* noundef nonnull %.sub13) #0
  ret i32 %3
}

declare i32 @printf(i8* noalias nocapture, ...) local_unnamed_addr

define internal fastcc void @julia_j_init_game_state_1590u1593() unnamed_addr {
entry:
  %result = call i32 @init_game_state()
  ret void
}

; Function Attrs: nounwind
declare i32 @init_game_state() local_unnamed_addr #0

define internal fastcc void @julia_j_init_game_state_1590u1594(i32 %0, float %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple_float(i32 %0, float %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple_float(i32, float) local_unnamed_addr #0

define internal fastcc void @julia_j_init_game_state_1590u1598(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @set_game_state_simple(i32, i32) local_unnamed_addr #0

define internal fastcc i32 @julia_j_init_game_state_1590u1601(i32 %0, i32 %1) unnamed_addr {
entry:
  %result = call i32 @set_game_state_simple(i32 %0, i32 %1)
  ret i32 %result
}

define internal fastcc void @julia_j_init_game_state_1590u1603() unnamed_addr {
entry:
  %result = call i32 @create_window_hardcoded()
  ret void
}

; Function Attrs: nounwind
declare i32 @create_window_hardcoded() local_unnamed_addr #0

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
