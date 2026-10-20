__asm__ __volatile__(
		"lock; incb %0"
			: "=m"(*__hp(1, addr))
			:
			: "memory");