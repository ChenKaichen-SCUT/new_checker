typedef unsigned long pthread_t;
extern int pthread_create(pthread_t *, const void *, void *(*)(void *), void *);
extern int pthread_join(pthread_t, void **);
extern void __VERIFIER_assert(int);

unsigned int x;
void *worker(void *unused) {
    unsigned int *ptr = &x;
    unsigned int delta = 1;
    __asm__ __volatile__("lock; xaddl %0,%1"
        : "+r"(delta), "+m"(*ptr) : : "memory", "cc");
    if (delta == 0) x = 7;
    __VERIFIER_assert(delta != 2);
    return (void *)0;
}
int main(void) {
    pthread_t t0, t1;
    pthread_create(&t0, 0, worker, 0);
    pthread_create(&t1, 0, worker, 0);
    pthread_join(t0, 0);
    pthread_join(t1, 0);
    __VERIFIER_assert(x == 2);
    return 0;
}
