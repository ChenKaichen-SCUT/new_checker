__asm__ __volatile__(
		"lock; addb %1, %0"
			: "=m"(*__hp(1, addr))
			: "iq" ((unsigned char)val)
			: "memory");