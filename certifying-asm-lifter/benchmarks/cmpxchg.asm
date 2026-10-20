__asm__ __volatile__("lock cmpxchgl %2,%1" : "+a"(expected), "+m"(*ptr) : "r"(desired) : "memory", "cc");
