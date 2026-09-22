
clear all
close all
clc

%T5.Pg 13. using 2nd order Runge-Kutta for the barometric pressure.


% Valores iniciales:

p0=101325;
h0=0;
H0=8005;

% Parámetros.

hN= 20000;
N= 10;
% Fórmula:

g=@ (p,h)(-p/H0);  

% para el integration block uso la función rk2.m:

[p,h]= rk2(g,h0,p0,hN,N); % 10 2nd order Runge-Kutta integration steps

plot(h,p,'b'), hold on

[p2,h2]=euler(g,h0,p0,hN,N); % 10 modified Euler integration steps for comparison

plot(h2,p2,'rx')

ylabel('p(h)')
xlabel('h')
legend('10 2nd order Runge-Kutta steps','10 modified Euler steps','Location','NorthEast')
title('barometric pressure')