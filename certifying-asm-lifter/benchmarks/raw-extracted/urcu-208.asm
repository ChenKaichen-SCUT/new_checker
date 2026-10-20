__asm__ __volatile__(
		"lock; xaddw %1, %0"
			: "+m"(*__hp(2, addr)), "+r" (result)
			:
			: "memory");