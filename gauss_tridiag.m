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
    
end