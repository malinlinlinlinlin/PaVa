function threshold=elbow(Y)
% 这个函数是用来找拐点的
Y=smooth(Y);
a=length(Y);
b=Y(1)-Y(a);
c=sqrt(a^2+b^2);
RM=[a/c,b/c;-b/c,a/c];
Rota=[(1:a)',Y]*RM;
Gloc=find(Rota(:,2)==min(Rota(:,2)));
threshold=Y(Gloc);
% plot(Y,'b');
% hold on
% plot(Rota(:,2),'r')
% plot(Gloc, Y(Gloc),'bd','MarkerSize',10, 'MarkerEdgeColor','b','MarkerFaceColor','b');
% plot(Gloc,Rota(Gloc,2),'rd','MarkerSize',10, 'MarkerEdgeColor','r','MarkerFaceColor','r')
% plot([1 length(Y)],[Y(1) Y(end)],'b-.')
% plot([1 length(Y)],[Rota(1,2) Rota(1,end)],'r-.')

%text(800,1,'Elbow point')
%text(1400,2,'Empty or Noise Units')
%text(300,2,'Body Units')
end