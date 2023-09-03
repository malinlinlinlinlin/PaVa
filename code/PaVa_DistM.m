function idx=PaVa_DistM(DistM,k)
% 2021/1/7
% ���������DBRS�ƹ㵽���ھ���������� 
% ѡȡһ�����Ŀ��ܲ��ȶ��� ����ѡȡ�������ʹ��PDF���ӹ⻬Щ�� Ҳ��֪���в��У� �������԰ɣ�
sizeS=size(DistM,1);
idx=zeros(sizeS,1);
countK=0;
counts=0;
%% �ȹ����һ����С����������
[T,pred,knn_dist]=ADM2MST(DistM,k);
while counts < sizeS*0.9     
        countK=countK+1;
        center=find(knn_dist==min(knn_dist),1);
        element=Ptoevery_minmaxT(T,center,sizeS);
        clusterid=extract_KSD(element);
        idx(clusterid & ~isnan(knn_dist))=countK; %����clusterid���ܰ����Ѿ�����ǵĵ㣬 ��ʱ��Ҫȥ����
        knn_dist(clusterid)=nan;
        counts=length(find(isnan(knn_dist)==1));
end
end