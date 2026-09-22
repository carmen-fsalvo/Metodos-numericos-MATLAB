
% function to calculate 2nd order ODEs with the 2nd order Runge-Kutta method

function[x,v,t]=rk22(g,h,t0,x0,v0,tN,N)

int=(tN-t0)/(N-1);
t=linspace(t0,tN,N);
x = zeros(1,N);
v = zeros(1,N);
x(1) = x0;
v(1) = v0;

for i=1:N-1
   
    tmid = t(i) + int/2;
    xmid = x(i) + g(x(i),v(i),t(i)) * int/2;
    vmid = v(i) + h(x(i),v(i),t(i)) * int/2;  
    
    x(i+1) = x(i) + g(xmid,vmid,tmid)*int;
    v(i+1) = v(i) + h(xmid,vmid,tmid)*int;
    
    
end


end

