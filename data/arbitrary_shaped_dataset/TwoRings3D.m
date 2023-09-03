function [D, Rsort]=TwoRings3D(N)
% N �������ÿ��ring�������ٸ��㣬 ��������
n=[0 0 1]; %������n
r=1+0.15*rand(N+1,1); %Բ�İ뾶Ϊ1
c=[0 0 0]; %Բ�ĵ�����
theta=(0:2*pi/N:2*pi)'; %theta�Ǵ�0��2*pi
a=cross(n,[1 0 0]); %n��i��ˣ���ȡa����
if ~any(a) %���aΪ����������n��j���
    a=cross(n,[0 1 0]);
end
b=cross(n,a); %��ȡb����
a=a/norm(a); %��λ��a����
b=b/norm(b); %��λ��b����

c1=c(1)*ones(size(theta,1),1);
c2=c(2)*ones(size(theta,1),1);
c3=c(3)*ones(size(theta,1),1);

x=c1+a(1)*r.*cos(theta)+b(1)*r.*sin(theta);%Բ�ϸ����x����
y=c2+r*a(2).*cos(theta)+r*b(2).*sin(theta);%Բ�ϸ����y����
z=c3+r*a(3).*cos(theta)+r*b(3).*sin(theta)+0.2*rand(N+1,1);%Բ�ϸ����z����
D1=[x y z];

n=[1 0 0]; %������n
r=1+0.15*rand(N+1,1); %Բ�İ뾶Ϊ1
c=[0 1 0]; %Բ�ĵ�����
theta=(0:2*pi/N:2*pi)'; %theta�Ǵ�0��2*pi
a=cross(n,[1 0 0]); %n��i��ˣ���ȡa����
if ~any(a) %���aΪ����������n��j���
    a=cross(n,[0 1 0]);
end
b=cross(n,a); %��ȡb����
a=a/norm(a); %��λ��a����
b=b/norm(b); %��λ��b����

c1=c(1)*ones(size(theta,1),1);
c2=c(2)*ones(size(theta,1),1);
c3=c(3)*ones(size(theta,1),1);

x=c1+a(1)*r.*cos(theta)+b(1)*r.*sin(theta);%Բ�ϸ����x����
y=c2+r*a(2).*cos(theta)+r*b(2).*sin(theta);%Բ�ϸ����y����
z=c3+r*a(3).*cos(theta)+r*b(3).*sin(theta)+0.2*rand(N+1,1);%Բ�ϸ����z����
D2=[x y z];

D=[D1;D2];
Rsort=[ones(N+1,1);ones(N+1,1)*2 ];
plotsort3D(D,Rsort)
end
