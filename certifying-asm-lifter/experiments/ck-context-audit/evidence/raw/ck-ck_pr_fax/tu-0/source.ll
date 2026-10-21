; ModuleID = '/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fax.c'
source_filename = "/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fax.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@stderr = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [28 x i8] c"***TESTING ck_pr_faa_int***\00", align 1
@.str.1 = private unnamed_addr constant [65 x i8] c"Serial fetch does not match ck_pr fetch.\0A\09Serial: %d\0A\09ck_pr: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"Final result:\0A\09Serial: %d\0A\09ck_pr: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"SUCCESS.\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"FAILURE.\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"***TESTING ck_pr_faa_uint***\00", align 1
@.str.6 = private unnamed_addr constant [65 x i8] c"Serial fetch does not match ck_pr fetch.\0A\09Serial: %u\0A\09ck_pr: %u\0A\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"Final result:\0A\09Serial: %u\0A\09ck_pr: %u\0A\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"***TESTING ck_pr_fas_int***\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c"***TESTING ck_pr_fas_uint***\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @ck_error], section "llvm.metadata"

; Function Attrs: cold nofree noreturn nounwind uwtable
define internal void @ck_error(ptr noundef readonly captures(none) %0, ...) #0 !dbg !8 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #7, !dbg !12
  call void @llvm.va_start.p0(ptr nonnull %2), !dbg !13
  %3 = load ptr, ptr @stderr, align 8, !dbg !14, !tbaa !15
  %4 = call i32 @vfprintf(ptr noundef %3, ptr noundef %0, ptr noundef nonnull %2) #8, !dbg !20
  call void @llvm.va_end.p0(ptr nonnull %2), !dbg !21
  call void @exit(i32 noundef 1) #9, !dbg !22
  unreachable, !dbg !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #2

; Function Attrs: nofree nounwind
declare !dbg !23 noundef i32 @vfprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #2

; Function Attrs: nofree noreturn nounwind
declare !dbg !25 void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define noundef i32 @main() local_unnamed_addr #5 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #7, !dbg !29
  store i32 0, ptr %4, align 4, !dbg !29, !tbaa !34
  %5 = tail call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str), !dbg !29
  %6 = tail call i32 @getpid() #7, !dbg !29
  tail call void @srandom(i32 noundef %6) #7, !dbg !36
  br label %7, !dbg !29

7:                                                ; preds = %16, %0
  %8 = phi i32 [ 0, %0 ], [ %18, %16 ]
  %9 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %10 = call i64 @random() #7, !dbg !39
  %11 = trunc i64 %10 to i32, !dbg !39
  %12 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %4, ptr nonnull elementtype(i32) %4, i32 %11) #7, !dbg !42, !srcloc !46
  %13 = icmp eq i32 %9, %12, !dbg !29
  br i1 %13, label %16, label %14, !dbg !29

14:                                               ; preds = %7
  %15 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %9, i32 noundef %12), !dbg !29
  br label %29, !dbg !29

16:                                               ; preds = %7
  %17 = add nsw i32 %9, %11, !dbg !47
  %18 = add nuw nsw i32 %8, 1, !dbg !29
  %19 = icmp eq i32 %18, 2000000, !dbg !29
  br i1 %19, label %20, label %7, !dbg !29, !llvm.loop !50

20:                                               ; preds = %16
  %21 = load i32, ptr %4, align 4, !dbg !29, !tbaa !34
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %17, i32 noundef %21), !dbg !29
  %23 = load i32, ptr %4, align 4, !dbg !29, !tbaa !34
  %24 = icmp eq i32 %17, %23, !dbg !29
  br i1 %24, label %25, label %27, !dbg !29

25:                                               ; preds = %20
  %26 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !29
  br label %29, !dbg !29

27:                                               ; preds = %20
  %28 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !29
  br label %29, !dbg !29

29:                                               ; preds = %27, %25, %14
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #7, !dbg !29
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #7, !dbg !51
  store i32 0, ptr %3, align 4, !dbg !51, !tbaa !34
  %30 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.5), !dbg !51
  %31 = call i32 @getpid() #7, !dbg !51
  call void @srandom(i32 noundef %31) #7, !dbg !54
  br label %32, !dbg !51

