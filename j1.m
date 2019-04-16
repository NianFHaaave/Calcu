U=1.0;a=1.0;m=4.0;co=m/(2*pi);
nPsi=15;n=30;yStart=-2.0*a;
xStart=linspace(0,2*a,nPsi);
y=linspace(-2*a,2*a,n);
x=zeros(1,n);
StreamFun=@(x,y,psi,U,co,a)(-U*x-co*(atan2(x,y+a)-atan2(x,y-a))-psi);
Psi=StreamFun(xStart,yStart,0,U,co,a);
options=optimset('display','off');
for j=1:nPsi
    guess=xStart(j);
    for i=1:n
        x(i)=fzero(StreamFun,guess,options,y(i),Psi(j),U,co,a);
        guess=x(i);
    end
    if j>1
        plot(y,x,'b',y,-x,'b')
    end
    hold on
end
axis([-2*a,2*a,-2*a,2*a])%作对应图形的流线
ylabel('x')
xlabel('y')
% xx=linspace(-1,1,40);%作对应图形
% yy=sqrt(1-xx.^2+2*xx./tan(xx/co));
% plot(yy,xx,'k',-yy,xx,'k')
