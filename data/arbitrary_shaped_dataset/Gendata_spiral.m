function [D,Rsort]=Gendata_spiral
%圆的周长是递增的
t = pi:0.05:4*pi;
A = 1;
w = 1;
sita = 0;
for ii = 1:length(t)
    x(ii) = A *cos(w*t(ii) + sita);
    y(ii) = A *sin(w*t(ii) + sita);
    A = A+ 0.1;
end
figure;
 plot(x,y,'ro');
 D=[x' y'];
Rsort=ones(size(D,1),1);

 t = pi:0.05:4*pi;
 A = 1;
 w = 1;
sita = pi*4/3;
for ii = 1:length(t)
    x(ii) = A *cos(w*t(ii) + sita);
    y(ii) = A *sin(w*t(ii) + sita);
    A = A+ 0.1;
end
D1=[x' y'];
D=[D; D1];
Rsort=[Rsort;ones(size(D1,1),1)*2];
hold on
plot(x,y,'b+')


 t = pi:0.05:4*pi;
 A = 1;
 w = 1;
sita = pi/3*2;
for ii = 1:length(t)
    x(ii) = A *cos(w*t(ii) + sita);
    y(ii) = A *sin(w*t(ii) + sita);
    A = A+ 0.1;
end
D1=[x' y'];
D=[D; D1];
Rsort=[Rsort;ones(size(D1,1),1)*3];
hold on
plot(x,y,'g*')
end
