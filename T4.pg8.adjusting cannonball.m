clear all
close all
clc


% T4.pg 8 .adjusting cannonball.m para que alpha varie aleatoriamente entre 5 y
% 85, dejando la velocidad inicial constante.para cada ángulo calcular x
%tal que y=y0 de nuevo.
% tambien plot the distribution of distances, (x para tiempo final) y
% relacionalas distancias con los ángulos.

for i=5:85
 alpha=[5:85]   
  gmoon=-1.622;
gx=0.0;
gy=-9.79757;
N=100;

x0=3;
y0=2;
v0=10;

vx0=cos(i)*v0;
vy0=sin(i)*v0;

Tf=-(2*vy0)/gy;% Tf es el tiempo que tarda en llegar desde y0 a y0 de nuevo
 t=linspace(0,Tf,N);
 
 %sistema de ecuacion de trayectoria del cañon
  
   x= x0 + vx0.*Tf; 
   y=y0+vy0.*Tf+0.5.*gy.*Tf.^2; 
   
   vx=vx0;
vy=vy0+gy.*t;

plot(Tf,x,'o')%-->AÚN NO FUNCIONA(dentro del loop Tf es un escalar)(como pasaba antes con alpha)
plot(x,alpha,'o')
end   















