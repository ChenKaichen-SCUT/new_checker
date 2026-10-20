__asm__ __volatile__(
		"xchgq %0, %1"
			: "=r"(result), "+m"(*__hp(8, addr))
			: "0" ((unsigned long)val)
			: "memory");