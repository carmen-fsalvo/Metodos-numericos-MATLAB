clear all
close all
clc
% rotate a 3D vector.in axis x and z.
t=[1;3;2];
%rotación eje x:
Mx=[1,0,0;0,cos(pi/2),-sin(pi/2);0,sin(pi/2),cos(pi/2)];
trx=Mx*t;
%rotación eje z:
Mz=[cos(pi/2),-sin(pi/2),0;sin(pi/2),cos(pi/2),0;0,0,1];
tr=Mz*trx;
% rotamos el eje z antes de el x:
trz=Mz*t;
tr2 = Mx*trz;
% demostrar que los vectores tr y tr2 no son iguales:
abs(tr-tr2)>eps
% demostrar que tienen el mismo módulo:
abs(norm(t)-norm(tr))<eps
abs(norm(t)-norm(tr2))<eps
% graficar los tres vectores:
figure(1)
quiver3(0,0,0,t(1),t(2),t(3))
figure(2)
quiver3(0,0,0,tr(1),tr(2),tr(3))
figure(3)
quiver3(0,0,0,tr2(1),tr2(2),tr2(3))


