function yvec = rungeKutta(y0, f, T, N)
    t = 0;
    h = T/N;
    
    yvec =[y0];
    ylast = y0;
    for t = [h:h:T] 
        tlast = t - h;
        k1 =  f(tlast,ylast);
        k2 =  f(tlast + h/2, ylast +  k1 * h/2);
        k3 =  f(tlast + h/2, ylast + (h/2) * k2);
        k4 =  f(tlast + h, ylast +  h * k3);
        
        ynew = h/6 * (k1 + 2*k2 + 2*k3 + k4) + ylast;
        
       
        yvec = [yvec ynew];
        ylast = ynew;
        
    end
    
end

