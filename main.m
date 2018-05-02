%Test 1.3 One
A_hoofdTest1 = [2,2,2,2];
A_subTest1 = [-1,-1,-1];
A_superTest1 = [-1,-1,-1];

b1 = [10; 11; 12; 7];

[A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest1, A_hoofdTest1, A_superTest1, b1);

