function [ his ] = outputHis( src_img )
%OUTPUTHIS Summary of this function goes here
%   Detailed explanation goes here
his=zeros(1,256);
s=size(src_img);
for i=1:s(1,1)
    for j=1:s(1,2)
        his(1,src_img(i,j)+1)=his(1,src_img(i,j)+1)+1;
    end
end
title('histogram'); bar(his);
end

