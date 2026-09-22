clear all
close all
clc

% PARTE 1-

% parámetros

A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.02;  % mortalidad de la presa
C= 0.5;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.01;  % natalidad del depredador

% valores iniciales

x0= 19.09;
y0= 30.4;
t0= 0;
tN= 17000;
N= 10000;

% función sacada de las ecuaciones diferenciales de Lotka-Volterra:
% dx/dt = Ax - Bxy , dy/dt = -Cy + Dxy

g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador

% integrar las ecuaciones diferenciales

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(1)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')

% PARTE 2-

A= 0.5/12;   % natalidad de la presa
B0= 0.02/12;  % mortalidad de la presa
C0= 0.5/12;   % mortalidad del depredador
D= 0.01/12;  % natalidad del depredador

Tmad  = [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];

% relacionamos las constantes B y C con la temperatura, teniendo en cuenta
% que cuando baja la temperatura, sube la tasa de mortalidad de tal manera
% que Temperatura= alpha/B  y Temperatura= beta/C.
% Para hallar la constante nos servimos de los valores iniciales de Tmad y de B0 y C0:



B=@(t)(B0.*sin(t./5)+ 1.02 );
C=@(t)(C0.*sin(t./5)+1.5);


% valores iniciales

x0= 19.58;
y0= 30.09;
t0= 0;
tN= 1000;
N= 100000;

% función sacada de las ecuaciones diferenciales de Lotka-Volterra:
% dx/dt = Ax - Bxy , dy/dt = -Cy + Dxy

g=@(x,y,t)(A.*x - (B0.*abs(sin(t./5)+0.03 )).*x.*y); % presa
h=@(x,y,t)(-(C0.*abs(sin(t./5)+0.6)).*y + D.*x.*y); % depredador

% integrar las ecuaciones diferenciales

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(2)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (meses)')
legend('presa','depredador')

%% PARTE 3-

% apartado a): mismo número de depredadores y presas.













%% -----------------------------NO FUNCIONA-------------------------------



% PARTE 2 --

% teniendo en cuenta cómo afecta el cambio de temperatura en un año a las
% tasas de mortalidad de las presas y los depredadores:

% parámetros

A= 0.5/12;   % natalidad de la presa
B0= 0.02/12;  % mortalidad de la presa
C0= 0.5/12;   % mortalidad del depredador
D= 0.01/12;  % natalidad del depredador

Tmad  = [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];

% relacionamos las constantes B y C con la temperatura, teniendo en cuenta
% que cuando baja la temperatura, sube la tasa de mortalidad de tal manera
% que Temperatura= alpha/B  y Temperatura= beta/C.
% Para hallar la constante nos servimos de los valores iniciales de Tmad y de B0 y C0:

alpha= Tmad(1)*B0;
beta= Tmad(1)*C0;



B=@(t)( alpha ./abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001)));
C=@(t)( beta./abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001)));

% valores iniciales

x0= 19.58;
y0= 30.09;
t0= 0;
tN= 100;
N= 10000;

% función sacada de las ecuaciones diferenciales de Lotka-Volterra:
% dx/dt = Ax - Bxy , dy/dt = -Cy + Dxy

g=@(x,y,t)(A.*x - ( alpha ./abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001))).*x.*y); % presa
h=@(x,y,t)(-( beta./abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001))).*y + (landa./abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001))).*x.*y); % depredador

% integrar las ecuaciones diferenciales

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(2)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (meses)')
legend('presa','depredador')

% Sacamos la relación entre la temperatura y el tiempo

Month = [1/12:1/12:1];
Tmad  = [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];
figure(3)
plot(Month,Tmad)
% usando cftool sale una función : Temperatura =27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001)

plot(t,(abs(27.2 .*sin(0.2322 .*t -0.05129) + 3.41 .*sin(0.9109 .*t + 1.001))))


