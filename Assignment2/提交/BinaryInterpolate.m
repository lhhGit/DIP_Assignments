function [ output ] = BinaryInterpolate( lt,width,height,X,input_img)
%BINARYINTERPOLATE ˫���Բ�ֵ����
%   lt,width,height ���ͼ�����󶥵�����ͳ���
%   x,y ���������,��һ����[0,1]֮��
%   output ʹ��˫���Բ�ֵ���Ӧ������
%   ����: ���ͼ�����ص�ֵӳ�䵽������?
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

