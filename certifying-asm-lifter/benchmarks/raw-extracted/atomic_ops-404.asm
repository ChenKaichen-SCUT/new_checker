__asm__ __volatile__ ("lock; andl %1, %0"
                            : "+m" (*p)
                            : "r" (value)
                            : "memory");