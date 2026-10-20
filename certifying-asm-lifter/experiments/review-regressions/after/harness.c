#include <stdint.h>
#include <stdio.h>
uint32_t original(uint32_t*); uint32_t lowered(uint32_t*);
int main(void) { uint32_t a=7,b=7; uint32_t x=original(&a),y=lowered(&b);
printf("source: memory=%u return=%u\nlowered: memory=%u return=%u\n",a,x,b,y);
return a!=b || x!=y; }
