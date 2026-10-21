; ModuleID = '/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_faa.c'
source_filename = "/opt/actc-gap45/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_faa.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@stderr = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [15 x i8] c"ck_pr_faa_64: \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"FAIL [\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"%lu (%lu) -> %lu (%lu)]\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"ck_pr_faa_32: \00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"%u (%u) -> %u (%u)]\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"ck_pr_faa_16: \00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"ck_pr_faa_8: \00", align 1
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

9:                                                ; preds = %0, %29
  %10 = phi i32 [ 0, %0 ], [ %30, %29 ]
  %11 = call i64 @random() #8, !dbg !34
  %12 = shl i64 %11, 32, !dbg !33
  %13 = ashr exact i64 %12, 32, !dbg !33
  %14 = urem i64 %13, 9223372036854775807, !dbg !33
  %15 = call i64 @random() #8, !dbg !37
  %16 = shl i64 %15, 32, !dbg !33
  %17 = ashr exact i64 %16, 32, !dbg !33
  %18 = urem i64 %17, 9223372036854775807, !dbg !33
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #8, !dbg !33
  store i64 %14, ptr %3, align 8, !dbg !33, !tbaa !39
  %19 = call i64 asm sideeffect "lock xaddq $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %3, ptr nonnull elementtype(i64) %3, i64 range(i64 0, 9223372036854775807) %18) #8, !dbg !41, !srcloc !45
  %20 = load i64, ptr %3, align 8, !dbg !33, !tbaa !39
  %21 = add nuw i64 %18, %14, !dbg !33
  %22 = icmp eq i64 %20, %21, !dbg !33
  %23 = icmp eq i64 %19, %14, !dbg !33
  %24 = select i1 %22, i1 %23, i1 false, !dbg !33
  br i1 %24, label %29, label %25, !dbg !33

25:                                               ; preds = %9
  %26 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !33
  %27 = load i64, ptr %3, align 8, !dbg !33, !tbaa !39
  %28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i64 noundef %14, i64 noundef %18, i64 noundef %27, i64 noundef %19), !dbg !33
  call void @exit(i32 noundef 1) #10, !dbg !33
  unreachable, !dbg !33

29:                                               ; preds = %9
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #8, !dbg !33
  %30 = add nuw nsw i32 %10, 1, !dbg !33
  %31 = icmp eq i32 %30, 200000, !dbg !33
  br i1 %31, label %32, label %9, !dbg !33, !llvm.loop !46

32:                                               ; preds = %29
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #8, !dbg !47
  store i64 -1, ptr %2, align 8, !dbg !47, !tbaa !39
  %33 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 1) #8, !dbg !50, !srcloc !53
  %34 = load i64, ptr %2, align 8, !dbg !47, !tbaa !39
  %35 = icmp eq i64 %34, -4294967296, !dbg !47
  br i1 %35, label %38, label %36, !dbg !47

36:                                               ; preds = %32
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i64 noundef %34, i64 noundef -4294967296), !dbg !47
  call void @exit(i32 noundef 1) #10, !dbg !47
  unreachable, !dbg !47

38:                                               ; preds = %32
  store i64 0, ptr %2, align 8, !dbg !47, !tbaa !39
  %39 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 -1) #8, !dbg !54, !srcloc !53
  %40 = load i64, ptr %2, align 8, !dbg !47, !tbaa !39
  %41 = icmp eq i64 %40, 4294967295, !dbg !47
  br i1 %41, label %44, label %42, !dbg !47

42:                                               ; preds = %38
  %43 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i64 noundef %40, i64 noundef 4294967295), !dbg !47
  call void @exit(i32 noundef 1) #10, !dbg !47
  unreachable, !dbg !47

44:                                               ; preds = %38
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #8, !dbg !47
  %45 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !33
  %46 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !56
  br label %47, !dbg !56

47:                                               ; preds = %44, %65
  %48 = phi i32 [ 0, %44 ], [ %66, %65 ]
  %49 = call i64 @random() #8, !dbg !57
  %50 = trunc i64 %49 to i32, !dbg !57
  %51 = urem i32 %50, 2147483647, !dbg !56
  %52 = call i64 @random() #8, !dbg !59
  %53 = trunc i64 %52 to i32, !dbg !59
  %54 = urem i32 %53, 2147483647, !dbg !56
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #8, !dbg !56
  store i32 %51, ptr %4, align 4, !dbg !56, !tbaa !61
  %55 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %4, ptr nonnull elementtype(i32) %4, i32 range(i32 -1, 2147483647) %54) #8, !dbg !63, !srcloc !53
  %56 = load i32, ptr %4, align 4, !dbg !56, !tbaa !61
  %57 = add nuw i32 %54, %51, !dbg !56
  %58 = icmp eq i32 %56, %57, !dbg !56
  %59 = icmp eq i32 %55, %51, !dbg !56
  %60 = select i1 %58, i1 %59, i1 false, !dbg !56
  br i1 %60, label %65, label %61, !dbg !56

