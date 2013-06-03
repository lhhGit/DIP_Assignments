function [ output_img ] = caliberate( input_img,input_target,output_target)
%CALIBERATE 图像几何校正
%   Detailed explanation goes here
mapping=TargetMatch(input_target,output_target);
match_matrix=zeros(12,12,2);
for i=1:12
    match_matrix(i,:,2)=10:10:120;
    match_matrix(i,:,1)=10*i*ones(1,12);
end

for i=1:size(mapping,1)
    match_matrix(mapping(i,1)/10,mapping(i,2)/10,1)=mapping(i,3);
    match_matrix(mapping(i,1)/10,mapping(i,2)/10,2)=mapping(i,4);
end

%自行添加40个靶点对应
%自行添加40个靶点对应
%左上角10个
for sum=5:-1:2
    for i=1:1:sum-1
        col=sum-i;
        right=match_matrix(i,col+1,:);
        below=match_matrix(i+1,col,:);
        rb=match_matrix(i+1,col+1,:);
        match_matrix(i,col,:)=right+below-rb;
    end
end

%右上角10个
for dif=8:1:11
    for i=1:1:12-dif
        col=dif+i;
        left=match_matrix(i,col-1,:);
        below=match_matrix(i+1,col,:);
        lb=match_matrix(i+1,col-1,:);
        match_matrix(i,col,:)=left+below-lb;
    end
end


%左下角10个
for dif=-8:-1:-11
    for i=12:-1:1-dif
        col=dif+i;
        right=match_matrix(i,col+1,:);
        above=match_matrix(i-1,col,:);
        ra=match_matrix(i-1,col+1,:);
        match_matrix(i,col,:)=right+above-ra;
    end
end

%右下角10个
for sum=21:1:24
    for i=12:-1:sum-12
        col=sum-i;
        left=match_matrix(i,col-1,:);
        above=match_matrix(i-1,col,:);
        la=match_matrix(i-1,col-1,:);
        match_matrix(i,col,:)=left+above-la;
    end
end

temp=match_matrix;
match_matrix=ones(14,14,2);
for i=1:14
    match_matrix(i,:,2)=[1:10:121,128];
    if(i<14)
    match_matrix(i,:,1)=10*(i-1)*ones(1,14)+1;
    else
    match_matrix(i,:,1)=128; 
    end
end
match_matrix(2:13,2:13,:)=temp;
output_img=input_img;
for i=1:13
    for j=1:13
        start_x=i*10-9;
        start_y=j*10-9;
        %width=10; height=10;
        if(i<13)
            height=10;
        else
            height=8;
        end
        if(j<13)
            width=10;
        else
            width=8;
        end
        output_img(start_x:start_x+height-1,start_y:start_y+width-1)=BinaryInterpolate([start_x,start_y],width,height,match_matrix(i:i+1,j:j+1,:),input_img);
    end
end

imshow(output_img);
imwrite(output_img,'tiger.bmp');