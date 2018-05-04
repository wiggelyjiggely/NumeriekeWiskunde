function [c] = spline_coeff(x,f)
n = length(x);
c = zeros(n-1, n-1);
for i = 1:n-1
    for j = 1 :n-1   
        [result] = evalBspline(j,3,f,x(i)); 
        c(i,j) = result;
    end
end
end 