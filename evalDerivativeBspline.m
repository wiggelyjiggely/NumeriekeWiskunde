function [result] = evalDerivativeBspline(index,k,t,x,m)
if k == 0
    if (x > t(index)) && (x < t(index + 1))
        result = 1;
    else
     result = 0;
    end  
else
    result = (k/(t(index + k) - t(index))*evalDerivativeBspline(index, k-1, t,x,m-1)) - (k/(t(index+k+1)-t(index+1))*evalDerivativeBspline(index+1,k-1,t,x,m-1));
end    
end
