function [ X ] = correlate( A,B )
%CORRELATE �����������
%   A �Ǳ���ؾ��� B��3*3���ģ�� 
X = zeros(size(A));
k = floor((size(B,1) - 1)/2);
l = size(B,1)-k-1;
% ��A����,��߷ֱ�����k
C = zeros(size(A)+[k+l,k+l]);
C(k+1:size(A,1)+k,k+1:size(A,2)+k)=A;
C(1:k,:)=C(k+1:2*k,:); C(:,1:k)=C(:,k+1:2*k);
C(size(A,1)+k+1:size(A,1)+k+l,:)=C(size(A,1)+k-l+1:size(A,1)+k,:);
C(:,size(A,2)+k+1:size(A,2)+k+l)=C(:,size(A,2)+k-l+1:size(A,2)+k);

for i=k+1:size(A,1)+k
    for j=k+1:size(A,2)+k
        X(i-k,j-k)=sum(sum(C(i-k:i+l,j-k:j+l).*B));
    end
end


end

