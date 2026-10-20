__asm__ __volatile__ ("lock; xadd %0, %1"
                        : "=r" (result), "+m" (*p)
                        : "0" (incr)
                        : "memory");