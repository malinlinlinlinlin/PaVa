function [D, Rsort]=hepta(~)
% 这个函数用来生成hepta 数据集，包含七个类， 中间类的密度较高，分布在三维空间
mu = [0 0 0]; Sigma = 0.3*eye(3);
r1 = mvnrnd(mu, Sigma, 300);
Rsort=ones(300,1);

mu = [0 0 4]; Sigma = 0.3*eye(3);
r2 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;2*ones(200,1)];

mu = [0 0 -4]; Sigma = 0.3*eye(3);
r3 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;3*ones(200,1)];

mu = [4 0 0]; Sigma = 0.3*eye(3);
r4 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;4*ones(200,1)];

mu = [-4 0 0]; Sigma = 0.3*eye(3);
r5 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;5*ones(200,1)];

mu = [0 4 0]; Sigma = 0.3*eye(3);
r6 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;6*ones(200,1)];

mu = [0 -4 0]; Sigma = 0.3*eye(3);
r7 = mvnrnd(mu, Sigma, 200);
Rsort=[Rsort;7*ones(200,1)];

D=[r1;r2;r3;r4;r5;r6;r7];
plotsort3D(D,Rsort);


end