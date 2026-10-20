__asm__ __volatile__ ("lock; cmpxchg %2, %0; setz %1"
                        : "+m" (*addr), "=a" (result)
                        : "r" (new_val), "a" (old)
                        : "memory");