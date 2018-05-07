%% interpolerende veelterm van graad n-1 van Runge functie 

E_lagrange=zeros(1, 26);

for n=5:30

    x = linspace(-1,1,n); %interpolatiepunten
    fx = 1./(1+25*x.^2);

    z = linspace(-1,1, 1000); %evaluatiepunten
    y = evalueer_lagrange(x, fx, z);

    E_lagrange(1, n-4) = maxnorm(y,fx, z);
end

disp(E_lagrange)
disp(linspace(1,27, 27));

plot(linspace(1,27, 26), E_lagrange);

fz = 1./(1+25*z.^2);

% figure(1),clf
% plot(z,fz)
% hold on
% plot(z,y,'r')
% legend('functie','int. veelterm')

function E = maxnorm(y, fx, z)
    f2x = 1./(1+25*z.^2);

    E = max(abs(y(find(z)) - f2x(find(z))));
end