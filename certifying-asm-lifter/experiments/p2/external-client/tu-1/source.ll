; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/src/ck_ec.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/src/ck_ec.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ck_ec_wait_state = type { %struct.timespec, %struct.timespec, ptr, ptr }
%struct.timespec = type { i64, i64 }
%struct.ck_ec32_slow_path_state = type { ptr, i32 }
%struct.ck_ec64_slow_path_state = type { ptr, i64 }

; Function Attrs: nounwind uwtable
define void @ck_ec32_wake(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 !dbg !8 {
  tail call void asm sideeffect "lock andl $1, $0", "=*m,Zq,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0, i32 2147483647, ptr elementtype(i32) %0) #5, !dbg !12, !srcloc !16
  %3 = getelementptr inbounds nuw i8, ptr %1, i64 24, !dbg !17
  %4 = load ptr, ptr %3, align 8, !dbg !18, !tbaa !19
  tail call void %4(ptr noundef %1, ptr noundef %0) #5, !dbg !18
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @ck_ec32_wait_slow(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef readonly captures(address_is_null) %3) local_unnamed_addr #0 !dbg !26 {
  %5 = tail call i32 @ck_ec32_wait_pred_slow(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef null, ptr noundef null, ptr noundef %3), !dbg !27
  ret i32 %5, !dbg !28
}

; Function Attrs: nounwind uwtable
define i32 @ck_ec32_wait_pred_slow(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef readonly captures(address_is_null) %3, ptr noundef %4, ptr noundef readonly captures(address_is_null) %5) local_unnamed_addr #0 !dbg !29 {
  %7 = alloca %struct.ck_ec_wait_state, align 8
  %8 = alloca %struct.ck_ec32_slow_path_state, align 8
  %9 = alloca %struct.timespec, align 16
  %10 = or i32 %2, -2147483648, !dbg !30
  %11 = tail call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !31, !srcloc !37
  %12 = and i32 %11, 2147483647, !dbg !38
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !39, !srcloc !46
  %13 = icmp eq i32 %12, %2, !dbg !47
  br i1 %13, label %14, label %84, !dbg !47, !prof !48

14:                                               ; preds = %6
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %7) #5, !dbg !49
  %15 = getelementptr inbounds nuw i8, ptr %7, i64 32, !dbg !49
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %7, i8 0, i64 32, i1 false), !dbg !49
  store ptr %1, ptr %15, align 8, !dbg !49, !tbaa !50
  %16 = getelementptr inbounds nuw i8, ptr %7, i64 40, !dbg !49
  store ptr %4, ptr %16, align 8, !dbg !49, !tbaa !55
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #5, !dbg !49
  store ptr %0, ptr %8, align 8, !dbg !49, !tbaa !56
  %17 = getelementptr inbounds nuw i8, ptr %8, i64 8, !dbg !49
  store i32 %10, ptr %17, align 8, !dbg !49, !tbaa !59
  %18 = getelementptr inbounds nuw i8, ptr %8, i64 12, !dbg !49
  store i32 0, ptr %18, align 4, !dbg !49
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %9) #5, !dbg !49
  %19 = icmp eq ptr %5, null, !dbg !60
  br i1 %19, label %20, label %22, !dbg !60

20:                                               ; preds = %14
  store i64 9223372036854775807, ptr %9, align 16, !dbg !49
  %21 = getelementptr inbounds nuw i8, ptr %9, i64 8, !dbg !49
  store i64 0, ptr %21, align 8, !dbg !49
  br label %26, !dbg !49

22:                                               ; preds = %14
  %23 = load <2 x i64>, ptr %5, align 8, !dbg !63, !tbaa !64
  %24 = load i64, ptr %5, align 8, !dbg !63, !tbaa !64
  store <2 x i64> %23, ptr %9, align 16, !dbg !49
  %25 = icmp slt i64 %24, 1, !dbg !49
  br i1 %25, label %82, label %26, !dbg !49, !prof !65

26:                                               ; preds = %20, %22
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 40
  br label %28, !dbg !66

28:                                               ; preds = %26, %77
  %29 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !69, !srcloc !37
  %30 = load i32, ptr %27, align 8, !dbg !66, !tbaa !71
  %31 = icmp eq i32 %30, 0, !dbg !66
  %32 = select i1 %31, i32 100, i32 %30, !dbg !66
  %33 = zext i32 %32 to i64, !dbg !66
  %34 = icmp eq i32 %29, %2, !dbg !66
  br i1 %34, label %35, label %42, !dbg !66

35:                                               ; preds = %28, %35
  %36 = phi i64 [ %38, %35 ], [ 0, %28 ]
  call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !72, !srcloc !75
  %37 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !76, !srcloc !37
  %38 = add nuw nsw i64 %36, 1, !dbg !66
  %39 = icmp samesign ult i64 %38, %33, !dbg !66
  %40 = icmp eq i32 %37, %2, !dbg !66
  %41 = select i1 %39, i1 %40, i1 false, !dbg !66
  br i1 %41, label %35, label %42, !dbg !66, !llvm.loop !78

42:                                               ; preds = %35, %28
  %43 = phi i32 [ %29, %28 ], [ %37, %35 ], !dbg !66
  %44 = icmp eq i32 %43, %10, !dbg !80
  br i1 %44, label %56, label %45, !dbg !80, !prof !83

45:                                               ; preds = %42
  %46 = icmp eq i32 %43, %2, !dbg !80
  br i1 %46, label %47, label %55, !dbg !80

47:                                               ; preds = %45
  %48 = call { i8, i32 } asm sideeffect "lock cmpxchgl $3, $0;", "=*m,={@ccz},={ax},q,*m,2,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0, i32 range(i32 -2147483648, 0) %10, ptr elementtype(i32) %0, i32 range(i32 0, -2147483648) %2) #5, !dbg !84, !srcloc !87
  %49 = extractvalue { i8, i32 } %48, 0, !dbg !84
  %50 = extractvalue { i8, i32 } %48, 1, !dbg !84
  %51 = icmp ult i8 %49, 2, !dbg !84
  call void @llvm.assume(i1 %51), !dbg !84
  %52 = trunc nuw i8 %49 to i1, !dbg !84
  %53 = icmp eq i32 %50, %10, !dbg !80
  %54 = select i1 %52, i1 true, i1 %53, !dbg !49
  br i1 %54, label %56, label %55, !dbg !49, !prof !88

55:                                               ; preds = %45, %47
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !89, !srcloc !46
  br label %82, !dbg !49

56:                                               ; preds = %42, %47
  %57 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !92, !srcloc !37
  %58 = load i32, ptr %27, align 8, !dbg !95, !tbaa !71
  %59 = icmp eq i32 %58, 0, !dbg !95
  %60 = select i1 %59, i32 100, i32 %58, !dbg !95
  %61 = zext i32 %60 to i64, !dbg !95
  %62 = icmp eq i32 %57, %10, !dbg !95
  br i1 %62, label %63, label %70, !dbg !95

63:                                               ; preds = %56, %63
  %64 = phi i64 [ %66, %63 ], [ 0, %56 ]
  call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !96, !srcloc !75
  %65 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !98, !srcloc !37
  %66 = add nuw nsw i64 %64, 1, !dbg !95
  %67 = icmp samesign ult i64 %66, %61, !dbg !95
  %68 = icmp eq i32 %65, %10, !dbg !95
  %69 = select i1 %67, i1 %68, i1 false, !dbg !95
  br i1 %69, label %63, label %70, !dbg !95, !llvm.loop !100

