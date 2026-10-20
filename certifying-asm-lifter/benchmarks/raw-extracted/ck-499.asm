__asm__ __volatile__("movq 0(%4), %%rax;"
			     "movq 8(%4), %%rdx;"
			     CK_PR_LOCK_PREFIX "cmpxchg16b %0; setz %1"
				: "+m" (*target),
				  "=q" (z)
				: "b"  (set[0]),
				  "c"  (set[1]),
				  "q"  (compare)
				: "memory", "cc", "%rax", "%rdx");