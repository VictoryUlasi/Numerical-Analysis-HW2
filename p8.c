#include <stdio.h>
#include <math.h>

double p8_factorial(int n){

    if (n == 0)
        return 1;
    
    return n * p8_factorial(n-1);
}

double p8_sin_taylor(double x , int n){

    if (n < 0)
        return 0.0;

    double prev = pow(-1,n) * (pow(x,((2*n) + 1)) / p8_factorial((2*n) + 1));

    return (prev + p8_sin_taylor(x , n-1));
}

int main(){

    double x;
    int N;

    if(scanf("%lf %d", &x, &N) == 0){
        return 1;
    }
    printf("%lf\n",p8_sin_taylor(x,N));

    return 0;
}