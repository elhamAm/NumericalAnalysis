function yvec = crankNicolson(y0, df, f, T, N,tol)
    t = 0;
    h = T/N;
    yvec =[y0];
    tvec = [t];
    ylast = y0;
   for t = [h:h:T]
        F = @(y) (h/2)* (f(t, y) + f(t - h, ylast)) + ylast - y;
        iden = eye(size(ylast));
        dF = @(y) h/2 * df(t,y) - iden;
        yinitialNewt = ylast;
        [ynew, Y] = Newton(F, dF, yinitialNewt,tol, 10000);
        
   
        yvec = [yvec ynew];
        ylast = ynew;
        
        
    end
    
end

