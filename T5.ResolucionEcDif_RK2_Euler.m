
clear all
close all
clc

% T5.Pg 22.calcular la solución numericamente de la ec diferencial de decadencia del
% uranio 232 usando rk2.  ec: dN/dt=-lambdaN 




% setup:
t0=0;                 %years
tend=4;               %years
N0=5e6;               %nuclei 
                                           Nend=2.09;    %nuclei
% decay constant of 232U
lambda = 0.01006*365;   % [1/years]

% función g:

g=@(N,t)(-lambda.*N);
                                           
%determine the minimum number of integration steps needed to obtain a numerical
%solution close to the correct analytical one

% Runge-Kutta integration
Nnum=N0;
Nsteps=1;
while abs(Nnum-Nend)>0.1
    
   Nsteps= 1+ Nsteps;
   
  [N,t]=rk2(g,t0,N0,tend,Nsteps);
  
  Nnum=N(Nsteps); 
  
end

disp('number of nuclei (Runge-Kutta scheme):'),Nnum
disp('number of required steps for 2nd order Runge-Kutta scheme:'),Nsteps


% Euler integration
Nsteps = 1;
Nnum   = N0;
while abs(Nnum-Nend) > 0.1
    Nsteps = Nsteps + 1;
    [N,t]  = euler(g, t0, N0, tend, Nsteps);
    Nnum   = N(Nsteps);
end

disp('number of nuclei (Euler scheme):'),Nnum
disp('number of required steps for Euler scheme:'),Nsteps










