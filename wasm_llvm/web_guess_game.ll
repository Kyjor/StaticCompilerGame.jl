; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define i32 @web_guess_game(i32 signext %0) local_unnamed_addr {
top:
  %.not = icmp eq i32 %0, 7
  %1 = icmp sgt i32 %0, 6
  %. = select i1 %1, i32 2, i32 -1
  %common.ret.op = select i1 %.not, i32 1, i32 %.
  ret i32 %common.ret.op
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
