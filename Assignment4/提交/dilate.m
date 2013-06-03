function [ dst ] = dilate( src,template,pos )
%DILATE ��̬ѧ��������
%   src Դͼ��
%   template ���ͽṹ��Ԫ
%   pos �ṹ��Ԫԭ��λ��
%   dst ���ͼ��
%   src,template,dst ���Ƕ�ֵͼ��
dst = zeros(size(src));
[x1,y1] = find(src == 1);
[x2,y2] = find(template == 1);
if(size(x2,2)~=1)
    x2=x2';
end
if(size(y2,2)~=1)
    y2=y2';
end
point_src = [x1,y1];
point_template = [x2,y2];
for i = 1:size(point_template,1)
    point_template(i,:) = point_template(i,:) - pos;
end

for i = 1:size(point_template,1)
    for j = 1:size(point_src,1)
        a=point_src(j,:);
        b=point_template(i,:);
        c=a+b;
        if(c(1,1)>=1&&c(1,2)>=1&&c(1,1)<=size(dst,1)&&c(1,2)<=size(dst,2))
           dst(c(1,1),c(1,2))=1;
        end
    end
end

    
end

