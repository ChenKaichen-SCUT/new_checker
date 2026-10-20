__asm__ __volatile__(
		"lock; incq %0"
			: "=m"(*__hp(8, addr))
			:
			: "memory");