70:                                               ; preds = %63, %56
  %71 = phi i32 [ %57, %56 ], [ %65, %63 ], !dbg !95
  %72 = icmp eq i32 %71, %10, !dbg !49
  br i1 %72, label %74, label %73, !dbg !49, !prof !101

73:                                               ; preds = %70
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !102, !srcloc !46
  br label %82, !dbg !49

74:                                               ; preds = %70
  %75 = call fastcc i32 @exponential_backoff(ptr noundef %7, ptr noundef nonnull @ck_ec32_wait_slow_once, ptr noundef %8, ptr noundef %3, ptr noundef %9), !dbg !49
  %76 = icmp eq i32 %75, 0, !dbg !49
  br i1 %76, label %77, label %82, !dbg !49

77:                                               ; preds = %74
  %78 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #5, !dbg !105, !srcloc !37
  %79 = and i32 %78, 2147483647, !dbg !108
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !109, !srcloc !46
  %80 = icmp eq i32 %79, %2, !dbg !49
  br i1 %80, label %28, label %81, !dbg !49

81:                                               ; preds = %77
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !112, !srcloc !46
  br label %82, !dbg !49

82:                                               ; preds = %74, %81, %73, %55, %22
  %83 = phi i32 [ -1, %22 ], [ 0, %81 ], [ 0, %73 ], [ 0, %55 ], [ %75, %74 ], !dbg !49
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %9) #5, !dbg !49
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #5, !dbg !49
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %7) #5, !dbg !49
  br label %84

84:                                               ; preds = %6, %82
  %85 = phi i32 [ %83, %82 ], [ 0, %6 ], !dbg !115
  ret i32 %85, !dbg !116
}

; Function Attrs: nounwind uwtable
define void @ck_ec64_wake(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 !dbg !117 {
  tail call void asm sideeffect "lock andq $1, $0", "=*m,Zq,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0, i64 -2, ptr elementtype(i64) %0) #5, !dbg !118, !srcloc !121
  %3 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !122
  %4 = load ptr, ptr %3, align 8, !dbg !123, !tbaa !124
  tail call void %4(ptr noundef %1, ptr noundef %0) #5, !dbg !123
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define i32 @ck_ec64_wait_slow(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef readonly captures(address_is_null) %3) local_unnamed_addr #0 !dbg !126 {
  %5 = tail call i32 @ck_ec64_wait_pred_slow(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef null, ptr noundef null, ptr noundef %3), !dbg !127
  ret i32 %5, !dbg !128
}

; Function Attrs: nounwind uwtable
define i32 @ck_ec64_wait_pred_slow(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef readonly captures(address_is_null) %3, ptr noundef %4, ptr noundef readonly captures(address_is_null) %5) local_unnamed_addr #0 !dbg !129 {
  %7 = alloca %struct.ck_ec_wait_state, align 8
  %8 = alloca %struct.ck_ec64_slow_path_state, align 8
  %9 = alloca %struct.timespec, align 16
  %10 = shl i64 %2, 1, !dbg !130
  %11 = or disjoint i64 %10, 1, !dbg !131
  %12 = tail call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !132, !srcloc !137
  %13 = lshr i64 %12, 1, !dbg !138
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !139, !srcloc !46
  %14 = icmp eq i64 %13, %2, !dbg !142
  br i1 %14, label %15, label %84, !dbg !142, !prof !48

15:                                               ; preds = %6
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %7) #5, !dbg !143
  %16 = getelementptr inbounds nuw i8, ptr %7, i64 32, !dbg !143
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %7, i8 0, i64 32, i1 false), !dbg !143
  store ptr %1, ptr %16, align 8, !dbg !143, !tbaa !50
  %17 = getelementptr inbounds nuw i8, ptr %7, i64 40, !dbg !143
  store ptr %4, ptr %17, align 8, !dbg !143, !tbaa !55
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #5, !dbg !143
  store ptr %0, ptr %8, align 8, !dbg !143, !tbaa !144
  %18 = getelementptr inbounds nuw i8, ptr %8, i64 8, !dbg !143
  store i64 %11, ptr %18, align 8, !dbg !143, !tbaa !147
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %9) #5, !dbg !143
  %19 = icmp eq ptr %5, null, !dbg !148
  br i1 %19, label %20, label %22, !dbg !148

20:                                               ; preds = %15
  store i64 9223372036854775807, ptr %9, align 16, !dbg !143
  %21 = getelementptr inbounds nuw i8, ptr %9, i64 8, !dbg !143
  store i64 0, ptr %21, align 8, !dbg !143
  br label %26, !dbg !143

22:                                               ; preds = %15
  %23 = load <2 x i64>, ptr %5, align 8, !dbg !150, !tbaa !64
  %24 = load i64, ptr %5, align 8, !dbg !150, !tbaa !64
  store <2 x i64> %23, ptr %9, align 16, !dbg !143
  %25 = icmp slt i64 %24, 1, !dbg !143
  br i1 %25, label %82, label %26, !dbg !143, !prof !65

26:                                               ; preds = %20, %22
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 40
  br label %28, !dbg !151

28:                                               ; preds = %26, %77
  %29 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !154, !srcloc !137
  %30 = load i32, ptr %27, align 8, !dbg !151, !tbaa !71
  %31 = icmp eq i32 %30, 0, !dbg !151
  %32 = select i1 %31, i32 100, i32 %30, !dbg !151
  %33 = zext i32 %32 to i64, !dbg !151
  %34 = icmp eq i64 %29, %10, !dbg !151
  br i1 %34, label %35, label %42, !dbg !151

35:                                               ; preds = %28, %35
  %36 = phi i64 [ %38, %35 ], [ 0, %28 ]
  call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !156, !srcloc !75
  %37 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !158, !srcloc !137
  %38 = add nuw nsw i64 %36, 1, !dbg !151
  %39 = icmp samesign ult i64 %38, %33, !dbg !151
  %40 = icmp eq i64 %37, %10, !dbg !151
  %41 = select i1 %39, i1 %40, i1 false, !dbg !151
  br i1 %41, label %35, label %42, !dbg !151, !llvm.loop !160

42:                                               ; preds = %35, %28
  %43 = phi i64 [ %29, %28 ], [ %37, %35 ], !dbg !151
  %44 = icmp eq i64 %43, %11, !dbg !161
  br i1 %44, label %56, label %45, !dbg !161, !prof !83

45:                                               ; preds = %42
  %46 = icmp eq i64 %43, %10, !dbg !161
  br i1 %46, label %47, label %55, !dbg !161

47:                                               ; preds = %45
  %48 = call { i8, i64 } asm sideeffect "lock cmpxchgq $3, $0;", "=*m,={@ccz},={ax},q,*m,2,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0, i64 range(i64 1, 0) %11, ptr elementtype(i64) %0, i64 range(i64 0, -1) %10) #5, !dbg !164, !srcloc !167
  %49 = extractvalue { i8, i64 } %48, 0, !dbg !164
  %50 = extractvalue { i8, i64 } %48, 1, !dbg !164
  %51 = icmp ult i8 %49, 2, !dbg !164
  call void @llvm.assume(i1 %51), !dbg !164
  %52 = trunc nuw i8 %49 to i1, !dbg !164
  %53 = icmp eq i64 %50, %11, !dbg !161
  %54 = select i1 %52, i1 true, i1 %53, !dbg !143
  br i1 %54, label %56, label %55, !dbg !143, !prof !88

