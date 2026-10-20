__asm__ __volatile__ ("lock; orl %1, %0"
                            : "+m" (*p)
                            : "r" (value)
                            : "memory");