; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @update_physics(i32 signext %0, i32 signext %1, i32 signext %2, i32 signext %3, i32 signext %4, i32 signext %5, i32 signext %6, i32 signext %7) local_unnamed_addr {
top:
  %.not = icmp eq i32 %7, 0
  %.not6 = icmp eq i32 %4, 0
  %8 = add i32 %3, 1
  %9 = select i1 %.not, i1 true, i1 %.not6
  %value_phi1 = select i1 %9, i32 %8, i32 -12
  %10 = add i32 %value_phi1, %1
  %11 = icmp sgt i32 %10, 547
  %.5 = zext i1 %11 to i32
  %common.ret.op = select i1 %.not, i32 %.5, i32 2
  ret i32 %common.ret.op
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
