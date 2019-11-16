function yvec = eulerImp(y0, df, f, T, N)
    t = 0;
    h = T/N;
    yvec =[y0];
    tvec = [t];
    ylast = y0;
 
    for t = [h:h:T]
     
        F = @(y) h * f(t, y) - y + ylast;
        iden = eye(size(ylast));
        dF = @(y) h * df(t,y) - iden;
        yinitialNewt = ylast;
        [ynew, Y] = Newton(F, dF, yinitialNewt,10^(-14), 10000);
   
        yvec = [yvec ynew];
        ylast = ynew;
        
        
    end
    
end

