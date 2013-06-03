function [ dst_img ] = hisequal( src_img )
%HISEQUAL histogram equalization
dim=size(src_img);
dst_img=zeros(dim);
%   calculate histogram
imghis=zeros(1,256);
for i=1:dim(1,1)
    for j=1:dim(1,2)
        imghis(src_img(i,j)+1)=imghis(src_img(i,j)+1)+1;
    end
end

%  calculate CDF
img_cdf=zeros(1,256);
img_cdf(1,1)=imghis(1,1);
for i=2:256
    img_cdf(1,i)=img_cdf(1,i-1)+imghis(1,i);
end

%  transform
for i=1:dim(1,1)
    for j=1:dim(1,2)
        value=src_img(i,j)+1;
        dst_img(i,j)=img_cdf(value)*256/(dim(1,1)*dim(1,2));
    end
end

%  convert to integer [0..255]
dst_img=round(dst_img);
for i=1:dim(1,1)
    for j=1:dim(1,2)
        if dst_img(i,j)>255
            dst_img(i,j)=255;
        end
    end
end

%  imshow
subplot(2,2,1);  imshow(src_img); title('src'); 
subplot(2,2,2);  imshow(dst_img/255.0);title('dst');
%  show histogram
subplot(2,2,3);  bar(outputHis(src_img)); title('src_his'); 
subplot(2,2,4);  bar(outputHis(dst_img)); title('dst_his');

end

