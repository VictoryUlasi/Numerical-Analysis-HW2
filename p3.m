close all;
clear,clc;

function a = increment(x)
    
a = ((-1)^(x+1))/((2*x) -1);

end

n = 1;
partialSum = 0;
pi_N = 0;
target = 3.14159;

while true

    if (pi_N == target)
        break;
    else
        partialSum = partialSum + increment(n);
        pi_N = round((4 *partialSum),5);
        n = n+1;
    end
end

fprintf("Smallest N so that pi_N rounds to %.5f:\n",target);
fprintf("N = %d\n", n);
fprintf("pi_N = %.5f\n", pi_N);
        