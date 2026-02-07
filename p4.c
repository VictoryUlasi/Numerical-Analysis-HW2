#include <stdio.h>
#include <math.h>


double increment(double x){

    x = (pow(-1,x+1))/((2*x)-1);
    return x;
}


int main(){

    int n = 1;
    double partialSum = 0;
    double pi_N = 0;
    double target = 3.14159;
    double epsilon = 1e-5;

    while(1){

        if ((roundf(pi_N*1e5)/1e5) == target){ //try ceilf for closer rounding im getting 2 different values from matlab and C
            printf("%lf",pi_N);
            break;
        }
        else{
            partialSum = partialSum + increment(n);
            pi_N = 4*partialSum;
            
            printf("pi_N = %lf\n", (roundf(pi_N*1e5)/1e5));
            printf("N = %d\n", n);
            n++;
        }
    }

    printf("Smallest N so that pi_N rounds to %.5f:\n",target);
    printf("N = %d\n", n);
    printf("pi_N = %.5f\n", pi_N);

    return 0;
}