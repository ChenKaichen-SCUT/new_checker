/* Minimal reproducible GNU-asm input. No headers needed for LLVM generation.
 * With EXPECT=2 the assertion is safe; with EXPECT=0 it is violated.
 * Thread creation succeeds in the verifier model used in this experiment.
 */
typedef unsigned long pthread_t;
extern int pthread_create(pthread_t *, const void *, void *(*)(void *), void *);
extern int pthread_join(pthread_t, void **);
extern void __VERIFIER_assert(int);
#ifndef EXPECT
#define EXPECT 2
#endif
unsigned int x;

void *worker(void *unused)
{
    unsigned int *ptr = &x;
    unsigned int delta = 1;
    __asm__ __volatile__("lock; xaddl %0,%1"
                         : "+r"(delta), "+m"(*ptr)
                         :
                         : "memory", "cc");
    return (void *)0;
}

int main(void)
{
    pthread_t t0, t1;
    pthread_create(&t0, (const void *)0, worker, (void *)0);
    pthread_create(&t1, (const void *)0, worker, (void *)0);
    pthread_join(t0, (void **)0);
    pthread_join(t1, (void **)0);
    __VERIFIER_assert(x == EXPECT);
    return 0;
}
