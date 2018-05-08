%% interpolerende veelterm van graad n-1 van Runge functie 

E_lagrange=zeros(1, 26);
n = 5
%for n=5:30

    x = linspace(-1,1,n); %interpolatiepunten
    fx = @(x)1./(1+25*x.^2);

    z = linspace(-1,1, 1000); %evaluatiepunten
    disp(fx(x));
    y = evalueer_lagrange(x, fx(x), z);
    disp(y);
%end
