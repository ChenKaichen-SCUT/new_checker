__asm__ __volatile__(
		"lock; incl %0"
			: "=m"(*__hp(4, addr))
			:
			: "memory");