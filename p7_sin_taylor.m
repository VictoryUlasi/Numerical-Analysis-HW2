function sin_x = p7_sin_taylor(x, n)

if(n == 0)
    sin_x = x;
    return;
end

prevTerm = (-1)^(n) *( ( x^((2*n) +1) ) / p7_factorial( (2*n) + 1 ) );
sin_x = prevTerm + p7_sin_taylor(x,n-1);

end