#include <malloc.h>
#include <stdio.h>

void sum(float* a , float * b,int len);




int main(){
    float a[7] = {1,2,3,4,5,6,7};
    float b[7] = {7,6,5,4,3,2,1};
    int len = 7;
    for (int i = 0; i<len;i++){
    printf("%f",a[i]);
    }
    return 0;
}