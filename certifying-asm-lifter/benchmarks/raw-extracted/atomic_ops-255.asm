__asm__ __volatile__ ("lock; xorw %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");