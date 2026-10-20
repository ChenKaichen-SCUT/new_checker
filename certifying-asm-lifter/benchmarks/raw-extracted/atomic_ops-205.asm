__asm__ __volatile__ ("lock; andb %1, %0"
                        : "+m" (*p)
                        : "r" (value)
                        : "memory");