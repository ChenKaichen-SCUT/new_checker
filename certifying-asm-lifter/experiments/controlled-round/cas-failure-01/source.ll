; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/benchmarks/cas-failure.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/benchmarks/cas-failure.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = dso_local global i32 1, align 4

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @worker(ptr readnone captures(none) %0) #0 !dbg !9 {
  %2 = tail call i32 asm sideeffect "lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @x, i32 2, i32 0, ptr nonnull elementtype(i32) @x) #3, !dbg !13, !srcloc !14
  %3 = icmp eq i32 %2, 1, !dbg !15
  %4 = zext i1 %3 to i32, !dbg !15
  tail call void @__VERIFIER_assert(i32 noundef %4) #3, !dbg !16
  ret ptr null, !dbg !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

declare !dbg !18 void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !19 {
  %1 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #3, !dbg !20
  %2 = call i32 @pthread_create(ptr noundef nonnull %1, ptr noundef null, ptr noundef nonnull @worker, ptr noundef null) #3, !dbg !21
  %3 = load i64, ptr %1, align 8, !dbg !22, !tbaa !23
  %4 = call i32 @pthread_join(i64 noundef %3, ptr noundef null) #3, !dbg !27
  %5 = load i32, ptr @x, align 4, !dbg !28, !tbaa !29
  %6 = icmp eq i32 %5, 1, !dbg !31
  %7 = zext i1 %6 to i32, !dbg !31
  call void @__VERIFIER_assert(i32 noundef %7) #3, !dbg !32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #3, !dbg !33
  ret i32 0, !dbg !34
}

declare !dbg !35 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !36 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/benchmarks/cas-failure.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "7a236106c2aae97258d7d9c1879d84a3")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!9 = distinct !DISubprogram(name: "worker", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DIFile(filename: "benchmarks/cas-failure.c", directory: "/cert-source/certifying-asm-lifter", checksumkind: CSK_MD5, checksum: "7a236106c2aae97258d7d9c1879d84a3")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 10, column: 5, scope: !9)
!14 = !{i64 360}
!15 = !DILocation(line: 12, column: 32, scope: !9)
!16 = !DILocation(line: 12, column: 5, scope: !9)
!17 = !DILocation(line: 13, column: 5, scope: !9)
!18 = !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 4, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!19 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !11, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!20 = !DILocation(line: 16, column: 5, scope: !19)
!21 = !DILocation(line: 17, column: 5, scope: !19)
!22 = !DILocation(line: 18, column: 18, scope: !19)
!23 = !{!24, !24, i64 0}
!24 = !{!"long", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C/C++ TBAA"}
!27 = !DILocation(line: 18, column: 5, scope: !19)
!28 = !DILocation(line: 19, column: 23, scope: !19)
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !25, i64 0}
!31 = !DILocation(line: 19, column: 25, scope: !19)
!32 = !DILocation(line: 19, column: 5, scope: !19)
!33 = !DILocation(line: 21, column: 1, scope: !19)
!34 = !DILocation(line: 20, column: 5, scope: !19)
!35 = !DISubprogram(name: "pthread_create", scope: !10, file: !10, line: 2, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!36 = !DISubprogram(name: "pthread_join", scope: !10, file: !10, line: 3, type: !11, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
