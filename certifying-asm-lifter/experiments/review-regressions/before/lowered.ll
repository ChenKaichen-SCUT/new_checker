target triple = "x86_64-pc-linux-gnu"
define i32 @lowered(i32* %p) {
  %lift1 = add i32 0, 0
  %lift0 = atomicrmw xchg i32* %p, i32 %lift1 monotonic
 ret i32 %lift0
}
