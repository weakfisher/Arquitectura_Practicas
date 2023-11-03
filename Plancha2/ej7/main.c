#include <stdio.h>

unsigned long fact1p(unsigned long);
unsigned long fact2p(unsigned long);

int main(void) { 

    unsigned long x;
    scanf("%lu", &x);
    printf("fact1: %lu\n", fact1p(x));
    printf("fact2: %lu\n", fact2p(x));
    return 0;

}
