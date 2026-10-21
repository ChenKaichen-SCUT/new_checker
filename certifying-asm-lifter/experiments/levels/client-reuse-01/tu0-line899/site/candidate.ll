; ModuleID = '/mnt/e/5 面向并发验证的可验证 asm 转换/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate/ck_ec_smoke_test.c'
source_filename = "/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate/ck_ec_smoke_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ck_ec_ops = type { ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32 }
%struct.timespec = type { i64, i64 }
%struct.ck_ec64 = type { i64 }
%struct.ck_ec32 = type { i32 }

@.str.7 = private unnamed_addr constant [22 x i8] c"ck_ec_value(&ec) == 0\00", align 1
@.str.8 = private unnamed_addr constant [170 x i8] c"/mnt/e/5 \E9\9D\A2\E5\90\91\E5\B9\B6\E5\8F\91\E9\AA\8C\E8\AF\81\E7\9A\84\E5\8F\AF\E9\AA\8C\E8\AF\81 asm \E8\BD\AC\E6\8D\A2/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate/ck_ec_smoke_test.c\00", align 1
@__PRETTY_FUNCTION__.test_update_counter_32 = private unnamed_addr constant [55 x i8] c"void test_update_counter_32(const struct ck_ec_mode *)\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"ck_ec_value(&ec) == 1\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"old == 1\00", align 1
@.str.11 = private unnamed_addr constant [23 x i8] c"ck_ec_value(&ec) == 43\00", align 1
@test_ops = internal constant %struct.ck_ec_ops { ptr @gettime, ptr @wait32, ptr @wait64, ptr @wake32, ptr @wake64, i32 0, i32 0, i32 0, i32 0 }, align 8
@sp = internal constant { ptr, i8, [7 x i8] } { ptr @test_ops, i8 1, [7 x i8] zeroinitializer }, align 8
@.str.13 = private unnamed_addr constant [17 x i8] c"ops == &test_ops\00", align 1
@__PRETTY_FUNCTION__.gettime = private unnamed_addr constant [57 x i8] c"int gettime(const struct ck_ec_ops *, struct timespec *)\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"state->ops == &test_ops\00", align 1
@__PRETTY_FUNCTION__.wait32 = private unnamed_addr constant [98 x i8] c"void wait32(const struct ck_ec_wait_state *, const uint32_t *, uint32_t, const struct timespec *)\00", align 1
@__PRETTY_FUNCTION__.wait64 = private unnamed_addr constant [98 x i8] c"void wait64(const struct ck_ec_wait_state *, const uint64_t *, uint64_t, const struct timespec *)\00", align 1
@__PRETTY_FUNCTION__.wake32 = private unnamed_addr constant [56 x i8] c"void wake32(const struct ck_ec_ops *, const uint32_t *)\00", align 1
@__PRETTY_FUNCTION__.wake64 = private unnamed_addr constant [56 x i8] c"void wake64(const struct ck_ec_ops *, const uint64_t *)\00", align 1
@__PRETTY_FUNCTION__.test_update_counter_64 = private unnamed_addr constant [55 x i8] c"void test_update_counter_64(const struct ck_ec_mode *)\00", align 1
@mp = internal constant { ptr, i8, [7 x i8] } { ptr @test_ops, i8 0, [7 x i8] zeroinitializer }, align 8
@.str.16 = private unnamed_addr constant [42 x i8] c"ck_ec_deadline(&deadline, &sp, NULL) == 0\00", align 1
@__PRETTY_FUNCTION__.test_deadline = private unnamed_addr constant [25 x i8] c"void test_deadline(void)\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"deadline.tv_sec == TIME_MAX\00", align 1
@__const.test_deadline.timeout = private unnamed_addr constant %struct.timespec { i64 1, i64 1000 }, align 8
@.str.18 = private unnamed_addr constant [46 x i8] c"ck_ec_deadline(&deadline, &sp, &timeout) == 0\00", align 1
@.str.19 = private unnamed_addr constant [44 x i8] c"ck_ec_deadline(&now, &sp, &no_timeout) == 0\00", align 1
@.str.20 = private unnamed_addr constant [23 x i8] c"now_sec < deadline_sec\00", align 1
@.str.21 = private unnamed_addr constant [38 x i8] c"deadline_sec <= now_sec + 1 + 1000e-9\00", align 1
@__const.test_deadline.timeout.22 = private unnamed_addr constant %struct.timespec { i64 9223372036854775806, i64 1000 }, align 8
@__PRETTY_FUNCTION__.test_wait_32 = private unnamed_addr constant [24 x i8] c"void test_wait_32(void)\00", align 1
@.str.23 = private unnamed_addr constant [35 x i8] c"ck_ec_wait(&ec, &sp, 2, NULL) == 0\00", align 1
@.str.24 = private unnamed_addr constant [41 x i8] c"ck_ec_wait(&ec, &sp, 1, &deadline) == -1\00", align 1
@.str.25 = private unnamed_addr constant [23 x i8] c"ck_ec_has_waiters(&ec)\00", align 1
@__PRETTY_FUNCTION__.test_wait_64 = private unnamed_addr constant [24 x i8] c"void test_wait_64(void)\00", align 1
@.str.26 = private unnamed_addr constant [35 x i8] c"ck_ec_wait(&ec, &sp, 1, NULL) == 0\00", align 1
@.str.27 = private unnamed_addr constant [41 x i8] c"ck_ec_wait(&ec, &sp, 0, &deadline) == -1\00", align 1
@__const.test_wait_64.timeout = private unnamed_addr constant %struct.timespec { i64 0, i64 1 }, align 8
@.str.28 = private unnamed_addr constant [24 x i8] c"!ck_ec_has_waiters(&ec)\00", align 1
@__PRETTY_FUNCTION__.test_wait_pred_32 = private unnamed_addr constant [29 x i8] c"void test_wait_pred_32(void)\00", align 1
@.str.29 = private unnamed_addr constant [54 x i8] c"ck_ec_wait_pred(&ec, &sp, 0, pred, &count, NULL) == 4\00", align 1
@.str.30 = private unnamed_addr constant [11 x i8] c"count == 5\00", align 1
@.str.31 = private unnamed_addr constant [15 x i8] c"pred wait: %f\0A\00", align 1
@__const.test_wait_pred_64.timeout = private unnamed_addr constant %struct.timespec { i64 5, i64 0 }, align 8
@__PRETTY_FUNCTION__.test_wait_pred_64 = private unnamed_addr constant [29 x i8] c"void test_wait_pred_64(void)\00", align 1
@.str.32 = private unnamed_addr constant [61 x i8] c"ck_ec_wait_pred(&ec, &sp, 0, pred2, &count, &deadline) == -1\00", align 1
@.str.33 = private unnamed_addr constant [16 x i8] c"pred2 wait: %f\0A\00", align 1
@woken = internal global i32 0, align 4
@.str.34 = private unnamed_addr constant [28 x i8] c"ck_pr_load_int(&woken) == 0\00", align 1
@__PRETTY_FUNCTION__.test_threaded_inc_32 = private unnamed_addr constant [53 x i8] c"void test_threaded_inc_32(const struct ck_ec_mode *)\00", align 1
@.str.35 = private unnamed_addr constant [28 x i8] c"ck_pr_load_int(&woken) == 1\00", align 1
@__PRETTY_FUNCTION__.test_threaded_add_32 = private unnamed_addr constant [53 x i8] c"void test_threaded_add_32(const struct ck_ec_mode *)\00", align 1
@__PRETTY_FUNCTION__.test_threaded_inc_64 = private unnamed_addr constant [53 x i8] c"void test_threaded_inc_64(const struct ck_ec_mode *)\00", align 1
@__PRETTY_FUNCTION__.test_threaded_add_64 = private unnamed_addr constant [53 x i8] c"void test_threaded_add_64(const struct ck_ec_mode *)\00", align 1
@str = private unnamed_addr constant [31 x i8] c"test_update_counter SP passed.\00", align 1
@str.36 = private unnamed_addr constant [31 x i8] c"test_update_counter MP passed.\00", align 1
@str.37 = private unnamed_addr constant [22 x i8] c"test_deadline passed.\00", align 1
@str.38 = private unnamed_addr constant [18 x i8] c"test_wait passed.\00", align 1
@str.39 = private unnamed_addr constant [23 x i8] c"test_wait_pred passed.\00", align 1
@str.40 = private unnamed_addr constant [25 x i8] c"test_threaded SP passed.\00", align 1
@str.41 = private unnamed_addr constant [25 x i8] c"test_threaded MP passed.\00", align 1

; Function Attrs: nounwind uwtable
define noundef i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 !dbg !8 {
  %3 = alloca %struct.timespec, align 8
  %4 = alloca %struct.timespec, align 8
  %5 = alloca %struct.ck_ec64, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ck_ec32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.timespec, align 8
  %10 = alloca %struct.ck_ec64, align 8
  %11 = alloca %struct.timespec, align 8
  %12 = alloca %struct.timespec, align 8
  %13 = alloca %struct.ck_ec32, align 4
  %14 = alloca %struct.timespec, align 8
  %15 = alloca %struct.timespec, align 8
  %16 = alloca %struct.timespec, align 8
  %17 = alloca %struct.timespec, align 8
  %18 = alloca %struct.timespec, align 8
  %19 = alloca %struct.timespec, align 8
  tail call fastcc void @test_update_counter_32(ptr noundef nonnull @sp), !dbg !12
  tail call fastcc void @test_update_counter_64(ptr noundef nonnull @sp), !dbg !13
  %20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !14
  tail call fastcc void @test_update_counter_32(ptr noundef nonnull @mp), !dbg !15
  tail call fastcc void @test_update_counter_64(ptr noundef nonnull @mp), !dbg !16
  %21 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.36), !dbg !17
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %15) #11, !dbg !18
  %22 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %15, ptr noundef nonnull @test_ops, ptr noundef null) #11, !dbg !21
  %23 = icmp eq i32 %22, 0, !dbg !25
  br i1 %23, label %25, label %24, !dbg !25

24:                                               ; preds = %2
  call void @__assert_fail(ptr noundef nonnull @.str.16, ptr noundef nonnull @.str.8, i32 noundef 151, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !25
  unreachable, !dbg !25

25:                                               ; preds = %2
  %26 = load i64, ptr %15, align 8, !dbg !26, !tbaa !27
  %27 = icmp eq i64 %26, 9223372036854775807, !dbg !26
  br i1 %27, label %29, label %28, !dbg !26

28:                                               ; preds = %25
  call void @__assert_fail(ptr noundef nonnull @.str.17, ptr noundef nonnull @.str.8, i32 noundef 152, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !26
  unreachable, !dbg !26

29:                                               ; preds = %25
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %16) #11, !dbg !32
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull align 8 dereferenceable(16) @__const.test_deadline.timeout, i64 16, i1 false), !dbg !33
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17) #11, !dbg !34
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %17, i8 0, i64 16, i1 false), !dbg !35
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18) #11, !dbg !36
  %30 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %15, ptr noundef nonnull @test_ops, ptr noundef nonnull %16) #11, !dbg !37
  %31 = icmp eq i32 %30, 0, !dbg !39
  br i1 %31, label %33, label %32, !dbg !39

32:                                               ; preds = %29
  call void @__assert_fail(ptr noundef nonnull @.str.18, ptr noundef nonnull @.str.8, i32 noundef 164, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !39
  unreachable, !dbg !39

33:                                               ; preds = %29
  %34 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %18, ptr noundef nonnull @test_ops, ptr noundef nonnull %17) #11, !dbg !40
  %35 = icmp eq i32 %34, 0, !dbg !42
  br i1 %35, label %37, label %36, !dbg !42

36:                                               ; preds = %33
  call void @__assert_fail(ptr noundef nonnull @.str.19, ptr noundef nonnull @.str.8, i32 noundef 165, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !42
  unreachable, !dbg !42

37:                                               ; preds = %33
  %38 = load i64, ptr %18, align 8, !dbg !43, !tbaa !27
  %39 = sitofp i64 %38 to double, !dbg !44
  %40 = getelementptr inbounds nuw i8, ptr %18, i64 8, !dbg !45
  %41 = load i64, ptr %40, align 8, !dbg !45, !tbaa !46
  %42 = sitofp i64 %41 to double, !dbg !47
  %43 = call double @llvm.fmuladd.f64(double %42, double 1.000000e-09, double %39), !dbg !48
  %44 = load i64, ptr %15, align 8, !dbg !49, !tbaa !27
  %45 = sitofp i64 %44 to double, !dbg !50
  %46 = getelementptr inbounds nuw i8, ptr %15, i64 8, !dbg !51
  %47 = load i64, ptr %46, align 8, !dbg !51, !tbaa !46
  %48 = sitofp i64 %47 to double, !dbg !52
  %49 = call double @llvm.fmuladd.f64(double %48, double 1.000000e-09, double %45), !dbg !53
  %50 = fcmp olt double %43, %49, !dbg !54
  br i1 %50, label %52, label %51, !dbg !54

51:                                               ; preds = %37
  call void @__assert_fail(ptr noundef nonnull @.str.20, ptr noundef nonnull @.str.8, i32 noundef 169, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !54
  unreachable, !dbg !54

52:                                               ; preds = %37
  %53 = fadd double %43, 1.000000e+00, !dbg !55
  %54 = fadd double %53, 0x3EB0C6F7A0B5ED8D, !dbg !55
  %55 = fcmp ugt double %49, %54, !dbg !55
  br i1 %55, label %56, label %57, !dbg !55

56:                                               ; preds = %52
  call void @__assert_fail(ptr noundef nonnull @.str.21, ptr noundef nonnull @.str.8, i32 noundef 170, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !55
  unreachable, !dbg !55

57:                                               ; preds = %52
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18) #11, !dbg !56
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17) #11, !dbg !56
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %16) #11, !dbg !56
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19) #11, !dbg !57
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %19, ptr noundef nonnull align 8 dereferenceable(16) @__const.test_deadline.timeout.22, i64 16, i1 false), !dbg !58
  %58 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %15, ptr noundef nonnull @test_ops, ptr noundef nonnull %19) #11, !dbg !59
  %59 = icmp eq i32 %58, 0, !dbg !61
  br i1 %59, label %61, label %60, !dbg !61

