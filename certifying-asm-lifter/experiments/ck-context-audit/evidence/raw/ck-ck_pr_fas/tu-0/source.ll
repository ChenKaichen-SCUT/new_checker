; ModuleID = '/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fas.c'
source_filename = "/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fas.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@stderr = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [15 x i8] c"ck_pr_fas_64: \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"FAIL [\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"%lu (%lu) -> %lu (%lu)]\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"ck_pr_fas_32: \00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"%u (%u) -> %u (%u)]\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"ck_pr_fas_16: \00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"ck_pr_fas_8: \00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"FAIL [%#lx != %#lx]\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"FAIL [%#x != %#x]\0A\00", align 1
@str.13 = private unnamed_addr constant [10 x i8] c"  SUCCESS\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @ck_error], section "llvm.metadata"

; Function Attrs: cold nofree noreturn nounwind uwtable
define internal void @ck_error(ptr noundef readonly captures(none) %0, ...) #0 !dbg !8 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #8, !dbg !12
  call void @llvm.va_start.p0(ptr nonnull %2), !dbg !13
  %3 = load ptr, ptr @stderr, align 8, !dbg !14, !tbaa !15
  %4 = call i32 @vfprintf(ptr noundef %3, ptr noundef %0, ptr noundef nonnull %2) #9, !dbg !20
  call void @llvm.va_end.p0(ptr nonnull %2), !dbg !21
  call void @exit(i32 noundef 1) #10, !dbg !22
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
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i8, align 1
  %7 = tail call i32 @getpid() #8, !dbg !29
  tail call void @srandom(i32 noundef %7) #8, !dbg !30
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str), !dbg !33
  br label %9, !dbg !33

9:                                                ; preds = %0, %26
  %10 = phi i32 [ 0, %0 ], [ %27, %26 ]
  %11 = call i64 @random() #8, !dbg !34
  %12 = shl i64 %11, 32, !dbg !33
  %13 = ashr exact i64 %12, 32, !dbg !33
  %14 = call i64 @random() #8, !dbg !37
  %15 = shl i64 %14, 32, !dbg !33
  %16 = ashr exact i64 %15, 32, !dbg !33
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #8, !dbg !33
  store i64 %13, ptr %3, align 8, !dbg !33, !tbaa !39
  %17 = call i64 asm sideeffect "xchgq $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %3, ptr nonnull elementtype(i64) %3, i64 range(i64 -2147483648, 2147483648) %16) #8, !dbg !41, !srcloc !45
  %18 = load i64, ptr %3, align 8, !dbg !33, !tbaa !39
  %19 = icmp eq i64 %18, %16, !dbg !33
  %20 = icmp eq i64 %17, %13, !dbg !33
  %21 = select i1 %19, i1 %20, i1 false, !dbg !33
  br i1 %21, label %26, label %22, !dbg !33

22:                                               ; preds = %9
  %23 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !33
  %24 = load i64, ptr %3, align 8, !dbg !33, !tbaa !39
  %25 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i64 noundef %13, i64 noundef %16, i64 noundef %24, i64 noundef %17), !dbg !33
  call void @exit(i32 noundef 1) #10, !dbg !33
  unreachable, !dbg !33

26:                                               ; preds = %9
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #8, !dbg !33
  %27 = add nuw nsw i32 %10, 1, !dbg !33
  %28 = icmp eq i32 %27, 200000, !dbg !33
  br i1 %28, label %29, label %9, !dbg !33, !llvm.loop !46

29:                                               ; preds = %26
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #8, !dbg !47
  store i64 0, ptr %2, align 8, !dbg !47, !tbaa !39
  %30 = call i32 asm sideeffect "xchgl $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 -1) #8, !dbg !50, !srcloc !53
  %31 = load i64, ptr %2, align 8, !dbg !47, !tbaa !39
  %32 = icmp eq i64 %31, 4294967295, !dbg !47
  br i1 %32, label %35, label %33, !dbg !47

33:                                               ; preds = %29
  %34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i64 noundef %31, i64 noundef 4294967295), !dbg !47
  call void @exit(i32 noundef 1) #10, !dbg !47
  unreachable, !dbg !47

