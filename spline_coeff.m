%berekent de coefficienten van de interpolerende kubische
% splinefuctie t.o.v. de genormaliseerde B-spline met 
% natuurlijke voorwaarden
function [c] = spline_coeff(x,f)
    if length(x) ~= length(f)
        error('x en f moeten even lang zijn');%programma moet stoppen indien x en f niet even groot zijn
    end

    v = addSplines(x,3); % 2k knooppunten toevoegen aan de x-waarden. 
    n = length(x)-1 ;
    
    %Ac=B
    
    B = zeros(n+3,1);
    %natuurlijke voorwaarden
    B(1) = 0;
    B(n + 3) = 0;
    
    %natuurlijke voorwaarden
    for p = 2:n + 2
       B(p) = f(p-1); 
    end  
    
    %interpolatievoorwaarden
    for j = 1:3
      A(1,j) = evalDerivativeBspline(j, 3, v , x(1),2);
    end    
    for i = 2:n + 2
        for j = i-5 :i-3               
                 A(i,j+4) = evalBspline(j+4,3,v,x(i-1));
        end
    end
    
    %natuurlijke voorwaarden
    for j = n + 1 : n + 3
       A(n+3, j) = evalDerivativeBspline(j,3,v,x(n+1),2);
    end 
    c = A\B;
    
    %tridiagonale matrix maken door elementaire rij-operaties
    g = A(1,3)/A(2,3);
    h = A(n+3,n+1)/A(n+2,n+1); 
    
    A(1,:) = A(1,:) - g*A(2,:);
    A(n+3,:) = A(n+3,:) - h*A(n+2,:);
    B(1) = B(1) - g*B(2);
    B(n+3) = B(n+3) - h*B(n+2); 
    %c = gauss_tridiag(diag(D,-1),diag(D,0),diag(D,1),E);
end 