60:                                               ; preds = %57
  call void @__assert_fail(ptr noundef nonnull @.str.18, ptr noundef nonnull @.str.8, i32 noundef 179, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !61
  unreachable, !dbg !61

61:                                               ; preds = %57
  %62 = load i64, ptr %15, align 8, !dbg !62, !tbaa !27
  %63 = icmp eq i64 %62, 9223372036854775807, !dbg !62
  br i1 %63, label %65, label %64, !dbg !62

64:                                               ; preds = %61
  call void @__assert_fail(ptr noundef nonnull @.str.17, ptr noundef nonnull @.str.8, i32 noundef 180, ptr noundef nonnull @__PRETTY_FUNCTION__.test_deadline) #12, !dbg !62
  unreachable, !dbg !62

65:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19) #11, !dbg !63
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %15) #11, !dbg !64
  %66 = call i32 @puts(ptr nonnull dereferenceable(1) @str.37), !dbg !65
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %12) #11, !dbg !66
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %12, i8 0, i64 16, i1 false), !dbg !69
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %13) #11, !dbg !70
  store i32 1, ptr %13, align 4, !dbg !71, !tbaa !74
  %67 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %13) #11, !dbg !77, !srcloc !83
  %68 = and i32 %67, 2147483647, !dbg !84
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !85, !srcloc !92
  %69 = icmp eq i32 %68, 1, !dbg !93
  br i1 %69, label %71, label %70, !dbg !93

70:                                               ; preds = %65
  call void @__assert_fail(ptr noundef nonnull @.str.9, ptr noundef nonnull @.str.8, i32 noundef 192, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !93
  unreachable, !dbg !93

71:                                               ; preds = %65
  %72 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %13) #11, !dbg !94, !srcloc !83
  %73 = and i32 %72, 2147483647, !dbg !99
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !100, !srcloc !92
  %74 = icmp eq i32 %73, 2, !dbg !103
  br i1 %74, label %75, label %79, !dbg !103

75:                                               ; preds = %71
  %76 = call i32 @ck_ec32_wait_slow(ptr noundef nonnull %13, ptr noundef nonnull @test_ops, i32 noundef 2, ptr noundef null) #11, !dbg !104
  %77 = icmp eq i32 %76, 0, !dbg !105
  br i1 %77, label %79, label %78, !dbg !105

78:                                               ; preds = %75
  call void @__assert_fail(ptr noundef nonnull @.str.23, ptr noundef nonnull @.str.8, i32 noundef 193, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !105
  unreachable, !dbg !105

79:                                               ; preds = %75, %71
  %80 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %13) #11, !dbg !106, !srcloc !83
  %81 = and i32 %80, 2147483647, !dbg !110
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !111, !srcloc !92
  %82 = icmp eq i32 %81, 1, !dbg !114
  br i1 %82, label %83, label %86, !dbg !114

83:                                               ; preds = %79
  %84 = call i32 @ck_ec32_wait_slow(ptr noundef nonnull %13, ptr noundef nonnull @test_ops, i32 noundef 1, ptr noundef nonnull %12) #11, !dbg !115
  %85 = icmp eq i32 %84, -1, !dbg !116
  br i1 %85, label %87, label %86, !dbg !116

86:                                               ; preds = %83, %79
  call void @__assert_fail(ptr noundef nonnull @.str.24, ptr noundef nonnull @.str.8, i32 noundef 194, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !116
  unreachable, !dbg !116

87:                                               ; preds = %83
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %14) #11, !dbg !117
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 8 dereferenceable(16) @__const.test_wait_64.timeout, i64 16, i1 false), !dbg !118
  %88 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %12, ptr noundef nonnull @test_ops, ptr noundef nonnull %14) #11, !dbg !119
  %89 = icmp eq i32 %88, 0, !dbg !121
  br i1 %89, label %91, label %90, !dbg !121

90:                                               ; preds = %87
  call void @__assert_fail(ptr noundef nonnull @.str.18, ptr noundef nonnull @.str.8, i32 noundef 199, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !121
  unreachable, !dbg !121

91:                                               ; preds = %87
  %92 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %13) #11, !dbg !122, !srcloc !83
  %93 = and i32 %92, 2147483647, !dbg !126
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !127, !srcloc !92
  %94 = icmp eq i32 %93, 1, !dbg !130
  br i1 %94, label %95, label %98, !dbg !130

95:                                               ; preds = %91
  %96 = call i32 @ck_ec32_wait_slow(ptr noundef nonnull %13, ptr noundef nonnull @test_ops, i32 noundef 1, ptr noundef nonnull %12) #11, !dbg !131
  %97 = icmp eq i32 %96, -1, !dbg !132
  br i1 %97, label %99, label %98, !dbg !132

98:                                               ; preds = %95, %91
  call void @__assert_fail(ptr noundef nonnull @.str.24, ptr noundef nonnull @.str.8, i32 noundef 200, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !132
  unreachable, !dbg !132

99:                                               ; preds = %95
  %100 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %13) #11, !dbg !133, !srcloc !83
  %101 = icmp slt i32 %100, 0, !dbg !137
  br i1 %101, label %103, label %102, !dbg !138

102:                                              ; preds = %99
  call void @__assert_fail(ptr noundef nonnull @.str.25, ptr noundef nonnull @.str.8, i32 noundef 201, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_32) #12, !dbg !138
  unreachable, !dbg !138

103:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %14) #11, !dbg !139
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %13) #11, !dbg !140
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %12) #11, !dbg !140
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %9) #11, !dbg !141
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %9, i8 0, i64 16, i1 false), !dbg !144
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10) #11, !dbg !145
  store i64 0, ptr %10, align 8, !dbg !146, !tbaa !149
  %104 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %10) #11, !dbg !151, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !157, !srcloc !92
  %105 = icmp ult i64 %104, 2, !dbg !160
  br i1 %105, label %107, label %106, !dbg !160

106:                                              ; preds = %103
  call void @__assert_fail(ptr noundef nonnull @.str.7, ptr noundef nonnull @.str.8, i32 noundef 214, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !160
  unreachable, !dbg !160

107:                                              ; preds = %103
  %108 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %10) #11, !dbg !161, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !166, !srcloc !92
  %109 = and i64 %108, -2, !dbg !169
  %110 = icmp eq i64 %109, 2, !dbg !169
  br i1 %110, label %111, label %115, !dbg !169

111:                                              ; preds = %107
  %112 = call i32 @ck_ec64_wait_slow(ptr noundef nonnull %10, ptr noundef nonnull @test_ops, i64 noundef 1, ptr noundef null) #11, !dbg !170
  %113 = icmp eq i32 %112, 0, !dbg !171
  br i1 %113, label %115, label %114, !dbg !171

114:                                              ; preds = %111
  call void @__assert_fail(ptr noundef nonnull @.str.26, ptr noundef nonnull @.str.8, i32 noundef 215, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !171
  unreachable, !dbg !171

115:                                              ; preds = %111, %107
  %116 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %10) #11, !dbg !172, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !176, !srcloc !92
  %117 = icmp ult i64 %116, 2, !dbg !179
  br i1 %117, label %118, label %121, !dbg !179

118:                                              ; preds = %115
  %119 = call i32 @ck_ec64_wait_slow(ptr noundef nonnull %10, ptr noundef nonnull @test_ops, i64 noundef 0, ptr noundef nonnull %9) #11, !dbg !180
  %120 = icmp eq i32 %119, -1, !dbg !181
  br i1 %120, label %122, label %121, !dbg !181

121:                                              ; preds = %118, %115
  call void @__assert_fail(ptr noundef nonnull @.str.27, ptr noundef nonnull @.str.8, i32 noundef 216, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !181
  unreachable, !dbg !181

122:                                              ; preds = %118
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %11) #11, !dbg !182
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) @__const.test_wait_64.timeout, i64 16, i1 false), !dbg !183
  %123 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %9, ptr noundef nonnull @test_ops, ptr noundef nonnull %11) #11, !dbg !184
  %124 = icmp eq i32 %123, 0, !dbg !186
  br i1 %124, label %126, label %125, !dbg !186

125:                                              ; preds = %122
  call void @__assert_fail(ptr noundef nonnull @.str.18, ptr noundef nonnull @.str.8, i32 noundef 221, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !186
  unreachable, !dbg !186

126:                                              ; preds = %122
  %127 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %10) #11, !dbg !187, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !191, !srcloc !92
  %128 = icmp ult i64 %127, 2, !dbg !194
  br i1 %128, label %129, label %132, !dbg !194

129:                                              ; preds = %126
  %130 = call i32 @ck_ec64_wait_slow(ptr noundef nonnull %10, ptr noundef nonnull @test_ops, i64 noundef 0, ptr noundef nonnull %9) #11, !dbg !195
  %131 = icmp eq i32 %130, -1, !dbg !196
  br i1 %131, label %133, label %132, !dbg !196

132:                                              ; preds = %129, %126
  call void @__assert_fail(ptr noundef nonnull @.str.27, ptr noundef nonnull @.str.8, i32 noundef 222, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !196
  unreachable, !dbg !196

133:                                              ; preds = %129
  %134 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %10) #11, !dbg !197, !srcloc !156
  %135 = and i64 %134, 1, !dbg !201
  %136 = icmp eq i64 %135, 0, !dbg !202
  br i1 %136, label %137, label %138, !dbg !203

137:                                              ; preds = %133
  call void @__assert_fail(ptr noundef nonnull @.str.25, ptr noundef nonnull @.str.8, i32 noundef 223, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_64) #12, !dbg !203
  unreachable, !dbg !203

138:                                              ; preds = %133
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %11) #11, !dbg !204
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10) #11, !dbg !205
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %9) #11, !dbg !205
  %139 = call i32 @puts(ptr nonnull dereferenceable(1) @str.38), !dbg !206
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #11, !dbg !207
  store i32 0, ptr %7, align 4, !dbg !210
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8) #11, !dbg !211
  store i32 0, ptr %8, align 4, !dbg !212, !tbaa !213
  %140 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %7) #11, !dbg !214, !srcloc !83
  %141 = icmp slt i32 %140, 0, !dbg !217
  br i1 %141, label %142, label %143, !dbg !218

142:                                              ; preds = %138
  call void @__assert_fail(ptr noundef nonnull @.str.28, ptr noundef nonnull @.str.8, i32 noundef 256, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_32) #12, !dbg !218
  unreachable, !dbg !218

143:                                              ; preds = %138
  %144 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %7) #11, !dbg !219, !srcloc !83
  %145 = and i32 %144, 2147483647, !dbg !224
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !225, !srcloc !92
  %146 = icmp eq i32 %145, 0, !dbg !228
  br i1 %146, label %147, label %150, !dbg !228

147:                                              ; preds = %143
  %148 = call i32 @ck_ec32_wait_pred_slow(ptr noundef nonnull %7, ptr noundef nonnull @test_ops, i32 noundef 0, ptr noundef nonnull @pred, ptr noundef nonnull %8, ptr noundef null) #11, !dbg !229
  %149 = icmp eq i32 %148, 4, !dbg !230
  br i1 %149, label %151, label %150, !dbg !230

150:                                              ; preds = %147, %143
  call void @__assert_fail(ptr noundef nonnull @.str.29, ptr noundef nonnull @.str.8, i32 noundef 257, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_32) #12, !dbg !230
  unreachable, !dbg !230

151:                                              ; preds = %147
  %152 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %7) #11, !dbg !231, !srcloc !83
  %153 = icmp slt i32 %152, 0, !dbg !234
  br i1 %153, label %155, label %154, !dbg !235

154:                                              ; preds = %151
  call void @__assert_fail(ptr noundef nonnull @.str.25, ptr noundef nonnull @.str.8, i32 noundef 258, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_32) #12, !dbg !235
  unreachable, !dbg !235

155:                                              ; preds = %151
  %156 = load i32, ptr %8, align 4, !dbg !236, !tbaa !213
  %157 = icmp eq i32 %156, 5, !dbg !236
  br i1 %157, label %159, label %158, !dbg !236

158:                                              ; preds = %155
  call void @__assert_fail(ptr noundef nonnull @.str.30, ptr noundef nonnull @.str.8, i32 noundef 259, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_32) #12, !dbg !236
  unreachable, !dbg !236

159:                                              ; preds = %155
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8) #11, !dbg !237
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #11, !dbg !237
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #11, !dbg !238
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(16) @__const.test_wait_pred_64.timeout, i64 16, i1 false), !dbg !241
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #11, !dbg !242
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #11, !dbg !243
  store i64 0, ptr %5, align 8, !dbg !244
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #11, !dbg !245
  store i32 0, ptr %6, align 4, !dbg !246, !tbaa !213
  %160 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %5) #11, !dbg !247, !srcloc !156
  %161 = and i64 %160, 1, !dbg !250
  %162 = icmp eq i64 %161, 0, !dbg !251
  br i1 %162, label %164, label %163, !dbg !252

163:                                              ; preds = %159
  call void @__assert_fail(ptr noundef nonnull @.str.28, ptr noundef nonnull @.str.8, i32 noundef 292, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_64) #12, !dbg !252
  unreachable, !dbg !252

164:                                              ; preds = %159
  %165 = call i32 @ck_ec_deadline_impl(ptr noundef nonnull %4, ptr noundef nonnull @test_ops, ptr noundef nonnull %3) #11, !dbg !253
  %166 = icmp eq i32 %165, 0, !dbg !255
  br i1 %166, label %168, label %167, !dbg !255

