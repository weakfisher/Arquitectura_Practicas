#include<stdio.h>
#include<stdlib.h>

int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);

int main(void) {

    float a = 1;
    float b = 2;
    float c = 3;
    float d = 4;
    float e = 5;
    float f = 6;
    float *x = malloc(sizeof(float));
    float *y = malloc(sizeof(float));

    printf("Resultado: %d\n", solve(a,b,c,d,e,f,x,y));

    printf("X -> %f\n", *x);
    printf("Y -> %f\n", *y);


    free(x);
    free(y);

    return 0;
}