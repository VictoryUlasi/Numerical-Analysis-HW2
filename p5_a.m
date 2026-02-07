function a = p5_a(n)

   if (n == 0)
    a = 3;
    return;
   elseif (n == 1)
       a = 2;
       return;
   end

   a = (4*(p5_a(n-1)) - (p5_a(n-2)) + 2*(n-2));
end
