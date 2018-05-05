function [c] = spline_coeff(x,f)
    v = addSplines(f,3);
    n = length(x) - 1;
    c = zeros(n+3, n+3);
    for j = 1:3
      c(1,j) = evalDerivativeBspline(j, 3, v , x(1),2);
    end    
    for i = 2:n + 2
        for j = i-5 :i-3               
                 c(i,j+4) = evalBspline(j+4,3,v,x(i-1));
        end
    end
    for j = n + 1 : n + 3
       c(n+3, j) = evalDerivativeBspline(j,3,v,x(n),2);
    end    
end 