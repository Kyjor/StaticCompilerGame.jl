; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @check_on_ground(i32 signext %0, i32 signext %1) local_unnamed_addr {
top:
  %2 = add i32 %0, 1
  %3 = add i32 %2, %1
  %4 = icmp sgt i32 %3, 547
  %. = zext i1 %4 to i32
  ret i32 %.
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
