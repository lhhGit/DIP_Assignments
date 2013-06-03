function [ dst ] = dilate( src,template )
%DILATE 简易膨胀运算
%   src 源图像
%   template 腐蚀结构单元
[idx,idy] = find(src == 1);
dst = zeros(size(src));
n = size(template,1);
half = floor(n/2);
for i = 1:length(idx)
    x = idx(i);
    y = idy(i);
    if (x-half>0&&x+half<=size(src,1)...
         &&y-half>0&&y+half<=size(src,2))
       dst(x-half:x+half,y-half:y+half)=template;           
    end
end
