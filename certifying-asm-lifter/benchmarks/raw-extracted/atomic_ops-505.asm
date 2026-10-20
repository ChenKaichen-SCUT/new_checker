__asm__ __volatile__("mov %%edi, %3\n\t" /* save edi */
                             "mov %%ebx, %2\n\t" /* save ebx */
                             "lea %0, %%edi\n\t" /* in case addr is in ebx */
                             "mov %8, %%ebx\n\t" /* load new_val1 */
                             "lock; cmpxchg8b (%%edi)\n\t"
                             "mov %2, %%ebx\n\t" /* restore ebx */
                             "mov %3, %%edi\n\t" /* restore edi */
                             "setz %1"
                        : "+m" (*addr), "=a" (result),
                          "=m" (saved_ebx), "=m" (saved_edi), "=d" (dummy)
                        : "d" (old_val2), "a" (old_val1),
                          "c" (new_val2), "m" (new_val1)
                        : "memory");