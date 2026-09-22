
% Runge-Kutta 2nd order.

function [f,x] = rk2(g, x0, f0, xN, N)


% initialisation block
%----------------------
% step size
dx   = (xN-x0)/(N-1);

% arrays
x    = linspace(x0,xN,N);
f    = zeros(1,N);
%x(1) = x0; this is automatically initialized by linspace()
f(1) = f0;


% integration block
%-------------------
for i=1:N-1
    
    % mid-point values
    xmid = x(i) + dx/2;
    fmid = f(i) + g(f(i),x(i))*dx/2;
    
    % actual step
    f(i+1) = f(i) + g(fmid,xmid)*dx;
end