clc
clear all
close all

% barometric pressure con meuler.2

% physical constants/input block
%--------------------------------
H0 = 8005;    % m
p0 = 101325;  % pascals
h0 = 0;       % m
hN = 20000;     % m

% define g(p,h) specifying the differential equation
%----------------------------------------------------
g  = @(p,h)(-p/H0);


% integrate ODE defined by g using modified Euler method
%--------------------------------------------------------
[p,h] = meuler(g,h0,p0,hN,10);      % 10 modified Euler integration steps
plot(h,p,'blue')