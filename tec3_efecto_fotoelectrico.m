clear all
close all
clc

% PRACTICA 4. EFECTO FOTOELÉTRICO


%P1: Determinar cte de Planck:


Wv=[365,405,436,546,577];      %longitudes de onda (nm)
f=[8.21,7.40,6.88,5.49,5.20];  %frecuencias (10^14Hz)

Volt2mm=-1.*[-1.861,-1.438,-1.227,-0.647,-0.436];  %stopping voltage (V) para apertura 2 mm
[mx2,b2,errmx2,errb2]=minimoscuadrados_(f,Volt2mm);

Volt4mm=-1.*[-1.879,-1.464,-1.246,-0.656,-0.503];  %stopping voltage (V) para apertura 4 mm
[mx4,b4,errmx4,errb4]=minimoscuadrados_(f,Volt4mm);

Volt8mm=-1.*[-1.861,-1.453,-1.227,-0.672,-0.521];  %stopping voltage (V) para apertura 8 mm
[mx8,b8,errmx8,errb8]=minimoscuadrados_(f,Volt8mm);

figure(1)

plot(f,Volt2mm,'*',f,mx2.*f+b2,'--',f,Volt4mm,'*',f,mx4.*f+b4,'--',f,Volt8mm,'*',f,mx8.*f+b8,'--')
xlabel('Frecuencia de radiación (10^1^4 Hz)')
ylabel('Voltaje de frenado (V)')
title('Determinación de la constante de Planck')
legend('Apertura 2mm','Ajuste lineal 2mm','Apertura 4mm','Ajuste lineal 4mm','Apertura 8mm','Ajuste lineal 8mm')
grid on

%la pendiente va a ser igual a h/e y la ordenada en el origen va a ser Wo/e

%mx [eV·s]   ;  b [eV]  como quiero pasar de eV a J multiplico e a mx y
%10^-14 porque mi escala de frecuencias está multiplicada por 10^14

e=1.6e-19;

h2mm= e/1e14.*mx2;
errh2mm= e/1e14.*errmx2;
Wo2mm= b2;
errWo2mm= errb2;

h4mm= e/1e14.*mx4;
errh4mm= e/1e14.*errmx4;
Wo4mm= b4;
errWo4mm= errb4;

h8mm= e/1e14.*mx8;
errh8mm= e/1e14.*errmx8;
Wo8mm= b8;
errWo8mm= errb8;

%P2.Medida de las curvas características corriente-voltaje del fotodiodo
%Medida de las curvas I-V del fotodiodo variando la intensidad a frecuencia
%constante

% valores iniciales: abertura 2mm, longitud de onda  436 nm

Voltfcte2=[-3.497
-1.431
-0.42
2.208
4.011
5.875
6.384
7.262
8.025
9.272
10.212
12.039
13.62
14.722
16.284
17.372
18.7
19.871
21.1
22.634
23.501
25.218
27.261
28.974
30.171]; % V
Corrfcte2=[2.63E-11
1.78E-10
3.08E-10
1.04E-09
1.54E-09
1.77E-09
1.90E-09
2.30E-09
2.45E-09
2.62E-09
2.80E-09
3.05E-09
3.23E-09
3.33E-09
3.48E-09
3.56E-09
3.68E-09
3.80E-09
3.89E-09
3.96E-09
4.07E-09
4.14E-09
4.25E-09
4.29E-09
4.39E-09];     % A


% valores iniciales: abertura 4mm, longitud de onda  436 nm

Voltfcte4=[-1.057
0.273
2.058
3.249
4.141
5.185
6.267
7.363
8.306
9.369
10.34
11.341
12.344
13.555
14.488
15.348
16.68
18.208
19.187
20.66
21.696
22.505
23.562
24.951
26.117
27.484
28.71
30.014]; % V
Corrfcte4=[2.13E-11
1.25E-09
3.79E-09
5.32E-09
6.08E-09
6.56E-09
7.54E-09
8.37E-09
9.11E-09
9.88E-09
1.05E-08
1.11E-08
1.16E-08
1.22E-08
1.25E-08
1.29E-08
1.34E-08
1.39E-08
1.42E-08
1.47E-08
1.50E-08
1.52E-08
1.55E-08
1.59E-08
1.61E-08
1.64E-08
1.66E-08
1.68E-08];     % A

% valores iniciales: abertura 8mm, longitud de onda  436 nm

Voltfcte8=[-0.898
0.349
1.513
2.299
3.327
4.269
5.272
6.321
7.242
8.216
9.16
10.233
11.38
12.166
12.454
13.251
14.368
15.333
16.283
17.202
18.288
19.247
20.374
21.362
22.161
23.188
24.203
25.399
26.256
27.225
28.17
29.393
30.198]; % V
Corrfcte8=[2.07E-10
5.36E-09
1.19E-08
1.64E-08
2.17E-08
2.44E-08
2.60E-08
3.01E-08
3.29E-08
3.58E-08
3.85E-08
4.18E-08
4.44E-08
4.60E-08
4.71E-08
4.94E-08
5.13E-08
5.27E-08
5.44E-08
5.48E-08
5.62E-08
5.80E-08
5.89E-08
6.00E-08
6.10E-08
6.28E-08
6.31E-08
6.46E-08
6.51E-08
6.64E-08
6.65E-08
6.73E-08
6.79E-08];     % A

% NOTA: en el programa de PASCO el Run4 corresponde a 2mm, Run5 corresponde
% 4 mm, y Run6 corresponde a 8mm de abertura.

figure(2)

