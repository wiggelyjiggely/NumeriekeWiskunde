%opdracht 2.3
x = [0;0.5;1];
f= [1;-1;0.5];
%[a,b,c,d] = spline_coeff(x,f);
[c] = spline_coeff(x,f);
disp(c);
