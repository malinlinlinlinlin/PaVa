function element=Ptoevery_minmaxT(T,S,sizeS)
% ������С������T�� pred T
% �����������Ѱ��һ������ S ���������е��maxmindist
element=zeros(sizeS,1);% ��������·������
visited=zeros(sizeS,1);
visited(S)=1;
Q=S;  %����һ������
Edge_Weight=T.Edges.Weight;
while ~isempty(Q)
    NofS=neighbors(T ,Q(1));
    NofS=NofS(visited(NofS)==0);
     Q=[Q;NofS]; %δ�����ʵĽ���Q����ǰ���ڵ㣩�Ķ���
     visited(NofS)=1;
    while ~isempty(NofS)
        ei = findedge(T,NofS(1),Q(1));
%           [x,y]= find(Edges_Nodes==NofS(1)) ;
%           ei=x(Edges_Nodes(x+rem(y,2)*sizeE)==Q(1));
        element(NofS(1))=max(Edge_Weight(ei),element(Q(1)));
        NofS(1)=[];  % ��S��neighbor�Ķ���
    end
    Q(1)=[];
end
 index=visited==0;
 element(index)=max(element)*2;

end



