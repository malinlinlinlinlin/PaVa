function clusterid=extract_KSD(element)
% 2021/10/3 
%���������֪������ĺ����÷�Χ�� ͨ���ҵ��ȵķ�ʽ��һ����ֱ����ȡ������DBRSһ��
elementS=element;
%element(element<prctile(element,1))=nan;
element(element>prctile(element,99))=nan;
%[f,xi] = ksdensity(element,'Bandwidth',BW);
[f,xi]=hist(element,200);
%figure
% f ���������ҵ��յ㣬��Ϊ��ֵ����С����ֵ�Ķ�ֵΪ�㣬 �����ʹﵽ�˷���ȡ��Ŀ��
% ��������
f(1)=f(1)-1;
%plot(f)
for i=1:3  %���Ǹ�����
    f=smooth(f);
end
Y=sort(f, 'descend');
threshold=elbow(Y);
f(f<threshold)=0;
 %hold on
 %plot(f)
 %% ---------------------first valley��֮ǰ�ľ�ֱ��ȷ�������ǹյ�֮����Ϊ�Ǳ߽��ϵĵ�-------------
    begin=2;
while begin<length(f)
       for j=begin:length(f)-1
            if (f(j-1)>f(j) ) && (f(j+1)>f(j)|| f(j+1)==f(j))
                 break;
            end
        end
        for jj=j:length(f)-1
            if (f(jj-1)>f(jj) || f(jj-1)==f(jj)) && (f(jj+1)>f(jj))
                 break;
            end
        end
        if jj-j>4
            loc=floor(j/3+jj/3*2); 
            break;
        else
            begin=jj+1;
            loc=length(f)-1;
        end
end
%------����Ӧ�������Ϊ�������ͱ߽�---------------
%-------����֮��߽�ֵ���Ϊ-1-------------------
        clusterid=elementS<xi(loc);
 end
     

