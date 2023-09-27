#include<stdio.h>
#include<ieee754.h>

/*

6.225 a float:

1 -> Pasar a binario: (6.225)₁₀ = (110.001110011001100110011)₂ (redondeado)
2 -> Normalizar: (110.001110011001100110011)₂ * 2^0 = (1.10001110011001100110011)₂ * 2^2
3 -> Significante: (1.10001110011001100110011)₂ (Sin contar el primer 1 y el punto).
5 -> Exponente a binario: (129)₁₀ = (10000001)₂
6 -> Signo: s = (0)₂

Finalmente resulta: (6.225)₁₀ convertido a IEEE 754 simple:

(6.225)₁₀ = (01000000110001110011001100110011)₂

(Se comete error de representacion)

-----------------------------------------------------------------------------------------------------

6.225 a double:

1 -> Pasar a binario: (6.225)₁₀ = (110.00111001100110011001100110011001100110011001100110)₂ (redondeado)
2 -> Normalizar: (110.00111001100110011001100110011001100110011001100110)₂ * 2^0 = (1.1000111001100110011001100110011001100110011001100110)₂ * 2^2
3 -> Significante: (1.1000111001100110011001100110011001100110011001100110)₂ (Sin contar el primer 1 y el punto).
4 -> Exponente: E = 2 + 1023 = 1025
5 -> Exponente a binario: (1025)₁₀ = (10000000001)
6 -> Signo: s = (0)₂

Finalmente resulta: (6.225)₁₀ convertido a IEEE 754 doble:

(6.225)₁₀ = (0100000000011000111001100110011001100110011001100110011001100110)₂

(Se comete error de representacion)

*/

void printbin_64(long n);
void printbin_32(int n);
unsigned long int extr_fraccion_doble(double num);

int main(void) {

    union ieee754_float a;
    union ieee754_double b;

    a.f = 6.225;
    b.d = 6.225;

    printf("6.255 pasado a float: 0|10000001|10001110011001100110011\n");
    printf("Comprobacion con cabecera ieee754.h:\n");
    printf("Signo 6.225 -> %d\n", a.ieee.negative);
    printf("Exponente 6.225 (8 bits desde el primer 1) -> ");
    printbin_32(a.ieee.exponent);
    printf("Significante 6.225 (23 bits desde el primer 1) -> ");
    printbin_32(a.ieee.mantissa);

    printf("---------------------------------------------------------------\n");


    printf("6.255 pasado a double: 0|10000000001|1000111001100110011001100110011001100110011001100110\n");
    printf("Comprobacion con cabecera ieee754.h y func propia:\n");
    printf("Signo 6.225 -> %d\n", b.ieee.negative);
    printf("Exponente 6.225 (11 bits desde el primer 1) -> ");
    printbin_32(b.ieee.exponent);
    printf("Significante 6.225 (52 bits desde el primer 1) -> ");
    printbin_64(extr_fraccion_doble(b.d));


    return 0;
}


void printbin_32(int n) {
    

    int corrimiento = 31;

    while (corrimiento-- > 0)
        printf("%d", (n >> corrimiento) & 1);
    printf("\n");
}

void printbin_64(long n) {

    int corrimiento = 63;

    while (corrimiento-- > 0)
        printf("%ld", (n >> corrimiento) & 1);
    printf("\n");
}

unsigned long int extr_fraccion_doble(double num) {

    long int value = *((long int*) &num);

    return (value & 0x000fffffffffffff);
}
