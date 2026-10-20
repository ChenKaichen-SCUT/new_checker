__asm__ __volatile__(
		"lock; xaddb %1, %0"
			: "+m"(*__hp(1, addr)), "+q" (result)
			:
			: "memory");