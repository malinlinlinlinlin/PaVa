function [D, Rsort]=TwoRings3D(N)
% N 代表的是每个ring包含多少各点， 样本容量
n=[0 0 1]; %法向量n
r=1+0.15*rand(N+1,1); %圆的半径为1
c=[0 0 0]; %圆心的坐标
theta=(0:2*pi/N:2*pi)'; %theta角从0到2*pi
a=cross(n,[1 0 0]); %n与i叉乘，求取a向量
if ~any(a) %如果a为零向量，将n与j叉乘
    a=cross(n,[0 1 0]);
end
b=cross(n,a); %求取b向量
a=a/norm(a); %单位化a向量
b=b/norm(b); %单位化b向量

c1=c(1)*ones(size(theta,1),1);
c2=c(2)*ones(size(theta,1),1);
c3=c(3)*ones(size(theta,1),1);

x=c1+a(1)*r.*cos(theta)+b(1)*r.*sin(theta);%圆上各点的x坐标
y=c2+r*a(2).*cos(theta)+r*b(2).*sin(theta);%圆上各点的y坐标
z=c3+r*a(3).*cos(theta)+r*b(3).*sin(theta)+0.2*rand(N+1,1);%圆上各点的z坐标
D1=[x y z];

n=[1 0 0]; %法向量n
r=1+0.15*rand(N+1,1); %圆的半径为1
c=[0 1 0]; %圆心的坐标
theta=(0:2*pi/N:2*pi)'; %theta角从0到2*pi
a=cross(n,[1 0 0]); %n与i叉乘，求取a向量
if ~any(a) %如果a为零向量，将n与j叉乘
    a=cross(n,[0 1 0]);
end
b=cross(n,a); %求取b向量
a=a/norm(a); %单位化a向量
b=b/norm(b); %单位化b向量

c1=c(1)*ones(size(theta,1),1);
c2=c(2)*ones(size(theta,1),1);
c3=c(3)*ones(size(theta,1),1);

x=c1+a(1)*r.*cos(theta)+b(1)*r.*sin(theta);%圆上各点的x坐标
y=c2+r*a(2).*cos(theta)+r*b(2).*sin(theta);%圆上各点的y坐标
z=c3+r*a(3).*cos(theta)+r*b(3).*sin(theta)+0.2*rand(N+1,1);%圆上各点的z坐标
D2=[x y z];

D=[D1;D2];
Rsort=[ones(N+1,1);ones(N+1,1)*2 ];
plotsort3D(D,Rsort)
end
