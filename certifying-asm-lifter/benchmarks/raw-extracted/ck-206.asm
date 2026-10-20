__asm__ __volatile__("movq %%rdx, %%rcx;"
			     "movq %%rax, %%rbx;"
			     CK_PR_LOCK_PREFIX "cmpxchg16b %2;"
				: "=a" (v[0]),
				  "=d" (v[1])
				: "m" (*(const uint64_t *)target)
				: "rbx", "rcx", "memory", "cc");