32:                                               ; preds = %41, %29
  %33 = phi i32 [ 0, %29 ], [ %43, %41 ]
  %34 = phi i32 [ 0, %29 ], [ %42, %41 ]
  %35 = call i64 @random() #7, !dbg !56
  %36 = trunc i64 %35 to i32, !dbg !56
  %37 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %3, ptr nonnull elementtype(i32) %3, i32 %36) #7, !dbg !58, !srcloc !61
  %38 = icmp eq i32 %34, %37, !dbg !51
  br i1 %38, label %41, label %39, !dbg !51

39:                                               ; preds = %32
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %34, i32 noundef %37), !dbg !51
  br label %54, !dbg !51

41:                                               ; preds = %32
  %42 = add i32 %34, %36, !dbg !62
  %43 = add nuw nsw i32 %33, 1, !dbg !51
  %44 = icmp eq i32 %43, 2000000, !dbg !51
  br i1 %44, label %45, label %32, !dbg !51, !llvm.loop !65

45:                                               ; preds = %41
  %46 = load i32, ptr %3, align 4, !dbg !51, !tbaa !34
  %47 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %42, i32 noundef %46), !dbg !51
  %48 = load i32, ptr %3, align 4, !dbg !51, !tbaa !34
  %49 = icmp eq i32 %42, %48, !dbg !51
  br i1 %49, label %50, label %52, !dbg !51

50:                                               ; preds = %45
  %51 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !51
  br label %54, !dbg !51

52:                                               ; preds = %45
  %53 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !51
  br label %54, !dbg !51

54:                                               ; preds = %39, %50, %52
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #7, !dbg !51
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #7, !dbg !66
  store i32 0, ptr %2, align 4, !dbg !66, !tbaa !34
  %55 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.8), !dbg !66
  %56 = call i32 @getpid() #7, !dbg !66
  call void @srandom(i32 noundef %56) #7, !dbg !71
  br label %60, !dbg !66

57:                                               ; preds = %60
  %58 = add nuw nsw i32 %61, 1, !dbg !66
  %59 = icmp eq i32 %58, 2000000, !dbg !66
  br i1 %59, label %69, label %60, !dbg !66, !llvm.loop !73

60:                                               ; preds = %57, %54
  %61 = phi i32 [ 0, %54 ], [ %58, %57 ]
  %62 = phi i32 [ 0, %54 ], [ %64, %57 ]
  %63 = call i64 @random() #7, !dbg !74
  %64 = trunc i64 %63 to i32, !dbg !74
  %65 = call i32 asm sideeffect "xchgl $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 %64) #7, !dbg !76, !srcloc !79
  %66 = icmp eq i32 %62, %65, !dbg !66
  br i1 %66, label %57, label %67, !dbg !66

67:                                               ; preds = %60
  %68 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %62, i32 noundef %65), !dbg !66
  br label %78, !dbg !66

69:                                               ; preds = %57
  %70 = load i32, ptr %2, align 4, !dbg !66, !tbaa !34
  %71 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %64, i32 noundef %70), !dbg !66
  %72 = load i32, ptr %2, align 4, !dbg !66, !tbaa !34
  %73 = icmp eq i32 %72, %64, !dbg !66
  br i1 %73, label %74, label %76, !dbg !66

74:                                               ; preds = %69
  %75 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !66
  br label %78, !dbg !66

76:                                               ; preds = %69
  %77 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !66
  br label %78, !dbg !66

78:                                               ; preds = %76, %74, %67
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #7, !dbg !66
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #7, !dbg !80
  store i32 0, ptr %1, align 4, !dbg !80, !tbaa !34
  %79 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.9), !dbg !80
  %80 = call i32 @getpid() #7, !dbg !80
  call void @srandom(i32 noundef %80) #7, !dbg !83
  br label %84, !dbg !80

81:                                               ; preds = %84
  %82 = add nuw nsw i32 %85, 1, !dbg !80
  %83 = icmp eq i32 %82, 2000000, !dbg !80
  br i1 %83, label %93, label %84, !dbg !80, !llvm.loop !85

84:                                               ; preds = %81, %78
  %85 = phi i32 [ 0, %78 ], [ %82, %81 ]
  %86 = phi i32 [ 0, %78 ], [ %88, %81 ]
  %87 = call i64 @random() #7, !dbg !86
  %88 = trunc i64 %87 to i32, !dbg !86
  %89 = call i32 asm sideeffect "xchgl $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %1, ptr nonnull elementtype(i32) %1, i32 %88) #7, !dbg !88, !srcloc !91
  %90 = icmp eq i32 %86, %89, !dbg !80
  br i1 %90, label %81, label %91, !dbg !80

