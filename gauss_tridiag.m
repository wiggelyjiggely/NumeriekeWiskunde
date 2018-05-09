function [x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_sub, A_hoofd, A_super, b) 

[n,m] = size(A_hoofd);
A = zeros(n, n);

%Make the matrix A from The 3 vectors
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

x = mldivide(A, b);
    
U = zeros(n, n);
L = zeros(n,n);

L_sub = zeros(n-1, 1);

U_super = zeros(n-1, 1);
U_hoofd = zeros(n, 1);

%Algoritme om U en L te halen uit A
for i = 1:n
   if (i < n)
       U(i, i+1) = A(i, i+1);
       U_super(i,1) = A(i, i+1);
   end
   
   if (i == 1)
       U(i,i) = A(i,i);
       U_hoofd(i,1) = A(i,i);
   else
       if (U(i-1, i-1) == 0) 
           disp('Geen oplossing door een deling door 0')
           return;
       end
       U(i,i) = A(i,i) - (A(i, i-1)/ U(i-1, i-1)) * U(i-1, i);
       U_hoofd(i,1) = A(i,i) - (A(i, i-1)/ U(i-1, i-1)) * U(i-1, i);
   end
   
   L(i,i) = 1;
   if (i > 1)
      L(i, i-1) = (A(i, i-1) /  U(i-1, i-1));
      L_sub(i-1,1) = (A(i, i-1) /  U(i-1, i-1));
   end
end

% y berekenen b = Le*y
y = mldivide(L, b);

end