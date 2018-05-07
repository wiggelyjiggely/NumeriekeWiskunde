%opdracht 2.4
n = 5
for n = 5 : 30
   t = linspace(-1,1,n+6);
   x = linspace(-1,1,n);
   fx = @(x)1./(1+25*x.^2);
   for i = 1 : n
      f(i) = fx(x(i)); 
   end 
   [c] = spline_coeff(x,f);
   [s] = deBoor(t, c, x);
end