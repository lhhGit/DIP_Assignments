function [ mapping ] = TargetMatch( output_img,input_img )
%TARGETMATCH 对两个靶图像进行输入输出点的一一对应
%   input_img 输入图像对应的靶图像, 扭曲靶
%   output_img 输出图像对应的靶图像, 点阵靶

%二值化
%X = find(input_img==67); 
%Y = find(input_img==68);
%input_img([X;Y])=255;
%Z = input_img~=255;
%input_img(Z)=0;
%imshow(input_img);

dim=size(input_img);
%靶点单像素化
for i=1:dim(1,1)-2
    for j=1:dim(1,2)-2
        [minV,idx]=MinV(input_img(i:i+2,j:j+2));
        
        if(minV~=128&&minV~=129)
            if(input_img(idx(1,1)+i-1,idx(1,2)+j-1)~=255)
            input_img(idx(1,1)+i-1,idx(1,2)+j-1)=0;
            end
            input_img(i:i+2,j:j+2)=255*ones(3);
            input_img(idx(1,1)+i-1,idx(1,2)+j-1)=0;           
            
        end
        
    end
end
Z= input_img~=0;
input_img(Z)=255;

input_img(10,10)=255; 
input_img(10,20)=255;
input_img(10,30)=255;
input_img(10,100)=255;
input_img(10,110)=255;
input_img(10,120)=255;
input_img(20,10)=255; 
input_img(20,20)=255;
input_img(20,110)=255;
input_img(20,120)=255;
input_img(30,10)=255;
input_img(30,120)=255;

input_img(120,10)=255; 
input_img(120,20)=255;
input_img(120,30)=255;
input_img(120,100)=255;
input_img(120,110)=255;
input_img(120,120)=255;
input_img(110,10)=255; 
input_img(110,20)=255;
input_img(110,110)=255;
input_img(110,120)=255;
input_img(100,10)=255;
input_img(100,120)=255;

[X,Y]= find(input_img==0);
%[X1,Y1]= find(output_img==0);
A=[X,Y];
A=sortrows(A,1);
%B=[X1,Y1];

pointer=1;  
%4,6,8,10,12,12,12,12,10,8,6,4
rows=[4,6,8,10,12,12,12,12,10,8,6,4];
mapping=zeros(104,4);

for i=1:12
    %对应第i排中间i个点
    pts=rows(i);
    matched_x=ones(pts,1)*10*i;
    matched_y=10*(7-pts/2):10:10*(6+pts/2);
    matched_y=matched_y';
    current=sortrows(A(pointer:pointer+pts-1,:),2);
    mapping(pointer:pointer+pts-1,:)=[matched_x,matched_y,current];
    pointer=pointer+pts;
end
%fprintf('size of X:%d',size(X));
imshow(input_img);

end

