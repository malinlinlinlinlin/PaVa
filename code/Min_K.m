function min_k=Min_K(A,k)
%�ҵ���ֵ�е�KС�����Ƕ���
min_k=zeros(k,1);
for i=1:k
    min_k(i)=find(A==min(A),1);
    A(min_k(i))=[];
end

end