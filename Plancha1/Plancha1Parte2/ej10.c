#include<stdio.h>
#include<ieee754.h>
#include<math.h>

// Ej d y e
int extr_exponente(float num);
unsigned int extr_fraccion(float num);
int my_isnan(float num);
int my_isnan_2(float num);
// Ej d y e

// f) En el caso de +infinito, podemos compararlo usando == INFINITY ya que
// solo hay una forma de representar el +infinito como punto flotante.
// Esto es, el exponente todos 1's y la parte fraccionaria 0.

// g) Como podemos ver en las lineas 35-38 si sumamos
// un valor a +infinito, sigue dando +infinito.

// Aux para ej g
int my_isinfinity(float num);

int main(void) {

    float g = 0.0;
    float f = 0.0 / g;

    float inf = INFINITY;
    float inf2 = inf + 5;
    float inf3 = inf - 5;

    printf("0/0 con funcion isnan -> %d\n", isnan(f));
    printf("0/0 con funcion my_isnan -> %d\n", my_isnan(f));
    printf("0/0 con funcion my_isnan_2 -> %d\n", my_isnan_2(f));
    printf("INFINITY con my_isinfinity -> %d\n", my_isinfinity(inf));
    printf("INFINITY + valor con my_isinifity -> %d\n", my_isinfinity(inf2));
    printf("INIFITY + valor == INFINITY -> %d\n", inf2 == INFINITY);
    printf("INFINITY - valor con my_isinifity -> %d\n", my_isinfinity(inf3));
    printf("INIFITY - valor == INFINITY -> %d\n", inf3 == INFINITY);

    return 0;
}

int extr_exponente(float num) {

    int value = *((int*) &num);
    return (value >> 23) - 127;
}

unsigned int extr_fraccion(float num) {

    int value = *((int*) &num);

    return (value & 0x007fffff);
}

int my_isnan(float num) {

    return ((extr_exponente(num) + 127) & 0xff == 0xff) &&
            (extr_fraccion(num) != 0);
}

int my_isnan_2(float num) {

    int value = *((int*) &num);

    return value > 0xff800000;
}

int my_isinfinity(float num) {

    return ((extr_exponente(num) + 127) & 0xff == 0xff) &&
            (extr_fraccion(num) == 0);
}
