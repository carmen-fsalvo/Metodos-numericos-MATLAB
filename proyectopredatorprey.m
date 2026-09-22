
clear all
close all
clc

% PROYECTO COMPUTACIÓN.PREDATOR-PREY.

% PARTE 1- 

  

% parámetros 

  

A= 0.5;   % natalidad de la presa 

B= 0.02;  % mortalidad de la presa 

C= 0.5;   % mortalidad del depredador 

D= 0.01;  % natalidad del depredador 

  

% valores iniciales 

  

x0= 19.58; 

y0= 30.09; 

t0= 0; 

tN= 100; 

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

% grafico la población de dpredadores respecto a la población de presas:
figure(2)
plot(x,y)

ylabel('número de dpredadores')
xlabel('número de presas')

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

figure(3) 

plot(t,x,'b'), hold on 

plot(t,y,'r') 

ylabel('numero de animales') 

xlabel('tiempo (meses)') 

legend('presa','depredador') 

%% PARTE 3-
% --apartado a): mismo número de depredadores y presas.




% parámetros

A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.02;  % mortalidad de la presa
C= 0.5;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.01;  % natalidad del depredador
% equilibrio depredador= 25, equilibrio presa=50


% valores iniciales

x0= 20;
y0= 20;
t0= 0;
tN= 17000; % para esa tn el equilibrio se logra en 2000 años
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

% Variamos los parámetros dejando el mismo número de depredadores
% y presas=20.

% a.1): variar el parámetro A. 


%CASO A= 0.8

A= 0.8;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador
equilibrio=[C/D,A/B];

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(2)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador','equilibrio')

%equilibrio depredador varia= 40. tiempo hasta llegar al equilibrio disminuye casi a la mitad


% CASO A= 1

A= 1;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador


[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(3)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')


% a.2) variación de B


% CASO B= 0.05


A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.05;  % mortalidad de la presa
C= 0.5;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.01;  % natalidad del depredador

g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador


[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(4)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')

% varía la posición del equilibrio del depredador= 10, mismo tiempo (mas o
% menos) para el equilibrio.


% a.3) variación C


% CASO C=0.8

A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.02;  % mortalidad de la presa
C= 0.8;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.01;  % natalidad del depredador

g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador


[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(5)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')

% varía la posición del equilibrio del presa= 80,  tiempo para el
% equilibrio disminuye casi a la mitad

% a.4) variación D

% CASO D=0.04

A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.02;  % mortalidad de la presa
C= 0.5;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.04;  % natalidad del depredador

g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador


[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(6)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')

% varía la posición del equilibrio de presa= 12.5 ,  tiempo para el
% equilibrio es (mas o menos) el mismo que el original



% --apartado b): partimos de datos experimentales, y variamos los parametros
% de la misma manera que en a)


A= 0.5;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
B= 0.02;  % mortalidad de la presa
C= 0.5;   % mortalidad del depredador En el equilibrio, el nº de presas= C*100 cuando D= 0.01-->C/D
D= 0.01;  % natalidad del depredador
% equilibrio depredador= , equilibrio presa=


% valores iniciales

x0= 19.58;
y0= 30.4;
t0= 0;
tN= 17000; % para esa tn el equilibrio se logra en 2000 años
N= 10000;

% función sacada de las ecuaciones diferenciales de Lotka-Volterra:
% dx/dt = Ax - Bxy , dy/dt = -Cy + Dxy

g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador

% integrar las ecuaciones diferenciales

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(7)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador')


% b.1) variamos A

% CASO A=0.8

A= 0.8;   % natalidad de la presa. En el equilibrio, el nº de depredadores= A/2*100 si B= 0.02--> A/B
g=@(x,y,t)(A.*x - B.*x.*y); % presa
h=@(x,y,t)(-C.*y + D.*x.*y); % depredador
equilibrio=[C/D,A/B];

[x,y,t]=rk42(g,h,t0,x0,y0,tN,N);
figure(8)
plot(t,x,'b'), hold on
plot(t,y,'r')
ylabel('numero de animales')
xlabel('tiempo (años)')
legend('presa','depredador','equilibrio')

% pasa lo mismo que en el apartado a.1) CASO A =0.8. Es decir, las gráficas
% de la figura 2 y la figura 8 son idénticas salvo los valores iniciales.












