__asm__ __volatile__("prefetchw (%0)"
	    :
	    : "r" (m)
	    : "memory");