__asm__ __volatile__(CK_PR_LOCK_PREFIX "cmpxchg16b %0;"
			     "setz %3"
				: "+m" (*target),
				  "=a" (v[0]),
				  "=d" (v[1]),
				  "=q" (z)
				: "a" (compare[0]),
				  "d" (compare[1]),
				  "b" (set[0]),
				  "c" (set[1])
				: "memory", "cc");