__asm__ __volatile__(
		"lock; cmpxchgl %2, %1"
			: "+a"(result), "+m"(*__hp(4, addr))
			: "r"((unsigned int)_new)
			: "memory");