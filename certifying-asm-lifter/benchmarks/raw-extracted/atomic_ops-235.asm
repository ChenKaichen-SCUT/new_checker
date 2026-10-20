__asm__ __volatile__ ("lock; andw %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");