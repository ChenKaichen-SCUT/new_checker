__asm__ __volatile__ ("lock; xorb %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");