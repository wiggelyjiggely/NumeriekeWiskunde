function [c] = spline_coeff(x,f)
    n = length(x);
    for j = 1 : 3
        %j-4
        A(1,j) = j-4;
    end
    for i = 1 : n 
       for j = i - 4 : i - 2
           %j
            A(i+1,j + 4) = j;
       end
    end
    for j = n : n + 2
        %j-4
        A(n + 2,j) = j-4;
    end
    B(1,1) = (0);
    B(n+2,1) = (0);
    for i = 2 : n+1
        B(i,1) = f(i-1);
    end
    disp(B);
    c = A;
end      

