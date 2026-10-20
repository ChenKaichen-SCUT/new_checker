__asm__ __volatile__(
		"lock; xaddq %1, %0"
			: "+m"(*__hp(8, addr)), "+r" (result)
			:
			: "memory");