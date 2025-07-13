; ModuleID = 'start'
source_filename = "start"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-linux-gnu"

define internal fastcc void @println_1831({}* noundef nonnull %0) unnamed_addr {
top:
  %1 = alloca [2 x {}*], align 8
  %.sub = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 0
  %gcframe = call {}** @julia.new_gc_frame(i32 1)
  call void @julia.push_gc_frame({}** nonnull %gcframe, i32 1)
  %stdout = load atomic {}*, {}** inttoptr (i64 140506099633904 to {}**) unordered, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  %2 = call {}** @julia.get_gc_frame_slot({}** nonnull %gcframe, i32 0)
  store {}* %stdout, {}** %2, align 8
  store {}* %stdout, {}** %.sub, align 8
  %3 = getelementptr inbounds [2 x {}*], [2 x {}*]* %1, i64 0, i64 1
  store {}* %0, {}** %3, align 8
  %4 = call nonnull {}* @ijl_apply_generic({}* inttoptr (i64 140506097226288 to {}*), {}** nonnull %.sub, i32 2)
  call void @julia.pop_gc_frame({}** nonnull %gcframe)
  ret void
}

declare nonnull {}* @ijl_apply_generic({}*, {}** noalias nocapture noundef readonly, i32) local_unnamed_addr

define i32 @init_game() local_unnamed_addr {
top:
  store atomic {}* inttoptr (i64 140506237381984 to {}*), {}** inttoptr (i64 140506294854192 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506237381984 to {}*), {}** inttoptr (i64 140506294854432 to {}**) release, align 32, !tbaa !2, !alias.scope !7, !noalias !10
  call fastcc void @println_1831({}* inttoptr (i64 140506323632200 to {}*))
  store atomic {}* inttoptr (i64 140506158243248 to {}*), {}** inttoptr (i64 140506294852944 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506158243248 to {}*), {}** inttoptr (i64 140506294853184 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506157526688 to {}*), {}** inttoptr (i64 140506294853424 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506157526688 to {}*), {}** inttoptr (i64 140506294853712 to {}**) release, align 16, !tbaa !2, !alias.scope !7, !noalias !10
  store atomic {}* inttoptr (i64 140506237382000 to {}*), {}** inttoptr (i64 140506294853952 to {}**) release, align 64, !tbaa !2, !alias.scope !7, !noalias !10
  call fastcc void @println_1831({}* inttoptr (i64 140506323633208 to {}*))
  ret i32 0
}

declare noalias nonnull {}** @julia.new_gc_frame(i32) local_unnamed_addr

declare void @julia.push_gc_frame({}**, i32) local_unnamed_addr

declare {}** @julia.get_gc_frame_slot({}**, i32) local_unnamed_addr

declare void @julia.pop_gc_frame({}**) local_unnamed_addr

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{!3, !3, i64 0}
!3 = !{!"jtbaa_binding", !4, i64 0}
!4 = !{!"jtbaa_data", !5, i64 0}
!5 = !{!"jtbaa", !6, i64 0}
!6 = !{!"jtbaa"}
!7 = !{!8}
!8 = !{!"jnoalias_data", !9}
!9 = !{!"jnoalias"}
!10 = !{!11, !12, !13, !14}
!11 = !{!"jnoalias_gcframe", !9}
!12 = !{!"jnoalias_stack", !9}
!13 = !{!"jnoalias_typemd", !9}
!14 = !{!"jnoalias_const", !9}