61:                                               ; preds = %47
  %62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !56
  %63 = load i32, ptr %4, align 4, !dbg !56, !tbaa !61
  %64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %51, i32 noundef %54, i32 noundef %63, i32 noundef %55), !dbg !56
  call void @exit(i32 noundef 1) #10, !dbg !56
  unreachable, !dbg !56

65:                                               ; preds = %47
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #8, !dbg !56
  %66 = add nuw nsw i32 %48, 1, !dbg !56
  %67 = icmp eq i32 %66, 200000, !dbg !56
  br i1 %67, label %68, label %47, !dbg !56, !llvm.loop !65

68:                                               ; preds = %65
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #8, !dbg !66
  store i32 -1, ptr %1, align 4, !dbg !66, !tbaa !61
  %69 = call i16 asm sideeffect "lock xaddw $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i16) %1, ptr nonnull elementtype(i16) %1, i16 1) #8, !dbg !68, !srcloc !71
  %70 = load i32, ptr %1, align 4, !dbg !66, !tbaa !61
  %71 = icmp eq i32 %70, -65536, !dbg !66
  br i1 %71, label %74, label %72, !dbg !66

72:                                               ; preds = %68
  %73 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef %70, i32 noundef -65536), !dbg !66
  call void @exit(i32 noundef 1) #10, !dbg !66
  unreachable, !dbg !66

74:                                               ; preds = %68
  store i32 0, ptr %1, align 4, !dbg !66, !tbaa !61
  %75 = call i16 asm sideeffect "lock xaddw $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i16) %1, ptr nonnull elementtype(i16) %1, i16 -1) #8, !dbg !72, !srcloc !71
  %76 = load i32, ptr %1, align 4, !dbg !66, !tbaa !61
  %77 = icmp eq i32 %76, 65535, !dbg !66
  br i1 %77, label %80, label %78, !dbg !66

78:                                               ; preds = %74
  %79 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef %76, i32 noundef 65535), !dbg !66
  call void @exit(i32 noundef 1) #10, !dbg !66
  unreachable, !dbg !66

80:                                               ; preds = %74
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #8, !dbg !66
  %81 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !56
  %82 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6), !dbg !74
  br label %83, !dbg !74

83:                                               ; preds = %80, %108
  %84 = phi i32 [ 0, %80 ], [ %109, %108 ]
  %85 = call i64 @random() #8, !dbg !75
  %86 = trunc i64 %85 to i32, !dbg !75
  %87 = srem i32 %86, 32767, !dbg !74
  %88 = trunc nsw i32 %87 to i16, !dbg !74
  %89 = call i64 @random() #8, !dbg !77
  %90 = trunc i64 %89 to i32, !dbg !77
  %91 = srem i32 %90, 32767, !dbg !74
  %92 = trunc nsw i32 %91 to i16, !dbg !74
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %5) #8, !dbg !74
  store i16 %88, ptr %5, align 2, !dbg !74, !tbaa !79
  %93 = call i16 asm sideeffect "lock xaddw $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i16) %5, ptr nonnull elementtype(i16) %5, i16 range(i16 -32766, 32767) %92) #8, !dbg !81, !srcloc !71
  %94 = load i16, ptr %5, align 2, !dbg !74, !tbaa !79
  %95 = add nsw i32 %91, %87, !dbg !74
  %96 = trunc i32 %95 to i16, !dbg !74
  %97 = icmp eq i16 %94, %96, !dbg !74
  %98 = icmp eq i16 %93, %88, !dbg !74
  %99 = select i1 %97, i1 %98, i1 false, !dbg !74
  br i1 %99, label %108, label %100, !dbg !74

100:                                              ; preds = %83
  %101 = and i32 %87, 65535, !dbg !74
  %102 = and i32 %91, 65535, !dbg !74
  %103 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !74
  %104 = load i16, ptr %5, align 2, !dbg !74, !tbaa !79
  %105 = zext i16 %104 to i32, !dbg !74
  %106 = zext i16 %93 to i32, !dbg !74
  %107 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %101, i32 noundef %102, i32 noundef %105, i32 noundef %106), !dbg !74
  call void @exit(i32 noundef 1) #10, !dbg !74
  unreachable, !dbg !74

