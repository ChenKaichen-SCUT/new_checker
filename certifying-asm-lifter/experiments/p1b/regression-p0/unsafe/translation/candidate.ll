; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/benchmarks/ck-live-unsafe.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/benchmarks/ck-live-unsafe.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = dso_local global i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @worker(ptr readnone captures(none) %0) #0 !dbg !9 {
  %cert_9d5ba0d7aeed_0 = atomicrmw add i32* @x, i32 1 monotonic, !dbg !13
  %2 = add i32 0, %cert_9d5ba0d7aeed_0, !dbg !13
  %3 = icmp ne i32 %2, 2, !dbg !18
  %4 = zext i1 %3 to i32, !dbg !18
  tail call void @__VERIFIER_assert(i32 noundef %4) #3, !dbg !19
  ret ptr null, !dbg !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

declare !dbg !21 void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !22 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #3, !dbg !23
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #3, !dbg !23
  %3 = call i32 @pthread_create(ptr noundef nonnull %1, ptr noundef null, ptr noundef nonnull @worker, ptr noundef null) #3, !dbg !24
  %4 = call i32 @pthread_create(ptr noundef nonnull %2, ptr noundef null, ptr noundef nonnull @worker, ptr noundef null) #3, !dbg !25
  %5 = load i64, ptr %1, align 8, !dbg !26, !tbaa !27
  %6 = call i32 @pthread_join(i64 noundef %5, ptr noundef null) #3, !dbg !31
  %7 = load i64, ptr %2, align 8, !dbg !32, !tbaa !27
  %8 = call i32 @pthread_join(i64 noundef %7, ptr noundef null) #3, !dbg !33
  %9 = load i32, ptr @x, align 4, !dbg !34, !tbaa !35
  %10 = icmp ne i32 %9, 2, !dbg !37
  %11 = zext i1 %10 to i32, !dbg !37
  call void @__VERIFIER_assert(i32 noundef %11) #3, !dbg !38
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #3, !dbg !39
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #3, !dbg !39
  ret i32 0, !dbg !40
}

declare !dbg !41 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !42 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/benchmarks/ck-live-unsafe.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "91ceb0f800f29ee9b2756bba3ae53d52")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!9 = distinct !DISubprogram(name: "worker", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DIFile(filename: "benchmarks/ck-live-unsafe.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "91ceb0f800f29ee9b2756bba3ae53d52")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 309, column: 1, scope: !14, inlinedAt: !16)
!14 = distinct !DISubprogram(name: "ck_pr_faa_32", scope: !15, file: !15, line: 309, type: !11, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!15 = !DIFile(filename: "vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/gcc/x86_64/ck_pr.h", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!16 = distinct !DILocation(line: 9, column: 20, scope: !9)
!17 = !{i64 2147751627}
!18 = !DILocation(line: 10, column: 27, scope: !9)
!19 = !DILocation(line: 10, column: 5, scope: !9)
!20 = !DILocation(line: 11, column: 5, scope: !9)
!21 = !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 5, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!22 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!23 = !DILocation(line: 14, column: 5, scope: !22)
!24 = !DILocation(line: 15, column: 5, scope: !22)
!25 = !DILocation(line: 16, column: 5, scope: !22)
!26 = !DILocation(line: 17, column: 18, scope: !22)
!27 = !{!28, !28, i64 0}
!28 = !{!"long", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C/C++ TBAA"}
!31 = !DILocation(line: 17, column: 5, scope: !22)
!32 = !DILocation(line: 18, column: 18, scope: !22)
!33 = !DILocation(line: 18, column: 5, scope: !22)
!34 = !DILocation(line: 19, column: 23, scope: !22)
!35 = !{!36, !36, i64 0}
!36 = !{!"int", !29, i64 0}
!37 = !DILocation(line: 19, column: 25, scope: !22)
!38 = !DILocation(line: 19, column: 5, scope: !22)
!39 = !DILocation(line: 21, column: 1, scope: !22)
!40 = !DILocation(line: 20, column: 5, scope: !22)
!41 = !DISubprogram(name: "pthread_create", scope: !10, file: !10, line: 3, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!42 = !DISubprogram(name: "pthread_join", scope: !10, file: !10, line: 4, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
