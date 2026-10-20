__asm__ __volatile__(
		"lock; decw %0"
			: "=m"(*__hp(2, addr))
			:
			: "memory");