167:                                              ; preds = %164
  call void @__assert_fail(ptr noundef nonnull @.str.18, ptr noundef nonnull @.str.8, i32 noundef 293, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_64) #12, !dbg !255
  unreachable, !dbg !255

168:                                              ; preds = %164
  %169 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %5) #11, !dbg !256, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !261, !srcloc !92
  %170 = icmp ult i64 %169, 2, !dbg !264
  br i1 %170, label %171, label %174, !dbg !264

171:                                              ; preds = %168
  %172 = call i32 @ck_ec64_wait_pred_slow(ptr noundef nonnull %5, ptr noundef nonnull @test_ops, i64 noundef 0, ptr noundef nonnull @pred2, ptr noundef nonnull %6, ptr noundef nonnull %4) #11, !dbg !265
  %173 = icmp eq i32 %172, -1, !dbg !266
  br i1 %173, label %175, label %174, !dbg !266

174:                                              ; preds = %171, %168
  call void @__assert_fail(ptr noundef nonnull @.str.32, ptr noundef nonnull @.str.8, i32 noundef 294, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_64) #12, !dbg !266
  unreachable, !dbg !266

175:                                              ; preds = %171
  %176 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %5) #11, !dbg !267, !srcloc !156
  %177 = and i64 %176, 1, !dbg !270
  %178 = icmp eq i64 %177, 0, !dbg !271
  br i1 %178, label %179, label %180, !dbg !272

179:                                              ; preds = %175
  call void @__assert_fail(ptr noundef nonnull @.str.25, ptr noundef nonnull @.str.8, i32 noundef 295, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_64) #12, !dbg !272
  unreachable, !dbg !272

180:                                              ; preds = %175
  %181 = load i32, ptr %6, align 4, !dbg !273, !tbaa !213
  %182 = icmp eq i32 %181, 5, !dbg !273
  br i1 %182, label %184, label %183, !dbg !273

183:                                              ; preds = %180
  call void @__assert_fail(ptr noundef nonnull @.str.30, ptr noundef nonnull @.str.8, i32 noundef 296, ptr noundef nonnull @__PRETTY_FUNCTION__.test_wait_pred_64) #12, !dbg !273
  unreachable, !dbg !273

184:                                              ; preds = %180
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #11, !dbg !274
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #11, !dbg !274
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #11, !dbg !274
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #11, !dbg !274
  %185 = call i32 @puts(ptr nonnull dereferenceable(1) @str.39), !dbg !275
  call fastcc void @test_threaded_inc_32(ptr noundef nonnull @sp), !dbg !276
  call fastcc void @test_threaded_add_32(ptr noundef nonnull @sp), !dbg !277
  call fastcc void @test_threaded_inc_64(ptr noundef nonnull @sp), !dbg !278
  call fastcc void @test_threaded_add_64(ptr noundef nonnull @sp), !dbg !279
  %186 = call i32 @puts(ptr nonnull dereferenceable(1) @str.40), !dbg !280
  call fastcc void @test_threaded_inc_32(ptr noundef nonnull @mp), !dbg !281
  call fastcc void @test_threaded_add_32(ptr noundef nonnull @mp), !dbg !282
  call fastcc void @test_threaded_inc_64(ptr noundef nonnull @mp), !dbg !283
  call fastcc void @test_threaded_add_64(ptr noundef nonnull @mp), !dbg !284
  %187 = call i32 @puts(ptr nonnull dereferenceable(1) @str.41), !dbg !285
  ret i32 0, !dbg !286
}

; Function Attrs: nounwind uwtable
define internal fastcc void @test_update_counter_32(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !287 {
  %2 = alloca %struct.ck_ec32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #11, !dbg !288
  store i32 0, ptr %2, align 4, !dbg !289
  %3 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2) #11, !dbg !290, !srcloc !83
  %4 = and i32 %3, 2147483647, !dbg !293
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !294, !srcloc !92
  %5 = icmp eq i32 %4, 0, !dbg !297
  br i1 %5, label %7, label %6, !dbg !297

6:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.7, ptr noundef nonnull @.str.8, i32 noundef 119, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_32) #12, !dbg !297
  unreachable, !dbg !297

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !298
  %9 = load i8, ptr %8, align 8, !dbg !298, !tbaa !301, !range !306, !noundef !11
  %10 = trunc nuw i8 %9 to i1, !dbg !298
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !307
  br i1 %10, label %11, label %13, !dbg !308

11:                                               ; preds = %7
  %12 = call i8 asm sideeffect " incl $0; setle $1", "=*m,=r,*m,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2) #11, !dbg !309, !srcloc !310
  br label %15, !dbg !311

13:                                               ; preds = %7
  %14 = call i8 asm sideeffect "lock incl $0; setle $1", "=*m,=r,*m,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2) #11, !dbg !312, !srcloc !313
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8 [ %12, %11 ], [ %14, %13 ], !dbg !307
  %17 = icmp eq i8 %16, 0, !dbg !314
  br i1 %17, label %20, label %18, !dbg !314, !prof !315

18:                                               ; preds = %15
  %19 = load ptr, ptr %0, align 8, !dbg !316, !tbaa !317
  call void @ck_ec32_wake(ptr noundef nonnull %2, ptr noundef %19) #11, !dbg !318
  br label %20, !dbg !319

20:                                               ; preds = %15, %18
  %21 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2) #11, !dbg !320, !srcloc !83
  %22 = and i32 %21, 2147483647, !dbg !323
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !324, !srcloc !92
  %23 = icmp eq i32 %22, 1, !dbg !327
  br i1 %23, label %25, label %24, !dbg !327

24:                                               ; preds = %20
  call void @__assert_fail(ptr noundef nonnull @.str.9, ptr noundef nonnull @.str.8, i32 noundef 122, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_32) #12, !dbg !327
  unreachable, !dbg !327

25:                                               ; preds = %20
  %26 = load i8, ptr %8, align 8, !dbg !328, !tbaa !301, !range !306, !noundef !11
  %27 = trunc nuw i8 %26 to i1, !dbg !328
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !331
  br i1 %27, label %28, label %31, !dbg !332

28:                                               ; preds = %25
  %29 = call i32 asm sideeffect "xaddl $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 42) #11, !dbg !333, !srcloc !336
  %30 = icmp sgt i32 %29, -1, !dbg !337
  br i1 %30, label %37, label %34, !dbg !337, !prof !315

31:                                               ; preds = %25
  %32 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 range(i32 4, 43) 42) #11, !dbg !340, !srcloc !345
  %33 = icmp sgt i32 %32, -1, !dbg !346
  br i1 %33, label %37, label %34, !dbg !346, !prof !315

34:                                               ; preds = %31, %28
  %35 = phi i32 [ %29, %28 ], [ %32, %31 ]
  %36 = load ptr, ptr %0, align 8, !dbg !331, !tbaa !317
  call void @ck_ec32_wake(ptr noundef nonnull %2, ptr noundef %36) #11, !dbg !331
  br label %37, !dbg !331

37:                                               ; preds = %34, %31, %28
  %38 = phi i32 [ %29, %28 ], [ %32, %31 ], [ %35, %34 ]
  %39 = and i32 %38, 2147483647, !dbg !331
  %40 = icmp eq i32 %39, 1, !dbg !348
  br i1 %40, label %42, label %41, !dbg !348

41:                                               ; preds = %37
  call void @__assert_fail(ptr noundef nonnull @.str.10, ptr noundef nonnull @.str.8, i32 noundef 125, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_32) #12, !dbg !348
  unreachable, !dbg !348

42:                                               ; preds = %37
  %43 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2) #11, !dbg !349, !srcloc !83
  %44 = and i32 %43, 2147483647, !dbg !352
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !353, !srcloc !92
  %45 = icmp eq i32 %44, 43, !dbg !356
  br i1 %45, label %47, label %46, !dbg !356

46:                                               ; preds = %42
  call void @__assert_fail(ptr noundef nonnull @.str.11, ptr noundef nonnull @.str.8, i32 noundef 126, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_32) #12, !dbg !356
  unreachable, !dbg !356

47:                                               ; preds = %42
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #11, !dbg !357
  ret void, !dbg !357
}

; Function Attrs: nounwind uwtable
define internal fastcc void @test_update_counter_64(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !358 {
  %2 = alloca %struct.ck_ec64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #11, !dbg !359
  store i64 0, ptr %2, align 8, !dbg !360
  %3 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2) #11, !dbg !361, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !364, !srcloc !92
  %4 = icmp ult i64 %3, 2, !dbg !367
  br i1 %4, label %6, label %5, !dbg !367

5:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.7, ptr noundef nonnull @.str.8, i32 noundef 135, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_64) #12, !dbg !367
  unreachable, !dbg !367

6:                                                ; preds = %1
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !368
  %8 = load i8, ptr %7, align 8, !dbg !368, !tbaa !301, !range !306, !noundef !11
  %9 = trunc nuw i8 %8 to i1, !dbg !368
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !373
  br i1 %9, label %10, label %14, !dbg !374

10:                                               ; preds = %6
  %11 = call i64 asm sideeffect "xaddq $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 2) #11, !dbg !375, !srcloc !378
  %12 = and i64 %11, 1, !dbg !379
  %13 = icmp eq i64 %12, 0, !dbg !379
  br i1 %13, label %20, label %18, !dbg !379, !prof !315

14:                                               ; preds = %6
  %15 = call i64 asm sideeffect "lock xaddq $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 range(i64 2, 85) 2) #11, !dbg !382, !srcloc !387
  %16 = and i64 %15, 1, !dbg !388
  %17 = icmp eq i64 %16, 0, !dbg !388
  br i1 %17, label %20, label %18, !dbg !388, !prof !315

18:                                               ; preds = %14, %10
  %19 = load ptr, ptr %0, align 8, !dbg !373, !tbaa !317
  call void @ck_ec64_wake(ptr noundef nonnull %2, ptr noundef %19) #11, !dbg !373
  br label %20, !dbg !390

20:                                               ; preds = %18, %10, %14
  %21 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2) #11, !dbg !390, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !393, !srcloc !92
  %22 = and i64 %21, -2, !dbg !396
  %23 = icmp eq i64 %22, 2, !dbg !396
  br i1 %23, label %25, label %24, !dbg !396

24:                                               ; preds = %20
  call void @__assert_fail(ptr noundef nonnull @.str.9, ptr noundef nonnull @.str.8, i32 noundef 138, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_64) #12, !dbg !396
  unreachable, !dbg !396

25:                                               ; preds = %20
  %26 = load i8, ptr %7, align 8, !dbg !397, !tbaa !301, !range !306, !noundef !11
  %27 = trunc nuw i8 %26 to i1, !dbg !397
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !399
  br i1 %27, label %28, label %32, !dbg !400

28:                                               ; preds = %25
  %29 = call i64 asm sideeffect "xaddq $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 84) #11, !dbg !401, !srcloc !378
  %30 = and i64 %29, 1, !dbg !403
  %31 = icmp eq i64 %30, 0, !dbg !403
  br i1 %31, label %39, label %36, !dbg !403, !prof !315

32:                                               ; preds = %25
  %33 = call i64 asm sideeffect "lock xaddq $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 range(i64 2, 85) 84) #11, !dbg !405, !srcloc !387
  %34 = and i64 %33, 1, !dbg !408
  %35 = icmp eq i64 %34, 0, !dbg !408
  br i1 %35, label %39, label %36, !dbg !408, !prof !315

36:                                               ; preds = %32, %28
  %37 = phi i64 [ %29, %28 ], [ %33, %32 ]
  %38 = load ptr, ptr %0, align 8, !dbg !399, !tbaa !317
  call void @ck_ec64_wake(ptr noundef nonnull %2, ptr noundef %38) #11, !dbg !399
  br label %39, !dbg !410

39:                                               ; preds = %36, %32, %28
  %40 = phi i64 [ %29, %28 ], [ %33, %32 ], [ %37, %36 ]
  %41 = and i64 %40, -2, !dbg !410
  %42 = icmp eq i64 %41, 2, !dbg !410
  br i1 %42, label %44, label %43, !dbg !410

43:                                               ; preds = %39
  call void @__assert_fail(ptr noundef nonnull @.str.10, ptr noundef nonnull @.str.8, i32 noundef 141, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_64) #12, !dbg !410
  unreachable, !dbg !410

44:                                               ; preds = %39
  %45 = call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2) #11, !dbg !411, !srcloc !156
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !414, !srcloc !92
  %46 = and i64 %45, -2, !dbg !417
  %47 = icmp eq i64 %46, 86, !dbg !417
  br i1 %47, label %49, label %48, !dbg !417

48:                                               ; preds = %44
  call void @__assert_fail(ptr noundef nonnull @.str.11, ptr noundef nonnull @.str.8, i32 noundef 142, ptr noundef nonnull @__PRETTY_FUNCTION__.test_update_counter_64) #12, !dbg !417
  unreachable, !dbg !417

49:                                               ; preds = %44
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #11, !dbg !418
  ret void, !dbg !418
}

; Function Attrs: nofree nounwind
declare !dbg !419 noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define internal fastcc void @test_threaded_inc_32(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !421 {
  %2 = alloca %struct.ck_ec32, align 4
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #11, !dbg !422
  store i32 0, ptr %2, align 4, !dbg !423
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #11, !dbg !424
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 0) #11, !dbg !425, !srcloc !428
  %4 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @test_threaded_32_waiter, ptr noundef nonnull %2) #11, !dbg !429
  %5 = call i32 @usleep(i32 noundef 10000) #11, !dbg !430
  %6 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !431, !srcloc !434
  %7 = icmp eq i32 %6, 0, !dbg !435
  br i1 %7, label %9, label %8, !dbg !435

8:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.34, ptr noundef nonnull @.str.8, i32 noundef 322, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_inc_32) #12, !dbg !435
  unreachable, !dbg !435

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !436
  %11 = load i8, ptr %10, align 8, !dbg !436, !tbaa !301, !range !306, !noundef !11
  %12 = trunc nuw i8 %11 to i1, !dbg !436
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !438
  br i1 %12, label %13, label %15, !dbg !439

13:                                               ; preds = %9
  %14 = call i8 asm sideeffect " incl $0; setle $1", "=*m,=r,*m,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2) #11, !dbg !440, !srcloc !310
  br label %17, !dbg !441

15:                                               ; preds = %9
  %16 = call i8 asm sideeffect "lock incl $0; setle $1", "=*m,=r,*m,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2) #11, !dbg !442, !srcloc !313
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8 [ %14, %13 ], [ %16, %15 ], !dbg !438
  %19 = icmp eq i8 %18, 0, !dbg !443
  br i1 %19, label %22, label %20, !dbg !443, !prof !315

20:                                               ; preds = %17
  %21 = load ptr, ptr %0, align 8, !dbg !444, !tbaa !317
  call void @ck_ec32_wake(ptr noundef nonnull %2, ptr noundef %21) #11, !dbg !445
  br label %22, !dbg !446

22:                                               ; preds = %17, %20
  %23 = load i64, ptr %3, align 8, !dbg !447, !tbaa !448
  %24 = call i32 @pthread_join(i64 noundef %23, ptr noundef null) #11, !dbg !449
  %25 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !450, !srcloc !434
  %26 = icmp eq i32 %25, 1, !dbg !452
  br i1 %26, label %28, label %27, !dbg !452

27:                                               ; preds = %22
  call void @__assert_fail(ptr noundef nonnull @.str.35, ptr noundef nonnull @.str.8, i32 noundef 326, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_inc_32) #12, !dbg !452
  unreachable, !dbg !452

28:                                               ; preds = %22
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #11, !dbg !453
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #11, !dbg !453
  ret void, !dbg !453
}

; Function Attrs: nounwind uwtable
define internal fastcc void @test_threaded_add_32(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !454 {
  %2 = alloca %struct.ck_ec32, align 4
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #11, !dbg !455
  store i32 0, ptr %2, align 4, !dbg !456
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #11, !dbg !457
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 0) #11, !dbg !458, !srcloc !428
  %4 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @test_threaded_32_waiter, ptr noundef nonnull %2) #11, !dbg !460
  %5 = call i32 @usleep(i32 noundef 10000) #11, !dbg !461
  %6 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !462, !srcloc !434
  %7 = icmp eq i32 %6, 0, !dbg !464
  br i1 %7, label %9, label %8, !dbg !464

8:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.34, ptr noundef nonnull @.str.8, i32 noundef 340, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_add_32) #12, !dbg !464
  unreachable, !dbg !464

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !465
  %11 = load i8, ptr %10, align 8, !dbg !465, !tbaa !301, !range !306, !noundef !11
  %12 = trunc nuw i8 %11 to i1, !dbg !465
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !467
  br i1 %12, label %13, label %16, !dbg !468

13:                                               ; preds = %9
  %14 = call i32 asm sideeffect "xaddl $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 4) #11, !dbg !469, !srcloc !336
  %15 = icmp sgt i32 %14, -1, !dbg !471
  br i1 %15, label %21, label %19, !dbg !471, !prof !315

16:                                               ; preds = %9
  %17 = call i32 asm sideeffect "lock xaddl $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) %2, ptr nonnull elementtype(i32) %2, i32 range(i32 4, 43) 4) #11, !dbg !473, !srcloc !345
  %18 = icmp sgt i32 %17, -1, !dbg !476
  br i1 %18, label %21, label %19, !dbg !476, !prof !315

19:                                               ; preds = %16, %13
  %20 = load ptr, ptr %0, align 8, !dbg !467, !tbaa !317
  call void @ck_ec32_wake(ptr noundef nonnull %2, ptr noundef %20) #11, !dbg !467
  br label %21, !dbg !478

21:                                               ; preds = %19, %13, %16
  %22 = load i64, ptr %3, align 8, !dbg !478, !tbaa !448
  %23 = call i32 @pthread_join(i64 noundef %22, ptr noundef null) #11, !dbg !479
  %24 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !480, !srcloc !434
  %25 = icmp eq i32 %24, 1, !dbg !482
  br i1 %25, label %27, label %26, !dbg !482

26:                                               ; preds = %21
  call void @__assert_fail(ptr noundef nonnull @.str.35, ptr noundef nonnull @.str.8, i32 noundef 344, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_add_32) #12, !dbg !482
  unreachable, !dbg !482

27:                                               ; preds = %21
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #11, !dbg !483
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #11, !dbg !483
  ret void, !dbg !483
}

; Function Attrs: nounwind uwtable
define internal fastcc void @test_threaded_inc_64(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !484 {
  %2 = alloca %struct.ck_ec64, align 8
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #11, !dbg !485
  store i64 0, ptr %2, align 8, !dbg !486
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #11, !dbg !487
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 0) #11, !dbg !488, !srcloc !428
  %4 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @test_threaded_64_waiter, ptr noundef nonnull %2) #11, !dbg !490
  %5 = call i32 @usleep(i32 noundef 10000) #11, !dbg !491
  %6 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !492, !srcloc !434
  %7 = icmp eq i32 %6, 0, !dbg !494
  br i1 %7, label %9, label %8, !dbg !494

8:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.34, ptr noundef nonnull @.str.8, i32 noundef 368, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_inc_64) #12, !dbg !494
  unreachable, !dbg !494

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !495
  %11 = load i8, ptr %10, align 8, !dbg !495, !tbaa !301, !range !306, !noundef !11
  %12 = trunc nuw i8 %11 to i1, !dbg !495
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !498
  br i1 %12, label %13, label %17, !dbg !499

13:                                               ; preds = %9
  %14 = call i64 asm sideeffect "xaddq $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 2) #11, !dbg !500, !srcloc !378
  %15 = and i64 %14, 1, !dbg !502
  %16 = icmp eq i64 %15, 0, !dbg !502
  br i1 %16, label %23, label %21, !dbg !502, !prof !315

17:                                               ; preds = %9
  %18 = call i64 asm sideeffect "lock xaddq $1, $0", "=*m,=q,*m,1,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 range(i64 2, 85) 2) #11, !dbg !504, !srcloc !387
  %19 = and i64 %18, 1, !dbg !507
  %20 = icmp eq i64 %19, 0, !dbg !507
  br i1 %20, label %23, label %21, !dbg !507, !prof !315

21:                                               ; preds = %17, %13
  %22 = load ptr, ptr %0, align 8, !dbg !498, !tbaa !317
  call void @ck_ec64_wake(ptr noundef nonnull %2, ptr noundef %22) #11, !dbg !498
  br label %23, !dbg !509

23:                                               ; preds = %21, %13, %17
  %24 = load i64, ptr %3, align 8, !dbg !509, !tbaa !448
  %25 = call i32 @pthread_join(i64 noundef %24, ptr noundef null) #11, !dbg !510
  %26 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !511, !srcloc !434
  %27 = icmp eq i32 %26, 1, !dbg !513
  br i1 %27, label %29, label %28, !dbg !513

28:                                               ; preds = %23
  call void @__assert_fail(ptr noundef nonnull @.str.35, ptr noundef nonnull @.str.8, i32 noundef 372, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_inc_64) #12, !dbg !513
  unreachable, !dbg !513

29:                                               ; preds = %23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #11, !dbg !514
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #11, !dbg !514
  ret void, !dbg !514
}

; Function Attrs: nounwind uwtable
define internal fastcc void @test_threaded_add_64(ptr noundef readonly captures(none) %0) unnamed_addr #0 !dbg !515 {
  %2 = alloca %struct.ck_ec64, align 8
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #11, !dbg !516
  store i64 0, ptr %2, align 8, !dbg !517
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #11, !dbg !518
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 0) #11, !dbg !519, !srcloc !428
  %4 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @test_threaded_64_waiter, ptr noundef nonnull %2) #11, !dbg !521
  %5 = call i32 @usleep(i32 noundef 10000) #11, !dbg !522
  %6 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !523, !srcloc !434
  %7 = icmp eq i32 %6, 0, !dbg !525
  br i1 %7, label %9, label %8, !dbg !525

8:                                                ; preds = %1
  call void @__assert_fail(ptr noundef nonnull @.str.34, ptr noundef nonnull @.str.8, i32 noundef 386, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_add_64) #12, !dbg !525
  unreachable, !dbg !525

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !526
  %11 = load i8, ptr %10, align 8, !dbg !526, !tbaa !301, !range !306, !noundef !11
  %12 = trunc nuw i8 %11 to i1, !dbg !526
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !528
  br i1 %12, label %13, label %17, !dbg !529

13:                                               ; preds = %9
  %14 = call i64 asm sideeffect "xaddq $1, $0", "=*m,=r,*m,1,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i64) %2, ptr nonnull elementtype(i64) %2, i64 8) #11, !dbg !530, !srcloc !378
  %15 = and i64 %14, 1, !dbg !532
  %16 = icmp eq i64 %15, 0, !dbg !532
  br i1 %16, label %23, label %21, !dbg !532, !prof !315

17:                                               ; preds = %9
  %cert_4b1a82fac6ff_tu0-line899_0 = atomicrmw add i64* %2, i64 8 monotonic, !dbg !534
  %18 = add i64 0, %cert_4b1a82fac6ff_tu0-line899_0, !dbg !534
  %19 = and i64 %18, 1, !dbg !537
  %20 = icmp eq i64 %19, 0, !dbg !537
  br i1 %20, label %23, label %21, !dbg !537, !prof !315

21:                                               ; preds = %17, %13
  %22 = load ptr, ptr %0, align 8, !dbg !528, !tbaa !317
  call void @ck_ec64_wake(ptr noundef nonnull %2, ptr noundef %22) #11, !dbg !528
  br label %23, !dbg !539

23:                                               ; preds = %21, %13, %17
  %24 = load i64, ptr %3, align 8, !dbg !539, !tbaa !448
  %25 = call i32 @pthread_join(i64 noundef %24, ptr noundef null) #11, !dbg !540
  %26 = call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken) #11, !dbg !541, !srcloc !434
  %27 = icmp eq i32 %26, 1, !dbg !543
  br i1 %27, label %29, label %28, !dbg !543

28:                                               ; preds = %23
  call void @__assert_fail(ptr noundef nonnull @.str.35, ptr noundef nonnull @.str.8, i32 noundef 390, ptr noundef nonnull @__PRETTY_FUNCTION__.test_threaded_add_64) #12, !dbg !543
  unreachable, !dbg !543

29:                                               ; preds = %23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #11, !dbg !544
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #11, !dbg !544
  ret void, !dbg !544
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #3

; Function Attrs: cold noreturn nounwind
declare !dbg !545 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #2

declare !dbg !547 void @ck_ec32_wake(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define internal i32 @gettime(ptr noundef readnone captures(address) %0, ptr noundef %1) #0 !dbg !548 {
  %3 = icmp eq ptr %0, @test_ops, !dbg !549
  br i1 %3, label %5, label %4, !dbg !549

4:                                                ; preds = %2
  tail call void @__assert_fail(ptr noundef nonnull @.str.13, ptr noundef nonnull @.str.8, i32 noundef 38, ptr noundef nonnull @__PRETTY_FUNCTION__.gettime) #12, !dbg !549
  unreachable, !dbg !549

5:                                                ; preds = %2
  %6 = tail call i32 @clock_gettime(i32 noundef 1, ptr noundef %1) #11, !dbg !550
  ret i32 %6, !dbg !551
}

; Function Attrs: nounwind uwtable
define internal void @wait32(ptr noundef readonly captures(none) %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !552 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !553
  %6 = load ptr, ptr %5, align 8, !dbg !553, !tbaa !554
  %7 = icmp eq ptr %6, @test_ops, !dbg !553
  br i1 %7, label %9, label %8, !dbg !553

8:                                                ; preds = %4
  tail call void @__assert_fail(ptr noundef nonnull @.str.14, ptr noundef nonnull @.str.8, i32 noundef 46, ptr noundef nonnull @__PRETTY_FUNCTION__.wait32) #12, !dbg !553
  unreachable, !dbg !553

9:                                                ; preds = %4
  %10 = tail call i64 (i64, ...) @syscall(i64 noundef 202, ptr noundef %1, i32 noundef 9, i32 noundef %2, ptr noundef %3, ptr noundef null, i32 noundef -1, i32 noundef 0) #11, !dbg !556
  ret void, !dbg !557
}

; Function Attrs: nounwind uwtable
define internal void @wait64(ptr noundef readonly captures(none) %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 !dbg !558 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !559
  %6 = load ptr, ptr %5, align 8, !dbg !559, !tbaa !554
  %7 = icmp eq ptr %6, @test_ops, !dbg !559
  br i1 %7, label %9, label %8, !dbg !559

8:                                                ; preds = %4
  tail call void @__assert_fail(ptr noundef nonnull @.str.14, ptr noundef nonnull @.str.8, i32 noundef 59, ptr noundef nonnull @__PRETTY_FUNCTION__.wait64) #12, !dbg !559
  unreachable, !dbg !559

9:                                                ; preds = %4
  %10 = trunc i64 %2 to i32, !dbg !560
  %11 = tail call i64 (i64, ...) @syscall(i64 noundef 202, ptr noundef %1, i32 noundef 9, i32 noundef %10, ptr noundef %3, ptr noundef null, i32 noundef -1, i32 noundef 0) #11, !dbg !561
  ret void, !dbg !562
}