plot(Voltfcte2,Corrfcte2,'.',Voltfcte4,Corrfcte4,'.',Voltfcte8,Corrfcte8,'.')
xlabel('Voltaje (V)')
ylabel('Intensidad (A)')
title('Determinación de la curva I-V a frecuencia cte')
legend('Apertura 2mm','Apertura 4mm','Apertura 8mm')
grid on


%P3.Medida de las curvas características corriente-voltaje del fotodiodo
%Medida de las curvas I-V del fotodiodo variando la frecuencia a intensidad
%constante

% longitud de onda: 365 nm, apertura 4mm

Volticte1=[-1.726
0.301
2.262
4.331
6.266
8.306
10.257
12.261
14.277
16.208
18.22
20.236
22.201
24.277
26.289
28.178
30.11];
Corricte1=[2.71E-11
2.98E-09
8.10E-09
1.22E-08
1.51E-08
1.92E-08
2.23E-08
2.49E-08
2.70E-08
2.92E-08
3.11E-08
3.28E-08
3.39E-08
3.54E-08
3.68E-08
3.83E-08
3.89E-08];

% longitud de onda: 405 nm, apertura 4mm

Volticte2=[-1.34
-0.693
0.747
2.746
4.793
6.691
8.754
10.706
12.716
14.733
16.694
18.677
20.676
22.635
24.669
26.59
28.636
30.161];
Corricte2=[1.17E-12
2.67E-10
1.40E-09
3.48E-09
4.47E-09
5.52E-09
6.69E-09
7.67E-09
8.47E-09
9.12E-09
9.69E-09
1.03E-08
1.07E-08
1.12E-08
1.17E-08
1.20E-08
1.23E-08
1.25E-08];


% longitud de onda: 436 nm, apertura 4mm

Volticte3=[-1.1
0.932
2.934
5.01
7.016
8.909
10.859
12.862
14.86
16.818
18.892
20.85
22.878
24.951
26.926
28.871
30.149];
Corricte3=[7.76E-12
2.33E-09
5.20E-09
6.50E-09
8.17E-09
9.75E-09
1.10E-08
1.21E-08
1.28E-08
1.36E-08
1.44E-08
1.51E-08
1.57E-08
1.62E-08
1.67E-08
1.70E-08
1.73E-08];


figure(3)

plot(Volticte1,Corricte1,'.',Volticte2,Corricte2,'.',Volticte3,Corricte3,'.')
xlabel('Voltaje (V)')
ylabel('Intensidad (A)')
title('Determinación de la curva I-V a intensidad cte')
legend('Longitud de onda de 365nm','Longitud de onda de 405nm','Longitud de onda de 436nm')
grid on


%Parte extra (kinda) aplico logaritmos para ver la relación
%intensidad-voltaje a través de la pendiente (que debe ser 1/2 aprox:

% Para frecuencia constante (436 nm)
Vlogfcte2=log10(Voltfcte2(4:end));
Ilogfcte2=log10(Corrfcte2(4:end));
[mxlog1,blog1,errmxlog1,errblog1]=minimoscuadrados_(Vlogfcte2,Ilogfcte2);

Vlogfcte4=log10(Voltfcte4(3:end));
Ilogfcte4=log10(Corrfcte4(3:end));
[mxlog2,blog2,errmxlog2,errblog2]=minimoscuadrados_(Vlogfcte4,Ilogfcte4);

Vlogfcte8=log10(Voltfcte8(3:end));
Ilogfcte8=log10(Corrfcte8(3:end));
[mxlog3,blog3,errmxlog3,errblog3]=minimoscuadrados_(Vlogfcte8,Ilogfcte8);


%Para intensidad cte (4mm)

Vlogicte1=log10(Volticte1(3:end));
Ilogicte1=log10(Corricte1(3:end));
[mxlog4,blog4,errmxlog4,errblog4]=minimoscuadrados_(Vlogicte1,Ilogicte1);

Vlogicte2=log10(Volticte2(3:end));
Ilogicte2=log10(Corricte2(3:end));
[mxlog5,blog5,errmxlog5,errblog5]=minimoscuadrados_(Vlogicte2,Ilogicte2);

Vlogicte3=log10(Volticte3(3:end));
Ilogicte3=log10(Corricte3(3:end));
[mxlog6,blog6,errmxlog6,errblog6]=minimoscuadrados_(Vlogicte3,Ilogicte3);



figure(4)

plot(Vlogfcte2,Ilogfcte2,'.',Vlogfcte2,mxlog1.*Vlogfcte2+blog1,'--',Vlogfcte4,Ilogfcte4,'.',Vlogfcte4,mxlog2.*Vlogfcte4+blog2,'--',Vlogfcte8,Ilogfcte8,'.',Vlogfcte8,mxlog3.*Vlogfcte8+blog3,'--')
xlabel('Voltaje (V)')
ylabel('Intensidad (A)')
title('Determinación de la curva I-V a frecuencia cte tomando logaritmos')
legend('Apertura 2mm','Ajuste lineal','Apertura 4mm','Ajuste lineal','Apertura 8mm','Ajuste lineal')
grid on


figure(5)

plot(Vlogicte1,Ilogicte1,'.',Vlogicte1,mxlog4.*Vlogicte1+blog4,'--',Vlogicte2,Ilogicte2,'.',Vlogicte2,mxlog5.*Vlogicte2+blog5,'--',Vlogicte3,Ilogicte3,'.',Vlogicte3,mxlog6.*Vlogicte3+blog6,'--')
xlabel('Voltaje (V)')
ylabel('Intensidad (A)')
title('Determinación de la curva I-V a intensidad cte tomando logaritmos')
legend('Longitud de onda de 365nm','Ajuste lineal','Longitud de onda de 405nm','Ajuste lineal','Longitud de onda de 436nm','Ajuste lineal')
grid on







