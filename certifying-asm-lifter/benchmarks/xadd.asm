__asm__ __volatile__("lock; xaddl %0,%1" : "+r"(delta), "+m"(*ptr) : : "memory", "cc");
