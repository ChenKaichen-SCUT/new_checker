__asm__ __volatile__(
		"lock; cmpxchgw %2, %1"
			: "+a"(result), "+m"(*__hp(2, addr))
			: "r"((unsigned short)_new)
			: "memory");