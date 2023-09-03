function [T,pred,knn_dist]=weighted_MST(D,k)
% 2021/10/14
% ���������������һ��knn graph, ���õ�knn_distance ������ÿ������ܶ�
%%
DT = delaunayTriangulation(D);
s1=[DT.ConnectivityList(:,1); DT.ConnectivityList(:,1);DT.ConnectivityList(:,2)];
t1=[DT.ConnectivityList(:,2); DT.ConnectivityList(:,3);DT.ConnectivityList(:,3)];
if size(D,2)==2
    weight1= sqrt((D(s1,1)-D(t1,1)).^2+(D(s1,2)-D(t1,2)).^2); % ��ά
else
    weight1= sqrt((D(s1,1)-D(t1,1)).^2+(D(s1,2)-D(t1,2)).^2+(D(s1,3)-D(t1,3)).^2); % ��ά
end
%  G = graph(s1,t1,weight1);  %
%  [T,pred] = minspantree(G,'Type','forest','Root',1);%
k_idx=knnsearch(D,D,'k',k);
s=repmat( k_idx(:,1) , k-1 , 1 );
t=reshape(k_idx(:,2:end),[],1 );
if size(D,2)==2
     weight= sqrt((D(s,1)-D(t,1)).^2+(D(s,2)-D(t,2)).^2);% ��ά
else
    weight= sqrt((D(s,1)-D(t,1)).^2+(D(s,2)-D(t,2)).^2+(D(s,3)-D(t,3)).^2); %knn-graph �д��ڵıߵ�weight
end
knn_dist=weight(end-size(D,1)+1:end);
G = graph([s1;s],[t1;t],[weight1;weight]);
[T,pred] = minspantree(G,'Type','forest','Root',1);
edge=T.Edges.EndNodes;
weight=T.Edges.Weight;
Newweight=weight.*knn_dist(edge(:,1)).*knn_dist(edge(:,1));
Newweight=Newweight.^(1/3);
T=graph(edge(:,1),edge(:,2),Newweight);
end

%% ����
% [~,ia,~]=unique(weight1);
% s1=s1(ia);
% t1=t1(ia);
% weight1=weight1(ia);
% G = graph(s1,t1,weight1);
% [T,pred] = minspantree(G,'Type','forest','Root',1);
% knn_dist=zeros(size(D,1),1);
% for i=1:size(D,1)
%     knn_dist(i)=mean(weight1([find(s1==i); find(t1==i)]));
% end
% edge=T.Edges.EndNodes;
% weight=T.Edges.Weight;
% Newweight=weight.*knn_dist(edge(:,1)).*knn_dist(edge(:,1));
% Newweight=Newweight.^(1/3);
% T=graph(edge(:,1),edge(:,2),Newweight);