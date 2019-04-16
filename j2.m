nx=100;xmin=-3.5;xmax=1.5;
ny=100;ymin=-3.0;ymax=1.5;
[x,y]=meshgrid(linspace(xmin,xmax,nx),linspace(ymin,ymax,ny));
U0=5.0;
Gamma=8*pi;xGamma=-1.0;yGamma=-1.0;
K=5.0;xK=-1.0;yK=-1.0;
radius=@(x,y,x1,y1)(sqrt((x-x1).^2+(y-y1).^2));
PsiK=K*sin(atan2(y-yK,x-xK))./radius(x,y,xK,yK);
PsiGamma=Gamma*log(radius(x,y,xGamma,yGamma))./2/pi;
StreamFunction=U0*y-PsiGamma-PsiK;
levmin=StreamFunction(1,nx);
levmax=StreamFunction(ny,nx/2);
levels=linspace(levmin,levmax,50);
contour(x,y,StreamFunction,levels)
hold on
theta=linspace(0,2*pi);
plot(xGamma+cos(theta),yGamma+sin(theta),'k')
axis equal
axis([xmin xmax ymin ymax])
ylabel('y')
xlabel('x')