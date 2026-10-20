__asm__ __volatile__(
		"lock; cmpxchgq %2, %1"
			: "+a"(result), "+m"(*__hp(8, addr))
			: "r"((unsigned long)_new)
			: "memory");