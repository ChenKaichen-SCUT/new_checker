__asm__ __volatile__ ("lock; cmpxchg %3, %0"
                        : "+m" (*addr), "=@ccz" (result), "=a" (dummy)
                        : "r" (new_val), "a" (old)
                        : "memory");