__asm__ __volatile__(
		"lock; decq %0"
			: "=m"(*__hp(8, addr))
			:
			: "memory");