%%
%% 1. calculer les erreurs
%%
clear all
f = @(t, y)(1 - (4/3) * t) * y;
df = @(t,y) 1 - (4/3) * t;
y0 = 1;
y = @(t) exp(t - (2/3)*t.^2);

errorEulerExp = [];
errorEulerImp = [];
errorCrankNicolson = [];
errorRungeKutta = [];

%h=10^-4:0.001:10^-2
T = 5;
Ninterval=[10000:-1000:10];
hinterval = [];

for N=Ninterval
   
    h = T/N;
    hinterval = [hinterval h];
    %t = [0: h: T];
    yT = y(T);
 
   y1 = eulerExp(y0,f, T, N);
    error = norm(yT - y1(end));
    errorEulerExp = [errorEulerExp error];
    
  y2 = eulerImp(y0,df, f, T, N);
    error = norm(yT - y2(end));
    errorEulerImp = [errorEulerImp error];
   
    
   y3 = crankNicolson(y0, df, f, T, N, 10^(-14));
    error = norm(yT - y3(end));
    errorCrankNicolson = [errorCrankNicolson error];
    
    y4 = rungeKutta(y0, f, T, N);
    error = norm(yT - y4(end));
    errorRungeKutta = [errorRungeKutta error];
end

EE = semilogy(hinterval, errorEulerExp,'-r')
hold on
IE = semilogy(hinterval, errorEulerImp ,'-b')
hold on
CN = semilogy(hinterval, errorCrankNicolson,'-k')
hold on
RK = semilogy(hinterval, errorRungeKutta,'-g')

legend([EE IE RK CN ],{'EE', 'IE', 'RK', 'CN'});


%%
%% 2. calculer les erreurs
%%
clear all
f = @(t, y)(1 - (4/3) * t) * y;
df = @(t,y) 1 - (4/3) * t;
y0 = 1;
y = @(t) exp(t - (2/3)*t.^2);

errorEulerExp = [];
errorEulerImp = [];
errorCrankNicolson = [];
errorRungeKutta = [];

%h=10^-4:0.001:10^-2
T = 5;
Ninterval=[10000:-1000:100];
hinterval = [];

for N=Ninterval
  
    h = T/N;
    hinterval = [hinterval h];
    %t = [0: h: T];
    yT = y(T);
    t = [0:h:T];
 
    y1 = eulerExp(y0,f, T, N);
     error = sqrt(sum((y(t) - y1).^2));
    errorEulerExp = [errorEulerExp error];
    
    y2 = eulerImp(y0,df, f, T, N);
     error = sqrt(sum((y(t) - y2).^2));
    errorEulerImp = [errorEulerImp error];
    
    
    y3 = crankNicolson(y0, df, f, T, N, 10^(-14));
     error = sqrt(sum((y(t) - y3).^2));
    errorCrankNicolson = [errorCrankNicolson error];
    
    y4 = rungeKutta(y0, f, T, N);
     error = sqrt(sum((y(t) - y4).^2));
    errorRungeKutta = [errorRungeKutta error];
end

EE = semilogy(hinterval, errorEulerExp,'-r')
hold on
IE = semilogy(hinterval, errorEulerImp ,'-b')
hold on
CN = semilogy(hinterval, errorCrankNicolson,'-k')
hold on
RK = semilogy(hinterval, errorRungeKutta,'-g')

legend([EE IE RK CN ],{'EE', 'IE', 'RK', 'CN'});

