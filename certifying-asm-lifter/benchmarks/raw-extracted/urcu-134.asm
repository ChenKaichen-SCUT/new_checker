__asm__ __volatile__(
		"xchgb %0, %1"
			: "=q"(result), "+m"(*__hp(1, addr))
			: "0" ((unsigned char)val)
			: "memory");