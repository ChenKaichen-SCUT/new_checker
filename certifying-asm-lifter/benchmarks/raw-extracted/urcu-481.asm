__asm__ __volatile__(
		"lock; decb %0"
			: "=m"(*__hp(1, addr))
			:
			: "memory");