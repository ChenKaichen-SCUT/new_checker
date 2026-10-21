; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/experiments/guarded/conditional-lift-01/lifting/candidate.ll'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/benchmarks/guarded-conditional.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_a = dso_local global i32 0, align 4
@input_b = dso_local global i32 1, align 4
@x = dso_local global i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local noalias noundef ptr @worker(ptr noundef readonly captures(none) %0) #0 !dbg !9 {
  %2 = load i32, ptr %0, align 4, !dbg !13, !tbaa !14
  %3 = icmp eq i32 %2, 0, !dbg !18
  br i1 %3, label %7, label %4, !dbg !18

4:                                                ; preds = %1
  %cert_223a72d72243_16_0 = atomicrmw add ptr @x, i32 2 monotonic, align 4, !dbg !19
  %5 = icmp ne i32 %cert_223a72d72243_16_0, 42, !dbg !22
  %6 = zext i1 %5 to i32, !dbg !22
  br label %7, !dbg !23

7:                                                ; preds = %4, %1
  %8 = phi i32 [ %6, %4 ], [ 1, %1 ], !dbg !24
  tail call void @__VERIFIER_assert(i32 noundef %8) #3, !dbg !25
  ret ptr null, !dbg !26
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

declare !dbg !27 void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !28 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #3, !dbg !29
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #3, !dbg !29
  %3 = call i32 @pthread_create(ptr noundef nonnull %1, ptr noundef null, ptr noundef nonnull @worker, ptr noundef nonnull @input_a) #3, !dbg !30
  %4 = call i32 @pthread_create(ptr noundef nonnull %2, ptr noundef null, ptr noundef nonnull @worker, ptr noundef nonnull @input_b) #3, !dbg !31
  %5 = load i64, ptr %1, align 8, !dbg !32, !tbaa !33
  %6 = call i32 @pthread_join(i64 noundef %5, ptr noundef null) #3, !dbg !35
  %7 = load i64, ptr %2, align 8, !dbg !36, !tbaa !33
  %8 = call i32 @pthread_join(i64 noundef %7, ptr noundef null) #3, !dbg !37
  %9 = load i32, ptr @x, align 4, !dbg !38, !tbaa !14
  %10 = icmp eq i32 %9, 1, !dbg !39
  %11 = zext i1 %10 to i32, !dbg !39
  call void @__VERIFIER_assert(i32 noundef %11) #3, !dbg !40
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #3, !dbg !41
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #3, !dbg !41
  ret i32 0, !dbg !42
}

declare !dbg !43 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !44 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/benchmarks/guarded-conditional.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "14e0679ba9c673a3183ac3d9512eb51c")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!9 = distinct !DISubprogram(name: "worker", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DIFile(filename: "benchmarks/guarded-conditional.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "14e0679ba9c673a3183ac3d9512eb51c")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 15, column: 25, scope: !9)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 17, column: 9, scope: !9)
!19 = !DILocation(line: 10, column: 5, scope: !20, inlinedAt: !21)
!20 = distinct !DISubprogram(name: "faa", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!21 = distinct !DILocation(line: 17, column: 21, scope: !9)
!22 = !DILocation(line: 18, column: 27, scope: !9)
!23 = !DILocation(line: 17, column: 15, scope: !9)
!24 = !DILocation(line: 0, scope: !9)
!25 = !DILocation(line: 18, column: 5, scope: !9)
!26 = !DILocation(line: 19, column: 5, scope: !9)
!27 = !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 5, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 21, type: !11, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!29 = !DILocation(line: 22, column: 5, scope: !28)
!30 = !DILocation(line: 23, column: 5, scope: !28)
!31 = !DILocation(line: 24, column: 5, scope: !28)
!32 = !DILocation(line: 25, column: 18, scope: !28)
!33 = !{!34, !34, i64 0}
!34 = !{!"long", !16, i64 0}
!35 = !DILocation(line: 25, column: 5, scope: !28)
!36 = !DILocation(line: 26, column: 18, scope: !28)
!37 = !DILocation(line: 26, column: 5, scope: !28)
!38 = !DILocation(line: 27, column: 23, scope: !28)
!39 = !DILocation(line: 27, column: 25, scope: !28)
!40 = !DILocation(line: 27, column: 5, scope: !28)
!41 = !DILocation(line: 29, column: 1, scope: !28)
!42 = !DILocation(line: 28, column: 5, scope: !28)
!43 = !DISubprogram(name: "pthread_create", scope: !10, file: !10, line: 3, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!44 = !DISubprogram(name: "pthread_join", scope: !10, file: !10, line: 4, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
