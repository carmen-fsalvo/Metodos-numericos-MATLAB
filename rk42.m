
% function to calculate 2nd order ODEs with the 4th order Runge-Kutta
% method.

function[x,v,t]=rk42(g,h,t0,x0,v0,tN,N)

int=(tN-t0)/(N-1);
t = linspace(t0,tN,N);
x = zeros(1,N);
v = zeros(1,N);
x(1) = x0;
v(1) = v0;

for i=1:N-1
    
   k1 = g(x(i), v(i), t(i));
   m1 = h(x(i), v(i), t(i)); 
   
   k2 = g(x(i)+k1*int/2,   v(i)+m1*int/2,  t(i)+int/2);
   m2 = h(x(i)+k1*int/2,   v(i)+m1*int/2,  t(i)+int/2);
    
   k3 = g(x(i)+k2*int/2,   v(i)+m2*int/2,  t(i)+int/2);
   m3 = h(x(i)+k2*int/2,   v(i)+m2*int/2,  t(i)+int/2);
   
   k4 = g(x(i)+k3*int,     v(i)+m3*int,    t(i+1));
   m4 = h(x(i)+k3*int,     v(i)+m3*int,    t(i+1));

   x(i+1) = x(i) + 1/6 * (k1+2*k2+2*k3+k4) * int;
   v(i+1) = v(i) + 1/6 * (m1+2*m2+2*m3+m4) * int;
   
end



end
