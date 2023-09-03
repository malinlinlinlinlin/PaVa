function [D,Rsort] = sixhetersep( nr)
% this is the generation process of dataset_3
%%
mu = [4 5]; Sigma = [1 0; 0 1];
r45 = mvnrnd(mu, Sigma, 100);
Rsort=ones(1,100);
mu = [-3 1]; Sigma = [2 .2; .2 2];
r11 = mvnrnd(mu, Sigma, 300);
Rsort=[Rsort,2*ones(1,300)];
mu = [-5 8]; Sigma = [.6 .2; .2 .3];
r23 = mvnrnd(mu, Sigma, 400);
Rsort=[Rsort,3*ones(1,400)];
mu = [11 11]; Sigma = [3 .2; .2 2];
r77 = mvnrnd(mu, Sigma, 1000);
Rsort=[Rsort,4*ones(1,1000)];
mu = [6 -1]; Sigma = [.6 .2; .2 1];
r61 = mvnrnd(mu, Sigma, 500);
Rsort=[Rsort,5*ones(1,500)];
mu = [-10 -3]; Sigma = [.6 0; 0 .3];
rn3n1 = mvnrnd(mu, Sigma, 300);
Rsort=[Rsort,6*ones(1,300)];
N=length(Rsort)*nr;%ÔëÒôµÄ¸öÊý
noise=rand(N,2);
noise(:,1)=-15+35*noise(:,1);
noise(:,2)=-10+30*noise(:,2);
D=[r45 ;r11; r23;r77;r61;rn3n1];
D=[D;noise];
Rsort=[Rsort,zeros(1,N)];

end
