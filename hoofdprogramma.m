%-----------------------------------------------Opdracht 1.3----------------------------------------------- 
A_hoofdTest1 = [1,4,6,1];
A_subTest1 = [2,5,5];
A_superTest1 = [3,8,2];

b1 = [1; 8; 4; 6];

[A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest1, A_hoofdTest1, A_superTest1, b1);

%Test 1.3 Two (Gaat niet door de deling door 0)
% A_hoofdTest2 = [5,36,2,11];
% A_subTest2 = [12,9,65];
% A_superTest2 = [15,17,31];
% 
% b2 = [4; 5; 6; 7];
% 
% [A, U, L, x, L_sub, U_hoofd, U_super, y] = gausTest(A_subTest2, A_hoofdTest2, A_superTest2, b2);

%-----------------------------------------------Opdracht 2.1-----------------------------------------------

k = 3;
t = [0;1;2;3;4;5;6;7;8;9];
x = 3;
index = 3;
[resultB] = evalBspline(index,k,t,x);


%-----------------------------------------------Opdracht 2.2-----------------------------------------------

k = 3;
t = [0;1;2;3;4;5;6;7;8;9];
x = 3;
index = 3;
[resultD] = evalDerivativeBspline(index,k,t,x,0);

if resultD ~= resultB
   disp('evalDerivative met m = 0 en evalBspline niet gelijk'); 
end    


%-----------------------------------------------Opdracht 2.3-----------------------------------------------

%ERROR als x en f niet even groot zijn
% x = [1;2;3;4];
% f = [2;3;4;5;6];
% [c] = spline_coeff(x,f);

%-----------------------------------------------Opdracht 2.4-----------------------------------------------

    p = 30;  %stijdgend aantal interpolatiepunten tot p 
    fx = @(x)1./(1+25*x.^2);  
    z = linspace(-1,1, 1000); %evaluatiepunten
    
    E_Boor=zeros(1, p-4);   
    for n = 5 : p
       t = linspace(-1,1,n+6);
       x = linspace(-1,1,n);  
       f = fx(x); 
       [c] = spline_coeff(transpose(x),transpose(f));
       [s] = deBoor(t, c, z);   
       E_Boor(1, n-4) = maxnorm(s,fx, x);
    end

%-----------------------------------------------Opdracht 2.5-----------------------------------------------
  
    fx = @(x)1./(1+25*x.^2);
    z = linspace(-1,1, 1000); %evaluatiepunten
    
    E_lagrange = zeros(1, p-4); 
    for m=5:p
        x = linspace(-1,1,m); %interpolatiepunten     
        y = evalueer_lagrange(x, fx(x), z);   
        E_lagrange(1, m-4) = maxnorm(y,fx, x);
    end

%-----------------------------------------------Opdracht 2.6-----------------------------------------------

%plot lagrange, deBoor en originele functie
    figure(1);
    subplot(3,1,1);
    plot(z,y);
    title('lagrange interpolatie');
    xlabel('x') % x-axis label
    ylabel('y') % y-axis label
    
    subplot(3,1,2);        
    plot(z,s);
    title('de Boor interpolatie');
    xlabel('x') % x-axis label
    ylabel('y') % y-axis label
    
    subplot(3,1,3);
    plot(z,fx(z));
    title('1/(1 + 25x^2)');
    xlabel('x') % x-axis label
    ylabel('y') % y-axis label
    
    %plot de interpolatiefouten in functie van n
    figure(2);
    subplot(2,1,1);
    plot(linspace(5,p, p-4), E_Boor);
    title('de Boor interpolatiefout');
    %ylim([-0.1 0.1]); 
    xlabel('n') % x-axis label
    ylabel('interpolatiefout') % y-axis label
    subplot(2,1,2);
    plot(linspace(5,p, p-4), E_lagrange);
    title('Lagrange interpolatiefout');
    xlabel('n') % x-axis label
    ylabel('interpolatiefout') % y-axis label
    
    %-----------------------------------------------extra functies-----------------------------------------------

    %berekent benadering maximale interpolatiefout
    function E = maxnorm(y, fx, z)
        E = max(abs(y(find(z)) - fx(find(z))));
    end
    
    