function [y] = evalueer_lagrange(x,f,z) 
n = length(x);
L=ones(n,size(z,2));
if n ~= length (f)
    error ('X and Y must have the same length.');
end
for i=1:n
  for j=1:n
     if (i~=j)
        L(i,:)=L(i,:).*(z-x(j))/(x(i)-x(j));
     end
  end
end
y=0;
for i=1:n
  y=y+f(i)*L(i,:);
end
end