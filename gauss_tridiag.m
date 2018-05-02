function [x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b) 

[m,n] = size(A_hoofd);
disp(n);
A = zeros(n, n);

for i = 1:n
    A(i,i) = A_hoofd(i);
end

for i = 1:(n-1)
    A(i,i+1) = A_super(i);
end

for i = 1:(n-1)
    A(i+1,i) = A_sub(i);
end

if(det(A)==0) %% determinante is 0 means no single solution
    disp('No solutions or infinite number of solutions')
    return;
end

disp(A);
disp(b);

x = mldivide(A, b);

%disp(A);
    
A_Bewerk = A;

for i = 1:n
    pivot = A_Bewerk(i,i);
    deler = 1;
    if (pivot ~= 1)
        deler = pivot;
        for j = 1:n
            A_Bewerk(i,j) = A_Bewerk(i,j) / pivot;
        end
    end
    
    for j = i:n
        
    end
end

disp(A_Bewerk);

end