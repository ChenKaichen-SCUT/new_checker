__asm__ __volatile__(
		"lock; andl %1, %0"
			: "=m"(*__hp(4, addr))
			: "ir" ((unsigned int)val)
			: "memory");