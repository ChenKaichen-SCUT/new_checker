__asm__ __volatile__ ("lock; cmpxchgl %3, %1"
                            : "=a" (fetched_val), "+m" (*addr)
                            : "a" (old_val), "r" (new_val)
                            : "memory");