91:                                               ; preds = %84
  %92 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %86, i32 noundef %89), !dbg !80
  br label %102, !dbg !80

93:                                               ; preds = %81
  %94 = load i32, ptr %1, align 4, !dbg !80, !tbaa !34
  %95 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %88, i32 noundef %94), !dbg !80
  %96 = load i32, ptr %1, align 4, !dbg !80, !tbaa !34
  %97 = icmp eq i32 %96, %88, !dbg !80
  br i1 %97, label %98, label %100, !dbg !80

98:                                               ; preds = %93
  %99 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !80
  br label %102, !dbg !80

100:                                              ; preds = %93
  %101 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !80
  br label %102, !dbg !80

102:                                              ; preds = %91, %98, %100
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #7, !dbg !80
  ret i32 0, !dbg !92
}

; Function Attrs: nofree nounwind
declare !dbg !93 noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !94 i32 @getpid() local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare !dbg !96 noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind
declare !dbg !97 void @srandom(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !98 i64 @random() local_unnamed_addr #6

attributes #0 = { cold nofree noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }
attributes #9 = { cold noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fax.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "7d1a1c6f946eb3924a73a120bc673eb2")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!8 = distinct !DISubprogram(name: "ck_error", scope: !9, file: !9, line: 553, type: !10, scopeLine: 554, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!9 = !DIFile(filename: "../../common.h", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "da6a1c748ec5e2d1e93f4801832f13e1")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 555, column: 2, scope: !8)
!13 = !DILocation(line: 557, column: 2, scope: !8)
!14 = !DILocation(line: 558, column: 11, scope: !8)
!15 = !{!16, !16, i64 0}
!16 = !{!"p1 _ZTS8_IO_FILE", !17, i64 0}
!17 = !{!"any pointer", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 558, column: 2, scope: !8)
!21 = !DILocation(line: 559, column: 2, scope: !8)
!22 = !DILocation(line: 560, column: 2, scope: !8)
!23 = !DISubprogram(name: "vfprintf", scope: !24, file: !24, line: 365, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!24 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!25 = !DISubprogram(name: "exit", scope: !26, file: !26, line: 624, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!26 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!27 = distinct !DISubprogram(name: "main", scope: !28, file: !28, line: 113, type: !10, scopeLine: 114, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!28 = !DIFile(filename: "ck_pr_fax.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "7d1a1c6f946eb3924a73a120bc673eb2")
!29 = !DILocation(line: 106, column: 1, scope: !30, inlinedAt: !31)
!30 = distinct !DISubprogram(name: "run_test_faa_int", scope: !28, file: !28, line: 106, type: !10, scopeLine: 106, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!31 = distinct !DILocation(line: 106, column: 1, scope: !32, inlinedAt: !33)
!32 = distinct !DISubprogram(name: "run_test_faa", scope: !28, file: !28, line: 106, type: !10, scopeLine: 106, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!33 = distinct !DILocation(line: 115, column: 2, scope: !27)
!34 = !{!35, !35, i64 0}
!35 = !{!"int", !18, i64 0}
!36 = !DILocation(line: 78, column: 2, scope: !37, inlinedAt: !38)
!37 = distinct !DISubprogram(name: "common_srand", scope: !9, file: !9, line: 73, type: !10, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!38 = distinct !DILocation(line: 106, column: 1, scope: !30, inlinedAt: !31)
!39 = !DILocation(line: 88, column: 9, scope: !40, inlinedAt: !41)
!40 = distinct !DISubprogram(name: "common_rand", scope: !9, file: !9, line: 83, type: !10, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!41 = distinct !DILocation(line: 106, column: 1, scope: !30, inlinedAt: !31)
!42 = !DILocation(line: 307, column: 1, scope: !43, inlinedAt: !45)
!43 = distinct !DISubprogram(name: "ck_pr_faa_int", scope: !44, file: !44, line: 307, type: !10, scopeLine: 307, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!44 = !DIFile(filename: "../../../include/gcc/x86_64/ck_pr.h", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!45 = distinct !DILocation(line: 106, column: 1, scope: !30, inlinedAt: !31)
!46 = !{i64 2148054155}
!47 = !DILocation(line: 55, column: 1, scope: !48, inlinedAt: !49)
!48 = distinct !DISubprogram(name: "test_faa_int", scope: !28, file: !28, line: 55, type: !10, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!49 = distinct !DILocation(line: 106, column: 1, scope: !30, inlinedAt: !31)
!50 = distinct !{!50, !29, !29}
!51 = !DILocation(line: 106, column: 1, scope: !52, inlinedAt: !53)
!52 = distinct !DISubprogram(name: "run_test_faa_uint", scope: !28, file: !28, line: 106, type: !10, scopeLine: 106, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!53 = distinct !DILocation(line: 106, column: 1, scope: !32, inlinedAt: !33)
!54 = !DILocation(line: 78, column: 2, scope: !37, inlinedAt: !55)
!55 = distinct !DILocation(line: 106, column: 1, scope: !52, inlinedAt: !53)
!56 = !DILocation(line: 88, column: 9, scope: !40, inlinedAt: !57)
!57 = distinct !DILocation(line: 106, column: 1, scope: !52, inlinedAt: !53)
!58 = !DILocation(line: 306, column: 1, scope: !59, inlinedAt: !60)
!59 = distinct !DISubprogram(name: "ck_pr_faa_uint", scope: !44, file: !44, line: 306, type: !10, scopeLine: 306, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!60 = distinct !DILocation(line: 106, column: 1, scope: !52, inlinedAt: !53)
!61 = !{i64 2148053765}
!62 = !DILocation(line: 56, column: 1, scope: !63, inlinedAt: !64)
!63 = distinct !DISubprogram(name: "test_faa_uint", scope: !28, file: !28, line: 56, type: !10, scopeLine: 56, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!64 = distinct !DILocation(line: 106, column: 1, scope: !52, inlinedAt: !53)
!65 = distinct !{!65, !51, !51}
!66 = !DILocation(line: 107, column: 1, scope: !67, inlinedAt: !68)
!67 = distinct !DISubprogram(name: "run_test_fas_int", scope: !28, file: !28, line: 107, type: !10, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!68 = distinct !DILocation(line: 107, column: 1, scope: !69, inlinedAt: !70)
!69 = distinct !DISubprogram(name: "run_test_fas", scope: !28, file: !28, line: 107, type: !10, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!70 = distinct !DILocation(line: 116, column: 2, scope: !27)
!71 = !DILocation(line: 78, column: 2, scope: !37, inlinedAt: !72)
!72 = distinct !DILocation(line: 107, column: 1, scope: !67, inlinedAt: !68)
!73 = distinct !{!73, !66, !66}
!74 = !DILocation(line: 88, column: 9, scope: !40, inlinedAt: !75)
!75 = distinct !DILocation(line: 107, column: 1, scope: !67, inlinedAt: !68)
!76 = !DILocation(line: 161, column: 1, scope: !77, inlinedAt: !78)
!77 = distinct !DISubprogram(name: "ck_pr_fas_int", scope: !44, file: !44, line: 161, type: !10, scopeLine: 161, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!78 = distinct !DILocation(line: 107, column: 1, scope: !67, inlinedAt: !68)
!79 = !{i64 2148042081}
!80 = !DILocation(line: 107, column: 1, scope: !81, inlinedAt: !82)
!81 = distinct !DISubprogram(name: "run_test_fas_uint", scope: !28, file: !28, line: 107, type: !10, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!82 = distinct !DILocation(line: 107, column: 1, scope: !69, inlinedAt: !70)
!83 = !DILocation(line: 78, column: 2, scope: !37, inlinedAt: !84)
!84 = distinct !DILocation(line: 107, column: 1, scope: !81, inlinedAt: !82)
!85 = distinct !{!85, !80, !80}
!86 = !DILocation(line: 88, column: 9, scope: !40, inlinedAt: !87)
!87 = distinct !DILocation(line: 107, column: 1, scope: !81, inlinedAt: !82)
!88 = !DILocation(line: 160, column: 1, scope: !89, inlinedAt: !90)
!89 = distinct !DISubprogram(name: "ck_pr_fas_uint", scope: !44, file: !44, line: 160, type: !10, scopeLine: 160, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!90 = distinct !DILocation(line: 107, column: 1, scope: !81, inlinedAt: !82)
!91 = !{i64 2148041721}
!92 = !DILocation(line: 118, column: 2, scope: !27)
!93 = !DISubprogram(name: "puts", scope: !24, file: !24, line: 661, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!94 = !DISubprogram(name: "getpid", scope: !95, file: !95, line: 650, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!95 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!96 = !DISubprogram(name: "printf", scope: !24, file: !24, line: 356, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!97 = !DISubprogram(name: "srandom", scope: !26, file: !26, line: 405, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!98 = !DISubprogram(name: "random", scope: !26, file: !26, line: 402, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
