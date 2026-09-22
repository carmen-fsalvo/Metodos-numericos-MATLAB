
% 4th order Runge-Kutta. (for ODE)

function[f,x]=rk4(g,x0,f0,xN,N)

inx=(xN-x0)/(N-1); % incremento de x
x=linspace(x0,xN,N);
f=zeros(1,N);
f(1)=f0;

for i=1:N-1
  
  x(i+1)= x(i)+ inx;  
  
  k1=g(f(i),x(i));
  k2=g(f(i)+0.5*k1*inx, x(i)+inx/2);
  k3=g(f(i)+0.5*k2*inx, x(i)+inx/2);
  k4=g(f(i)+k3*inx, x(i+1));
  
  
  f(i+1)=f(i) + 1/6 * (k1+2*k2+2*k3+k4) * inx;
  
end

end