35:                                               ; preds = %29
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #8, !dbg !47
  %36 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !33
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !54
  br label %38, !dbg !54

38:                                               ; preds = %35, %53
  %39 = phi i32 [ 0, %35 ], [ %54, %53 ]
  %40 = call i64 @random() #8, !dbg !55
  %41 = trunc i64 %40 to i32, !dbg !55
  %42 = call i64 @random() #8, !dbg !57
  %43 = trunc i64 %42 to i32, !dbg !57
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #8, !dbg !54
  store i32 %41, ptr %4, align 4, !dbg !54, !tbaa !59
  %44 = call i32 asm sideeffect "xchgl $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %4, ptr nonnull elementtype(i32) %4, i32 %43) #8, !dbg !61, !srcloc !53
  %45 = load i32, ptr %4, align 4, !dbg !54, !tbaa !59
  %46 = icmp eq i32 %45, %43, !dbg !54
  %47 = icmp eq i32 %44, %41, !dbg !54
  %48 = select i1 %46, i1 %47, i1 false, !dbg !54
  br i1 %48, label %53, label %49, !dbg !54

49:                                               ; preds = %38
  %50 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !54
  %51 = load i32, ptr %4, align 4, !dbg !54, !tbaa !59
  %52 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %41, i32 noundef %43, i32 noundef %51, i32 noundef %44), !dbg !54
  call void @exit(i32 noundef 1) #10, !dbg !54
  unreachable, !dbg !54

53:                                               ; preds = %38
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #8, !dbg !54
  %54 = add nuw nsw i32 %39, 1, !dbg !54
  %55 = icmp eq i32 %54, 200000, !dbg !54
  br i1 %55, label %56, label %38, !dbg !54, !llvm.loop !63

56:                                               ; preds = %53
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #8, !dbg !64
  store i32 0, ptr %1, align 4, !dbg !64, !tbaa !59
  %57 = call i16 asm sideeffect "xchgw $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i16) %1, ptr nonnull elementtype(i16) %1, i16 -1) #8, !dbg !66, !srcloc !69
  %58 = load i32, ptr %1, align 4, !dbg !64, !tbaa !59
  %59 = icmp eq i32 %58, 65535, !dbg !64
  br i1 %59, label %62, label %60, !dbg !64

60:                                               ; preds = %56
  %61 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef %58, i32 noundef 65535), !dbg !64
  call void @exit(i32 noundef 1) #10, !dbg !64
  unreachable, !dbg !64

62:                                               ; preds = %56
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #8, !dbg !64
  %63 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !54
  %64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6), !dbg !70
  br label %65, !dbg !70

65:                                               ; preds = %62, %86
  %66 = phi i32 [ 0, %62 ], [ %87, %86 ]
  %67 = call i64 @random() #8, !dbg !71
  %68 = trunc i64 %67 to i16, !dbg !70
  %69 = call i64 @random() #8, !dbg !73
  %70 = trunc i64 %69 to i16, !dbg !70
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %5) #8, !dbg !70
  store i16 %68, ptr %5, align 2, !dbg !70, !tbaa !75
  %71 = call i16 asm sideeffect "xchgw $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i16) %5, ptr nonnull elementtype(i16) %5, i16 %70) #8, !dbg !77, !srcloc !69
  %72 = load i16, ptr %5, align 2, !dbg !70, !tbaa !75
  %73 = icmp eq i16 %72, %70, !dbg !70
  %74 = icmp eq i16 %71, %68, !dbg !70
  %75 = select i1 %73, i1 %74, i1 false, !dbg !70
  br i1 %75, label %86, label %76, !dbg !70

76:                                               ; preds = %65
  %77 = trunc i64 %69 to i32, !dbg !73
  %78 = trunc i64 %67 to i32, !dbg !71
  %79 = and i32 %77, 65535, !dbg !70
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !70
  %81 = and i32 %78, 65535, !dbg !70
  %82 = load i16, ptr %5, align 2, !dbg !70, !tbaa !75
  %83 = zext i16 %82 to i32, !dbg !70
  %84 = zext i16 %71 to i32, !dbg !70
  %85 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %81, i32 noundef %79, i32 noundef %83, i32 noundef %84), !dbg !70
  call void @exit(i32 noundef 1) #10, !dbg !70
  unreachable, !dbg !70

