__asm__ __volatile__(
		"lock; incw %0"
			: "=m"(*__hp(2, addr))
			:
			: "memory");