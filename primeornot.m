% prime-or-not.m: evalua si un número natural es primo o no

function[y]=primeornot(n)

div=2;

while (rem(n,div)>0)
    div = div + 1;
end

if div==n
    y=1;
else
    y=div;
end


end