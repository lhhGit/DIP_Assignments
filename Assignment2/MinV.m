function [ minV,I ] = MinV( X )
%MAXV 返回矩阵最大元素和下标
%   Detailed explanation goes here

[x1,row]=min(X);
[minV,col]=min(x1);
row=row(col);
I=[row,col];
end