108:                                              ; preds = %83
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %5) #8, !dbg !74
  %109 = add nuw nsw i32 %84, 1, !dbg !74
  %110 = icmp eq i32 %109, 200000, !dbg !74
  br i1 %110, label %111, label %83, !dbg !74, !llvm.loop !83

111:                                              ; preds = %108
  %112 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !74
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7), !dbg !84
  %114 = call i32 @putchar(i32 32), !dbg !84
  br label %115, !dbg !84

115:                                              ; preds = %111, %140
  %116 = phi i32 [ 0, %111 ], [ %141, %140 ]
  %117 = call i64 @random() #8, !dbg !85
  %118 = trunc i64 %117 to i32, !dbg !85
  %119 = srem i32 %118, 127, !dbg !84
  %120 = trunc nsw i32 %119 to i8, !dbg !84
  %121 = call i64 @random() #8, !dbg !87
  %122 = trunc i64 %121 to i32, !dbg !87
  %123 = srem i32 %122, 127, !dbg !84
  %124 = trunc nsw i32 %123 to i8, !dbg !84
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %6) #8, !dbg !84
  store i8 %120, ptr %6, align 1, !dbg !84, !tbaa !89
  %125 = call i8 asm sideeffect "lock xaddb $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i8) %6, ptr nonnull elementtype(i8) %6, i8 range(i8 -126, 127) %124) #8, !dbg !90, !srcloc !93
  %126 = load i8, ptr %6, align 1, !dbg !84, !tbaa !89
  %127 = add nsw i32 %123, %119, !dbg !84
  %128 = trunc i32 %127 to i8, !dbg !84
  %129 = icmp eq i8 %126, %128, !dbg !84
  %130 = icmp eq i8 %125, %120, !dbg !84
  %131 = select i1 %129, i1 %130, i1 false, !dbg !84
  br i1 %131, label %140, label %132, !dbg !84

132:                                              ; preds = %115
  %133 = and i32 %119, 255, !dbg !84
  %134 = and i32 %123, 255, !dbg !84
  %135 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !84
  %136 = load i8, ptr %6, align 1, !dbg !84, !tbaa !89
  %137 = zext i8 %136 to i32, !dbg !84
  %138 = zext i8 %125 to i32, !dbg !84
  %139 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %133, i32 noundef %134, i32 noundef %137, i32 noundef %138), !dbg !84
  call void @exit(i32 noundef 1) #10, !dbg !84
  unreachable, !dbg !84

140:                                              ; preds = %115
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %6) #8, !dbg !84
  %141 = add nuw nsw i32 %116, 1, !dbg !84
  %142 = icmp eq i32 %141, 200000, !dbg !84
  br i1 %142, label %143, label %115, !dbg !84, !llvm.loop !94