; Function Attrs: nounwind uwtable
define internal void @wake32(ptr noundef readnone captures(address) %0, ptr noundef %1) #0 !dbg !563 {
  %3 = icmp eq ptr %0, @test_ops, !dbg !564
  br i1 %3, label %5, label %4, !dbg !564

4:                                                ; preds = %2
  tail call void @__assert_fail(ptr noundef nonnull @.str.13, ptr noundef nonnull @.str.8, i32 noundef 77, ptr noundef nonnull @__PRETTY_FUNCTION__.wake32) #12, !dbg !564
  unreachable, !dbg !564

5:                                                ; preds = %2
  %6 = tail call i64 (i64, ...) @syscall(i64 noundef 202, ptr noundef %1, i32 noundef 1, i32 noundef 2147483647, ptr noundef null, ptr noundef null, i32 noundef 0) #11, !dbg !565
  ret void, !dbg !566
}

; Function Attrs: nounwind uwtable
define internal void @wake64(ptr noundef readnone captures(address) %0, ptr noundef %1) #0 !dbg !567 {
  %3 = icmp eq ptr %0, @test_ops, !dbg !568
  br i1 %3, label %5, label %4, !dbg !568

4:                                                ; preds = %2
  tail call void @__assert_fail(ptr noundef nonnull @.str.13, ptr noundef nonnull @.str.8, i32 noundef 88, ptr noundef nonnull @__PRETTY_FUNCTION__.wake64) #12, !dbg !568
  unreachable, !dbg !568

5:                                                ; preds = %2
  %6 = tail call i64 (i64, ...) @syscall(i64 noundef 202, ptr noundef %1, i32 noundef 1, i32 noundef 2147483647, ptr noundef null, ptr noundef null, i32 noundef 0) #11, !dbg !569
  ret void, !dbg !570
}

; Function Attrs: nounwind
declare !dbg !571 i32 @clock_gettime(i32 noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !573 i64 @syscall(i64 noundef, ...) local_unnamed_addr #6

declare !dbg !575 void @ck_ec64_wake(ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #8

declare !dbg !576 i32 @ck_ec_deadline_impl(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

declare !dbg !577 i32 @ck_ec32_wait_slow(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #5

declare !dbg !578 i32 @ck_ec64_wait_slow(ptr noundef, ptr noundef, i64 noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind uwtable
define internal range(i32 0, -2147483648) i32 @pred(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) #9 !dbg !579 {
  %3 = load i64, ptr %0, align 8, !dbg !580, !tbaa !581
  %4 = sitofp i64 %3 to double, !dbg !582
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !583
  %6 = load i64, ptr %5, align 8, !dbg !583, !tbaa !584
  %7 = sitofp i64 %6 to double, !dbg !585
  %8 = tail call double @llvm.fmuladd.f64(double %7, double 1.000000e-09, double %4), !dbg !586
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 40, !dbg !587
  %10 = load ptr, ptr %9, align 8, !dbg !587, !tbaa !588
  %11 = load i64, ptr %1, align 8, !dbg !589, !tbaa !27
  %12 = sitofp i64 %11 to double, !dbg !590
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 8, !dbg !591
  %14 = load i64, ptr %13, align 8, !dbg !591, !tbaa !46
  %15 = sitofp i64 %14 to double, !dbg !592
  %16 = tail call double @llvm.fmuladd.f64(double %15, double 1.000000e-09, double %12), !dbg !593
  %17 = fsub double %16, %8, !dbg !594
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.31, double noundef %17), !dbg !595
  %19 = load i32, ptr %10, align 4, !dbg !596, !tbaa !213
  %20 = add nsw i32 %19, 1, !dbg !596
  %21 = icmp slt i32 %19, 3, !dbg !597
  %22 = add nuw nsw i32 %19, 2
  %23 = select i1 %21, i32 %20, i32 %22, !dbg !597
  %24 = select i1 %21, i32 0, i32 %20, !dbg !597
  store i32 %23, ptr %10, align 4, !dbg !598, !tbaa !213
  ret i32 %24, !dbg !599
}

declare !dbg !600 i32 @ck_ec32_wait_pred_slow(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind uwtable
define internal noundef i32 @pred2(ptr noundef readonly captures(none) %0, ptr noundef captures(none) %1) #9 !dbg !601 {
  %3 = load i64, ptr %0, align 8, !dbg !602, !tbaa !581
  %4 = sitofp i64 %3 to double, !dbg !603
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8, !dbg !604
  %6 = load i64, ptr %5, align 8, !dbg !604, !tbaa !584
  %7 = sitofp i64 %6 to double, !dbg !605
  %8 = tail call double @llvm.fmuladd.f64(double %7, double 1.000000e-09, double %4), !dbg !606
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 40, !dbg !607
  %10 = load ptr, ptr %9, align 8, !dbg !607, !tbaa !588
  %11 = load i64, ptr %1, align 8, !dbg !608, !tbaa !27
  %12 = sitofp i64 %11 to double, !dbg !609
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 8, !dbg !610
  %14 = load i64, ptr %13, align 8, !dbg !610, !tbaa !46
  %15 = sitofp i64 %14 to double, !dbg !611
  %16 = tail call double @llvm.fmuladd.f64(double %15, double 1.000000e-09, double %12), !dbg !612
  %17 = fsub double %16, %8, !dbg !613
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.33, double noundef %17), !dbg !614
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 16, !dbg !615
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 8 dereferenceable(16) %19, i64 16, i1 false), !dbg !615, !tbaa.struct !616
  %20 = load i64, ptr %1, align 8, !dbg !617, !tbaa !27
  %21 = add nsw i64 %20, 1, !dbg !617
  store i64 %21, ptr %1, align 8, !dbg !617, !tbaa !27
  %22 = load i32, ptr %10, align 4, !dbg !618, !tbaa !213
  %23 = add nsw i32 %22, 1, !dbg !618
  store i32 %23, ptr %10, align 4, !dbg !618, !tbaa !213
  ret i32 0, !dbg !619
}

declare !dbg !620 i32 @ck_ec64_wait_pred_slow(ptr noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare !dbg !621 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define internal noundef ptr @test_threaded_32_waiter(ptr noundef %0) #0 !dbg !623 {
  %2 = tail call i32 asm sideeffect "movl $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) %0) #11, !dbg !624, !srcloc !83
  %3 = and i32 %2, 2147483647, !dbg !628
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !629, !srcloc !92
  %4 = icmp eq i32 %3, 0, !dbg !632
  br i1 %4, label %5, label %7, !dbg !632

5:                                                ; preds = %1
  %6 = tail call i32 @ck_ec32_wait_slow(ptr noundef %0, ptr noundef nonnull @test_ops, i32 noundef 0, ptr noundef null) #11, !dbg !633
  br label %7, !dbg !634

7:                                                ; preds = %1, %5
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 1) #11, !dbg !635, !srcloc !428
  ret ptr null, !dbg !637
}

declare !dbg !638 i32 @usleep(i32 noundef) local_unnamed_addr #5

declare !dbg !639 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define internal noundef ptr @test_threaded_64_waiter(ptr noundef %0) #0 !dbg !640 {
  %2 = tail call i64 asm sideeffect "movq $1, $0", "=q,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i64) %0) #11, !dbg !641, !srcloc !156
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #11, !dbg !645, !srcloc !92
  %3 = icmp ult i64 %2, 2, !dbg !648
  br i1 %3, label %4, label %6, !dbg !648

4:                                                ; preds = %1
  %5 = tail call i32 @ck_ec64_wait_slow(ptr noundef %0, ptr noundef nonnull @test_ops, i64 noundef 0, ptr noundef null) #11, !dbg !649
  br label %6, !dbg !650

