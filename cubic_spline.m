function [a_inter] = cubic_spline(xi,a,inter)
if length(xi) ~= length(a) 
  error('vectors xi and a must be of same length'); 
end
% Plotting points we want to interpolate between: 
grid on; 
hold on;     
title('Cubic Spline Interpolation'); 
plot(xi,a,'or');
n = length(xi);
% Vector h with subintervals: 
h = zeros(n-1,1); 
for j = 1:n-1
  h(j) = xi(j+1) - xi(j); 
end
% Coefficient matrix A: 
A = zeros(n);
% Natural Spline boundary conditions: 
A(1,1)= 1; 
A(n,n) = 1;
for i = 2:n-1 
  A(i,i-1) = h(i-1); 
  A(i,i) = 2*(h(i-1)+h(i)); 
  A(i,i+1) = h(i); 
end
% Vector b: 

b = zeros(n,1);
%[it wasn't clear to me if this was supposed to be commented out or not..]:
for i = 2:n-1 
  b(i) = (3/h(i))*(a(i+1)-a(i)) - (3/h(i-1))*(a(i)-a(i-1));     
end
% Coefficient vector cj: 
cj = A\b;
% Coefficient vector bj: 
bj = zeros(n-1,1); 
for i = 1:n-1 
  bj(i) = (1/h(i))*(a(i+1)-a(i)) - (1/3*h(i))*(2*cj(i)+cj(i+1)); 
end
% Coefficient vector dj: 
dj = zeros(n-1,1); 
for i = 1:n-1 
  dj(i) = (1/(3*h(i))) * (cj(i+1)-cj(i)); 
end
% Making a matrix P with all polynomials 
P = zeros(n-1,4); 
for i = 1:n-1 
  P(i,1) = dj(i); 
  P(i,2) = cj(i); 
  P(i,3) = bj(i); 
  P(i,4) = a(i); 
end
% Plotting results: 
resolution = 100;
for i = 1:n-1 
  f = @(x) a(i) + bj(i)*(x-xi(i)) + cj(i)*(x-xi(i))*2 + dj(i)*(x-xi(i))*3; 
  xf = linspace(xi(i),xi(i+1),resolution); 
  plot(xf,f(xf),'b'); 
end
jl = 1; 
ju = n; 
while (ju - jl > 1) 
  jm = ceil((jl + ju)/2); 
  if (inter < xi(jm)) 
    ju = jm; 
  else 
    jl = jm; 
  end 
end
a_inter = polyval(P(jl,:), inter-xi(jl)); 
fprintf('\n The interpolated value is: %f \n', a_inter); 
plot(inter, a_inter, 'og'); 
fprintf('The value of bj is %f \n',bj); 
fprintf('The value of cj is %f \n',cj); 
fprintf('The value of dj is %f \n',dj);
end % [end of function]