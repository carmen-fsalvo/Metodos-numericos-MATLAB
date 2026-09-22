
clear all
close all
clc

% T5.Pg 14. using the 4th order Runge-Kutta method to solve the equation for the barometric pressure


% Valores iniciales:

p0=101325;
h0=0;
H0=8005;

% Parámetros.

hN= 20000;
N= 5;
% Fórmula:

g=@ (p,h)(-p/H0);  

% para el integration block uso la función rk4.m:

[p,h]= rk4(g,h0,p0,hN,N); % 5 4nd order Runge-Kutta integration steps

plot(h,p,'b','LineWidth',[2]), hold on

[p,h]= rk2(g,h0,p0,hN,N); % 5 2nd order Runge-Kutta integration steps for comparison

plot(h,p,'r')

N=10;
[p2,h2]=euler(g,h0,p0,hN,N); % 10 modified Euler integration steps for comparison

plot(h2,p2,'g')

ylabel('p(h)')
xlabel('h')
legend('5 4nd order Runge-Kutta steps','5 2nd order Runge-Kutta steps','10 modified Euler steps','Location','NorthEast')
title('barometric pressure')
