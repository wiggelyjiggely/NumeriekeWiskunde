function [c] = spline_coeff(x,f)
    v = addSplines(x,3);
    n = length(x)-1 ;
    A = zeros(n+3, n+3);
    E = zeros(n+3,1);
    E(1) = 0;
    E(n + 3) = 0;
    for p = 2:n + 2
       E(p) = f(p-1); 
    end  
    
    for j = 1:3
      D(1,j) = evalDerivativeBspline(j, 3, v , x(1),2);
    end    
    for i = 2:n + 2
        for j = i-5 :i-3               
                 D(i,j+4) = evalBspline(j+4,3,v,x(i-1));
        end
    end
    for j = n + 1 : n + 3
       D(n+3, j) = evalDerivativeBspline(j,3,v,x(n+1),2);
    end 
    c = D\E;
    %tridiagonale matrix 
    g = D(1,3)/D(2,3);
    h = D(n+3,n+1)/D(n+2,n+1); 
    
    D(1,:) = D(1,:) - g*D(2,:);
    D(n+3,:) = D(n+3,:) - h*D(n+2,:);
    E(1) = E(1) - g*E(2);
    E(n+3) = E(n+3) - h*E(n+2);
    
    %c = gauss_tridiag(diag(D,-1),diag(D,0),diag(D,1),E);
end 