143:                                              ; preds = %140
  %144 = call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !84
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare !dbg !96 i32 @getpid() local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare !dbg !98 noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind
declare !dbg !99 void @srandom(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !100 i64 @random() local_unnamed_addr #6

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
!1 = !DIFile(filename: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate/ck_pr_faa.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "6f892db98af39233b26b7dbd9ceef0a3")
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
!27 = distinct !DISubprogram(name: "main", scope: !28, file: !28, line: 129, type: !10, scopeLine: 130, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!28 = !DIFile(filename: "ck_pr_faa.c", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "6f892db98af39233b26b7dbd9ceef0a3")
!29 = !DILocation(line: 132, column: 29, scope: !27)
!30 = !DILocation(line: 78, column: 2, scope: !31, inlinedAt: !32)
!31 = distinct !DISubprogram(name: "common_srand", scope: !9, file: !9, line: 73, type: !10, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!32 = distinct !DILocation(line: 132, column: 2, scope: !27)
!33 = !DILocation(line: 135, column: 2, scope: !27)
!34 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !36)
!35 = distinct !DISubprogram(name: "common_rand", scope: !9, file: !9, line: 83, type: !10, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!36 = distinct !DILocation(line: 135, column: 2, scope: !27)
!37 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !38)
!38 = distinct !DILocation(line: 135, column: 2, scope: !27)
!39 = !{!40, !40, i64 0}
!40 = !{!"long", !18, i64 0}
!41 = !DILocation(line: 308, column: 1, scope: !42, inlinedAt: !44)
!42 = distinct !DISubprogram(name: "ck_pr_faa_64", scope: !43, file: !43, line: 308, type: !10, scopeLine: 308, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!43 = !DIFile(filename: "../../../include/gcc/x86_64/ck_pr.h", directory: "/cert-source/upstreams/ck-archive/regressions/ck_pr/validate", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!44 = distinct !DILocation(line: 135, column: 2, scope: !27)
!45 = !{i64 2148066142}
!46 = distinct !{!46, !33, !33}
!47 = !DILocation(line: 97, column: 3, scope: !48, inlinedAt: !49)
!48 = distinct !DISubprogram(name: "rg_width", scope: !28, file: !28, line: 86, type: !10, scopeLine: 87, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!49 = distinct !DILocation(line: 135, column: 2, scope: !27)
!50 = !DILocation(line: 309, column: 1, scope: !51, inlinedAt: !52)
!51 = distinct !DISubprogram(name: "ck_pr_faa_32", scope: !43, file: !43, line: 309, type: !10, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!52 = distinct !DILocation(line: 97, column: 3, scope: !48, inlinedAt: !49)
!53 = !{i64 2148066564}
!54 = !DILocation(line: 309, column: 1, scope: !51, inlinedAt: !55)
!55 = distinct !DILocation(line: 97, column: 3, scope: !48, inlinedAt: !49)
!56 = !DILocation(line: 139, column: 2, scope: !27)
!57 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !58)
!58 = distinct !DILocation(line: 139, column: 2, scope: !27)
!59 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !60)
!60 = distinct !DILocation(line: 139, column: 2, scope: !27)
!61 = !{!62, !62, i64 0}
!62 = !{!"int", !18, i64 0}
!63 = !DILocation(line: 309, column: 1, scope: !51, inlinedAt: !64)
!64 = distinct !DILocation(line: 139, column: 2, scope: !27)
!65 = distinct !{!65, !56, !56}
!66 = !DILocation(line: 111, column: 3, scope: !48, inlinedAt: !67)
!67 = distinct !DILocation(line: 139, column: 2, scope: !27)
!68 = !DILocation(line: 310, column: 1, scope: !69, inlinedAt: !70)
!69 = distinct !DISubprogram(name: "ck_pr_faa_16", scope: !43, file: !43, line: 310, type: !10, scopeLine: 310, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!70 = distinct !DILocation(line: 111, column: 3, scope: !48, inlinedAt: !67)
!71 = !{i64 2148066986}
!72 = !DILocation(line: 310, column: 1, scope: !69, inlinedAt: !73)
!73 = distinct !DILocation(line: 111, column: 3, scope: !48, inlinedAt: !67)
!74 = !DILocation(line: 143, column: 2, scope: !27)
!75 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !76)
!76 = distinct !DILocation(line: 143, column: 2, scope: !27)
!77 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !78)
!78 = distinct !DILocation(line: 143, column: 2, scope: !27)
!79 = !{!80, !80, i64 0}
!80 = !{!"short", !18, i64 0}
!81 = !DILocation(line: 310, column: 1, scope: !69, inlinedAt: !82)
!82 = distinct !DILocation(line: 143, column: 2, scope: !27)
!83 = distinct !{!83, !74, !74}
!84 = !DILocation(line: 147, column: 2, scope: !27)
!85 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !86)
!86 = distinct !DILocation(line: 147, column: 2, scope: !27)
!87 = !DILocation(line: 88, column: 9, scope: !35, inlinedAt: !88)
!88 = distinct !DILocation(line: 147, column: 2, scope: !27)
!89 = !{!18, !18, i64 0}
!90 = !DILocation(line: 311, column: 1, scope: !91, inlinedAt: !92)
!91 = distinct !DISubprogram(name: "ck_pr_faa_8", scope: !43, file: !43, line: 311, type: !10, scopeLine: 311, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!92 = distinct !DILocation(line: 147, column: 2, scope: !27)
!93 = !{i64 2148067398}
!94 = distinct !{!94, !84, !84}
!95 = !DILocation(line: 150, column: 2, scope: !27)
!96 = !DISubprogram(name: "getpid", scope: !97, file: !97, line: 650, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!97 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!98 = !DISubprogram(name: "printf", scope: !24, file: !24, line: 356, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!99 = !DISubprogram(name: "srandom", scope: !26, file: !26, line: 405, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DISubprogram(name: "random", scope: !26, file: !26, line: 402, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
