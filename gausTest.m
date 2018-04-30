A_hoofdTest = [2,2,2,2];
A_subTest = [-1,-1,-1];
A_superTest = [-1,-1,-1];

b = [10; 11; 12; 7];

[x, L_sub, U_hoofd, U_super, y] = gauss_tridiag(A_subTest, A_hoofdTest, A_superTest, b);