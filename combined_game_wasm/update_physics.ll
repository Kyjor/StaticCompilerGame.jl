; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-apple-darwin"

@_j_const1 = private unnamed_addr constant [19 x i8] c"Inexact conversion\00"

; Function Attrs: noinline
define internal fastcc void @_throw_inexacterror_904() unnamed_addr #0 {
top:
  %0 = alloca [19 x i8], align 16
  %.sub = getelementptr inbounds [19 x i8], [19 x i8]* %0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %.sub)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %.sub, i8* noundef nonnull align 16 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @_j_const1, i64 0, i64 0), i64 19, i1 false)
  %status.i = call i32 @puts(i8* noundef nonnull %.sub) #1
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %.sub)
  call void @exit(i32 1) #1
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) local_unnamed_addr #1

declare void @exit(i32) local_unnamed_addr

define internal fastcc i32 @julia_checked_trunc_sint_901(i64 signext %0) unnamed_addr {
top:
  %1 = add i64 %0, -2147483648
  %2 = icmp ult i64 %1, -4294967296
  br i1 %2, label %L6, label %L7

L6:                                               ; preds = %top
  call fastcc void @_throw_inexacterror_904() #4
  br label %L7

L7:                                               ; preds = %L6, %top
  %3 = trunc i64 %0 to i32
  ret i32 %3
}

define internal fastcc i32 @julia_toInt32_898(i64 signext %0) unnamed_addr {
top:
  %1 = call fastcc i32 @julia_checked_trunc_sint_901(i64 signext %0) #4
  ret i32 %1
}

define i32 @update_physics(i32 signext %0, i32 signext %1, i32 signext %2, i32 signext %3, i32 signext %4, i32 signext %5, i32 signext %6, i32 signext %7) local_unnamed_addr {
top:
  %.not = icmp eq i32 %4, 0
  %.not4 = icmp eq i32 %5, 0
  %.3 = select i1 %.not4, i64 0, i64 5
  %value_phi1 = select i1 %.not, i64 %.3, i64 -5
  %8 = sext i32 %0 to i64
  %9 = add nsw i64 %value_phi1, %8
  %10 = icmp slt i64 %9, 768
  %. = select i1 %10, i64 %9, i64 768
  %11 = icmp sgt i64 %., 0
  %value_phi2 = select i1 %11, i64 %., i64 0
  %12 = call fastcc i32 @julia_toInt32_898(i64 signext %value_phi2) #4
  ret i32 %12
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "probe-stack"="inline-asm" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
