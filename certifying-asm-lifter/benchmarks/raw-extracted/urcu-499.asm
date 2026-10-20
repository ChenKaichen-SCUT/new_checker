__asm__ __volatile__(
		"lock; decl %0"
			: "=m"(*__hp(4, addr))
			:
			: "memory");