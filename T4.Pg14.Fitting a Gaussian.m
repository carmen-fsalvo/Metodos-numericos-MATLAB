close all
clear all
clc

%T4.Pg 14. fit a Gaussian to the distribution of the return values of
%randn().

% obtener los datos, es decir, obtener la distribución normalizada:

N=100000;
data= rand(N,1);
[p,x] = hist(data,Nbins);
p = normalise(p,x);

% filtro los ceros:
i=find(p>0);
p=p(i);
x=x(i);

plot(x,p,'.'), hold on

% hallo la matriz Xij=df/da con f=a1-a2 x^2

dfda1=ones(1,length(x));
dfda2= -x.^2;

% obtain best-fit parameters via solution to linear system
a = inv(transpose(X)*X)*transpose(X) * log(p)';
