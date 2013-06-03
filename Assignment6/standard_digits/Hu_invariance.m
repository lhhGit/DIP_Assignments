function [invariancematrix]=invariance(image,size_order,rotate)
%image: 输入图形%
%size_order: 图形的放大倍率%
%rotate: 图形旋转的角度%
%invariancematrix: 计算出的不变矩%

X=image;         
[F_x F_y]=size(X);
F=imresize(X,[fix(F_x*size_order) fix(F_y*size_order)]); %改变图像大小
F=imrotate(F,rotate);                                    %改变图像角度

[F_x F_y]=size(F);

%求x的平均值%
F_xsum=sum(F,2);
temp=1:F_x;
temp=temp';
mean_temp=temp.*F_xsum;
mean_x=sum(mean_temp)/sum(sum(F));

%求y的平均值%
F_ysum=sum(F,1);
temp=1:F_y;
mean_temp=temp.*F_ysum;
mean_y=sum(mean_temp)/sum(sum(F));

%求各阶矩%
for p=0:3
   for q=0:3
      r(p+1,q+1)=(p+q)/2+1;
      x=1:F_x;
      x=x-mean_x;
      x=x.^p;
      y=1:F_y;
      y=y-mean_y;
      y=y.^q;
      u_temp=x'*y;
      u(p+1,q+1)=sum(sum(u_temp.*F));
   end 
end

%标准中心矩%
n=u./u(1,1).^r;

%七个不变矩%
invariancematrix(1,1)=log10(abs(n(3,1)+n(1,3)));
invariancematrix(1,2)=log10(abs((n(3,1)-n(1,3)).^2+4*n(2,2).^2));
invariancematrix(1,3)=log10(abs((n(4,1)-3*n(2,3)).^2+(3*n(3,2)-n(1,4)).^2));
invariancematrix(1,4)=log10(abs((n(4,1)+n(2,3)).^2+(n(3,2)+n(1,4)).^2));
invariancematrix(1,5)=log10(abs((n(4,1)-3*n(2,3))*(n(4,1)+n(2,3))*((n(4,1)-n(2,3)).^2-3*(n(3,2)+n(1,4)).^2)+(3*n(3,2)-n(1,4))*(n(3,2)+n(1,4))*((3*n(4,1)+n(2,3)).^2-(n(3,2)+n(1,4)).^2)));
invariancematrix(1,6)=log10(abs((n(3,1)-n(1,3))*((n(4,1)+n(2,3)).^2-(n(3,2)+n(1,4)).^2)+4*n(2,2)*(n(4,1)+n(2,3))*(n(3,2)+n(1,4))));
invariancematrix(1,7)=log10(abs((3*n(3,2)-n(1,4))*(n(4,1)+n(2,3))*((n(4,1)+n(2,3)).^2-3*(n(3,2)+n(1,4)).^2)+(3*n(2,3)-n(4,1))*(n(3,2)+n(1,4))*((3*n(4,1)+n(2,3)).^2-(n(3,2)+n(1,4)).^2)));