55:                                               ; preds = %45, %47
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !168, !srcloc !46
  br label %82, !dbg !143

56:                                               ; preds = %42, %47
  %57 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !171, !srcloc !137
  %58 = load i32, ptr %27, align 8, !dbg !174, !tbaa !71
  %59 = icmp eq i32 %58, 0, !dbg !174
  %60 = select i1 %59, i32 100, i32 %58, !dbg !174
  %61 = zext i32 %60 to i64, !dbg !174
  %62 = icmp eq i64 %57, %11, !dbg !174
  br i1 %62, label %63, label %70, !dbg !174

63:                                               ; preds = %56, %63
  %64 = phi i64 [ %66, %63 ], [ 0, %56 ]
  call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !175, !srcloc !75
  %65 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !177, !srcloc !137
  %66 = add nuw nsw i64 %64, 1, !dbg !174
  %67 = icmp samesign ult i64 %66, %61, !dbg !174
  %68 = icmp eq i64 %65, %11, !dbg !174
  %69 = select i1 %67, i1 %68, i1 false, !dbg !174
  br i1 %69, label %63, label %70, !dbg !174, !llvm.loop !179

70:                                               ; preds = %63, %56
  %71 = phi i64 [ %57, %56 ], [ %65, %63 ], !dbg !174
  %72 = icmp eq i64 %71, %11, !dbg !143
  br i1 %72, label %74, label %73, !dbg !143, !prof !101

73:                                               ; preds = %70
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !180, !srcloc !46
  br label %82, !dbg !143

74:                                               ; preds = %70
  %75 = call fastcc i32 @exponential_backoff(ptr noundef %7, ptr noundef nonnull @ck_ec64_wait_slow_once, ptr noundef %8, ptr noundef %3, ptr noundef %9), !dbg !143
  %76 = icmp eq i32 %75, 0, !dbg !143
  br i1 %76, label %77, label %82, !dbg !143

77:                                               ; preds = %74
  %78 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #5, !dbg !183, !srcloc !137
  %79 = lshr i64 %78, 1, !dbg !186
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !187, !srcloc !46
  %80 = icmp eq i64 %79, %2, !dbg !143
  br i1 %80, label %28, label %81, !dbg !143

81:                                               ; preds = %77
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #5, !dbg !190, !srcloc !46
  br label %82, !dbg !143

82:                                               ; preds = %74, %81, %73, %55, %22
  %83 = phi i32 [ -1, %22 ], [ 0, %81 ], [ 0, %73 ], [ 0, %55 ], [ %75, %74 ], !dbg !143
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %9) #5, !dbg !143
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #5, !dbg !143
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %7) #5, !dbg !143
  br label %84

84:                                               ; preds = %6, %82
  %85 = phi i32 [ %83, %82 ], [ 0, %6 ], !dbg !193
  ret i32 %85, !dbg !194
}

; Function Attrs: nounwind uwtable
define range(i32 -1, 1) i32 @ck_ec_deadline_impl(ptr noundef writeonly captures(none) %0, ptr noundef %1, ptr noundef readonly captures(address_is_null) %2) local_unnamed_addr #0 !dbg !195 {
  %4 = alloca %struct.timespec, align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #5, !dbg !196
  %5 = icmp eq ptr %2, null, !dbg !197
  br i1 %5, label %32, label %6, !dbg !197

6:                                                ; preds = %3
  %7 = load ptr, ptr %1, align 8, !dbg !198, !tbaa !199
  %8 = call i32 %7(ptr noundef nonnull %1, ptr noundef nonnull %4) #5, !dbg !198
  %9 = icmp eq i32 %8, 0, !dbg !200
  br i1 %9, label %10, label %36, !dbg !200

10:                                               ; preds = %6
  %11 = load i64, ptr %4, align 8, !dbg !201
  %12 = getelementptr inbounds nuw i8, ptr %4, i64 8, !dbg !201
  %13 = load i64, ptr %12, align 8, !dbg !201
  %14 = load i64, ptr %2, align 8, !dbg !201
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 8, !dbg !201
  %16 = load i64, ptr %15, align 8, !dbg !201
  %17 = icmp slt i64 %14, 0, !dbg !202
  %18 = icmp ugt i64 %16, 999999999, !dbg !206
  %19 = select i1 %17, i1 true, i1 %18, !dbg !206
  br i1 %19, label %32, label %20, !dbg !206

20:                                               ; preds = %10
  %21 = sub nsw i64 9223372036854775807, %11, !dbg !207
  %22 = icmp samesign ugt i64 %14, %21, !dbg !208
  br i1 %22, label %32, label %23, !dbg !208

23:                                               ; preds = %20
  %24 = add nsw i64 %14, %11, !dbg !209
  %25 = add i64 %16, %13, !dbg !210
  %26 = icmp ugt i64 %25, 999999999, !dbg !211
  br i1 %26, label %27, label %32, !dbg !211

27:                                               ; preds = %23
  %28 = icmp eq i64 %24, 9223372036854775807, !dbg !212
  br i1 %28, label %32, label %29, !dbg !212

29:                                               ; preds = %27
  %30 = add nsw i64 %24, 1, !dbg !213
  %31 = add i64 %25, -1000000000, !dbg !214
  br label %32, !dbg !215

32:                                               ; preds = %29, %27, %23, %20, %10, %3
  %33 = phi i64 [ 9223372036854775807, %3 ], [ %11, %10 ], [ 9223372036854775807, %20 ], [ 9223372036854775807, %27 ], [ %30, %29 ], [ %24, %23 ]
  %34 = phi i64 [ 999999999, %3 ], [ %13, %10 ], [ 999999999, %20 ], [ 999999999, %27 ], [ %31, %29 ], [ %25, %23 ]
  store i64 %33, ptr %0, align 8, !dbg !216, !tbaa !64
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !216
  store i64 %34, ptr %35, align 8, !dbg !216, !tbaa !64
  br label %36, !dbg !217

36:                                               ; preds = %32, %6
  %37 = phi i32 [ -1, %6 ], [ 0, %32 ], !dbg !216
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #5, !dbg !217
  ret i32 %37, !dbg !217
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #3

; Function Attrs: nounwind uwtable
define internal fastcc i32 @exponential_backoff(ptr noundef nonnull %0, ptr noundef readonly captures(none) %1, ptr noundef nonnull %2, ptr noundef readonly captures(address_is_null) %3, ptr noundef nonnull readonly captures(none) %4) unnamed_addr #0 !dbg !218 {
  %6 = alloca %struct.timespec, align 8
  %7 = alloca %struct.timespec, align 8
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !219
  %9 = load ptr, ptr %8, align 8, !dbg !219, !tbaa !50
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 48, !dbg !220
  %11 = load i32, ptr %10, align 8, !dbg !220, !tbaa !221
  %12 = icmp eq i32 %11, 0, !dbg !222
  %13 = select i1 %12, i32 8, i32 %11, !dbg !223
  %14 = getelementptr inbounds nuw i8, ptr %9, i64 52, !dbg !224
  %15 = load i32, ptr %14, align 4, !dbg !224, !tbaa !225
  %16 = getelementptr inbounds nuw i8, ptr %9, i64 44, !dbg !226
  %17 = load i32, ptr %16, align 4, !dbg !226, !tbaa !227
  %18 = icmp eq i32 %17, 0, !dbg !228
  %19 = select i1 %18, i32 2000000, i32 %17, !dbg !229
  %20 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %21 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %22 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %24 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %25 = zext i32 %13 to i64
  %26 = zext i32 %15 to i64
  %27 = shl i64 4294967295, %26
  %28 = icmp eq ptr %3, null
  br label %29, !dbg !230

