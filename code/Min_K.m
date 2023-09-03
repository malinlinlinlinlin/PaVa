function min_k=Min_K(A,k)
%找到数值中第K小的数是多少
min_k=zeros(k,1);
for i=1:k
    min_k(i)=find(A==min(A),1);
    A(min_k(i))=[];
end

end