/* Frozen controlled input: two exclusive source calls, live return. */
typedef unsigned long pthread_t;
extern int pthread_create(pthread_t *, const void *, void *(*)(void *), void *);
extern int pthread_join(pthread_t, void **);
extern void __VERIFIER_assert(int);
unsigned int x;
unsigned int input_a = 0;
unsigned int input_b = 1;
static __attribute__((always_inline)) inline unsigned int faa(unsigned int *ptr, unsigned int delta) {
    __asm__ __volatile__("lock; xaddl %0,%1" : "+r"(delta), "+m"(*ptr) : : "memory", "cc");
    return delta;
}
void *worker(void *input) {
    unsigned int *p = (unsigned int *)input;
    unsigned int flag = *p;
    unsigned int old;
    if (flag) old = faa(&x, 1); else old = faa(&x, 2);
    __VERIFIER_assert(old != 42u);
    return (void *)0;
}
int main(void) {
    pthread_t a, b;
    pthread_create(&a, 0, worker, &input_a);
    pthread_create(&b, 0, worker, &input_b);
    pthread_join(a, 0);
    pthread_join(b, 0);
    __VERIFIER_assert(x == 3u);
    return 0;
}