29:                                               ; preds = %137, %5
  %30 = phi i32 [ %19, %5 ], [ %131, %137 ], !dbg !231
  %31 = phi i1 [ true, %5 ], [ false, %137 ], !dbg !232
  %32 = phi i64 [ undef, %5 ], [ %130, %137 ]
  %33 = phi i64 [ undef, %5 ], [ %129, %137 ]
  %34 = phi i64 [ undef, %5 ], [ %128, %137 ]
  %35 = phi i64 [ undef, %5 ], [ %127, %137 ]
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %6) #5, !dbg !233
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %7) #5, !dbg !234
  %36 = load i64, ptr %4, align 8, !dbg !235
  %37 = load i64, ptr %20, align 8, !dbg !235
  %38 = load ptr, ptr %9, align 8, !dbg !236, !tbaa !199
  %39 = call i32 %38(ptr noundef nonnull %9, ptr noundef nonnull %6) #5, !dbg !236
  %40 = icmp eq i32 %39, 0, !dbg !239
  br i1 %40, label %41, label %135, !dbg !239

41:                                               ; preds = %29
  %42 = load i64, ptr %6, align 8, !dbg !240
  %43 = icmp eq i64 %42, %36, !dbg !241
  br i1 %43, label %48, label %44, !dbg !241

44:                                               ; preds = %41
  %45 = icmp slt i64 %42, %36, !dbg !244
  br i1 %45, label %46, label %135, !dbg !245

46:                                               ; preds = %44
  %47 = load i64, ptr %21, align 8, !dbg !246
  br label %51, !dbg !245

48:                                               ; preds = %41
  %49 = load i64, ptr %21, align 8, !dbg !240
  %50 = icmp slt i64 %49, %37
  br i1 %50, label %51, label %135, !dbg !247

51:                                               ; preds = %46, %48
  %52 = phi i64 [ %47, %46 ], [ %49, %48 ], !dbg !246
  br i1 %31, label %53, label %67, !dbg !248

53:                                               ; preds = %51
  store i64 %42, ptr %0, align 8, !dbg !249, !tbaa !64
  store i64 %52, ptr %22, align 8, !dbg !249, !tbaa !64
  %54 = icmp eq i64 %42, 9223372036854775807, !dbg !250
  br i1 %54, label %55, label %56, !dbg !250

55:                                               ; preds = %53
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %23, ptr noundef nonnull align 8 dereferenceable(16) %6, i64 16, i1 false), !dbg !252, !tbaa.struct !253
  br label %75, !dbg !254

56:                                               ; preds = %53
  %57 = add nsw i64 %42, 1, !dbg !256
  %58 = icmp ugt i64 %52, 999999999, !dbg !257
  br i1 %58, label %59, label %64, !dbg !257

59:                                               ; preds = %56
  %60 = icmp eq i64 %57, 9223372036854775807, !dbg !258
  br i1 %60, label %64, label %61, !dbg !258

61:                                               ; preds = %59
  %62 = add nsw i64 %42, 2, !dbg !259
  %63 = add i64 %52, -1000000000, !dbg !260
  br label %64, !dbg !261

64:                                               ; preds = %59, %61, %56
  %65 = phi i64 [ %57, %56 ], [ %62, %61 ], [ 9223372036854775807, %59 ]
  %66 = phi i64 [ %52, %56 ], [ %63, %61 ], [ 999999999, %59 ]
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %23, ptr noundef nonnull align 8 dereferenceable(16) %6, i64 16, i1 false), !dbg !252, !tbaa.struct !253
  br label %69, !dbg !254

67:                                               ; preds = %51
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %23, ptr noundef nonnull align 8 dereferenceable(16) %6, i64 16, i1 false), !dbg !252, !tbaa.struct !253
  %68 = icmp eq i64 %42, %32, !dbg !254
  br i1 %68, label %75, label %69, !dbg !254

69:                                               ; preds = %64, %67
  %70 = phi i64 [ %52, %64 ], [ %35, %67 ]
  %71 = phi i64 [ %42, %64 ], [ %34, %67 ]
  %72 = phi i64 [ %66, %64 ], [ %33, %67 ]
  %73 = phi i64 [ %65, %64 ], [ %32, %67 ]
  %74 = icmp slt i64 %42, %73, !dbg !262
  br i1 %74, label %81, label %91, !dbg !263

75:                                               ; preds = %55, %67
  %76 = phi i64 [ %52, %55 ], [ %35, %67 ]
  %77 = phi i64 [ 9223372036854775807, %55 ], [ %34, %67 ]
  %78 = phi i64 [ 999999999, %55 ], [ %33, %67 ]
  %79 = phi i64 [ 9223372036854775807, %55 ], [ %32, %67 ]
  %80 = icmp slt i64 %52, %78
  br i1 %80, label %81, label %91, !dbg !264

81:                                               ; preds = %75, %69
  %82 = phi i64 [ %76, %75 ], [ %70, %69 ]
  %83 = phi i64 [ %77, %75 ], [ %71, %69 ]
  %84 = phi i64 [ %78, %75 ], [ %72, %69 ]
  %85 = phi i64 [ %79, %75 ], [ %73, %69 ]
  %86 = trunc i64 %82 to i32
  %87 = icmp eq i64 %83, 9223372036854775807
  %88 = add nsw i64 %83, 1
  %89 = select i1 %87, i64 9223372036854775807, i64 %88
  %90 = select i1 %87, i64 999999999, i64 %82
  br label %96, !dbg !265

91:                                               ; preds = %69, %75
  %92 = phi i64 [ %70, %69 ], [ %76, %75 ]
  %93 = phi i64 [ %71, %69 ], [ %77, %75 ]
  %94 = phi i64 [ %72, %69 ], [ %78, %75 ]
  %95 = phi i64 [ %73, %69 ], [ %79, %75 ]
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %4, i64 16, i1 false), !dbg !266, !tbaa.struct !253
  br label %126, !dbg !267

96:                                               ; preds = %121, %81
  %97 = phi i32 [ %30, %81 ], [ %117, %121 ], !dbg !268
  %98 = icmp ugt i32 %97, 999999999, !dbg !269
  br i1 %98, label %109, label %99, !dbg !269

99:                                               ; preds = %96
  %100 = add i32 %97, %86, !dbg !272
  %101 = icmp ugt i32 %100, 999999999, !dbg !273
  br i1 %101, label %102, label %105, !dbg !273

102:                                              ; preds = %99
  br i1 %87, label %109, label %103, !dbg !274

103:                                              ; preds = %102
  %104 = add i32 %100, -1000000000, !dbg !275
  br label %105, !dbg !276

105:                                              ; preds = %103, %99
  %106 = phi i64 [ %88, %103 ], [ %83, %99 ], !dbg !277
  %107 = phi i32 [ %104, %103 ], [ %100, %99 ], !dbg !277
  %108 = zext i32 %107 to i64, !dbg !278
  br label %109, !dbg !279

