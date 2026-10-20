__asm__ __volatile__ ("lock; xaddb %0, %1"
                        : "=q" (result), "+m" (*p)
                        : "0" (incr)
                        : "memory");