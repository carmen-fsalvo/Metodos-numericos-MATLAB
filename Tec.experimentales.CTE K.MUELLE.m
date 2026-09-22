clear all
close all
clc
% TABLA 1. recta y= 0.99x+23.64:

x=[57,98,136,176];
y=[80,121,159,198];


err=[0.1,0.1,0.1,0.1];

plot(x,y), hold on
errorbar(x,y,err,'both','o'),hold off



% TABLA 2. recta y'=0.96x'+1.64:

x2=[120,81,61,49];
y2=[116.95,79.88,60.31,48.63];
err2=[0.01,0.01,0.01,0.01];

oplot(x2,y2), hold on
errorbar(x2,y2,err2,'both','o'), hold off