function [D,Rsort] = CCRings(N1,N2,N3,No)
% 这个函数用于生成同心圆环
% 
%% 环1
theta=2*pi*rand(N1,1);
pho=1+0.8*rand(N1,1);
x=pho.*cos(theta);
y=pho.*sin(theta);
d1=[x y];
rsort1=ones(1,N1);
%% 环2
theta=2*pi*rand(N2,1);
pho=2.5+0.8*rand(N2,1);
x=pho.*cos(theta);
y=pho.*sin(theta);
d2=[x y];
rsort2=2*ones(1,N2);
%% 环3
theta=2*pi*rand(N3,1);
pho=4+0.8*rand(N3,1);
x=pho.*cos(theta);
y=pho.*sin(theta);
d3=[x y];
rsort3=3*ones(1,N3);
%% noise
noise=[-4+0.6*rand(No,1) -0.5+0.1*rand(No,1)];
noise=[noise;-2.4+0.6*rand(No-5,1) -0.5+0.1*rand(No-5,1)];
rsortn=zeros(1,2*No-5);
D=[d1;d2;d3;noise];
Rsort=[rsort1,rsort2,rsort3,rsortn];
end

