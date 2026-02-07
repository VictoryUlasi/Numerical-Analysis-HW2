#include <stdio.h>
#include <math.h>

double p8_factorial(int n){

    if (n == 0)
        return 1;
    
    return n * p8_factorial(n-1);
}