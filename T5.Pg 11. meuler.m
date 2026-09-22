clc
clear all
close all

% Tema 5. Pg 11. usar meuler.m para integrar la ecuación barométrica de la
% presión y representar graficamente.


% Valores iniciales:

p0=101325;
h0=0;
H0=8005;

% parámetros:

hN= 20000;
N= 10;

% fórmula:

g=@ (p,h)(-p/H0);

% utilizo meuler.m:

[p,h]=meuler(g,h0,p0,hN,N);

% plot p(h):

plot(h,p)