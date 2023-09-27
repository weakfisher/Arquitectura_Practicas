#include<stdio.h>

void rotar_valores(int* a, int* b, int* c);

int main(void) {

    int a, b, c;

    printf("Ingrese tres valores para ser rotados: ");
    scanf("%d %d %d", &a, &b, &c);

    printf("Antes: a -> %d, b -> %d, c -> %d\n", a, b, c);

    rotar_valores(&a, &b, &c);

    printf("Despues: a -> %d, b -> %d, c -> %d\n", a, b, c);

    return 0;
}

void rotar_valores(int *a, int *b, int *c) {

    *a = *a ^ *b ^ *c;
    *b = *a ^ *b ^ *c;
    *c = *a ^ *b ^ *c;
    *a = *a ^ *b ^ *c;
}