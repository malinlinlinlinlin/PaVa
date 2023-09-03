function clusterid=extract_KSD(element)
% 2021/10/3 
%这个函数已知类的中心和作用范围， 通过找到谷的方式将一个类直接提取出来和DBRS一样
elementS=element;
%element(element<prctile(element,1))=nan;
element(element>prctile(element,99))=nan;
%[f,xi] = ksdensity(element,'Bandwidth',BW);
[f,xi]=hist(element,200);
%figure
% f 降序排列找到拐点，作为阈值，将小于阈值的都值为零， 这样就达到了峰提取的目的
% 非球形类
f(1)=f(1)-1;
%plot(f)
for i=1:3  %这是个参数
    f=smooth(f);
end
Y=sort(f, 'descend');
threshold=elbow(Y);
f(f<threshold)=0;
 %hold on
 %plot(f)
 %% ---------------------first valley，之前的就直接确定，但是拐点之后认为是边界上的点-------------
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
%------或许应当将类分为类的主体和边界---------------
%-------返回之后边界值标记为-1-------------------
        clusterid=elementS<xi(loc);
 end
     

