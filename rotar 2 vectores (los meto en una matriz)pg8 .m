clear all 
close all
clc
% rotar un vector x 32 grados
% formar matriz S compuesta por x y t
t=(1:2);
x=sin(t);
S=[t;x];
% M es la rotation matrix
M=[cos(pi/2),-sin(pi/2);sin(pi/2),cos(pi/2)];
Sr=M*S;
% extraigo los vectores girados tr y xr
tr=Sr([1,3]);
xr=Sr([2,4]);
% grafico xr y tr
plot(tr,xr,x,t)
% ¿como saco una fila entera de una matriz????????????????????????