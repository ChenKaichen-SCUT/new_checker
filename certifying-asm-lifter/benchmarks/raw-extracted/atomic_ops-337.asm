__asm__ __volatile__ ("lock; cmpxchgb %3, %1"
                            : "=a" (fetched_val), "+m" (*addr)
                            : "a" (old_val), "q" (new_val)
                            : "memory");