#include<stdio.h>
#include<assert.h>

int is_one(int a, int b);

void test_is_one();

int main(void) {

    test_is_one();

    return 0;
}

// Devuelve 1 si el bit b de a es 1 y 0 caso contrario.
// bn......b0.
int is_one(int a, int b) {
    
    return (a >> b ) & 1;
}

// Test de la funcion is_one
void test_is_one() {


    int a = 0b1;
    int b = 0b101;
    int c = 0b1111;
    int d = 0b1000101;

    assert(is_one(a, 0) == 1);
    assert(is_one(b, 1) == 0);
    assert(is_one(c, 3) == 1);
    assert(is_one(d, 2) == 1);
    assert(is_one(d, 1) == 0);

    printf("is_one tests passed!\n");
}
