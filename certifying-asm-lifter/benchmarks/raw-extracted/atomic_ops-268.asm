__asm__ __volatile__ ("xchgb %0, %1"
                        : "=q" (oldval), "+m" (*addr)
                        : "0" ((unsigned char)0xff)
                        : "memory");