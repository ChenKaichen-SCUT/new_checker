; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/benchmarks/backend-source.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/benchmarks/backend-source.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = dso_local global i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @worker(ptr readnone captures(none) %0) #0 !dbg !9 {
  %cert_d0c1dc0e6121_0 = load atomic i32, i32* @x monotonic, align 4, !dbg !13
  %cert_d0c1dc0e6121_0_mutated_sum = add i32 %cert_d0c1dc0e6121_0, 1, !dbg !13
  store atomic i32 %cert_d0c1dc0e6121_0_mutated_sum, i32* @x monotonic, align 4, !dbg !13
  %2 = add i32 0, %cert_d0c1dc0e6121_0, !dbg !13
  ret ptr null, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !16 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #3, !dbg !17
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #3, !dbg !17
  %3 = call i32 @pthread_create(ptr noundef nonnull %1, ptr noundef null, ptr noundef nonnull @worker, ptr noundef null) #3, !dbg !18
  %4 = call i32 @pthread_create(ptr noundef nonnull %2, ptr noundef null, ptr noundef nonnull @worker, ptr noundef null) #3, !dbg !19
  %5 = load i64, ptr %1, align 8, !dbg !20, !tbaa !21
  %6 = call i32 @pthread_join(i64 noundef %5, ptr noundef null) #3, !dbg !25
  %7 = load i64, ptr %2, align 8, !dbg !26, !tbaa !21
  %8 = call i32 @pthread_join(i64 noundef %7, ptr noundef null) #3, !dbg !27
  %9 = load i32, ptr @x, align 4, !dbg !28, !tbaa !29
  %10 = icmp eq i32 %9, 2, !dbg !31
  %11 = zext i1 %10 to i32, !dbg !31
  call void @__VERIFIER_assert(i32 noundef %11) #3, !dbg !32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #3, !dbg !33
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #3, !dbg !33
  ret i32 0, !dbg !34
}

declare !dbg !35 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !36 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !37 void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/benchmarks/backend-source.c", directory: "/cert-source", checksumkind: CSK_MD5, checksum: "92aceb4b5896c1da8f82f7438ca3dbb3")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!9 = distinct !DISubprogram(name: "worker", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DIFile(filename: "certifying-asm-lifter/benchmarks/backend-source.c", directory: "/cert-source", checksumkind: CSK_MD5, checksum: "92aceb4b5896c1da8f82f7438ca3dbb3")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 18, column: 5, scope: !9)
!14 = !{i64 590}
!15 = !DILocation(line: 22, column: 5, scope: !9)
!16 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!17 = !DILocation(line: 27, column: 5, scope: !16)
!18 = !DILocation(line: 28, column: 5, scope: !16)
!19 = !DILocation(line: 29, column: 5, scope: !16)
!20 = !DILocation(line: 30, column: 18, scope: !16)
!21 = !{!22, !22, i64 0}
!22 = !{!"long", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C/C++ TBAA"}
!25 = !DILocation(line: 30, column: 5, scope: !16)
!26 = !DILocation(line: 31, column: 18, scope: !16)
!27 = !DILocation(line: 31, column: 5, scope: !16)
!28 = !DILocation(line: 32, column: 23, scope: !16)
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !23, i64 0}
!31 = !DILocation(line: 32, column: 25, scope: !16)
!32 = !DILocation(line: 32, column: 5, scope: !16)
!33 = !DILocation(line: 34, column: 1, scope: !16)
!34 = !DILocation(line: 33, column: 5, scope: !16)
!35 = !DISubprogram(name: "pthread_create", scope: !10, file: !10, line: 6, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!36 = !DISubprogram(name: "pthread_join", scope: !10, file: !10, line: 7, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!37 = !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 8, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
