function [D,Rsort]=gendata_atom(N1,N2)
%% Íâ¿Ç
theta=rand(N1,1)*2*pi;
phy=rand(N1,1)*pi;
pho=5;
x=pho*sin(theta).*cos(phy);
y=pho*sin(theta).*sin(phy);
z=pho*cos(theta);
D_outer=[x y z];
%% ÖÐÐÄ
theta=rand(N2,1)*2*pi;
phy=rand(N2,1)*pi;
pho=sqrt(rand(N2,1))*1.5;
x=pho.*sin(theta).*cos(phy);
y=pho.*sin(theta).*sin(phy);
z=pho.*cos(theta);
D_inner=[x y z];


D=[D_outer; D_inner];
Rsort=[ones(N1,1); ones(N2,1)*2];
plotsort3D(D,Rsort)
end