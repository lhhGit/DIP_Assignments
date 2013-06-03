function [ dst_img ] = linearTransform( src_img,a,b )
%LINEARTRANSFORM 图像线性变换
%   src_img 源图像,a 一次项系数,b 二次项系数
dim=size(src_img);
dst_img=round(a*src_img+b);

%   scale to [0..255]
for i=1:dim(1)
    for j=1:dim(2)
        if (dst_img(i,j)>255)
            dst_img(i,j)=255;
        end
    end
end

subplot(2,2,1); imshow(src_img); title('src');
subplot(2,2,2); imshow(dst_img); title('dst');
subplot(2,2,3); bar(outputHis(src_img)); title('src_his');
subplot(2,2,4); bar(outputHis(dst_img)); title('dst_his');
end

