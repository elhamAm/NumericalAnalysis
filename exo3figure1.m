

%%
%% 1.0tester exacte fonction y
%%
clear all
tvec = [0:5/50:5];
yvec = exp(tvec - 2/3 * tvec.^2);
exact = plot(tvec, yvec, '-b')
hold on

%%
%% 1.1 tester euler explicite sur f
%%

f = @(t, y)(1 - 4/3 * t) * y;
tvec = [0:5/50:5];
y0 = 1;
T = 5;
N = 50;
yvec = eulerExp(y0,f, T, N);%final sloution :  2.1973e-07
EE = plot(tvec, yvec,'-m')
hold on

%%
%% 1.2 tester euler implicit sur f 
%%

f = @(t, y)(1 - 4/3 * t) * y;
tvec = [0:5/50:5];
df = @(t,y) 1 - 4/3 * t;
y0 = 1;
T = 5;
N = 50;
yvec = eulerImp(y0,df, f, T, N);%final sloution :  2.1973e-07
IE = plot(tvec, yvec,'-k')


%%
%% 1.3 tester crank-Nicolson sur f 
%%

f = @(t, y)(1 - 4/3 * t) * y;
df = @(t,y) 1 - 4/3 * t;
tol = 10^(-14);
tvec = [0:5/50:5];
y0 = 1;
T = 5;
N = 50;
yvec = crankNicolson(y0,df, f, T, N,tol);%final sloution :  2.1973e-07
CN = plot(tvec, yvec,'-r')


%%
%% 1.4 tester Runge-Kutta sur f 
%%
f = @(t, y)(1 - 4/3 * t) * y;
df = @(t,y) 1 - 4/3 * t;
tvec = [0:5/50:5];
y0 = 1;
T = 5;
N = 50;
yvec = rungeKutta(y0, f, T, N);%final sloution :  2.1973e-07
RK = plot(tvec, yvec,'-c')

legend([EE IE RK CN exact],{'EE', 'IE', 'RK', 'CN', 'exacte'});

