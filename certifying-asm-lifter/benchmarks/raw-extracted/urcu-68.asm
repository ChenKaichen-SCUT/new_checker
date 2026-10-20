__asm__ __volatile__(
		"lock; cmpxchgb %2, %1"
			: "+a"(result), "+m"(*__hp(1, addr))
			: "q"((unsigned char)_new)
			: "memory");