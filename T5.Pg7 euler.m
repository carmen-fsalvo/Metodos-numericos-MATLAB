clear all
close all
clc

% Use the Euler method to integrate the equation for the barometric
% pressure in 5, 10, and 100 integration steps(N=5, N=10, N=100).
% Plot the numerical and analytical result in the same figure.

% Valores iniciales:

p0=101325;
h0=0;
H0=8005;

% Parámetros.

hN= 20000;
N= 5;
% Fórmula:

g=@ (p,h)(-p/H0);  

% para el integration block uso la función euler.m:

%  ( -->euler returns  h= N values of h from h0 to hN        )
%                     p= the solution of the diff. ecuation

[p,h]=euler(g,h0,p0,hN,N);

N=10;

[p2,h2]=euler(g,h0,p0,hN,N);

N=100;

[p3,h3]=euler(g,h0,p0,hN,N);

N=500;

[p4,h4]=euler(g,h0,p0,hN,N);

% plot p(h) para todos los diferentes valores de N.

  plot (h,p,'b'), hold on
  plot (h2,p2,'m'), hold on
  plot (h3,p3,'g'), hold on
  plot (h4,p4,'r'), hold off
xlabel('h')
ylabel('p(h)')
% para calcular la solución analítica se hace a mano (con papel y boli)
% para después graficarlo.


