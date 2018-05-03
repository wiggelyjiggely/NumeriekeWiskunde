function [result] = evalBspline(index,k,t,x)
if k == 0
    result = 0;
     if (x >= t(index)) && (x < t(index + 1))
        result = 1;
     end 
else
    r_1 = (((x - t(index))/(t(index + k) - t(index)))*evalBspline(index, k-1, t, x));
    r_2 = (((t(index+k+1)-x)/(t(index+k+1)-t(index+1)))*evalBspline(index+1, k-1, t, x));
    result = r_1 + r_2;
end    
end