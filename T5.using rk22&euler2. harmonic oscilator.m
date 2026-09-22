
clear all
close all
clc

% T5.Pg 19. uso euler2.m,rk22.m, y rk42 para resolver una ec.diferencial 
%(especificamente una ODE) de segundo orden.

% initial conditions:

t0=0;      % en segundos
x0=-1;     % en metros
v0=2;      % en m/s

% parámetros:

tN=80;     % en segundos
N=1000;
k=1;       %kg/s^2
m=2;       %kg

% anonymous functions:

g=@(x,v,t)(v);
h=@(x,v,t)(-k/m*x);

% uso euler2.m

[x,v,t]=euler2(g,h,t0,x0,v0,tN,N);

plot(t,x,'b'), hold on

% uso rk22.m

[x,v,t]=rk22(g,h,t0,x0,v0,tN,N);

plot(t,x,'r')

% uso rk42.m

N=100;

[x,v,t]=rk42(g,h,t0,x0,v0,tN,N);

plot(t,x,'g')

% plot the analytical solution
w   = sqrt(k/m);
A   = sqrt(x0.^2+(v0./w).^2);
phi = atan(w.*x0./v0);
t   = linspace(t0,tN,1000);
plot(t,A*sin(w.*t+phi),'black:')

% label and legend
xlabel('t')
ylabel('x(t)')
title('harmonic oscillator')
legend('1000 Euler steps','1000 2nd order Runge-Kutta steps','100 4th order Runge-Kutta steps','analytical solution','Location','NorthWest')