109:                                              ; preds = %96, %102, %105
  %110 = phi i64 [ %106, %105 ], [ 9223372036854775807, %102 ], [ %89, %96 ], !dbg !277
  %111 = phi i64 [ %108, %105 ], [ 999999999, %102 ], [ %90, %96 ], !dbg !277
  %112 = zext i32 %97 to i64, !dbg !280
  %113 = mul nuw i64 %112, %25, !dbg !283
  %114 = icmp ult i64 %113, %27, !dbg !284
  %115 = lshr i64 %113, %26, !dbg !284
  %116 = trunc i64 %115 to i32, !dbg !284
  %117 = select i1 %114, i32 %116, i32 -1, !dbg !284
  %118 = icmp eq i64 %110, %42, !dbg !285
  br i1 %118, label %122, label %119, !dbg !285

119:                                              ; preds = %109
  %120 = icmp slt i64 %110, %42, !dbg !287
  br i1 %120, label %121, label %124, !dbg !288

121:                                              ; preds = %119, %122
  br label %96, !dbg !269, !llvm.loop !289

122:                                              ; preds = %109
  %123 = icmp sgt i64 %111, %52, !dbg !292
  br i1 %123, label %124, label %121, !dbg !292

124:                                              ; preds = %119, %122
  %125 = phi i64 [ %110, %119 ], [ %42, %122 ], !dbg !277
  store i64 %125, ptr %7, align 8, !dbg !293, !tbaa !64
  store i64 %111, ptr %24, align 8, !dbg !293, !tbaa !64
  br label %126, !dbg !294

126:                                              ; preds = %124, %91
  %127 = phi i64 [ %92, %91 ], [ %82, %124 ]
  %128 = phi i64 [ %93, %91 ], [ %83, %124 ]
  %129 = phi i64 [ %94, %91 ], [ %84, %124 ]
  %130 = phi i64 [ %95, %91 ], [ %85, %124 ]
  %131 = phi i32 [ %30, %91 ], [ %117, %124 ], !dbg !268
  br i1 %28, label %137, label %132, !dbg !294

132:                                              ; preds = %126
  %133 = call i32 %3(ptr noundef nonnull %0, ptr noundef nonnull %7) #5, !dbg !295
  %134 = icmp eq i32 %133, 0, !dbg !296
  br i1 %134, label %137, label %135

135:                                              ; preds = %132, %29, %44, %48
  %136 = phi i32 [ %133, %132 ], [ -1, %29 ], [ -1, %44 ], [ -1, %48 ]
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #5, !dbg !297
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %6) #5, !dbg !297
  br label %142

137:                                              ; preds = %126, %132
  %138 = load i64, ptr %7, align 8, !dbg !298, !tbaa !299
  %139 = icmp eq i64 %138, 9223372036854775807, !dbg !300
  %140 = select i1 %139, ptr null, ptr %7, !dbg !301
  %141 = call zeroext i1 %1(ptr noundef nonnull %2, ptr noundef nonnull %0, ptr noundef %140) #5, !dbg !302, !callees !303
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #5, !dbg !297
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %6) #5, !dbg !297
  br i1 %141, label %142, label %29

142:                                              ; preds = %137, %135
  %143 = phi i32 [ %136, %135 ], [ 0, %137 ]
  ret i32 %143, !dbg !304
}

; Function Attrs: nounwind uwtable
define internal zeroext i1 @ck_ec32_wait_slow_once(ptr noundef readonly captures(none) %0, ptr noundef %1, ptr noundef %2) #0 !dbg !305 {
  %4 = load ptr, ptr %0, align 8, !dbg !306, !tbaa !56
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !307
  %6 = load i32, ptr %5, align 8, !dbg !307, !tbaa !59
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !308
  %8 = load ptr, ptr %7, align 8, !dbg !308, !tbaa !50
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 8, !dbg !309
  %10 = load ptr, ptr %9, align 8, !dbg !310, !tbaa !311
  tail call void %10(ptr noundef %1, ptr noundef %4, i32 noundef %6, ptr noundef %2) #5, !dbg !310
  %11 = tail call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %4) #5, !dbg !312, !srcloc !37
  %12 = icmp ne i32 %11, %6, !dbg !314
  ret i1 %12, !dbg !315
}

; Function Attrs: nounwind uwtable
define internal zeroext i1 @ck_ec64_wait_slow_once(ptr noundef readonly captures(none) %0, ptr noundef %1, ptr noundef %2) #0 !dbg !316 {
  %4 = load ptr, ptr %0, align 8, !dbg !317, !tbaa !144
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !318
  %6 = load i64, ptr %5, align 8, !dbg !318, !tbaa !147
  %7 = tail call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %4) #5, !dbg !319, !srcloc !137
  %8 = icmp eq i64 %7, %6, !dbg !321
  br i1 %8, label %9, label %16, !dbg !321

9:                                                ; preds = %3
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !322
  %11 = load ptr, ptr %10, align 8, !dbg !322, !tbaa !50
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 16, !dbg !323
  %13 = load ptr, ptr %12, align 8, !dbg !324, !tbaa !325
  tail call void %13(ptr noundef %1, ptr noundef %4, i64 noundef %6, ptr noundef %2) #5, !dbg !324
  %14 = tail call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %4) #5, !dbg !326, !srcloc !137
  %15 = icmp ne i64 %14, %6, !dbg !328
  br label %16, !dbg !329

