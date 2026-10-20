__asm__ __volatile__(
		"lock; addw %1, %0"
			: "=m"(*__hp(2, addr))
			: "ir" ((unsigned short)val)
			: "memory");