6:                                                ; preds = %1, %4
  tail call void asm sideeffect "movl $1, $0", "=*m,eq,~{memory},~{dirflag},~{fpsr},~{flags}"(ptr nonnull elementtype(i32) @woken, i32 1) #11, !dbg !651, !srcloc !428
  ret ptr null, !dbg !653
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #10

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { cold noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind }
attributes #11 = { nounwind }
attributes #12 = { cold noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 21.1.8 (6ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate/ck_ec_smoke_test.c", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "94cae59e52530e0a4b290a590b6d9e26")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!8 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 395, type: !10, scopeLine: 396, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!9 = !DIFile(filename: "ck_ec_smoke_test.c", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "94cae59e52530e0a4b290a590b6d9e26")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 407, column: 2, scope: !8)
!13 = !DILocation(line: 409, column: 2, scope: !8)
!14 = !DILocation(line: 411, column: 2, scope: !8)
!15 = !DILocation(line: 413, column: 2, scope: !8)
!16 = !DILocation(line: 415, column: 2, scope: !8)
!17 = !DILocation(line: 417, column: 2, scope: !8)
!18 = !DILocation(line: 149, column: 2, scope: !19, inlinedAt: !20)
!19 = distinct !DISubprogram(name: "test_deadline", scope: !9, file: !9, line: 147, type: !10, scopeLine: 148, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!20 = distinct !DILocation(line: 419, column: 2, scope: !8)
!21 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !24)
!22 = distinct !DISubprogram(name: "ck_ec_deadline", scope: !23, file: !23, line: 755, type: !10, scopeLine: 758, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!23 = !DIFile(filename: "../../../include/ck_ec.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "bae0e38c7e45f8cbf422b5e01099eee4")
!24 = distinct !DILocation(line: 151, column: 2, scope: !19, inlinedAt: !20)
!25 = !DILocation(line: 151, column: 2, scope: !19, inlinedAt: !20)
!26 = !DILocation(line: 152, column: 2, scope: !19, inlinedAt: !20)
!27 = !{!28, !29, i64 0}
!28 = !{!"timespec", !29, i64 0, !29, i64 8}
!29 = !{!"long", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C/C++ TBAA"}
!32 = !DILocation(line: 155, column: 3, scope: !19, inlinedAt: !20)
!33 = !DILocation(line: 155, column: 25, scope: !19, inlinedAt: !20)
!34 = !DILocation(line: 159, column: 3, scope: !19, inlinedAt: !20)
!35 = !DILocation(line: 159, column: 25, scope: !19, inlinedAt: !20)
!36 = !DILocation(line: 162, column: 3, scope: !19, inlinedAt: !20)
!37 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !38)
!38 = distinct !DILocation(line: 164, column: 3, scope: !19, inlinedAt: !20)
!39 = !DILocation(line: 164, column: 3, scope: !19, inlinedAt: !20)
!40 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !41)
!41 = distinct !DILocation(line: 165, column: 3, scope: !19, inlinedAt: !20)
!42 = !DILocation(line: 165, column: 3, scope: !19, inlinedAt: !20)
!43 = !DILocation(line: 167, column: 24, scope: !19, inlinedAt: !20)
!44 = !DILocation(line: 167, column: 20, scope: !19, inlinedAt: !20)
!45 = !DILocation(line: 167, column: 44, scope: !19, inlinedAt: !20)
!46 = !{!28, !29, i64 8}
!47 = !DILocation(line: 167, column: 40, scope: !19, inlinedAt: !20)
!48 = !DILocation(line: 167, column: 31, scope: !19, inlinedAt: !20)
!49 = !DILocation(line: 168, column: 34, scope: !19, inlinedAt: !20)
!50 = !DILocation(line: 168, column: 25, scope: !19, inlinedAt: !20)
!51 = !DILocation(line: 168, column: 59, scope: !19, inlinedAt: !20)
!52 = !DILocation(line: 168, column: 50, scope: !19, inlinedAt: !20)
!53 = !DILocation(line: 168, column: 41, scope: !19, inlinedAt: !20)
!54 = !DILocation(line: 169, column: 3, scope: !19, inlinedAt: !20)
!55 = !DILocation(line: 170, column: 3, scope: !19, inlinedAt: !20)
!56 = !DILocation(line: 171, column: 2, scope: !19, inlinedAt: !20)
!57 = !DILocation(line: 174, column: 3, scope: !19, inlinedAt: !20)
!58 = !DILocation(line: 174, column: 25, scope: !19, inlinedAt: !20)
!59 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !60)
!60 = distinct !DILocation(line: 179, column: 3, scope: !19, inlinedAt: !20)
!61 = !DILocation(line: 179, column: 3, scope: !19, inlinedAt: !20)
!62 = !DILocation(line: 180, column: 3, scope: !19, inlinedAt: !20)
!63 = !DILocation(line: 181, column: 2, scope: !19, inlinedAt: !20)
!64 = !DILocation(line: 184, column: 1, scope: !19, inlinedAt: !20)
!65 = !DILocation(line: 420, column: 2, scope: !8)
!66 = !DILocation(line: 188, column: 2, scope: !67, inlinedAt: !68)
!67 = distinct !DISubprogram(name: "test_wait_32", scope: !9, file: !9, line: 186, type: !10, scopeLine: 187, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!68 = distinct !DILocation(line: 422, column: 2, scope: !8)
!69 = !DILocation(line: 188, column: 18, scope: !67, inlinedAt: !68)
!70 = !DILocation(line: 189, column: 2, scope: !67, inlinedAt: !68)
!71 = !DILocation(line: 604, column: 14, scope: !72, inlinedAt: !73)
!72 = distinct !DISubprogram(name: "ck_ec32_init", scope: !23, file: !23, line: 602, type: !10, scopeLine: 603, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!73 = distinct !DILocation(line: 191, column: 2, scope: !67, inlinedAt: !68)
!74 = !{!75, !76, i64 0}
!75 = !{!"ck_ec32", !76, i64 0}
!76 = !{!"int", !30, i64 0}
!77 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !80)
!78 = distinct !DISubprogram(name: "ck_pr_md_load_32", scope: !79, file: !79, line: 196, type: !10, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!79 = !DIFile(filename: "../../../include/gcc/x86_64/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "caff40debc1c9427348a405a2e1d8659")
!80 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !82)
!81 = distinct !DISubprogram(name: "ck_ec32_value", scope: !23, file: !23, line: 608, type: !10, scopeLine: 609, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!82 = distinct !DILocation(line: 192, column: 2, scope: !67, inlinedAt: !68)
!83 = !{i64 2147795245}
!84 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !82)
!85 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !88)
!86 = distinct !DISubprogram(name: "ck_pr_barrier", scope: !87, file: !87, line: 37, type: !10, scopeLine: 38, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!87 = !DIFile(filename: "../../../include/gcc/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "29d90103f3cc9c1099664f6ceb38293f")
!88 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !91)
!89 = distinct !DISubprogram(name: "ck_pr_fence_acquire", scope: !90, file: !90, line: 159, type: !10, scopeLine: 159, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!90 = !DIFile(filename: "../../../include/ck_pr.h", directory: "/cert-source/certifying-asm-lifter/vendor/ck-8f0847cfe57b1479d8e63b89028831d94d0e4d26/regressions/ck_ec/validate", checksumkind: CSK_MD5, checksum: "a04525ce1c6aca0c6489b709b33f6356")
!91 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !82)
!92 = !{i64 402399}
!93 = !DILocation(line: 192, column: 2, scope: !67, inlinedAt: !68)
!94 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !95)
!95 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !96)
!96 = distinct !DILocation(line: 773, column: 6, scope: !97, inlinedAt: !98)
!97 = distinct !DISubprogram(name: "ck_ec32_wait", scope: !23, file: !23, line: 768, type: !10, scopeLine: 772, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!98 = distinct !DILocation(line: 193, column: 2, scope: !67, inlinedAt: !68)
!99 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !96)
!100 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !101)
!101 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !102)
!102 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !96)
!103 = !DILocation(line: 773, column: 24, scope: !97, inlinedAt: !98)
!104 = !DILocation(line: 777, column: 9, scope: !97, inlinedAt: !98)
!105 = !DILocation(line: 193, column: 2, scope: !67, inlinedAt: !68)
!106 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !107)
!107 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !108)
!108 = distinct !DILocation(line: 773, column: 6, scope: !97, inlinedAt: !109)
!109 = distinct !DILocation(line: 194, column: 2, scope: !67, inlinedAt: !68)
!110 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !108)
!111 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !112)
!112 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !113)
!113 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !108)
!114 = !DILocation(line: 773, column: 24, scope: !97, inlinedAt: !109)
!115 = !DILocation(line: 777, column: 9, scope: !97, inlinedAt: !109)
!116 = !DILocation(line: 194, column: 2, scope: !67, inlinedAt: !68)
!117 = !DILocation(line: 197, column: 3, scope: !67, inlinedAt: !68)
!118 = !DILocation(line: 197, column: 25, scope: !67, inlinedAt: !68)
!119 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !120)
!120 = distinct !DILocation(line: 199, column: 3, scope: !67, inlinedAt: !68)
!121 = !DILocation(line: 199, column: 3, scope: !67, inlinedAt: !68)
!122 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !123)
!123 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !124)
!124 = distinct !DILocation(line: 773, column: 6, scope: !97, inlinedAt: !125)
!125 = distinct !DILocation(line: 200, column: 3, scope: !67, inlinedAt: !68)
!126 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !124)
!127 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !128)
!128 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !129)
!129 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !124)
!130 = !DILocation(line: 773, column: 24, scope: !97, inlinedAt: !125)
!131 = !DILocation(line: 777, column: 9, scope: !97, inlinedAt: !125)
!132 = !DILocation(line: 200, column: 3, scope: !67, inlinedAt: !68)
!133 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !134)
!134 = distinct !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !136)
!135 = distinct !DISubprogram(name: "ck_ec32_has_waiters", scope: !23, file: !23, line: 616, type: !10, scopeLine: 617, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!136 = distinct !DILocation(line: 201, column: 3, scope: !67, inlinedAt: !68)
!137 = !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !136)
!138 = !DILocation(line: 201, column: 3, scope: !67, inlinedAt: !68)
!139 = !DILocation(line: 202, column: 2, scope: !67, inlinedAt: !68)
!140 = !DILocation(line: 205, column: 1, scope: !67, inlinedAt: !68)
!141 = !DILocation(line: 210, column: 2, scope: !142, inlinedAt: !143)
!142 = distinct !DISubprogram(name: "test_wait_64", scope: !9, file: !9, line: 208, type: !10, scopeLine: 209, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!143 = distinct !DILocation(line: 424, column: 2, scope: !8)
!144 = !DILocation(line: 210, column: 18, scope: !142, inlinedAt: !143)
!145 = !DILocation(line: 211, column: 2, scope: !142, inlinedAt: !143)
!146 = !DILocation(line: 808, column: 14, scope: !147, inlinedAt: !148)
!147 = distinct !DISubprogram(name: "ck_ec64_init", scope: !23, file: !23, line: 806, type: !10, scopeLine: 807, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!148 = distinct !DILocation(line: 213, column: 2, scope: !142, inlinedAt: !143)
!149 = !{!150, !29, i64 0}
!150 = !{!"ck_ec64", !29, i64 0}
!151 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !153)
!152 = distinct !DISubprogram(name: "ck_pr_md_load_64", scope: !79, file: !79, line: 195, type: !10, scopeLine: 195, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!153 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !155)
!154 = distinct !DISubprogram(name: "ck_ec64_value", scope: !23, file: !23, line: 812, type: !10, scopeLine: 813, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!155 = distinct !DILocation(line: 214, column: 2, scope: !142, inlinedAt: !143)
!156 = !{i64 2147794836}
!157 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !158)
!158 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !159)
!159 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !155)
!160 = !DILocation(line: 214, column: 2, scope: !142, inlinedAt: !143)
!161 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !162)
!162 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !163)
!163 = distinct !DILocation(line: 912, column: 6, scope: !164, inlinedAt: !165)
!164 = distinct !DISubprogram(name: "ck_ec64_wait", scope: !23, file: !23, line: 907, type: !10, scopeLine: 911, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!165 = distinct !DILocation(line: 215, column: 2, scope: !142, inlinedAt: !143)
!166 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !167)
!167 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !168)
!168 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !163)
!169 = !DILocation(line: 912, column: 24, scope: !164, inlinedAt: !165)
!170 = !DILocation(line: 916, column: 9, scope: !164, inlinedAt: !165)
!171 = !DILocation(line: 215, column: 2, scope: !142, inlinedAt: !143)
!172 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !173)
!173 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !174)
!174 = distinct !DILocation(line: 912, column: 6, scope: !164, inlinedAt: !175)
!175 = distinct !DILocation(line: 216, column: 2, scope: !142, inlinedAt: !143)
!176 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !177)
!177 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !178)
!178 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !174)
!179 = !DILocation(line: 912, column: 24, scope: !164, inlinedAt: !175)
!180 = !DILocation(line: 916, column: 9, scope: !164, inlinedAt: !175)
!181 = !DILocation(line: 216, column: 2, scope: !142, inlinedAt: !143)
!182 = !DILocation(line: 219, column: 3, scope: !142, inlinedAt: !143)
!183 = !DILocation(line: 219, column: 25, scope: !142, inlinedAt: !143)
!184 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !185)
!185 = distinct !DILocation(line: 221, column: 3, scope: !142, inlinedAt: !143)
!186 = !DILocation(line: 221, column: 3, scope: !142, inlinedAt: !143)
!187 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !188)
!188 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !189)
!189 = distinct !DILocation(line: 912, column: 6, scope: !164, inlinedAt: !190)
!190 = distinct !DILocation(line: 222, column: 3, scope: !142, inlinedAt: !143)
!191 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !192)
!192 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !193)
!193 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !189)
!194 = !DILocation(line: 912, column: 24, scope: !164, inlinedAt: !190)
!195 = !DILocation(line: 916, column: 9, scope: !164, inlinedAt: !190)
!196 = !DILocation(line: 222, column: 3, scope: !142, inlinedAt: !143)
!197 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !198)
!198 = distinct !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !200)
!199 = distinct !DISubprogram(name: "ck_ec64_has_waiters", scope: !23, file: !23, line: 820, type: !10, scopeLine: 821, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!200 = distinct !DILocation(line: 223, column: 3, scope: !142, inlinedAt: !143)
!201 = !DILocation(line: 822, column: 37, scope: !199, inlinedAt: !200)
!202 = !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !200)
!203 = !DILocation(line: 223, column: 3, scope: !142, inlinedAt: !143)
!204 = !DILocation(line: 224, column: 2, scope: !142, inlinedAt: !143)
!205 = !DILocation(line: 227, column: 1, scope: !142, inlinedAt: !143)
!206 = !DILocation(line: 426, column: 2, scope: !8)
!207 = !DILocation(line: 253, column: 2, scope: !208, inlinedAt: !209)
!208 = distinct !DISubprogram(name: "test_wait_pred_32", scope: !9, file: !9, line: 251, type: !10, scopeLine: 252, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!209 = distinct !DILocation(line: 428, column: 2, scope: !8)
!210 = !DILocation(line: 253, column: 17, scope: !208, inlinedAt: !209)
!211 = !DILocation(line: 254, column: 2, scope: !208, inlinedAt: !209)
!212 = !DILocation(line: 254, column: 6, scope: !208, inlinedAt: !209)
!213 = !{!76, !76, i64 0}
!214 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !215)
!215 = distinct !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !216)
!216 = distinct !DILocation(line: 256, column: 2, scope: !208, inlinedAt: !209)
!217 = !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !216)
!218 = !DILocation(line: 256, column: 2, scope: !208, inlinedAt: !209)
!219 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !220)
!220 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !221)
!221 = distinct !DILocation(line: 797, column: 6, scope: !222, inlinedAt: !223)
!222 = distinct !DISubprogram(name: "ck_ec32_wait_pred", scope: !23, file: !23, line: 789, type: !10, scopeLine: 796, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!223 = distinct !DILocation(line: 257, column: 2, scope: !208, inlinedAt: !209)
!224 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !221)
!225 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !226)
!226 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !227)
!227 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !221)
!228 = !DILocation(line: 797, column: 24, scope: !222, inlinedAt: !223)
!229 = !DILocation(line: 801, column: 9, scope: !222, inlinedAt: !223)
!230 = !DILocation(line: 257, column: 2, scope: !208, inlinedAt: !209)
!231 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !232)
!232 = distinct !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !233)
!233 = distinct !DILocation(line: 258, column: 2, scope: !208, inlinedAt: !209)
!234 = !DILocation(line: 618, column: 9, scope: !135, inlinedAt: !233)
!235 = !DILocation(line: 258, column: 2, scope: !208, inlinedAt: !209)
!236 = !DILocation(line: 259, column: 2, scope: !208, inlinedAt: !209)
!237 = !DILocation(line: 261, column: 1, scope: !208, inlinedAt: !209)
!238 = !DILocation(line: 287, column: 2, scope: !239, inlinedAt: !240)
!239 = distinct !DISubprogram(name: "test_wait_pred_64", scope: !9, file: !9, line: 285, type: !10, scopeLine: 286, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!240 = distinct !DILocation(line: 430, column: 2, scope: !8)
!241 = !DILocation(line: 287, column: 24, scope: !239, inlinedAt: !240)
!242 = !DILocation(line: 288, column: 2, scope: !239, inlinedAt: !240)
!243 = !DILocation(line: 289, column: 2, scope: !239, inlinedAt: !240)
!244 = !DILocation(line: 289, column: 17, scope: !239, inlinedAt: !240)
!245 = !DILocation(line: 290, column: 2, scope: !239, inlinedAt: !240)
!246 = !DILocation(line: 290, column: 6, scope: !239, inlinedAt: !240)
!247 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !248)
!248 = distinct !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !249)
!249 = distinct !DILocation(line: 292, column: 2, scope: !239, inlinedAt: !240)
!250 = !DILocation(line: 822, column: 37, scope: !199, inlinedAt: !249)
!251 = !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !249)
!252 = !DILocation(line: 292, column: 2, scope: !239, inlinedAt: !240)
!253 = !DILocation(line: 759, column: 9, scope: !22, inlinedAt: !254)
!254 = distinct !DILocation(line: 293, column: 2, scope: !239, inlinedAt: !240)
!255 = !DILocation(line: 293, column: 2, scope: !239, inlinedAt: !240)
!256 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !257)
!257 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !258)
!258 = distinct !DILocation(line: 937, column: 6, scope: !259, inlinedAt: !260)
!259 = distinct !DISubprogram(name: "ck_ec64_wait_pred", scope: !23, file: !23, line: 929, type: !10, scopeLine: 936, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!260 = distinct !DILocation(line: 294, column: 2, scope: !239, inlinedAt: !240)
!261 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !262)
!262 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !263)
!263 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !258)
!264 = !DILocation(line: 937, column: 24, scope: !259, inlinedAt: !260)
!265 = !DILocation(line: 941, column: 9, scope: !259, inlinedAt: !260)
!266 = !DILocation(line: 294, column: 2, scope: !239, inlinedAt: !240)
!267 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !268)
!268 = distinct !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !269)
!269 = distinct !DILocation(line: 295, column: 2, scope: !239, inlinedAt: !240)
!270 = !DILocation(line: 822, column: 37, scope: !199, inlinedAt: !269)
!271 = !DILocation(line: 822, column: 9, scope: !199, inlinedAt: !269)
!272 = !DILocation(line: 295, column: 2, scope: !239, inlinedAt: !240)
!273 = !DILocation(line: 296, column: 2, scope: !239, inlinedAt: !240)
!274 = !DILocation(line: 298, column: 1, scope: !239, inlinedAt: !240)
!275 = !DILocation(line: 432, column: 2, scope: !8)
!276 = !DILocation(line: 434, column: 2, scope: !8)
!277 = !DILocation(line: 435, column: 2, scope: !8)
!278 = !DILocation(line: 437, column: 2, scope: !8)
!279 = !DILocation(line: 438, column: 2, scope: !8)
!280 = !DILocation(line: 440, column: 2, scope: !8)
!281 = !DILocation(line: 442, column: 2, scope: !8)
!282 = !DILocation(line: 443, column: 2, scope: !8)
!283 = !DILocation(line: 445, column: 2, scope: !8)
!284 = !DILocation(line: 446, column: 2, scope: !8)
!285 = !DILocation(line: 448, column: 2, scope: !8)
!286 = !DILocation(line: 449, column: 2, scope: !8)
!287 = distinct !DISubprogram(name: "test_update_counter_32", scope: !9, file: !9, line: 115, type: !10, scopeLine: 116, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!288 = !DILocation(line: 117, column: 2, scope: !287)
!289 = !DILocation(line: 117, column: 17, scope: !287)
!290 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !291)
!291 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !292)
!292 = distinct !DILocation(line: 119, column: 2, scope: !287)
!293 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !292)
!294 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !295)
!295 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !296)
!296 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !292)
!297 = !DILocation(line: 119, column: 2, scope: !287)
!298 = !DILocation(line: 669, column: 12, scope: !299, inlinedAt: !300)
!299 = distinct !DISubprogram(name: "ck_ec32_inc", scope: !23, file: !23, line: 624, type: !10, scopeLine: 626, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!300 = distinct !DILocation(line: 121, column: 2, scope: !287)
!301 = !{!302, !305, i64 8}
!302 = !{!"ck_ec_mode", !303, i64 0, !305, i64 8}
!303 = !{!"p1 _ZTS9ck_ec_ops", !304, i64 0}
!304 = !{!"any pointer", !30, i64 0}
!305 = !{!"_Bool", !30, i64 0}
!306 = !{i8 0, i8 2}
!307 = !DILocation(line: 0, scope: !299, inlinedAt: !300)
!308 = !DILocation(line: 669, column: 28, scope: !299, inlinedAt: !300)
!309 = !DILocation(line: 671, column: 3, scope: !299, inlinedAt: !300)
!310 = !{i64 2147937934}
!311 = !DILocation(line: 672, column: 2, scope: !299, inlinedAt: !300)
!312 = !DILocation(line: 674, column: 3, scope: !299, inlinedAt: !300)
!313 = !{i64 2147938051}
!314 = !DILocation(line: 678, column: 6, scope: !299, inlinedAt: !300)
!315 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!316 = !DILocation(line: 679, column: 26, scope: !299, inlinedAt: !300)
!317 = !{!302, !303, i64 0}
!318 = !DILocation(line: 679, column: 3, scope: !299, inlinedAt: !300)
!319 = !DILocation(line: 680, column: 2, scope: !299, inlinedAt: !300)
!320 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !321)
!321 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !322)
!322 = distinct !DILocation(line: 122, column: 2, scope: !287)
!323 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !322)
!324 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !325)
!325 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !326)
!326 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !322)
!327 = !DILocation(line: 122, column: 2, scope: !287)
!328 = !DILocation(line: 743, column: 12, scope: !329, inlinedAt: !330)
!329 = distinct !DISubprogram(name: "ck_ec32_add", scope: !23, file: !23, line: 738, type: !10, scopeLine: 741, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!330 = distinct !DILocation(line: 124, column: 17, scope: !287)
!331 = !DILocation(line: 0, scope: !329, inlinedAt: !330)
!332 = !DILocation(line: 743, column: 28, scope: !329, inlinedAt: !330)
!333 = !DILocation(line: 731, column: 2, scope: !334, inlinedAt: !335)
!334 = distinct !DISubprogram(name: "ck_ec32_add_sp", scope: !23, file: !23, line: 714, type: !10, scopeLine: 717, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!335 = distinct !DILocation(line: 744, column: 10, scope: !329, inlinedAt: !330)
!336 = !{i64 127442}
!337 = !DILocation(line: 695, column: 6, scope: !338, inlinedAt: !339)
!338 = distinct !DISubprogram(name: "ck_ec32_add_epilogue", scope: !23, file: !23, line: 686, type: !10, scopeLine: 689, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!339 = distinct !DILocation(line: 734, column: 9, scope: !334, inlinedAt: !335)
!340 = !DILocation(line: 309, column: 1, scope: !341, inlinedAt: !342)
!341 = distinct !DISubprogram(name: "ck_pr_faa_32", scope: !79, file: !79, line: 309, type: !10, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!342 = distinct !DILocation(line: 709, column: 8, scope: !343, inlinedAt: !344)
!343 = distinct !DISubprogram(name: "ck_ec32_add_mp", scope: !23, file: !23, line: 702, type: !10, scopeLine: 705, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!344 = distinct !DILocation(line: 748, column: 9, scope: !329, inlinedAt: !330)
!345 = !{i64 2147803880}
!346 = !DILocation(line: 695, column: 6, scope: !338, inlinedAt: !347)
!347 = distinct !DILocation(line: 710, column: 9, scope: !343, inlinedAt: !344)
!348 = !DILocation(line: 125, column: 2, scope: !287)
!349 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !350)
!350 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !351)
!351 = distinct !DILocation(line: 126, column: 2, scope: !287)
!352 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !351)
!353 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !354)
!354 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !355)
!355 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !351)
!356 = !DILocation(line: 126, column: 2, scope: !287)
!357 = !DILocation(line: 128, column: 1, scope: !287)
!358 = distinct !DISubprogram(name: "test_update_counter_64", scope: !9, file: !9, line: 131, type: !10, scopeLine: 132, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!359 = !DILocation(line: 133, column: 2, scope: !358)
!360 = !DILocation(line: 133, column: 17, scope: !358)
!361 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !362)
!362 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !363)
!363 = distinct !DILocation(line: 135, column: 2, scope: !358)
!364 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !365)
!365 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !366)
!366 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !363)
!367 = !DILocation(line: 135, column: 2, scope: !358)
!368 = !DILocation(line: 894, column: 12, scope: !369, inlinedAt: !370)
!369 = distinct !DISubprogram(name: "ck_ec64_add", scope: !23, file: !23, line: 889, type: !10, scopeLine: 892, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!370 = distinct !DILocation(line: 831, column: 8, scope: !371, inlinedAt: !372)
!371 = distinct !DISubprogram(name: "ck_ec64_inc", scope: !23, file: !23, line: 827, type: !10, scopeLine: 829, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!372 = distinct !DILocation(line: 137, column: 2, scope: !358)
!373 = !DILocation(line: 0, scope: !369, inlinedAt: !370)
!374 = !DILocation(line: 894, column: 28, scope: !369, inlinedAt: !370)
!375 = !DILocation(line: 877, column: 2, scope: !376, inlinedAt: !377)
!376 = distinct !DISubprogram(name: "ck_ec64_add_sp", scope: !23, file: !23, line: 860, type: !10, scopeLine: 863, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!377 = distinct !DILocation(line: 895, column: 10, scope: !369, inlinedAt: !370)
!378 = !{i64 131050}
!379 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !381)
!380 = distinct !DISubprogram(name: "ck_ec_add64_epilogue", scope: !23, file: !23, line: 835, type: !10, scopeLine: 838, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!381 = distinct !DILocation(line: 880, column: 9, scope: !376, inlinedAt: !377)
!382 = !DILocation(line: 308, column: 1, scope: !383, inlinedAt: !384)
!383 = distinct !DISubprogram(name: "ck_pr_faa_64", scope: !79, file: !79, line: 308, type: !10, scopeLine: 308, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!384 = distinct !DILocation(line: 855, column: 40, scope: !385, inlinedAt: !386)
!385 = distinct !DISubprogram(name: "ck_ec64_add_mp", scope: !23, file: !23, line: 848, type: !10, scopeLine: 851, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!386 = distinct !DILocation(line: 899, column: 9, scope: !369, inlinedAt: !370)
!387 = !{i64 2147803458}
!388 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !389)
!389 = distinct !DILocation(line: 855, column: 9, scope: !385, inlinedAt: !386)
!390 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !391)
!391 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !392)
!392 = distinct !DILocation(line: 138, column: 2, scope: !358)
!393 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !394)
!394 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !395)
!395 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !392)
!396 = !DILocation(line: 138, column: 2, scope: !358)
!397 = !DILocation(line: 894, column: 12, scope: !369, inlinedAt: !398)
!398 = distinct !DILocation(line: 140, column: 17, scope: !358)
!399 = !DILocation(line: 0, scope: !369, inlinedAt: !398)
!400 = !DILocation(line: 894, column: 28, scope: !369, inlinedAt: !398)
!401 = !DILocation(line: 877, column: 2, scope: !376, inlinedAt: !402)
!402 = distinct !DILocation(line: 895, column: 10, scope: !369, inlinedAt: !398)
!403 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !404)
!404 = distinct !DILocation(line: 880, column: 9, scope: !376, inlinedAt: !402)
!405 = !DILocation(line: 308, column: 1, scope: !383, inlinedAt: !406)
!406 = distinct !DILocation(line: 855, column: 40, scope: !385, inlinedAt: !407)
!407 = distinct !DILocation(line: 899, column: 9, scope: !369, inlinedAt: !398)
!408 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !409)
!409 = distinct !DILocation(line: 855, column: 9, scope: !385, inlinedAt: !407)
!410 = !DILocation(line: 141, column: 2, scope: !358)
!411 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !412)
!412 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !413)
!413 = distinct !DILocation(line: 142, column: 2, scope: !358)
!414 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !415)
!415 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !416)
!416 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !413)
!417 = !DILocation(line: 142, column: 2, scope: !358)
!418 = !DILocation(line: 144, column: 1, scope: !358)
!419 = !DISubprogram(name: "printf", scope: !420, file: !420, line: 370, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!420 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "1737dfad03570987edca7e059644f741")
!421 = distinct !DISubprogram(name: "test_threaded_inc_32", scope: !9, file: !9, line: 312, type: !10, scopeLine: 313, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!422 = !DILocation(line: 314, column: 2, scope: !421)
!423 = !DILocation(line: 314, column: 17, scope: !421)
!424 = !DILocation(line: 315, column: 2, scope: !421)
!425 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !427)
!426 = distinct !DISubprogram(name: "ck_pr_md_store_int", scope: !79, file: !79, line: 275, type: !10, scopeLine: 275, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!427 = distinct !DILocation(line: 317, column: 2, scope: !421)
!428 = !{i64 2147799345}
!429 = !DILocation(line: 319, column: 2, scope: !421)
!430 = !DILocation(line: 320, column: 2, scope: !421)
!431 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !433)
!432 = distinct !DISubprogram(name: "ck_pr_md_load_int", scope: !79, file: !79, line: 191, type: !10, scopeLine: 191, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!433 = distinct !DILocation(line: 322, column: 2, scope: !421)
!434 = !{i64 2147794024}
!435 = !DILocation(line: 322, column: 2, scope: !421)
!436 = !DILocation(line: 669, column: 12, scope: !299, inlinedAt: !437)
!437 = distinct !DILocation(line: 323, column: 2, scope: !421)
!438 = !DILocation(line: 0, scope: !299, inlinedAt: !437)
!439 = !DILocation(line: 669, column: 28, scope: !299, inlinedAt: !437)
!440 = !DILocation(line: 671, column: 3, scope: !299, inlinedAt: !437)
!441 = !DILocation(line: 672, column: 2, scope: !299, inlinedAt: !437)
!442 = !DILocation(line: 674, column: 3, scope: !299, inlinedAt: !437)
!443 = !DILocation(line: 678, column: 6, scope: !299, inlinedAt: !437)
!444 = !DILocation(line: 679, column: 26, scope: !299, inlinedAt: !437)
!445 = !DILocation(line: 679, column: 3, scope: !299, inlinedAt: !437)
!446 = !DILocation(line: 680, column: 2, scope: !299, inlinedAt: !437)
!447 = !DILocation(line: 325, column: 15, scope: !421)
!448 = !{!29, !29, i64 0}
!449 = !DILocation(line: 325, column: 2, scope: !421)
!450 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !451)
!451 = distinct !DILocation(line: 326, column: 2, scope: !421)
!452 = !DILocation(line: 326, column: 2, scope: !421)
!453 = !DILocation(line: 328, column: 1, scope: !421)
!454 = distinct !DISubprogram(name: "test_threaded_add_32", scope: !9, file: !9, line: 330, type: !10, scopeLine: 331, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!455 = !DILocation(line: 332, column: 2, scope: !454)
!456 = !DILocation(line: 332, column: 17, scope: !454)
!457 = !DILocation(line: 333, column: 2, scope: !454)
!458 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !459)
!459 = distinct !DILocation(line: 335, column: 2, scope: !454)
!460 = !DILocation(line: 337, column: 2, scope: !454)
!461 = !DILocation(line: 338, column: 2, scope: !454)
!462 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !463)
!463 = distinct !DILocation(line: 340, column: 2, scope: !454)
!464 = !DILocation(line: 340, column: 2, scope: !454)
!465 = !DILocation(line: 743, column: 12, scope: !329, inlinedAt: !466)
!466 = distinct !DILocation(line: 341, column: 2, scope: !454)
!467 = !DILocation(line: 0, scope: !329, inlinedAt: !466)
!468 = !DILocation(line: 743, column: 28, scope: !329, inlinedAt: !466)
!469 = !DILocation(line: 731, column: 2, scope: !334, inlinedAt: !470)
!470 = distinct !DILocation(line: 744, column: 10, scope: !329, inlinedAt: !466)
!471 = !DILocation(line: 695, column: 6, scope: !338, inlinedAt: !472)
!472 = distinct !DILocation(line: 734, column: 9, scope: !334, inlinedAt: !470)
!473 = !DILocation(line: 309, column: 1, scope: !341, inlinedAt: !474)
!474 = distinct !DILocation(line: 709, column: 8, scope: !343, inlinedAt: !475)
!475 = distinct !DILocation(line: 748, column: 9, scope: !329, inlinedAt: !466)
!476 = !DILocation(line: 695, column: 6, scope: !338, inlinedAt: !477)
!477 = distinct !DILocation(line: 710, column: 9, scope: !343, inlinedAt: !475)
!478 = !DILocation(line: 343, column: 15, scope: !454)
!479 = !DILocation(line: 343, column: 2, scope: !454)
!480 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !481)
!481 = distinct !DILocation(line: 344, column: 2, scope: !454)
!482 = !DILocation(line: 344, column: 2, scope: !454)
!483 = !DILocation(line: 346, column: 1, scope: !454)
!484 = distinct !DISubprogram(name: "test_threaded_inc_64", scope: !9, file: !9, line: 358, type: !10, scopeLine: 359, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!485 = !DILocation(line: 360, column: 2, scope: !484)
!486 = !DILocation(line: 360, column: 17, scope: !484)
!487 = !DILocation(line: 361, column: 2, scope: !484)
!488 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !489)
!489 = distinct !DILocation(line: 363, column: 2, scope: !484)
!490 = !DILocation(line: 365, column: 2, scope: !484)
!491 = !DILocation(line: 366, column: 2, scope: !484)
!492 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !493)
!493 = distinct !DILocation(line: 368, column: 2, scope: !484)
!494 = !DILocation(line: 368, column: 2, scope: !484)
!495 = !DILocation(line: 894, column: 12, scope: !369, inlinedAt: !496)
!496 = distinct !DILocation(line: 831, column: 8, scope: !371, inlinedAt: !497)
!497 = distinct !DILocation(line: 369, column: 2, scope: !484)
!498 = !DILocation(line: 0, scope: !369, inlinedAt: !496)
!499 = !DILocation(line: 894, column: 28, scope: !369, inlinedAt: !496)
!500 = !DILocation(line: 877, column: 2, scope: !376, inlinedAt: !501)
!501 = distinct !DILocation(line: 895, column: 10, scope: !369, inlinedAt: !496)
!502 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !503)
!503 = distinct !DILocation(line: 880, column: 9, scope: !376, inlinedAt: !501)
!504 = !DILocation(line: 308, column: 1, scope: !383, inlinedAt: !505)
!505 = distinct !DILocation(line: 855, column: 40, scope: !385, inlinedAt: !506)
!506 = distinct !DILocation(line: 899, column: 9, scope: !369, inlinedAt: !496)
!507 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !508)
!508 = distinct !DILocation(line: 855, column: 9, scope: !385, inlinedAt: !506)
!509 = !DILocation(line: 371, column: 15, scope: !484)
!510 = !DILocation(line: 371, column: 2, scope: !484)
!511 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !512)
!512 = distinct !DILocation(line: 372, column: 2, scope: !484)
!513 = !DILocation(line: 372, column: 2, scope: !484)
!514 = !DILocation(line: 374, column: 1, scope: !484)
!515 = distinct !DISubprogram(name: "test_threaded_add_64", scope: !9, file: !9, line: 376, type: !10, scopeLine: 377, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!516 = !DILocation(line: 378, column: 2, scope: !515)
!517 = !DILocation(line: 378, column: 17, scope: !515)
!518 = !DILocation(line: 379, column: 2, scope: !515)
!519 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !520)
!520 = distinct !DILocation(line: 381, column: 2, scope: !515)
!521 = !DILocation(line: 383, column: 2, scope: !515)
!522 = !DILocation(line: 384, column: 2, scope: !515)
!523 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !524)
!524 = distinct !DILocation(line: 386, column: 2, scope: !515)
!525 = !DILocation(line: 386, column: 2, scope: !515)
!526 = !DILocation(line: 894, column: 12, scope: !369, inlinedAt: !527)
!527 = distinct !DILocation(line: 387, column: 2, scope: !515)
!528 = !DILocation(line: 0, scope: !369, inlinedAt: !527)
!529 = !DILocation(line: 894, column: 28, scope: !369, inlinedAt: !527)
!530 = !DILocation(line: 877, column: 2, scope: !376, inlinedAt: !531)
!531 = distinct !DILocation(line: 895, column: 10, scope: !369, inlinedAt: !527)
!532 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !533)
!533 = distinct !DILocation(line: 880, column: 9, scope: !376, inlinedAt: !531)
!534 = !DILocation(line: 308, column: 1, scope: !383, inlinedAt: !535)
!535 = distinct !DILocation(line: 855, column: 40, scope: !385, inlinedAt: !536)
!536 = distinct !DILocation(line: 899, column: 9, scope: !369, inlinedAt: !527)
!537 = !DILocation(line: 841, column: 6, scope: !380, inlinedAt: !538)
!538 = distinct !DILocation(line: 855, column: 9, scope: !385, inlinedAt: !536)
!539 = !DILocation(line: 389, column: 15, scope: !515)
!540 = !DILocation(line: 389, column: 2, scope: !515)
!541 = !DILocation(line: 191, column: 1, scope: !432, inlinedAt: !542)
!542 = distinct !DILocation(line: 390, column: 2, scope: !515)
!543 = !DILocation(line: 390, column: 2, scope: !515)
!544 = !DILocation(line: 392, column: 1, scope: !515)
!545 = !DISubprogram(name: "__assert_fail", scope: !546, file: !546, line: 97, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!546 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "bbe4efabfb721e131b449362af198ed0")
!547 = !DISubprogram(name: "ck_ec32_wake", scope: !23, file: !23, line: 622, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = distinct !DISubprogram(name: "gettime", scope: !9, file: !9, line: 36, type: !10, scopeLine: 37, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!549 = !DILocation(line: 38, column: 2, scope: !548)
!550 = !DILocation(line: 39, column: 9, scope: !548)
!551 = !DILocation(line: 39, column: 2, scope: !548)
!552 = distinct !DISubprogram(name: "wait32", scope: !9, file: !9, line: 42, type: !10, scopeLine: 45, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!553 = !DILocation(line: 46, column: 2, scope: !552)
!554 = !{!555, !303, i64 32}
!555 = !{!"ck_ec_wait_state", !28, i64 0, !28, i64 16, !303, i64 32, !304, i64 40}
!556 = !DILocation(line: 47, column: 2, scope: !552)
!557 = !DILocation(line: 50, column: 2, scope: !552)
!558 = distinct !DISubprogram(name: "wait64", scope: !9, file: !9, line: 53, type: !10, scopeLine: 56, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!559 = !DILocation(line: 59, column: 2, scope: !558)
!560 = !DILocation(line: 70, column: 22, scope: !558)
!561 = !DILocation(line: 69, column: 2, scope: !558)
!562 = !DILocation(line: 73, column: 1, scope: !558)
!563 = distinct !DISubprogram(name: "wake32", scope: !9, file: !9, line: 75, type: !10, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!564 = !DILocation(line: 77, column: 2, scope: !563)
!565 = !DILocation(line: 78, column: 2, scope: !563)
!566 = !DILocation(line: 81, column: 2, scope: !563)
!567 = distinct !DISubprogram(name: "wake64", scope: !9, file: !9, line: 84, type: !10, scopeLine: 85, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!568 = !DILocation(line: 88, column: 2, scope: !567)
!569 = !DILocation(line: 98, column: 2, scope: !567)
!570 = !DILocation(line: 102, column: 1, scope: !567)
!571 = !DISubprogram(name: "clock_gettime", scope: !572, file: !572, line: 297, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!572 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "76901d42113d78fcd31949a25b853122")
!573 = !DISubprogram(name: "syscall", scope: !574, file: !574, line: 1091, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "e3970d43902e72178fdcc8f9ee12106a")
!575 = !DISubprogram(name: "ck_ec64_wake", scope: !23, file: !23, line: 825, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!576 = !DISubprogram(name: "ck_ec_deadline_impl", scope: !23, file: !23, line: 751, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!577 = !DISubprogram(name: "ck_ec32_wait_slow", scope: !23, file: !23, line: 763, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DISubprogram(name: "ck_ec64_wait_slow", scope: !23, file: !23, line: 902, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!579 = distinct !DISubprogram(name: "pred", scope: !9, file: !9, line: 230, type: !10, scopeLine: 232, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!580 = !DILocation(line: 233, column: 35, scope: !579)
!581 = !{!555, !29, i64 0}
!582 = !DILocation(line: 233, column: 22, scope: !579)
!583 = !DILocation(line: 234, column: 26, scope: !579)
!584 = !{!555, !29, i64 8}
!585 = !DILocation(line: 234, column: 13, scope: !579)
!586 = !DILocation(line: 233, column: 42, scope: !579)
!587 = !DILocation(line: 235, column: 22, scope: !579)
!588 = !{!555, !304, i64 40}
!589 = !DILocation(line: 238, column: 19, scope: !579)
!590 = !DILocation(line: 238, column: 9, scope: !579)
!591 = !DILocation(line: 238, column: 45, scope: !579)
!592 = !DILocation(line: 238, column: 35, scope: !579)
!593 = !DILocation(line: 238, column: 26, scope: !579)
!594 = !DILocation(line: 238, column: 53, scope: !579)
!595 = !DILocation(line: 237, column: 2, scope: !579)
!596 = !DILocation(line: 240, column: 14, scope: !579)
!597 = !DILocation(line: 240, column: 17, scope: !579)
!598 = !DILocation(line: 0, scope: !579)
!599 = !DILocation(line: 245, column: 1, scope: !579)
!600 = !DISubprogram(name: "ck_ec32_wait_pred_slow", scope: !23, file: !23, line: 780, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = distinct !DISubprogram(name: "pred2", scope: !9, file: !9, line: 264, type: !10, scopeLine: 266, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!602 = !DILocation(line: 267, column: 35, scope: !601)
!603 = !DILocation(line: 267, column: 22, scope: !601)
!604 = !DILocation(line: 268, column: 26, scope: !601)
!605 = !DILocation(line: 268, column: 13, scope: !601)
!606 = !DILocation(line: 267, column: 42, scope: !601)
!607 = !DILocation(line: 269, column: 22, scope: !601)
!608 = !DILocation(line: 272, column: 19, scope: !601)
!609 = !DILocation(line: 272, column: 9, scope: !601)
!610 = !DILocation(line: 272, column: 45, scope: !601)
!611 = !DILocation(line: 272, column: 35, scope: !601)
!612 = !DILocation(line: 272, column: 26, scope: !601)
!613 = !DILocation(line: 272, column: 53, scope: !601)
!614 = !DILocation(line: 271, column: 2, scope: !601)
!615 = !DILocation(line: 274, column: 21, scope: !601)
!616 = !{i64 0, i64 8, !448, i64 8, i64 8, !448}
!617 = !DILocation(line: 275, column: 18, scope: !601)
!618 = !DILocation(line: 277, column: 10, scope: !601)
!619 = !DILocation(line: 278, column: 2, scope: !601)
!620 = !DISubprogram(name: "ck_ec64_wait_pred_slow", scope: !23, file: !23, line: 919, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!621 = !DISubprogram(name: "pthread_create", scope: !622, file: !622, line: 202, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!622 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "c665ae672368d86b0545524d35407e96")
!623 = distinct !DISubprogram(name: "test_threaded_32_waiter", scope: !9, file: !9, line: 303, type: !10, scopeLine: 304, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!624 = !DILocation(line: 196, column: 1, scope: !78, inlinedAt: !625)
!625 = distinct !DILocation(line: 610, column: 17, scope: !81, inlinedAt: !626)
!626 = distinct !DILocation(line: 773, column: 6, scope: !97, inlinedAt: !627)
!627 = distinct !DILocation(line: 307, column: 2, scope: !623)
!628 = !DILocation(line: 610, column: 45, scope: !81, inlinedAt: !626)
!629 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !630)
!630 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !631)
!631 = distinct !DILocation(line: 612, column: 2, scope: !81, inlinedAt: !626)
!632 = !DILocation(line: 773, column: 24, scope: !97, inlinedAt: !627)
!633 = !DILocation(line: 777, column: 9, scope: !97, inlinedAt: !627)
!634 = !DILocation(line: 777, column: 2, scope: !97, inlinedAt: !627)
!635 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !636)
!636 = distinct !DILocation(line: 308, column: 2, scope: !623)
!637 = !DILocation(line: 309, column: 2, scope: !623)
!638 = !DISubprogram(name: "usleep", scope: !574, file: !574, line: 480, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!639 = !DISubprogram(name: "pthread_join", scope: !622, file: !622, line: 219, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!640 = distinct !DISubprogram(name: "test_threaded_64_waiter", scope: !9, file: !9, line: 349, type: !10, scopeLine: 350, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!641 = !DILocation(line: 195, column: 1, scope: !152, inlinedAt: !642)
!642 = distinct !DILocation(line: 814, column: 17, scope: !154, inlinedAt: !643)
!643 = distinct !DILocation(line: 912, column: 6, scope: !164, inlinedAt: !644)
!644 = distinct !DILocation(line: 353, column: 2, scope: !640)
!645 = !DILocation(line: 40, column: 2, scope: !86, inlinedAt: !646)
!646 = distinct !DILocation(line: 159, column: 1, scope: !89, inlinedAt: !647)
!647 = distinct !DILocation(line: 816, column: 2, scope: !154, inlinedAt: !643)
!648 = !DILocation(line: 912, column: 24, scope: !164, inlinedAt: !644)
!649 = !DILocation(line: 916, column: 9, scope: !164, inlinedAt: !644)
!650 = !DILocation(line: 916, column: 2, scope: !164, inlinedAt: !644)
!651 = !DILocation(line: 275, column: 1, scope: !426, inlinedAt: !652)
!652 = distinct !DILocation(line: 354, column: 2, scope: !640)
!653 = !DILocation(line: 355, column: 2, scope: !640)
