function [ minV,I ] = MinV( X )
%MAXV ���ؾ������Ԫ�غ��±�
%   Detailed explanation goes here

[x1,row]=min(X);
[minV,col]=min(x1);
row=row(col);
I=[row,col];
end

