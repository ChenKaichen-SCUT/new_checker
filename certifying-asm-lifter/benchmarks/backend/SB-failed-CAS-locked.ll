target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@x = global i32 0, align 4
@y = global i32 0, align 4
@z0 = global i32 0, align 4
@z1 = global i32 0, align 4
@r0 = global i32 0, align 4
@r1 = global i32 0, align 4
declare i32 @pthread_create(i64*, i8*, i8* (i8*)*, i8*)
declare i32 @pthread_join(i64, i8**)
declare void @__VERIFIER_assert(i32)
define i8* @thread0(i8* %arg) {
  store atomic i32 1, i32* @x monotonic, align 4
  %cas00 = cmpxchg i32* @z0, i32 1, i32 2 monotonic monotonic
  %cas01 = extractvalue {i32, i1} %cas00, 0
  %v = load atomic i32, i32* @y monotonic, align 4
  store i32 %v, i32* @r0, align 4
  ret i8* null
}
define i8* @thread1(i8* %arg) {
  store atomic i32 1, i32* @y monotonic, align 4
  %cas10 = cmpxchg i32* @z1, i32 1, i32 2 monotonic monotonic
  %cas11 = extractvalue {i32, i1} %cas10, 0
  %v = load atomic i32, i32* @x monotonic, align 4
  store i32 %v, i32* @r1, align 4
  ret i8* null
}
define i32 @main() {
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %c0 = call i32 @pthread_create(i64* %t0, i8* null, i8* (i8*)* @thread0, i8* null)
  %c1 = call i32 @pthread_create(i64* %t1, i8* null, i8* (i8*)* @thread1, i8* null)
  %id0 = load i64, i64* %t0
  %id1 = load i64, i64* %t1
  %j0 = call i32 @pthread_join(i64 %id0, i8** null)
  %j1 = call i32 @pthread_join(i64 %id1, i8** null)
  %a = load i32, i32* @r0
  %b = load i32, i32* @r1
  %ca = icmp eq i32 %a, 0
  %cb = icmp eq i32 %b, 0
  %bad = and i1 %ca, %cb
  %ok = xor i1 %bad, true
  %ok32 = zext i1 %ok to i32
  call void @__VERIFIER_assert(i32 %ok32)
  ret i32 0
}
