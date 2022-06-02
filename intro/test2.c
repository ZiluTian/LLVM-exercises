#include <stdio.h>

extern int twice(int a);

int main(){
    int num = 4;
    num = twice(num);
    printf("number is %d \n", num);
    return num;
}

int randMethod(){
    return 2;
}
