__asm__ __volatile__(
		"xchgl %0, %1"
			: "=r"(result), "+m"(*__hp(4, addr))
			: "0" ((unsigned int)val)
			: "memory");