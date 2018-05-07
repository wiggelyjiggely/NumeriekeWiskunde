%opdracht 2.3
x = [0;1;2;3;4];
f= [0;24;24;18;16];
%[a,b,c,d] = spline_coeff(x,f);
[c] = spline_coeff(x,f);
disp(c);
