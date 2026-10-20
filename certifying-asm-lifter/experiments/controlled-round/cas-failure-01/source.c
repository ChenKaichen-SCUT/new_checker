typedef unsigned long pthread_t;
extern int pthread_create(pthread_t *, const void *, void *(*)(void *), void *);
extern int pthread_join(pthread_t, void **);
extern void __VERIFIER_assert(int);
unsigned int x = 1;
void *worker(void *unused) {
    unsigned int *ptr = &x;
    unsigned int expected = 0;
    unsigned int desired = 2;
    __asm__ __volatile__("lock; cmpxchgl %2,%1"
        : "+a"(expected), "+m"(*ptr) : "r"(desired) : "memory", "cc");
    __VERIFIER_assert(expected == 1);
    return (void *)0;
}
int main(void) {
    pthread_t t0;
    pthread_create(&t0, 0, worker, 0);
    pthread_join(t0, 0);
    __VERIFIER_assert(x == 1);
    return 0;
}
