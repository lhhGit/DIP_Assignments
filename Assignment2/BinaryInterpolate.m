function [ output ] = BinaryInterpolate( lt,width,height,X,input_img)
%BINARYINTERPOLATE 双线性插值函数
%   lt,width,height 输出图像块的左顶点坐标和长宽
%   x,y 输入点坐标,归一化到[0,1]之间
%   output 使用双线性插值后对应的坐标
%   问题: 输出图像像素点值映射到像素外?
x_coe = (X(2,1,:) - X(1,1,:));
y_coe = (X(1,2,:) - X(1,1,:));
xy_coe = (X(2,2,:)+X(1,1,:)-X(1,2,:)-X(2,1,:));
zero_coe = X(1,1,:);
output=zeros(height,width);
for i=lt(1,1):lt(1,1)+height-1
    for j=lt(1,2):lt(1,2)+width-1
        x=(i-lt(1,1))*1.0/height;
        y=(j-lt(1,2))*1.0/width;
        matched_cord=round(x_coe*x+y_coe*y+xy_coe*x*y+zero_coe);
        cord=zeros(2,1);
        cord(1,1)=matched_cord(1,1,1);
        cord(2,1)=matched_cord(1,1,2);
        output(i-lt(1,1)+1,j-lt(1,2)+1)=input_img(cord(1,1),cord(2,1));
    end
end
%subplot(1,2,1); imshow(output/255.0);
%subplot(1,2,2); imshow(input_img(lt(1,1):lt(1,1)+height-1,lt(1,2):lt(1,2)+width-1));
%a=1;
end

