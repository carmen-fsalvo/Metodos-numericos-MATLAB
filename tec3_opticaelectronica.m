clear all
clc
close all

% ÓPTICA ELECTRONICA . PRÁCTICA 3.


Ua=[2000
2200
2400
2600
2800
3000
3200
3400
3600
3800
4000
4200
4400
4600
4800]; % tensión anódica (V)

B2=[1.06234E-06
1.15271E-06
1.24677E-06
1.34452E-06
1.49806E-06
1.60503E-06
1.71569E-06
1.83004E-06
1.94808E-06
2.06981E-06
2.19522E-06
2.32432E-06
2.39026E-06
2.45712E-06
2.5936E-06]; %Campo mag. al cuadrado (T^2)

errorB2=[
2.47086E-07
2.64263E-07
2.81991E-07
3.00269E-07
3.28719E-07
3.48373E-07
3.68579E-07
3.89334E-07
4.10641E-07
4.32497E-07
4.54905E-07
4.77863E-07
4.89548E-07
5.01371E-07
5.2543E-07];


errorUa=[100
    100
    100
    100
    100
    100
    100
    100
    100
    100
    100
    100
    100
    100
    100];


[mx,b,errormx]=minimoscuadrados_(B2,Ua);
[mxmax,bmax,errormxmax]=minimoscuadrados_(B2+errorB2,Ua);
[mxmin,bmin,errormxmin]=minimoscuadrados_(B2-errorB2,Ua);


%comparo B teorica con experimentales conociendo el valor de literatura de
%la carga específica del electrón:

Bteoria=[0.000943215
0.000989252
0.00103324
0.00107543
0.001116027
0.001155198
0.001193083
0.001229802
0.001265456
0.001300132
0.001333907
0.001366848
0.001399014
0.001430456
0.001461222];
Bexpc=[0.001030698
0.001073643
0.001116589
0.001159535
0.001223953
0.001266899
0.001309845
0.001352791
0.001395736
0.001438682
0.001481628
0.001524574
0.001546046
0.001567519
0.001610465];
Bexpl=[0.001567519
0.001631938
0.001717829
0.001803721
0.001846667
0.001932558
0.001996977
0.002061395
0.002147287
0.002190232
0.002254651
0.00231907
0.002383488
0.002426434
0.00246938];

figure (1)
errorbar(B2,Ua,errorUa,errorUa,errorB2,errorB2,'o') 
hold on,
plot(B2,B2.*mx +b,B2+errorB2,(B2+errorB2).*mxmax +bmax,(B2-errorB2),(B2-errorB2).*mxmin +bmin)
hold off
xlabel('B^2 medio (T^2)')
ylabel('Tensión anódica (V)')
legend('Datos','Pendiente media','Pendiente mín','Pendiente máx')
title('Tensión anódica respecto al cuadrado del campo magnético')
grid on

figure(2)

plot(Ua,Bteoria,'o',Ua,Bexpc,'o',Ua,Bexpl,'o')
xlabel('Tensión anódica (V)')
ylabel('Campos magnéticos')
legend('B según el valor tabulado','B experimental a distancia pequeña','B experimental a distancia mayor')
grid on







