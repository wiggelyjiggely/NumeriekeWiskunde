%Test 1.3 One
A_hoofdTest1 = [1,4,6,1];
A_subTest1 = [2,5,5];
A_superTest1 = [3,8,2];

b1 = [1; 8; 4; 6];

[A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest1, A_hoofdTest1, A_superTest1, b1);


%Test 1.3 Two (Kapot door deling door 0)
% A_hoofdTest2 = [5,36,2,11];
% A_subTest2 = [12,9,65];
% A_superTest2 = [15,17,31];
% 
% b2 = [4; 5; 6; 7];
% 
% [A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest2, A_hoofdTest2, A_superTest2, b2);