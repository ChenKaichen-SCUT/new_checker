__asm__ __volatile__(
		"xchgw %0, %1"
			: "=r"(result), "+m"(*__hp(2, addr))
			: "0" ((unsigned short)val)
			: "memory");