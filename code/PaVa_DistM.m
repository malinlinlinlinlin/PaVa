function idx=PaVa_DistM(DistM,k)
% 2021/1/7
% 这个函数是DBRS推广到基于距离矩阵的情况 
% 选取一个中心可能不稳定， 试着选取多个中心使得PDF更加光滑些， 也不知道行不行， 改天试试吧！
sizeS=size(DistM,1);
idx=zeros(sizeS,1);
countK=0;
counts=0;
%% 先构造出一棵最小生成树出来
[T,pred,knn_dist]=ADM2MST(DistM,k);
while counts < sizeS*0.9     
        countK=countK+1;
        center=find(knn_dist==min(knn_dist),1);
        element=Ptoevery_minmaxT(T,center,sizeS);
        clusterid=extract_KSD(element);
        idx(clusterid & ~isnan(knn_dist))=countK; %这里clusterid可能包含已经被标记的点， 这时候要去掉！
        knn_dist(clusterid)=nan;
        counts=length(find(isnan(knn_dist)==1));
end
end