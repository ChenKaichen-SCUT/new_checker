target triple = "x86_64-pc-linux-gnu"
define i32 @lowered(i32* %p) {
  %lift0 = atomicrmw add i32* %p, i32 0 monotonic
 ret i32 %lift0
}
