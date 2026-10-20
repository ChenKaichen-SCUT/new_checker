__asm__ __volatile__ ("lock; or %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");