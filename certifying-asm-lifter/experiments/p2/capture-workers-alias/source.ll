; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/benchmarks/ck-workers-alias.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/benchmarks/ck-workers-alias.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = dso_local global i32 1, align 4
@input_a = dso_local global i32 1, align 4
@input_b = dso_local local_unnamed_addr global i32 2, align 4

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @worker(ptr noundef readonly captures(none) %0) #0 !dbg !9 {
  %2 = load i32, ptr %0, align 4, !dbg !13, !tbaa !14
  %3 = tail call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @x, ptr nonnull elementtype(i32) @x, i32 %2) #3, !dbg !18, !srcloc !22
  %4 = icmp ne i32 %3, 0, !dbg !23
  %5 = zext i1 %4 to i32, !dbg !23
  tail call void @__VERIFIER_assert(i32 noundef %5) #3, !dbg !24
  ret ptr null, !dbg !25
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

declare !dbg !26 void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @worker_other(ptr noundef readonly captures(none) %0) #0 !dbg !27 {
  %2 = load i32, ptr %0, align 4, !dbg !28, !tbaa !14
  %3 = tail call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @x, ptr nonnull elementtype(i32) @x, i32 %2) #3, !dbg !29, !srcloc !22
  %4 = icmp ne i32 %3, 0, !dbg !31
  %5 = zext i1 %4 to i32, !dbg !31
  tail call void @__VERIFIER_assert(i32 noundef %5) #3, !dbg !32
  ret ptr null, !dbg !33
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !34 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #3, !dbg !35
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #3, !dbg !35
  %3 = call i32 @pthread_create(ptr noundef nonnull %1, ptr noundef null, ptr noundef nonnull @worker, ptr noundef nonnull @input_a) #3, !dbg !36
  %4 = call i32 @pthread_create(ptr noundef nonnull %2, ptr noundef null, ptr noundef nonnull @worker_other, ptr noundef nonnull @x) #3, !dbg !37
  %5 = load i64, ptr %1, align 8, !dbg !38, !tbaa !39
  %6 = call i32 @pthread_join(i64 noundef %5, ptr noundef null) #3, !dbg !41
  %7 = load i64, ptr %2, align 8, !dbg !42, !tbaa !39
  %8 = call i32 @pthread_join(i64 noundef %7, ptr noundef null) #3, !dbg !43
  %9 = load i32, ptr @x, align 4, !dbg !44, !tbaa !14
  %10 = icmp ne i32 %9, 0, !dbg !45
  %11 = zext i1 %10 to i32, !dbg !45
  call void @__VERIFIER_assert(i32 noundef %11) #3, !dbg !46
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #3, !dbg !47
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #3, !dbg !47
  ret i32 0, !dbg !48
}

declare !dbg !49 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !50 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/benchmarks/ck-workers-alias.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "50aa2c599f5c27bbe765045ae9669c1f")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!9 = distinct !DISubprogram(name: "worker", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DIFile(filename: "benchmarks/ck-workers-alias.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "50aa2c599f5c27bbe765045ae9669c1f")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 12, column: 22, scope: !9)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 309, column: 1, scope: !19, inlinedAt: !21)
!19 = distinct !DISubprogram(name: "ck_pr_faa_32", scope: !20, file: !20, line: 309, type: !11, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!20 = !DIFile(filename: "vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/gcc/x86_64/ck_pr.h", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!21 = distinct !DILocation(line: 13, column: 20, scope: !9)
!22 = !{i64 2147751951}
!23 = !DILocation(line: 14, column: 27, scope: !9)
!24 = !DILocation(line: 14, column: 5, scope: !9)
!25 = !DILocation(line: 15, column: 5, scope: !9)
!26 = !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 5, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!27 = distinct !DISubprogram(name: "worker_other", scope: !10, file: !10, line: 17, type: !11, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!28 = !DILocation(line: 19, column: 22, scope: !27)
!29 = !DILocation(line: 309, column: 1, scope: !19, inlinedAt: !30)
!30 = distinct !DILocation(line: 20, column: 20, scope: !27)
!31 = !DILocation(line: 21, column: 27, scope: !27)
!32 = !DILocation(line: 21, column: 5, scope: !27)
!33 = !DILocation(line: 22, column: 5, scope: !27)
!34 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 24, type: !11, scopeLine: 24, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!35 = !DILocation(line: 25, column: 5, scope: !34)
!36 = !DILocation(line: 26, column: 5, scope: !34)
!37 = !DILocation(line: 27, column: 5, scope: !34)
!38 = !DILocation(line: 28, column: 18, scope: !34)
!39 = !{!40, !40, i64 0}
!40 = !{!"long", !16, i64 0}
!41 = !DILocation(line: 28, column: 5, scope: !34)
!42 = !DILocation(line: 29, column: 18, scope: !34)
!43 = !DILocation(line: 29, column: 5, scope: !34)
!44 = !DILocation(line: 30, column: 23, scope: !34)
!45 = !DILocation(line: 30, column: 25, scope: !34)
!46 = !DILocation(line: 30, column: 5, scope: !34)
!47 = !DILocation(line: 32, column: 1, scope: !34)
!48 = !DILocation(line: 31, column: 5, scope: !34)
!49 = !DISubprogram(name: "pthread_create", scope: !10, file: !10, line: 3, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!50 = !DISubprogram(name: "pthread_join", scope: !10, file: !10, line: 4, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
