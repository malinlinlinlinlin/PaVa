function [T,pred,knn_dist]=ADM2MST(D,k)
% 2022/1/4
% ��������������ٽ����ת������С������
% ����D��������ٽ����k �������KNN graph����k,k1��������ܶ�knn_dist
s=zeros(size(D,1)*k,1);
t=zeros(size(D,1)*k,1);
w=zeros(size(D,1)*k,1);
knn_dist=zeros(size(D,1),1);
for i=1:size(D,1)
    s((i-1)*k+1:i*k)=i;
    min_k=Min_K(D(i,:),k);
    knn_dist(i)=D(i,min_k(k));
    t((i-1)*k+1:i*k)= min_k;
    w((i-1)*k+1:i*k)=D(i,min_k);
end
G = graph(s,t,w);
[T,pred] = minspantree(G,'Type','forest','Root',1);
edge=T.Edges.EndNodes;
w=T.Edges.Weight;
Newweight=w.*knn_dist(edge(:,1)).*knn_dist(edge(:,1));
Newweight=Newweight.^(1/3);
T=graph(edge(:,1),edge(:,2),Newweight);


end