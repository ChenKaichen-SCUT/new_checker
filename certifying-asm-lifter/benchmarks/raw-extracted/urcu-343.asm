__asm__ __volatile__(
		"lock; orq %1, %0"
			: "=m"(*__hp(8, addr))
			: "er" ((unsigned long)val)
			: "memory");