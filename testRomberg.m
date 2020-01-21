function testRomberg(f,a,b,n,s)
%funkcja testuje metode romberga dla funkcji f na przedziale [a,b] dla M
%rownych 1 az do n z krokiem s. Funkcja oblicza blad bezwzgledny i wzgledny
%wzgledem integral(f,a,b)
%dla kazdego M, wypisuje tabele w formacie LaTeXa i tworzy wykresy bledow
%wzglednych i bezwzglednych oraz wykres funkcji.
N=1:s:n;
xr=zeros(1,size(N,2));
error=zeros(1,size(N,2));
relError=zeros(1,size(N,2));
x=integral(f,a,b);
format='%10.5e';
    for i=1:size(N,2)
        xr(i)=romberg(f,a,b,N(i));
        error(i)=abs(x-xr(i));
        relError(i)=abs((x-xr(i))/x);
        disp(['\hline $', num2str(i), '$ & $', num2str(xr(i),format), '$ & $',num2str(x,format) ,'$ & $', num2str(error(i),format),'$ & $',num2str(relError(i),format),'$ \\']);
    end
figure, plot(N,error),title(['Wykres b³êdu bezwglednego dla obliczenia ca³ki z funkcji f(x)=',strrep(func2str(f),'@(x)',''),' na przedziale [',num2str(a),',',num2str(b),'] metod¹ Romberga']),
xlabel('M'),ylabel('b³¹d bezwzglêdny');
figure, plot(N,relError),title(['Wykres b³êdu wzglêdnego dla obliczenia ca³ki z funkcji f(x)=',strrep(func2str(f),'@(x)',''),' na przedziale [',num2str(a),',',num2str(b),'] metod¹ Romberga']),
xlabel('M'),ylabel('b³¹d wzglêdny');


%wykres funkcji
xx=linspace(a,b,1000);
y=zeros(size(xx,2));
    for i=1:size(xx,2)
        y(i)=f(xx(i));
    end
h=zeros(1,2^n+1);
ksi=linspace(a,b,2^n+1);
    for i=1:(2^n)
        h(i)=f(ksi(i));
    end
figure, area(ksi,h),hold on,plot(xx,y),,title(['Wykres funkcji f(x)=',strrep(func2str(f),'@(x)',''),' na przedziale [',num2str(a),',',num2str(b),']']),
xlabel('x'),ylabel('f(x)');
end