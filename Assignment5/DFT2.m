function [ dst ] = DFT2( src )
%DFT2 二维傅里叶变换
%   Detailed explanation goes here
dim=size(src);
width=dim(1,2);
height=dim(1,1);
WM=exp(-1i*2*pi/height);
WN=exp(-1i*2*pi/width);
multi_mat_m=zeros(height,height);
multi_mat_n=zeros(width,width);
%src_pro=zeros(height,width);
%for i=1:height
%    for j=1:width
%        src_pro(i,j)=src(i,j)*(-1)^(i+j);
%    end
%end

for i=1:height
    d=i-1;
    for j=1:height
        multi_mat_m(i,j)=WM^((j-1)*d);
    end
end
for i=1:width
    d=i-1;
    for j=1:width
        multi_mat_n(i,j)=WN^((j-1)*d);
    end
end
dst=multi_mat_m*src*multi_mat_n/sqrt(width*height);    
%RR=real(dst); %取傅立叶变换的实部
%II=imag(dst); %取傅立叶变换的虚部
%dst_mag=sqrt(RR.^2+II.^2);%计算频谱幅值
%dst_pha=angle(dst);

            
%subplot(1,2,1); imshow(dst_mag);
%subplot(1,2,2); imshow(dst_pha);
end

