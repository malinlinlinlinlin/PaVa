function [D, Rsort]=hepta(~)
% ���������������hepta ���ݼ��������߸��࣬ �м�����ܶȽϸߣ��ֲ�����ά�ռ�
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