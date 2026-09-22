clear all
close all
clc
%TEMA 3. PG 6.ej 2º

%tiempo cero empiezo a correr, a 0.2 km/h. tiempo 6 min caballo empieza a
%correr. ¿distancia q recorro hasta q el caballo me alcanza y tiempo q
%tardo en recorrerlo?

% you:      d  = 0.2 * t
% horse:    d  = 0.5 * (t-6)
%        -> d  = 0.5 * t - 3

% the linear system therefore is:
%     1*d - 0.2*t = 0
%     1*d - 0.5*t = -3

A = [1,-0.2;
     1,-0.5];
c = [0;-3];

solution = inv(A)*c;

d = solution(1);
t = solution(2);

fprintf(1,'you can run %f km before the horse catches up with you after %f seconds\n',d,t)
