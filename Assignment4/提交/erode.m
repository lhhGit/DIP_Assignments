function [ dst ] = erode( src,template,pos )
%ERODE ��̬ѧ��ʴ����
%   src Դͼ��
%   template ��ʴ�ṹ��Ԫ
%   pos �ṹ��Ԫԭ��λ��
%   dst ���ͼ��
%   src,template,dst ���Ƕ�ֵͼ��
dst = zeros(size(src));
%[x1,y1] = find(src == 1);
[x2,y2] = find(template == 1);
if(size(x2,2)~=1)
    x2=x2';
end
if(size(y2,2)~=1)
    y2=y2';
end
%point_src = [x1,y1];
point_template = [x2,y2];
for i = 1:size(point_template,1)
    point_template(i,:) = point_template(i,:) - pos;
end

for i=1:size(dst,1)
    for j=1:size(dst,2)
        flag = 1;
        for k=1:size(point_template,1)
            m = i+point_template(k,1);
            n = j+point_template(k,2);
            if m>size(dst,1)||n>size(dst,2)||m<1||n<1||src(m,n)==0
               flag = 0;
               break
            end
        end
        if(flag)
        dst(i,j)=1;
        end
    end
end
end         


