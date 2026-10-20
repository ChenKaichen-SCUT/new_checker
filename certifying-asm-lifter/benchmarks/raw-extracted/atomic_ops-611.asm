__asm__ __volatile__("lock; cmpxchg16b %0; setz %1"
                        : "+m" (*addr), "=a" (result), "=d" (dummy)
                        : "d" (old_val2), "a" (old_val1),
                          "c" (new_val2), "b" (new_val1)
                        : "memory");