#include<stdio.h>

void printbin(long n);


int main(void) {

    printf("Probar la funcion con 5 numeros.\n");
    long numero;
    for (int i = 0; i < 5; i++) {
        printf("Numero: ");
        scanf("%ld", &numero);
        printbin(numero);
    }

    return 0;
}

// Imprime el numero decimal pasado en binario (64 bits).
void printbin(long n) {
    
    if (n >= __LONG_MAX__) {
        printf("Fuera de rango.\n");
        return;
    }

    int corrimiento = 63;

    printf("%ld en binario: ", n);
    while (corrimiento-- > 0)
        printf("%ld", (n >> corrimiento) & 1);
    printf("\n");
}

