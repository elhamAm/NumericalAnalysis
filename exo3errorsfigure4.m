%%
%% exo3.2
%%


%%
%% 2.1 tester Euler Explicit sur f 
%%
clear all
clc
N = 100000;
T = 50;
tvec = [0:T/N:T];
u0 = 1;
v0 = 1/2;
uv0 = [u0; v0];

yvec = eulerExp(uv0, @fpred, T, N);
uu = plot(tvec, yvec(1,:),'-b')
hold on
vv = plot(tvec, yvec(2,:),'-r')
legend([uu vv ],{'u', 'v'});


%%
%% 2.2 tester Euler Implicit sur f nooooooooooooooooo
%%
clear all
clc
N = 100000;
T = 50;
tvec = [0:T/N:T];
u0 = 1;
v0 = 1/2;
uv0 = [u0; v0];

yvec = eulerImp(uv0,@fpredDeriver, @fpred, T, N);
uu = plot(tvec, yvec(1,:),'-b')
hold on
vv = plot(tvec, yvec(2,:),'-r')
legend([uu vv ],{'u', 'v'});
%%
%% 2.3 tester crank-Nicolson sur f nooooooooooooooo
%%

clear all
clc
N = 100;
T = 50;
tvec = [0:T/N:T];
u0 = 1;
v0 = 1/2;
uv0 = [u0; v0];

yvec = crankNicolson(uv0,@fpredDeriver, @fpred, T, N, 10^-3);%final sloution :  2.1973e-07
uu = plot(tvec, yvec(1,:),'-b')
hold on
vv = plot(tvec, yvec(2,:),'-r')
legend([uu vv ],{'u', 'v'});
%%
%% 2.4 tester Runge-Kutta sur f 
%%
clear all
clc
N = 10000;
T = 50;
tvec = [0:T/N:T];
u0 = 1;
v0 = 1/2;
uv0 = [u0; v0];


yvec = rungeKutta(uv0, @fpred, T, N);
uu = plot(tvec, yvec(1,:),'-b')
hold on
vv = plot(tvec, yvec(2,:),'-r')
legend([uu vv ],{'u', 'v'});
