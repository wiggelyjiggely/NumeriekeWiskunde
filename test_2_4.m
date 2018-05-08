    %opdracht 2.4
    p = 30;   
    fx = @(x)1./(1+25*x.^2);  
    z = linspace(-1,1, 1000); %evaluatiepunten
    
    E_Boor=zeros(1, 26);   
    for n = 5 : p
       t = linspace(-1,1,n+6);
       x = linspace(-1,1,n);  
       f = fx(x); 
       [c] = spline_coeff(transpose(x),transpose(f));
       [s] = deBoor(t, c, z);   
       E_Boor(1, n-4) = maxnorm(s,fx, x);
    end

    %opdracht 2.5
    E_lagrange=zeros(1, 26);
    for m=5:p
        x = linspace(-1,1,m); %interpolatiepunten     
        y = evalueer_lagrange(x, fx(x), z);   
        E_lagrange(1, m-4) = maxnorm(y,fx, x);
    end

    %plot lagrange en spline
    subplot(2,1,1);
    plot(linspace(5,p, p-4), E_Boor);
    subplot(2,1,2);
    plot(linspace(5,p, p-4), E_lagrange);

    function E = maxnorm(y, fx, z)
        E = max(abs(y(find(z)) - fx(find(z))));
    end