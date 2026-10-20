__asm__ __volatile__ ("lock; cmpxchg8b %0"
                        : "+m" (*addr), "=@ccz" (result),
                          "+d" (old_val2), "+a" (old_val1)
                        : "c" (new_val2), "b" (new_val1)
                        : "memory");