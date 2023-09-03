function [D,Rsort] = Twomoons(N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% N  ÔëÒôµÄ¸öÊý
x=0:0.01:2*pi;
c=cos(x);
s=sin(x);
ss=s(find(s.*(x>=0&x<=3)));
cc=c(find(c.*(x>=1.5&x<=4.5)));
xc=x(find(x.*(x>=1.5&x<=4.5)));
xs=x(find(x.*(x>=0&x<=3)));
s1=randn(size(ss))./10+ss;
c1=randn(size(cc))./10+cc;
noise=rand(N,2);
noise(:,1)=4.5*noise(:,1);
noise(:,2)=-1.5+3*noise(:,2);
% plot(xc,c1,'ro');
% hold on
% plot(xs,s1,'bd');
D1=[xc,xs];
D2=[c1,s1];
D=[D1',D2'];
D=[D(1:600,:);noise];
Rsort(1:301)=1;
Rsort(302:600)=2;
if N>1
   Rsort(601:600+N)=0;
end
plotsort(D,Rsort,3);
end

