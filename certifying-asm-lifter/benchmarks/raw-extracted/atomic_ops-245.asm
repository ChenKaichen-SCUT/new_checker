__asm__ __volatile__ ("lock; orw %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");