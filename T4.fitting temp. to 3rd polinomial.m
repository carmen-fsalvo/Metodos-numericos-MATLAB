clear all
close all
clc

% T4.Pg 13. fitting temperature to a 3rd order polinomial.

TMadrid = [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];
TLondon = [6.4 ,7.1, 10.1, 13.3, 16.9, 20.3, 21.8, 21.5, 18.5, 14.2, 10.1, 7.4];
Month=[1:12];

% 'the temp. varies like a 3rd order polinomial':

plot(Month, TMadrid,'bo'),hold on
plot(Month, TLondon,'rx'), hold on

% creo la matriz Xij=df/da:

dfda1=transpose(Month.^0);
dfda2=transpose(Month);
dfda3=transpose(Month.^2);
dfda4=transpose(Month.^3);

X=[dfda1,dfda2,dfda3,dfda4];

% calculo los parámetros que busco con operaciones con matrices:

amad=inv(transpose(X)*X)*transpose(X)*TMadrid';
alon=inv(transpose(X)*X)*transpose(X)*TLondon';

% con los parámetros ya hallados formo mis funciones:

fmadrid=amad(1)+amad(2).*Month+amad(3).*Month.^2+amad(4).*Month.^3;
flondon=alon(1)+alon(2).*Month+alon(3).*Month.^2+alon(4).*Month.^3;

% plot best fit:

plot(Month,fmadrid,'b'), hold on
plot(Month, flondon,'r'), hold off

ylabel('Temperature [C]')
xlabel('Month')
legend('Madrid','London','best fit for Madrid','best fit for London','Location','Northwest')




%(el mio es correcto)

%% (el del profe)
clear all, close all, clc

% monthly averages (taken from www.wetter.com)
N     = 12;
Month = [1:12];
Tmad  = [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];
Tlon  = [6.4 ,7.1, 10.1, 13.3, 16.9, 20.3, 21.8, 21.5, 18.5, 14.2, 10.1, 7.4];

plot(Month,Tmad,'bo'), hold on
plot(Month,Tlon,'rx')


% generate matrix Xij = dfi/daj for model: f = a1 + a2 x + a3 x^2 + a4 x^3
dfda1 = transpose(Month.^0);
dfda2 = transpose(Month.^1);
dfda3 = transpose(Month.^2);
dfda4 = transpose(Month.^3);
X = [dfda1, dfda2, dfda3, dfda4];

% obtain best-fit parameters via solution to linear system
amad = inv(transpose(X)*X)*transpose(X)*Tmad'
alon = inv(transpose(X)*X)*transpose(X)*Tlon'


% plot best-fit
plot(Month,amad(1)+amad(2).*Month+amad(3).*Month.^2+amad(4).*Month.^3,'b')
plot(Month,alon(1)+alon(2).*Month+alon(3).*Month.^2+alon(4).*Month.^3,'r')

legend('Madrid','London','best-fit for Madrid','best-fit for London','Location','NorthWest')
xlabel('Month')
ylabel('Temperature [C]')
xlim([0 13])