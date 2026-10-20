#include <stdint.h>
uint32_t original(uint32_t *p) {
uint32_t result;
__asm__ __volatile__("movl $0,%0; lock xaddl %0,%1"
 : "=&r"(result), "+m"(*p) : : "cc", "memory");
return result;
}
