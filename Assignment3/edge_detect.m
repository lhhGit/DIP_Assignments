function [ dst_img ] = edge_detect( type,src_img )
%EDGE_DETECT 使用四个算子对图像进行边缘检测
%   src_img 输入图像
%   type 1 Sobel算子
%   type 2 Prewitt算子
%   type 3 Roberts算子
%   type 4 Marr算子
%   type 5 Canny边缘检测
%template 
switch(type)
    case 1
       template_x=[-1,0,1;-sqrt(2),0,sqrt(2);-1,0,1];
       template_y=[-1,-sqrt(2),-1;0,0,0;1,sqrt(2),1];
       dst_img=sqrt(correlate(src_img,template_x).^2+...
       correlate(src_img,template_y).^2);
       dst_img=im2bw(dst_img/255,0.5);
    case 2
       template_x=[-1,0,1;-1,0,1;-1,0,1];
       template_y=[-1,-1,-1;0,0,0;1,1,1];
       dst_img=sqrt(correlate(src_img,template_x).^2+...
       correlate(src_img,template_y).^2);
       dst_img=im2bw(dst_img/255,0.5);
    case 3
       template_x=[0,1;-1,0];
       template_y=[1,0;0,-1];
       dst_img=sqrt(correlate(src_img,template_x).^2+...
       correlate(src_img,template_y).^2);
       %dst_img=dst_img/255;
       %thresh = .75*mean2(abs(dst_img));  
       dst_img=im2bw(dst_img/255,0.18);
    case 4
       sigma = 2;
       fsize = ceil(sigma*3) * 2 + 1;  % choose an odd fsize > 6*sigma;
       op = fspecial('log',fsize,sigma); 
       dst_img=correlate(src_img,op);
       [m,n]=size(dst_img);
       rr = 2:m-1; cc=2:n-1;
       thresh = .75*mean2(abs(dst_img));      
       e=false(size(dst_img));
       [rx,cx] = find( dst_img(rr,cc) < 0 & dst_img(rr,cc+1) > 0 ...
                  & abs( dst_img(rr,cc)-dst_img(rr,cc+1) ) > thresh );   % [- +]
       e((rx+1) + cx*m) = 1;
       [rx,cx] = find( dst_img(rr,cc-1) > 0 & dst_img(rr,cc) < 0 ...
                  & abs( dst_img(rr,cc-1)-dst_img(rr,cc) ) > thresh );   % [+ -]
       e((rx+1) + cx*m) = 1;
       [rx,cx] = find( dst_img(rr,cc) < 0 & dst_img(rr+1,cc) > 0 ...
                  & abs( dst_img(rr,cc)-dst_img(rr+1,cc) ) > thresh);   % [- +]'
       e((rx+1) + cx*m) = 1;
       [rx,cx] = find( dst_img(rr-1,cc) > 0 & dst_img(rr,cc) < 0 ...
                  & abs( dst_img(rr-1,cc)-dst_img(rr,cc) ) > thresh);   % [+ -]'
       e((rx+1) + cx*m) = 1;
       dst_img=e;
    case 5
       %dst_img=edge(src_img,'canny');
       sigma = 1;      
       GaussianDieOff = 0.0001;
       pw = 1:30; % possible widths
       ssq = sigma^2;
       width = find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff,1,'last');
       fsize = 2*width + 1;  % choose an odd fsize > 6*sigma;
       op = fspecial('gaussian',fsize,sigma); 
       dst_img=correlate(src_img,op);
       template_x=[-1,-1;1,1]; 
       template_y=[1,-1;1,-1];
       A=correlate(dst_img,template_x);
       B=correlate(dst_img,template_y);
       dst_img=sqrt(A.^2+B.^2);
       gradient=floor((atan(A./B)-pi/8)/(pi/4));
       y = gradient > 4; gradient(y) = gradient(y) - 4;
       z = gradient < 0; gradient(z) = gradient(z) + 4;
       %non-maximum suppression      
       direction=[0,-1,0,1;-1,1,1,-1;-1,0,1,0;-1,-1,1,1];
       for i=2:size(dst_img,1)-1
           for j=2:size(dst_img,2)-1
               dire=gradient(i,j);
               %A=i+direction(dire,1);
               if(dst_img(i,j) < dst_img(i+direction(dire+1,1),j+direction(dire+1,2)) ||... 
                   dst_img(i,j)< dst_img(i+direction(dire+1,3),j+direction(dire+1,4)))
               dst_img(i,j)=0;
               end
           end
       end       
       
       %imshow(dst_img);
       img_max=max(dst_img(:));
       dst_img=dst_img/img_max;     
       ThresholdRatio = 0.5; 
       highThresh = 0.15;
       lowThresh = ThresholdRatio*highThresh;
       low=im2bw(dst_img,lowThresh);
       high=im2bw(dst_img,highThresh);
       % 将low中的点加到high中
       [x,y]=find(low>0);
       lowidx=[x,y];
       neighbor = [-1,-1;-1,0;-1,1;0,-1;0,1;1,-1,;1,0;1,1];
       for i=1:size(lowidx,1)
           idx=lowidx(i,:);
           if(idx(1)==1 || idx(1)==size(low,1)||...
               idx(2)==1||idx(2)==size(low,2))
               continue;
           end
           if(high(idx)==0)
               flag=0;
           for j=1:size(neighbor,1)
               if( high(idx+neighbor(j,:))>0)
                   flag=1;
                   break;
               end
           end
           if(flag)
               high(idx)=1;
           end
           end
       end
       dst_img=high;
end

    imshow(dst_img);
end


        
%imshow(im2bw(dst_img/255,0.9));




