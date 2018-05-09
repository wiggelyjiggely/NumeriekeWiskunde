%recursiebetrekking voor het evalueren van genormaliseerde B-splines.
function [result] = evalBspline(index,k,t,x)
    if k == 0
         if (x >= t(index)) && (x < t(index + 1))
            result = 1;
         else
            result = 0;
         end 
    else
        r_1 = (x - t(index))/(t(index + k) - t(index));
        r_2 = (t(index+k+1)-x)/(t(index+k+1)-t(index+1));
        result = r_1*evalBspline(index, k-1, t, x) + r_2*evalBspline(index+1, k-1, t,x);   
    end    
end