; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @get_new_vel_y(i32 signext %0, i32 signext %1, i32 signext %2, i32 signext %3) local_unnamed_addr {
top:
  %.not = icmp eq i32 %3, 0
  %.not2 = icmp eq i32 %2, 0
  %4 = add i32 %1, 1
  %5 = select i1 %.not, i1 true, i1 %.not2
  %value_phi = select i1 %5, i32 %4, i32 -12
  %6 = add i32 %value_phi, %0
  %7 = icmp slt i32 %6, 548
  %value_phi1 = select i1 %7, i32 %value_phi, i32 0
  ret i32 %value_phi1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
