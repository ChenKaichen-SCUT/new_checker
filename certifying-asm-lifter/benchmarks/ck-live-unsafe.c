#include <ck_pr.h>
typedef unsigned long pthread_t;
extern int pthread_create(pthread_t *, const void *, void *(*)(void *), void *);
extern int pthread_join(pthread_t, void **);
extern void __VERIFIER_assert(int);

uint32_t x;
void *worker(void *unused) {
    uint32_t old = ck_pr_faa_32(&x, 1);
    __VERIFIER_assert(old != 2);
    return (void *)0;
}
int main(void) {
    pthread_t t0, t1;
    pthread_create(&t0, 0, worker, 0);
    pthread_create(&t1, 0, worker, 0);
    pthread_join(t0, 0);
    pthread_join(t1, 0);
    __VERIFIER_assert(x != 2);
    return 0;
}
