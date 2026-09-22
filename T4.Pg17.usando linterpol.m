clear all
close all
clc

% T4.Pg 17. Usar la función linterpol.m
%-----------------------------------------

% plot la función f(x)=x^2sen(x) en el intervalo a,b:

N=10;
a=1.5;
b=8.7;
x=linspace(a,b,N);
y=x.^2.*sin(x);

plot(x,y,'bo','MarkerSize',10), hold on
xlabel('x')
ylabel('f(x)')

% overplot la misma funcion en los ptos medios de los ptos q ya tengo:
% (habrán solo N-1 midpoints)

%para saber como de espaciados está cada pto de x:
esp= (b-a)/N;

for i=a:esp:b 
     
   xint=((i)+(i+1))./2;
   yint= linterpol(i,(i+1),i.^2.*sin(i),(i+1).^2.*sin(i+1),xint);
   plot(xint,yint,'rx')
    
end

%% profe


clear all, close all, clc

a=1.5;
b=8.7;
N=10;

x=linspace(a,b,N);
f=x.^2.*sin(x);

% plot function
plot(x,f,'o','MarkerSize',10)
xlabel('x')
ylabel('f(x)')


% calculate f(x) at mid-points using polynomial interpolation
% (p4interpol() finds the 2 left and 2 right points itself...)
xp = (x(2:N-2)+x(3:N-1))./2;  
fp = p4interpol(x,f,xp);
hold on
plot(xp,fp,'rx')

% calculate f(x) at mid-points using linear interpolation
% (we pass the left and right point to linterpol()...)
fp = zeros(1,length(xp));
for i=1:length(xp)
    
    % find left and right points
    ir = find(x>xp(i));
    ir = ir(1);
    il = ir-1;
    xl = x(il);
    fl = f(il);
    xr = x(ir);
    fr = f(ir);
    
    % linearly interpolate to xp(i)
    fp(i) = linterpol(xl,xr,fl,fr,xp(i));
end
plot(xp,fp,'gd')

legend('tabulated function','polynomial interpolation','linear interpolation','Location','NorthWest')