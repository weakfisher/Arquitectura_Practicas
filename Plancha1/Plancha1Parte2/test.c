#include<ieee754.h>
#include<stdio.h>
#include<math.h>

int main(void) {

    /*union ieee754_float a;
    float b = 0x19d00000;
    float c = 1.75 * pow(2, -79);
    float d = b + c;*/

    float a = 100000;
    float b = 0.2;
    float c = 0.1;

    float d = b + c;
    float e = a * d;

    float f = 0.3;

    float g = a * b;

    float h = a * c;

    float m = g + h;



    return 0;
}