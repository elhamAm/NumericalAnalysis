%% Exercie 2
%%
clear all
close all
clc
%on est dans l'intervalle [0;1]
n=24;
h=1/(n+1);
ti=[0:h:1];

alpha=0; 
v0=alpha*(ti .* (1-ti))';

v1=Newton(v0,h,n+2,1e-8);

alpha=20; 
v0=alpha*(ti .* (1-ti))';

v2=Newton(v0,h,n+2,1e-8);

plot(ti,v1,'-b',ti,v2,'-r')