16:                                               ; preds = %3, %9
  %17 = phi i1 [ %15, %9 ], [ true, %3 ], !dbg !330
  ret i1 %17, !dbg !331
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/src/ck_ec.c", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "340690187bb34b743227e9b122fbbd50")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!8 = distinct !DISubprogram(name: "ck_ec32_wake", scope: !9, file: !9, line: 35, type: !10, scopeLine: 36, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!9 = !DIFile(filename: "src/ck_ec.c", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26", checksumkind: CSK_MD5, checksum: "340690187bb34b743227e9b122fbbd50")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 402, column: 1, scope: !13, inlinedAt: !15)
!13 = distinct !DISubprogram(name: "ck_pr_and_32", scope: !14, file: !14, line: 402, type: !10, scopeLine: 402, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!14 = !DIFile(filename: "../../../include/gcc/x86_64/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!15 = distinct !DILocation(line: 38, column: 2, scope: !8)
!16 = !{i64 2147840274}
!17 = !DILocation(line: 39, column: 7, scope: !8)
!18 = !DILocation(line: 39, column: 2, scope: !8)
!19 = !{!20, !21, i64 24}
!20 = !{!"ck_ec_ops", !21, i64 0, !21, i64 8, !21, i64 16, !21, i64 24, !21, i64 32, !24, i64 40, !24, i64 44, !24, i64 48, !24, i64 52}
!21 = !{!"any pointer", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C/C++ TBAA"}
!24 = !{!"int", !22, i64 0}
!25 = !DILocation(line: 40, column: 2, scope: !8)
!26 = distinct !DISubprogram(name: "ck_ec32_wait_slow", scope: !9, file: !9, line: 44, type: !10, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!27 = !DILocation(line: 49, column: 9, scope: !26)
!28 = !DILocation(line: 49, column: 2, scope: !26)
!29 = distinct !DISubprogram(name: "ck_ec32_wait_pred_slow", scope: !9, file: !9, line: 384, type: !10, scopeLine: 391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!30 = !DILocation(line: 393, column: 42, scope: !29)
!31 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !33)
!32 = distinct !DISubprogram(name: "ck_pr_md_load_32", scope: !14, file: !14, line: 196, type: !10, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!33 = distinct !DILocation(line: 610, column: 17, scope: !34, inlinedAt: !36)
!34 = distinct !DISubprogram(name: "ck_ec32_value", scope: !35, file: !35, line: 608, type: !10, scopeLine: 609, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!35 = !DIFile(filename: "../../../include/ck_ec.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "bae0e38c7e45f8cbf422b5e01099eee4")
!36 = distinct !DILocation(line: 395, column: 6, scope: !29)
!37 = !{i64 2147788638}
!38 = !DILocation(line: 610, column: 45, scope: !34, inlinedAt: !36)
!39 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !42)
!40 = distinct !DISubprogram(name: "ck_pr_barrier", scope: !41, file: !41, line: 37, type: !10, scopeLine: 38, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!41 = !DIFile(filename: "../../../include/gcc/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "29d90103f3cc9c1099664f6ceb38293f")
!42 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !45)
!43 = distinct !DISubprogram(name: "ck_pr_fence_acquire", scope: !44, file: !44, line: 159, type: !10, scopeLine: 159, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!44 = !DIFile(filename: "../../../include/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "a04525ce1c6aca0c6489b709b33f6356")
!45 = distinct !DILocation(line: 612, column: 2, scope: !34, inlinedAt: !36)
!46 = !{i64 395792}
!47 = !DILocation(line: 395, column: 6, scope: !29)
!48 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!49 = !DILocation(line: 399, column: 2, scope: !29)
!50 = !{!51, !54, i64 32}
!51 = !{!"ck_ec_wait_state", !52, i64 0, !52, i64 16, !54, i64 32, !21, i64 40}
!52 = !{!"timespec", !53, i64 0, !53, i64 8}
!53 = !{!"long", !22, i64 0}
!54 = !{!"p1 _ZTS9ck_ec_ops", !21, i64 0}
!55 = !{!51, !21, i64 40}
!56 = !{!57, !58, i64 0}
!57 = !{!"ck_ec32_slow_path_state", !58, i64 0, !24, i64 8}
!58 = !{!"p1 _ZTS7ck_ec32", !21, i64 0}
!59 = !{!57, !24, i64 8}
!60 = !DILocation(line: 106, column: 19, scope: !61, inlinedAt: !62)
!61 = distinct !DISubprogram(name: "canonical_deadline", scope: !9, file: !9, line: 103, type: !10, scopeLine: 104, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!62 = distinct !DILocation(line: 399, column: 2, scope: !29)
!63 = !DILocation(line: 110, column: 9, scope: !61, inlinedAt: !62)
!64 = !{!53, !53, i64 0}
!65 = !{!"branch_weights", !"expected", i32 -2147483648, i32 0}
!66 = !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !68)
!67 = distinct !DISubprogram(name: "ck_ec32_wait_easy", scope: !9, file: !9, line: 221, type: !10, scopeLine: 221, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!68 = distinct !DILocation(line: 399, column: 2, scope: !29)
!69 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !70)
!70 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !68)
!71 = !{!20, !24, i64 40}
!72 = !DILocation(line: 67, column: 2, scope: !73, inlinedAt: !74)
!73 = distinct !DISubprogram(name: "ck_pr_stall", scope: !14, file: !14, line: 65, type: !10, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!74 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !68)
!75 = !{i64 274977}
!76 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !77)
!77 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !68)
!78 = distinct !{!78, !66, !66, !79}
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 261, column: 1, scope: !81, inlinedAt: !82)
!81 = distinct !DISubprogram(name: "ck_ec32_upgrade", scope: !9, file: !9, line: 261, type: !10, scopeLine: 261, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!82 = distinct !DILocation(line: 399, column: 2, scope: !29)
!83 = !{!"branch_weights", i32 1073205, i32 2146410443}
!84 = !DILocation(line: 484, column: 1, scope: !85, inlinedAt: !86)
!85 = distinct !DISubprogram(name: "ck_pr_cas_32_value", scope: !14, file: !14, line: 484, type: !10, scopeLine: 484, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!86 = distinct !DILocation(line: 261, column: 1, scope: !81, inlinedAt: !82)
!87 = !{i64 2147856669}
!88 = !{!"branch_weights", !"expected", i32 0, i32 -2147483648}
!89 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !90)
!90 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !91)
!91 = distinct !DILocation(line: 399, column: 2, scope: !29)
!92 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !93)
!93 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !94)
!94 = distinct !DILocation(line: 399, column: 2, scope: !29)
!95 = !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !94)
!96 = !DILocation(line: 67, column: 2, scope: !73, inlinedAt: !97)
!97 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !94)
!98 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !99)
!99 = distinct !DILocation(line: 221, column: 1, scope: !67, inlinedAt: !94)
!100 = distinct !{!100, !95, !95, !79}
!101 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!102 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !103)
!103 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !104)
!104 = distinct !DILocation(line: 399, column: 2, scope: !29)
!105 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !106)
!106 = distinct !DILocation(line: 610, column: 17, scope: !34, inlinedAt: !107)
!107 = distinct !DILocation(line: 399, column: 2, scope: !29)
!108 = !DILocation(line: 610, column: 45, scope: !34, inlinedAt: !107)
!109 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !110)
!110 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !111)
!111 = distinct !DILocation(line: 612, column: 2, scope: !34, inlinedAt: !107)
!112 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !113)
!113 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !114)
!114 = distinct !DILocation(line: 399, column: 2, scope: !29)
!115 = !DILocation(line: 0, scope: !29)
!116 = !DILocation(line: 401, column: 1, scope: !29)
!117 = distinct !DISubprogram(name: "ck_ec64_wake", scope: !9, file: !9, line: 55, type: !10, scopeLine: 56, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!118 = !DILocation(line: 402, column: 1, scope: !119, inlinedAt: !120)
!119 = distinct !DISubprogram(name: "ck_pr_and_64", scope: !14, file: !14, line: 402, type: !10, scopeLine: 402, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!120 = distinct !DILocation(line: 57, column: 2, scope: !117)
!121 = !{i64 2147839839}
!122 = !DILocation(line: 58, column: 7, scope: !117)
!123 = !DILocation(line: 58, column: 2, scope: !117)
!124 = !{!20, !21, i64 32}
!125 = !DILocation(line: 59, column: 2, scope: !117)
!126 = distinct !DISubprogram(name: "ck_ec64_wait_slow", scope: !9, file: !9, line: 63, type: !10, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!127 = !DILocation(line: 68, column: 9, scope: !126)
!128 = !DILocation(line: 68, column: 2, scope: !126)
!129 = distinct !DISubprogram(name: "ck_ec64_wait_pred_slow", scope: !9, file: !9, line: 405, type: !10, scopeLine: 412, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!130 = !DILocation(line: 413, column: 44, scope: !129)
!131 = !DILocation(line: 414, column: 47, scope: !129)
!132 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !134)
!133 = distinct !DISubprogram(name: "ck_pr_md_load_64", scope: !14, file: !14, line: 195, type: !10, scopeLine: 195, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!134 = distinct !DILocation(line: 814, column: 17, scope: !135, inlinedAt: !136)
!135 = distinct !DISubprogram(name: "ck_ec64_value", scope: !35, file: !35, line: 812, type: !10, scopeLine: 813, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!136 = distinct !DILocation(line: 416, column: 6, scope: !129)
!137 = !{i64 2147788229}
!138 = !DILocation(line: 814, column: 45, scope: !135, inlinedAt: !136)
!139 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !140)
!140 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !141)
!141 = distinct !DILocation(line: 816, column: 2, scope: !135, inlinedAt: !136)
!142 = !DILocation(line: 416, column: 6, scope: !129)
!143 = !DILocation(line: 420, column: 2, scope: !129)
!144 = !{!145, !146, i64 0}
!145 = !{!"ck_ec64_slow_path_state", !146, i64 0, !53, i64 8}
!146 = !{!"p1 _ZTS7ck_ec64", !21, i64 0}
!147 = !{!145, !53, i64 8}
!148 = !DILocation(line: 106, column: 19, scope: !61, inlinedAt: !149)
!149 = distinct !DILocation(line: 420, column: 2, scope: !129)
!150 = !DILocation(line: 110, column: 9, scope: !61, inlinedAt: !149)
!151 = !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !153)
!152 = distinct !DISubprogram(name: "ck_ec64_wait_easy", scope: !9, file: !9, line: 223, type: !10, scopeLine: 223, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!153 = distinct !DILocation(line: 420, column: 2, scope: !129)
!154 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !155)
!155 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !153)
!156 = !DILocation(line: 67, column: 2, scope: !73, inlinedAt: !157)
!157 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !153)
!158 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !159)
!159 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !153)
!160 = distinct !{!160, !151, !151, !79}
!161 = !DILocation(line: 263, column: 1, scope: !162, inlinedAt: !163)
!162 = distinct !DISubprogram(name: "ck_ec64_upgrade", scope: !9, file: !9, line: 263, type: !10, scopeLine: 263, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!163 = distinct !DILocation(line: 420, column: 2, scope: !129)
!164 = !DILocation(line: 483, column: 1, scope: !165, inlinedAt: !166)
!165 = distinct !DISubprogram(name: "ck_pr_cas_64_value", scope: !14, file: !14, line: 483, type: !10, scopeLine: 483, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!166 = distinct !DILocation(line: 263, column: 1, scope: !162, inlinedAt: !163)
!167 = !{i64 2147855549}
!168 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !169)
!169 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !170)
!170 = distinct !DILocation(line: 420, column: 2, scope: !129)
!171 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !172)
!172 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !173)
!173 = distinct !DILocation(line: 420, column: 2, scope: !129)
!174 = !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !173)
!175 = !DILocation(line: 67, column: 2, scope: !73, inlinedAt: !176)
!176 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !173)
!177 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !178)
!178 = distinct !DILocation(line: 223, column: 1, scope: !152, inlinedAt: !173)
!179 = distinct !{!179, !174, !174, !79}
!180 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !181)
!181 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !182)
!182 = distinct !DILocation(line: 420, column: 2, scope: !129)
!183 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !184)
!184 = distinct !DILocation(line: 814, column: 17, scope: !135, inlinedAt: !185)
!185 = distinct !DILocation(line: 420, column: 2, scope: !129)
!186 = !DILocation(line: 814, column: 45, scope: !135, inlinedAt: !185)
!187 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !188)
!188 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !189)
!189 = distinct !DILocation(line: 816, column: 2, scope: !135, inlinedAt: !185)
!190 = !DILocation(line: 40, column: 2, scope: !40, inlinedAt: !191)
!191 = distinct !DILocation(line: 159, column: 1, scope: !43, inlinedAt: !192)
!192 = distinct !DILocation(line: 420, column: 2, scope: !129)
!193 = !DILocation(line: 0, scope: !129)
!194 = !DILocation(line: 422, column: 1, scope: !129)
!195 = distinct !DISubprogram(name: "ck_ec_deadline_impl", scope: !9, file: !9, line: 74, type: !10, scopeLine: 77, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!196 = !DILocation(line: 78, column: 2, scope: !195)
!197 = !DILocation(line: 81, column: 14, scope: !195)
!198 = !DILocation(line: 87, column: 6, scope: !195)
!199 = !{!20, !21, i64 0}
!200 = !DILocation(line: 88, column: 8, scope: !195)
!201 = !DILocation(line: 92, column: 18, scope: !195)
!202 = !DILocation(line: 90, column: 17, scope: !203, inlinedAt: !205)
!203 = distinct !DISubprogram(name: "timespec_add", scope: !204, file: !204, line: 78, type: !10, scopeLine: 80, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!204 = !DIFile(filename: "src/ck_ec_timeutil.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26", checksumkind: CSK_MD5, checksum: "f3315c86cd31fa70ba025fca921e1579")
!205 = distinct !DILocation(line: 92, column: 18, scope: !195)
!206 = !DILocation(line: 90, column: 21, scope: !203, inlinedAt: !205)
!207 = !DILocation(line: 95, column: 28, scope: !203, inlinedAt: !205)
!208 = !DILocation(line: 95, column: 17, scope: !203, inlinedAt: !205)
!209 = !DILocation(line: 99, column: 18, scope: !203, inlinedAt: !205)
!210 = !DILocation(line: 101, column: 35, scope: !203, inlinedAt: !205)
!211 = !DILocation(line: 103, column: 11, scope: !203, inlinedAt: !205)
!212 = !DILocation(line: 104, column: 11, scope: !203, inlinedAt: !205)
!213 = !DILocation(line: 108, column: 6, scope: !203, inlinedAt: !205)
!214 = !DILocation(line: 109, column: 8, scope: !203, inlinedAt: !205)
!215 = !DILocation(line: 110, column: 2, scope: !203, inlinedAt: !205)
!216 = !DILocation(line: 0, scope: !195)
!217 = !DILocation(line: 94, column: 1, scope: !195)
!218 = distinct !DISubprogram(name: "exponential_backoff", scope: !9, file: !9, line: 126, type: !10, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!219 = !DILocation(line: 137, column: 44, scope: !218)
!220 = !DILocation(line: 138, column: 38, scope: !218)
!221 = !{!20, !24, i64 48}
!222 = !DILocation(line: 138, column: 56, scope: !218)
!223 = !DILocation(line: 138, column: 32, scope: !218)
!224 = !DILocation(line: 141, column: 37, scope: !218)
!225 = !{!20, !24, i64 52}
!226 = !DILocation(line: 144, column: 27, scope: !218)
!227 = !{!20, !24, i64 44}
!228 = !DILocation(line: 144, column: 43, scope: !218)
!229 = !DILocation(line: 144, column: 21, scope: !218)
!230 = !DILocation(line: 149, column: 2, scope: !218)
!231 = !DILocation(line: 144, column: 11, scope: !218)
!232 = !DILocation(line: 147, column: 7, scope: !218)
!233 = !DILocation(line: 150, column: 3, scope: !218)
!234 = !DILocation(line: 151, column: 3, scope: !218)
!235 = !DILocation(line: 153, column: 7, scope: !218)
!236 = !DILocation(line: 143, column: 6, scope: !237, inlinedAt: !238)
!237 = distinct !DISubprogram(name: "check_deadline", scope: !204, file: !204, line: 137, type: !10, scopeLine: 140, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!238 = distinct !DILocation(line: 153, column: 7, scope: !218)
!239 = !DILocation(line: 144, column: 8, scope: !237, inlinedAt: !238)
!240 = !DILocation(line: 148, column: 9, scope: !237, inlinedAt: !238)
!241 = !DILocation(line: 121, column: 15, scope: !242, inlinedAt: !243)
!242 = distinct !DISubprogram(name: "timespec_cmp", scope: !204, file: !204, line: 118, type: !10, scopeLine: 120, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!243 = distinct !DILocation(line: 148, column: 9, scope: !237, inlinedAt: !238)
!244 = !DILocation(line: 122, column: 20, scope: !242, inlinedAt: !243)
!245 = !DILocation(line: 122, scope: !242, inlinedAt: !243)
!246 = !DILocation(line: 166, column: 7, scope: !218)
!247 = !DILocation(line: 125, column: 16, scope: !242, inlinedAt: !243)
!248 = !DILocation(line: 158, column: 7, scope: !218)
!249 = !DILocation(line: 160, column: 24, scope: !218)
!250 = !DILocation(line: 95, column: 17, scope: !203, inlinedAt: !251)
!251 = distinct !DILocation(line: 161, column: 19, scope: !218)
!252 = !DILocation(line: 165, column: 21, scope: !218)
!253 = !{i64 0, i64 8, !64, i64 8, i64 8, !64}
!254 = !DILocation(line: 121, column: 15, scope: !242, inlinedAt: !255)
!255 = distinct !DILocation(line: 166, column: 7, scope: !218)
!256 = !DILocation(line: 99, column: 18, scope: !203, inlinedAt: !251)
!257 = !DILocation(line: 103, column: 11, scope: !203, inlinedAt: !251)
!258 = !DILocation(line: 104, column: 11, scope: !203, inlinedAt: !251)
!259 = !DILocation(line: 108, column: 6, scope: !203, inlinedAt: !251)
!260 = !DILocation(line: 109, column: 8, scope: !203, inlinedAt: !251)
!261 = !DILocation(line: 110, column: 2, scope: !203, inlinedAt: !251)
!262 = !DILocation(line: 122, column: 20, scope: !242, inlinedAt: !255)
!263 = !DILocation(line: 122, scope: !242, inlinedAt: !255)
!264 = !DILocation(line: 125, column: 16, scope: !242, inlinedAt: !255)
!265 = !DILocation(line: 166, column: 39, scope: !218)
!266 = !DILocation(line: 167, column: 23, scope: !218)
!267 = !DILocation(line: 168, column: 3, scope: !218)
!268 = !DILocation(line: 0, scope: !218)
!269 = !DILocation(line: 47, column: 9, scope: !270, inlinedAt: !271)
!270 = distinct !DISubprogram(name: "timespec_add_ns", scope: !204, file: !204, line: 37, type: !10, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!271 = distinct !DILocation(line: 171, column: 9, scope: !218)
!272 = !DILocation(line: 58, column: 11, scope: !270, inlinedAt: !271)
!273 = !DILocation(line: 59, column: 13, scope: !270, inlinedAt: !271)
!274 = !DILocation(line: 60, column: 11, scope: !270, inlinedAt: !271)
!275 = !DILocation(line: 65, column: 10, scope: !270, inlinedAt: !271)
!276 = !DILocation(line: 66, column: 2, scope: !270, inlinedAt: !271)
!277 = !DILocation(line: 0, scope: !270, inlinedAt: !271)
!278 = !DILocation(line: 69, column: 16, scope: !270, inlinedAt: !271)
!279 = !DILocation(line: 70, column: 2, scope: !270, inlinedAt: !271)
!280 = !DILocation(line: 21, column: 18, scope: !281, inlinedAt: !282)
!281 = distinct !DISubprogram(name: "wait_time_scale", scope: !204, file: !204, line: 17, type: !10, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!282 = distinct !DILocation(line: 173, column: 9, scope: !218)
!283 = !DILocation(line: 21, column: 33, scope: !281, inlinedAt: !282)
!284 = !DILocation(line: 24, column: 11, scope: !281, inlinedAt: !282)
!285 = !DILocation(line: 121, column: 15, scope: !242, inlinedAt: !286)
!286 = distinct !DILocation(line: 176, column: 13, scope: !218)
!287 = !DILocation(line: 122, column: 20, scope: !242, inlinedAt: !286)
!288 = !DILocation(line: 122, scope: !242, inlinedAt: !286)
!289 = distinct !{!289, !290, !291, !79}
!290 = !DILocation(line: 169, column: 4, scope: !218)
!291 = !DILocation(line: 176, column: 53, scope: !218)
!292 = !DILocation(line: 125, column: 16, scope: !242, inlinedAt: !286)
!293 = !DILocation(line: 171, column: 9, scope: !218)
!294 = !DILocation(line: 179, column: 12, scope: !218)
!295 = !DILocation(line: 180, column: 12, scope: !218)
!296 = !DILocation(line: 181, column: 10, scope: !218)
!297 = !DILocation(line: 192, column: 2, scope: !218)
!298 = !DILocation(line: 188, column: 25, scope: !218)
!299 = !{!52, !53, i64 0}
!300 = !DILocation(line: 188, column: 32, scope: !218)
!301 = !DILocation(line: 188, column: 7, scope: !218)
!302 = !DILocation(line: 187, column: 7, scope: !218)
!303 = !{ptr @ck_ec32_wait_slow_once, ptr @ck_ec64_wait_slow_once}
!304 = !DILocation(line: 193, column: 1, scope: !218)
!305 = distinct !DISubprogram(name: "ck_ec32_wait_slow_once", scope: !9, file: !9, line: 273, type: !10, scopeLine: 276, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!306 = !DILocation(line: 278, column: 36, scope: !305)
!307 = !DILocation(line: 279, column: 39, scope: !305)
!308 = !DILocation(line: 281, column: 14, scope: !305)
!309 = !DILocation(line: 281, column: 19, scope: !305)
!310 = !DILocation(line: 281, column: 2, scope: !305)
!311 = !{!20, !21, i64 8}
!312 = !DILocation(line: 196, column: 1, scope: !32, inlinedAt: !313)
!313 = distinct !DILocation(line: 283, column: 9, scope: !305)
!314 = !DILocation(line: 283, column: 37, scope: !305)
!315 = !DILocation(line: 283, column: 2, scope: !305)
!316 = distinct !DISubprogram(name: "ck_ec64_wait_slow_once", scope: !9, file: !9, line: 288, type: !10, scopeLine: 291, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!317 = !DILocation(line: 293, column: 36, scope: !316)
!318 = !DILocation(line: 294, column: 39, scope: !316)
!319 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !320)
!320 = distinct !DILocation(line: 300, column: 6, scope: !316)
!321 = !DILocation(line: 300, column: 34, scope: !316)
!322 = !DILocation(line: 304, column: 14, scope: !316)
!323 = !DILocation(line: 304, column: 19, scope: !316)
!324 = !DILocation(line: 304, column: 2, scope: !316)
!325 = !{!20, !21, i64 16}
!326 = !DILocation(line: 195, column: 1, scope: !133, inlinedAt: !327)
!327 = distinct !DILocation(line: 306, column: 9, scope: !316)
!328 = !DILocation(line: 306, column: 37, scope: !316)
!329 = !DILocation(line: 306, column: 2, scope: !316)
!330 = !DILocation(line: 0, scope: !316)
!331 = !DILocation(line: 307, column: 1, scope: !316)
