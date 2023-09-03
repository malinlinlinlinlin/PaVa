function element=Ptoevery_minmaxT(T,S,sizeS)
% 给定最小生成树T， pred T
% 这个函数用来寻找一个顶点 S 到树中所有点的maxmindist
element=zeros(sizeS,1);% 用来储存路径距离
visited=zeros(sizeS,1);
visited(S)=1;
Q=S;  %创建一个队列
Edge_Weight=T.Edges.Weight;
while ~isempty(Q)
    NofS=neighbors(T ,Q(1));
    NofS=NofS(visited(NofS)==0);
     Q=[Q;NofS]; %未被访问的近入Q（当前父节点）的队列
     visited(NofS)=1;
    while ~isempty(NofS)
        ei = findedge(T,NofS(1),Q(1));
%           [x,y]= find(Edges_Nodes==NofS(1)) ;
%           ei=x(Edges_Nodes(x+rem(y,2)*sizeE)==Q(1));
        element(NofS(1))=max(Edge_Weight(ei),element(Q(1)));
        NofS(1)=[];  % 出S的neighbor的队列
    end
    Q(1)=[];
end
 index=visited==0;
 element(index)=max(element)*2;

end



