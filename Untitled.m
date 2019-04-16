w1=4;
w2=0.2;
e=0.9;
beta=1;
c=1;
h=polar([0 2*pi], [0 10]);
hold on
filename='test.gif';
for t=0:1:300
    x=w1*pi/100*t;
    y=1./(c*(1+e.*cos(beta*x)));
    polar(x+w2*pi/100*t,y,'*');
    hold on
    
    title(['t=',num2str(t)])
    drawnow
    im=frame2im(getframe(gcf));
    [A,map]=rgb2ind(im,256);
    if t==1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.001);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.001);
    end

end
