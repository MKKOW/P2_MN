function [x,R]=romberg(f,a,b,M)
%Funkcja oblicza wartosc numerczna calki na przedziale (a,b) z funkcji f(x)
%metoda romberga
h=b-a;
R=zeros(M);
R(1,1)=1/2*(b-a)*(f(a)+f(b));
for n = 2:M
    h=h/2;
    suma=0;
    for i=1:(2^(n-2))
        suma=suma+f(a+(2*i-1)*h);
    end
    R(n,1)=1/2*R(n-1,1)+h*suma;
    for m=2:n
        R(n,m)=R(n,m-1)+(R(n,m-1)-R(n-1,m-1))/(4^(m-1)-1);
    end
end
x=R(M,M);
end