#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
void sum_simd(float* a , float * b,int len);

 float *crearArregloAleatorio(int tamano) {
   
    float *arreglo = (float *)malloc(tamano * sizeof(float));

    for (int i = 0; i < tamano; i++) {
        arreglo[i] = i; 
    }

    return arreglo;
} 


int main() {

    float a[11] = {1,2,3,4,5,6,7,6,6,6,6};
    float b[11] = {10,6,5,4,3,20,1,6,6,6,6};

    int len = 1044;


    
    float* c = crearArregloAleatorio(1044);
    float* d = crearArregloAleatorio(1044);
    sum_simd(c, d, len);
    for (int i = 0; i<len;i++) {

        printf("%f\n",c[i]);

    }


    return 0;
}