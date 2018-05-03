%opdracht 2.1
index = 4;
k = 3;
t = [0.0;0.0;0.0;0.0;0.25;0.5;0.75;1.0;1.0;1.0;1.0];
x = 0.4;

[result] = evalBspline(index,k,t,x);
disp(result);