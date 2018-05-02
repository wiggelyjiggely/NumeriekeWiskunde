function [A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest, A_hoofdTest, A_superTest, b)

[x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_subTest, A_hoofdTest, A_superTest, b);

% disp("L_sub:");
% disp(L_sub);
% disp("U_hoofd:");
% disp(U_hoofd);
% disp("U_super:");
% disp(U_super);
% disp("y:");
% disp(y);

%%%%Testen%%%%%
disp("Test Cases");

%Test dat Ux = y
[U] = makeUMatrix(U_hoofd, U_super);
disp("Is Ux=y: " + isMatrixEqual(U*x,y));
disp(U);

%Test dat b = Le*y
[L] = makeLMatrix(L_sub);
disp("Is b = Le*y: " + isMatrixEqual(b, L*y));
disp(L)

%Test dat A = Le * U
[A] = makeAMatrix(A_subTest, A_hoofdTest, A_superTest);
disp("Is A = Le*U: " + isMatrixEqual(A, L*U));
disp(A);

end

%Functie om matrix U te genereren uit L_sub, U_hoofd en U_super
function [A] = makeAMatrix(L_sub, U_hoofd, U_super)
    [m,n] = size(U_hoofd);
    A = zeros(n, n);

    for i = 1:n
        A(i,i) = U_hoofd(i);
    end

    for i = 1:(n-1)
        A(i,i+1) = U_super(i);
    end

    for i = 1:(n-1)
        A(i+1,i) = L_sub(i);
    end
end

%Fumctie om matrix U te genereren uit U_hoofd en U_super
function [U] = makeUMatrix(U_hoofd, U_super)
    [n,m] = size(U_hoofd);
    U = zeros(n, n);

    for i = 1:n
        U(i,i) = U_hoofd(i);
    end

    for i = 1:(n-1)
        U(i,i+1) = U_super(i);
    end
end

%Fumctie om matrix L te genereren uit L_sub
function [L] = makeLMatrix(L_sub)
    [n,m] = size(L_sub);
    n = n+1;
    L = zeros(n, n);

    for i = 1:n
        L(i,i) = 1;
    end
    
    for i = 1:(n-1)
        L(i+1,i) = L_sub(i);
    end
end

%%Functie om te checken dat 2 matrices dezelfde zijn op 3 getallen na de
%%komma
function [boolean] = isMatrixEqual(A, B);
    [m,n] = size(A);
    [k,l] = size(B);
    
    if (m~=k || n~=l) 
       boolean = 0;
       return;
    end
    
    for i = 1:m
       for j = 1:n
           if (round(A(i,j), 3) ~= round(B(i,j), 3))
               boolean = 0;
               return;
           end
       end
    end
    
    boolean = 1;
end