function n_fact = p7_factorial(n)

if (n == 0)
    n_fact = 1;
    return;
end

n_fact = n * p7_factorial(n-1);
end