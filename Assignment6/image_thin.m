function [ dst ] = image_thin( src )
%IMAGE_THIN 图像细化
%  
% templateSet中,1表示击中,2表示击不中
templateSet = zeros(3,3,8);
templateSet(:,:,1) = [ 2,2,2; 0,1,0; 1,1,1]; 
templateSet(:,:,2) = [ 0,2,2; 1,1,2; 1,1,0]; 
templateSet(:,:,3) = [ 1,0,2; 1,1,2; 1,0,2]; 
templateSet(:,:,4) = [ 1,1,0; 1,1,2; 0,2,2]; 
templateSet(:,:,5) = [ 1,1,1; 0,1,0; 2,2,2]; 
templateSet(:,:,6) = [ 0,1,1; 2,1,1; 2,2,0]; 
templateSet(:,:,7) = [ 2,0,1; 2,1,1; 2,0,1]; 
templateSet(:,:,8) = [ 2,2,0; 2,1,1; 0,1,1]; 

dst = src;
while 1
    T = zeros(3,3,2);
    temp = dst;
    pos = 2*ones(1,2,2);
    for i=1:8
        hit = templateSet(:,:,i) == 1;
        miss = templateSet(:,:,i) == 2;       
        T(:,:,1) = hit;
        T(:,:,2) = miss;
        angle = morph(dst,'hit-miss',T,pos);
        dst = dst - angle;
    end
    A = find(temp~=dst, 1);
    if(isempty(A))
        break;
    end
end
imwrite(dst,'word_bw_thinned.bmp');


end

