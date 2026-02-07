#include <stdio.h>

double p6_a(int n){

    if (n == 0)
        return 3;
    else if (n == 1)
        return 2;
    return (4*(p6_a(n-1)) - (p6_a(n-2)) + 2*(n-2));
}

int main(){

    int n = 0;
    scanf("%d", &n);
    printf("%d\n",p6_a(n));
    return 0;
}