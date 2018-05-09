function [y] = evalueer_lagrange(x,f,z) 
n = length(x);
L=ones(n,size(z,2));
if n ~= length (f) %n en f moeten dezelfde lengte hebben
    error ('X and Y must have the same length.');
end
%Vul de temp Matrix L
for i=1:n
  for j=1:n
     if (i~=j)
        L(i,:)=L(i,:).*(z-x(j))/(x(i)-x(j));
     end
  end
end
%Vul y in als veelterm van L en f
y=0;
for i=1:n
  y=y+f(i)*L(i,:);
end
end