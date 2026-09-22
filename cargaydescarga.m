clear all
close all
clc

t=[10
20
40
60
90
120
150
180
210
240
300
360
420
510
600];
V=[0.41
0.83
1.62
2.27
3.14
3.84
4.41
4.88
5.27
5.58
6.06
6.39
6.60
6.81
6.93];



V2=[9.76
9.57
9.20
8.86
8.37
7.92
7.48
7.09
6.70
6.35
5.69
5.08
4.56
3.88
3.30];

figure(1)
plot(t,V),hold on 
plot(t,V,'o')
xlabel('tiempo(s)')
ylabel('voltaje(v)')

figure(2)

plot(t,V2), hold on
plot(t,V2,'o')
xlabel('tiempo (s)')
ylabel('voltaje (v)')












