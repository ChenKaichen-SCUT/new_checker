__asm__ __volatile__ ("lock; xaddw %0, %1"
                        : "=r" (result), "+m" (*p)
                        : "0" (incr)
                        : "memory");