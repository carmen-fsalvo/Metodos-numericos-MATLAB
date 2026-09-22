clear all
close all
clc

% DF_DIFRACCIÓN DE ELECTRONES.

% Parte 1: hallar las distancias interplanares del policristal de grafito

D1=[0.03,0.0282,0.0262,0.0255,0.024];
D2=[0.0503,0.047,0.0433,0.04225,0.0402];
raizUA=[0.018257419,0.016903085,0.015811388,0.01490712,0.014142136];
UA=[3000,3500,4000,4500,5000];

% errores

errD=[0.000025,0.000025,0.000025,0.000025,0.000025];
errraizUA=50./(UA.^(3/2));

% ajuste lineal

[mx1,b1,errmx1,errb1]=minimoscuadrados_(raizUA,D1);
[mx2,b2,errmx2,errb2]=minimoscuadrados_(raizUA,D2);

% representación gráfica

figure (1)
errorbar(raizUA,D1,errD,errD,errraizUA,errraizUA,'o')
hold on,
errorbar(raizUA,D2,errD,errD,errraizUA,errraizUA,'o')
hold on,
plot(raizUA,mx1.*raizUA+b1,'--',raizUA,mx2.*raizUA+b2,'--')
hold off
xlabel('$\frac{1}{\sqrt{UA}}$ $\left(\mathrm{V}^{-1/2}\right)$', 'Interpreter', 'latex', 'FontSize', 16)
ylabel(' Diámetros del patron de interferencia (m) ')
title('Diámteros del patrón de interferencia en función de la tensión UA')
legend('Diámetros orden 1','Diámetros orden 2','ajuste lineal','ajuste lineal')
grid on






