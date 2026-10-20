__asm__ __volatile__(
		"lock; xaddl %1, %0"
			: "+m"(*__hp(4, addr)), "+r" (result)
			:
			: "memory");