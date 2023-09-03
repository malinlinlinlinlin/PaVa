function [t_wightted_MST,t_Ptoevery_minmaxT,idx]=PaVa(D,k)
% 2021/10/13
% 这个函数是DBRS推广到任意形状的类的函数: t4.8k 可用
% 选取一个中心可能不稳定， 试着选取多个中心使得PDF更加光滑些， 也不知道行不行， 改天试试吧！
sizeS=size(D,1);
idx=zeros(sizeS,1);
countK=0;
% centers=[];
% radii=[];
counts=0;
%% 先构造出一棵最小生成树出来
%[T, knn_dist1]=knn_MST(D,k);
t1=cputime;
[T,pred,knn_dist]=weighted_MST(D,k);
t2=cputime;
t_wightted_MST=t2-t1;
 t_Ptoevery_minmaxT=0;
while counts < sizeS*0.85      
        countK=countK+1;
        Pinitial=find(knn_dist==min(knn_dist));
        t1=cputime;
        element=Ptoevery_minmaxT(T,Pinitial,sizeS);
        t2=cputime;
        t_Ptoevery_minmaxT=t_Ptoevery_minmaxT+t2-t1;
         clusterid=extract_KSD(element);
        idx(clusterid & ~isnan(knn_dist))=countK; %这里clusterid可能包含已经被标记的点， 这时候要去掉！         figure;
%         figure
%         plotsort(D,idx,3);       
        knn_dist(clusterid)=nan;
        counts=length(find(isnan(knn_dist)==1));

       
%         if size(D,2)==2
%            plotsort(D,idx,3);
%         else
%             plotsort3D(D,idx)
%         end
%         text(D(center,1),D(center,2),num2str(countK));
        %centers=[centers; center];
end
idx=Assignnoise(pred, idx,D);  % 
%figure;
%plotsort(D,idx,5)
end


        %band = General_meanshift(element(idx==0));
        %center=find(knn_dist(band)==min(knn_dist(band)),1);
        %if ~isempty(center)
        %    element=Ptoevery_minmaxT(T,band(center),sizeS);
        %end