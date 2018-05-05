function [v] = addSplines(f,k)
    o = 1;
    n = length(f);
    l = n + 2*k;
    v = zeros(l,1);
    for i = 1 : l
        if(i <=  k)
        v(i) = f(1)-k+i-1;
        else
            if(i > n + k)
                v(i) = f(n)+o;
                o = o + 1;
            else
                v(i) = f(i-k);
            end
        end    
    end    
end