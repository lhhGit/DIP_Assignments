function [ dst ] = IDFT2( src )
%IDFT2 反二维傅里叶变换
%   Detailed explanation goes here
dim=size(src);
width=dim(1,2);
height=dim(1,1);
WM=exp(-1i*2*pi/height);
WN=exp(-1i*2*pi/width);
multi_mat_m=zeros(height,height);
multi_mat_n=zeros(width,width);
for i=1:height
    d=i-1;
    for j=1:height
        multi_mat_m(i,j)=WM^(-(j-1)*d);
    end
end
for i=1:width
    d=i-1;
    for j=1:width
        multi_mat_n(i,j)=WN^(-(j-1)*d);
    end
end
dst=multi_mat_m*src*multi_mat_n/sqrt(width*height);
%for i=1:height
%    for j=1:width
%        dst(i,j)=dst(i,j)*(-1)^(i+j);
%    end
%end
%dst=uint(dst*255);
end