86:                                               ; preds = %65
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %5) #8, !dbg !70
  %87 = add nuw nsw i32 %66, 1, !dbg !70
  %88 = icmp eq i32 %87, 200000, !dbg !70
  br i1 %88, label %89, label %65, !dbg !70, !llvm.loop !79

89:                                               ; preds = %86
  %90 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !70
  %91 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7), !dbg !80
  %92 = call i32 @putchar(i32 32), !dbg !80
  br label %93, !dbg !80

93:                                               ; preds = %89, %114
  %94 = phi i32 [ 0, %89 ], [ %115, %114 ]
  %95 = call i64 @random() #8, !dbg !81
  %96 = trunc i64 %95 to i8, !dbg !80
  %97 = call i64 @random() #8, !dbg !83
  %98 = trunc i64 %97 to i8, !dbg !80
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %6) #8, !dbg !80
  store i8 %96, ptr %6, align 1, !dbg !80, !tbaa !85
  %99 = call i8 asm sideeffect "xchgb $0, $1", "=*m,=q,*m,1,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i8) %6, ptr nonnull elementtype(i8) %6, i8 %98) #8, !dbg !86, !srcloc !89
  %100 = load i8, ptr %6, align 1, !dbg !80, !tbaa !85
  %101 = icmp eq i8 %100, %98, !dbg !80
  %102 = icmp eq i8 %99, %96, !dbg !80
  %103 = select i1 %101, i1 %102, i1 false, !dbg !80
  br i1 %103, label %114, label %104, !dbg !80

104:                                              ; preds = %93
  %105 = trunc i64 %97 to i32, !dbg !83
  %106 = trunc i64 %95 to i32, !dbg !81
  %107 = and i32 %105, 255, !dbg !80
  %108 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !80
  %109 = and i32 %106, 255, !dbg !80
  %110 = load i8, ptr %6, align 1, !dbg !80, !tbaa !85
  %111 = zext i8 %110 to i32, !dbg !80
  %112 = zext i8 %99 to i32, !dbg !80
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %109, i32 noundef %107, i32 noundef %111, i32 noundef %112), !dbg !80
  call void @exit(i32 noundef 1) #10, !dbg !80
  unreachable, !dbg !80

114:                                              ; preds = %93
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %6) #8, !dbg !80
  %115 = add nuw nsw i32 %94, 1, !dbg !80
  %116 = icmp eq i32 %115, 200000, !dbg !80
  br i1 %116, label %117, label %93, !dbg !80, !llvm.loop !90

