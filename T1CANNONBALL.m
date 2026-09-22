 Unit 1 (MATLAB Course @ UAM)
% Cannonball exercise
% (c) Alexander Knebe

%============
% CANNONBALL
%============
clear all
close all
clc


% constants
gEarth     = -9.79757; % m/s^2
gMoon      = -1.622;   % m/s^2
gy         = gEarth;
gx         = 0.0;

% input values
N     = 100;     % number of points for the numerical solution x(t) and y(t)
x0    = 3.;      % m
y0    = 2.;      % m
v0    = 10.;     % m/s (NOTE: total velocity!)
alpha = 23.;     % degrees

% inital velocity transformed to [vxy, vy0]
vx0   = v0*cos(alpha * 2*pi/360.);
vy0   = v0*sin(alpha * 2*pi/360.);

% time arrays (Note: Tend is the time until return to y=y0)
Tend  = -(2*vy0)/gy
t     = linspace(0,Tend,N);

% analytical cannonball solution
x  = x0  + vx0.*t + 0.5.*gx.*t.^2;
y  = y0  + vy0.*t + 0.5.*gy.*t.^2;

%vx = vx0 .* ones(1,N); % making explicit use of the knowledge that gx=0
vx = vx0 +  gx.*t;
vy = vy0 +  gy.*t;


% figure 1: plot cannonball solution
figure(1)
subplot(3,2,[1 2]), plot(x,y),  xlabel('x'), ylabel('y')
subplot(3,2,3), plot(t,x),  xlabel('t'), ylabel('x')
subplot(3,2,4), plot(t,y),  xlabel('t'), ylabel('y')
subplot(3,2,5), plot(t,vx), xlabel('t'), ylabel('vx')
subplot(3,2,6), plot(t,vy), xlabel('t'), ylabel('vy')


% figure 2: check energy conservation
v = sqrt(vx.^2 + vy.^2);
E = 0.5*v.^2-gy.*y;
figure(2)
plot(t,E), xlabel('t'),ylabel('E')


% figure 3: numerical derivative of positions
%  (NOTE: we have N elements and end up with N-1 elements for the derivatives!)
dx     = diff(x);
dy     = diff(y);
dt     = diff(t);
vx_num = dx./dt;
vy_num = dy./dt;

figure(3)
plot(t(1:1:N-1)+dt/2,vx_num,'rx', t(1:1:N),vx(1:1:N),'k'), hold on
plot(t(1:1:N-1)+dt/2,vy_num,'rx', t(1:1:N),vy(1:1:N),'k')
xlabel('t'),ylabel('v')
legend('vx_{numerical}','vx_{analytical}','vy_{numerical}','vy_{analytical}')

% numerical energy conservation:
%   v_num() is given at the mid-points of time t(), whereas y() is given at t()
%     -> we need to correct for that and obtain y_mid()!
y_mid = (y(1:end-1)+y(2:end))./2;
E_num = 0.5.*(vx_num.^2+vy_num.^2)-gy.*y_mid;
t_mid = (t(1:end-1)+t(2:end))./2;
figure(2), hold on % we return to figure #2 adding this line to it
plot(t_mid,E_num,'x')
legend('analytical energy conservation','numerical energy conservation')

% numerical derivatives of numerical velocities
dvx  = diff(vx_num); % NOTE: dvx will have length N-2
dvy  = diff(vy_num);
il   = (1:1:N-2);
ir   = (2:1:N-1);
dt   = t(ir)-t(il);
gx_num = dvx./dt;
gy_num = dvy./dt;

figure(4)
% the mid-points of the mid-points are again the original points (minus the first and last)!
plot(t(2:1:N-1),gx_num,'bx', t(2:1:N-1),gy_num,'rx', t(2:1:N-1),gy.*ones(1,N-2),'k')
xlabel('t'), ylabel('acceleration')
legend('gx_{numerical}','gy_{numerical}','gy_{analytical}')