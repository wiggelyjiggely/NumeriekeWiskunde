index = 2;
k = 3;
t = [0.0;0.0;0.0;0.0;0.25;0.5;0.75;1.0;1.0;1.0;1.0];
x = 0.4;

[result] = evalDerivativeBspline(index,k,t,x,2);
disp(result);