117:                                              ; preds = %114
  %118 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !80
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare !dbg !92 i32 @getpid() local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare !dbg !94 noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind
declare !dbg !95 void @srandom(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !96 i64 @random() local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #7

attributes #0 = { cold nofree noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind }
attributes #8 = { nounwind }
attributes #9 = { cold nounwind }
attributes #10 = { cold noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_fas.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "b30a61374deef68026ad7e2436c05f2e")
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
!27 = distinct !DISubprogram(name: "main", scope: !28, file: !28, line: 125, type: !10, scopeLine: 126, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!28 = !DIFile(filename: "ck_pr_fas.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "b30a61374deef68026ad7e2436c05f2e")
!29 = !DILocation(line: 128, column: 29, scope: !27)
!30 = !DILocation(line: 78, column: 2, scope: !31, inlinedAt: !32)
!31 = distinct !DISubprogram(name: "common_srand", scope: !9, file: !9, line: 73, type: !10, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!32 = distinct !DILocation(line: 128, column: 2, scope: !27)
!33 = !DILocation(line: 131, column: 2, scope: !27)
!34 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !36)
!35 = distinct !DISubprogram(name: "common_rand", scope: !9, file: !9, line: 83, type: !10, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!36 = distinct !DILocation(line: 131, column: 2, scope: !27)
!37 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !38)
!38 = distinct !DILocation(line: 131, column: 2, scope: !27)
!39 = !{!40, !40, i64 0}
!40 = !{!"long", !18, i64 0}
!41 = !DILocation(line: 162, column: 1, scope: !42, inlinedAt: !44)
!42 = distinct !DISubprogram(name: "ck_pr_fas_64", scope: !43, file: !43, line: 162, type: !10, scopeLine: 162, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!43 = !DIFile(filename: "../../../include/gcc/x86_64/ck_pr.h", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!44 = distinct !DILocation(line: 131, column: 2, scope: !27)
!45 = !{i64 2148053750}
!46 = distinct !{!46, !33, !33}
!47 = !DILocation(line: 93, column: 3, scope: !48, inlinedAt: !49)
!48 = distinct !DISubprogram(name: "rg_width", scope: !28, file: !28, line: 82, type: !10, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!49 = distinct !DILocation(line: 131, column: 2, scope: !27)
!50 = !DILocation(line: 163, column: 1, scope: !51, inlinedAt: !52)
!51 = distinct !DISubprogram(name: "ck_pr_fas_32", scope: !43, file: !43, line: 163, type: !10, scopeLine: 163, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!52 = distinct !DILocation(line: 93, column: 3, scope: !48, inlinedAt: !49)
!53 = !{i64 2148054132}
!54 = !DILocation(line: 135, column: 2, scope: !27)
!55 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !56)
!56 = distinct !DILocation(line: 135, column: 2, scope: !27)
!57 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !58)
!58 = distinct !DILocation(line: 135, column: 2, scope: !27)
!59 = !{!60, !60, i64 0}
!60 = !{!"int", !18, i64 0}
!61 = !DILocation(line: 163, column: 1, scope: !51, inlinedAt: !62)
!62 = distinct !DILocation(line: 135, column: 2, scope: !27)
!63 = distinct !{!63, !54, !54}
!64 = !DILocation(line: 107, column: 3, scope: !48, inlinedAt: !65)
!65 = distinct !DILocation(line: 135, column: 2, scope: !27)
!66 = !DILocation(line: 164, column: 1, scope: !67, inlinedAt: !68)
!67 = distinct !DISubprogram(name: "ck_pr_fas_16", scope: !43, file: !43, line: 164, type: !10, scopeLine: 164, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!68 = distinct !DILocation(line: 107, column: 3, scope: !48, inlinedAt: !65)
!69 = !{i64 2148054514}
!70 = !DILocation(line: 139, column: 2, scope: !27)
!71 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !72)
!72 = distinct !DILocation(line: 139, column: 2, scope: !27)
!73 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !74)
!74 = distinct !DILocation(line: 139, column: 2, scope: !27)
!75 = !{!76, !76, i64 0}
!76 = !{!"short", !18, i64 0}
!77 = !DILocation(line: 164, column: 1, scope: !67, inlinedAt: !78)
!78 = distinct !DILocation(line: 139, column: 2, scope: !27)
!79 = distinct !{!79, !70, !70}
!80 = !DILocation(line: 143, column: 2, scope: !27)
!81 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !82)
!82 = distinct !DILocation(line: 143, column: 2, scope: !27)
!83 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !84)
!84 = distinct !DILocation(line: 143, column: 2, scope: !27)
!85 = !{!18, !18, i64 0}
!86 = !DILocation(line: 165, column: 1, scope: !87, inlinedAt: !88)
!87 = distinct !DISubprogram(name: "ck_pr_fas_8", scope: !43, file: !43, line: 165, type: !10, scopeLine: 165, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!88 = distinct !DILocation(line: 143, column: 2, scope: !27)
!89 = !{i64 2148054888}
!90 = distinct !{!90, !80, !80}
!91 = !DILocation(line: 146, column: 2, scope: !27)
!92 = !DISubprogram(name: "getpid", scope: !93, file: !93, line: 650, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!93 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!94 = !DISubprogram(name: "printf", scope: !24, file: !24, line: 356, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!95 = !DISubprogram(name: "srandom", scope: !26, file: !26, line: 405, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DISubprogram(name: "random", scope: !26, file: !26, line: 402, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
