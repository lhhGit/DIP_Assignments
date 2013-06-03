function [ dst ] = morph( src,method,template,pos)
%MORPH Summary of this function goes here
%   Detailed explanation goes here
methods = {'erode','dilate','open','close','hit-miss'};
method = strmatch(method,methods);
if length(size(template))>2
   template_hit=template(:,:,1);
   template_miss=template(:,:,2);
   pos_hit=pos(:,:,1);
   pos_miss=pos(:,:,2);
end
switch method
    case 1
       dst = erode(src,template,pos);             
    case 2       
       dst = dilate(src,template,pos);
    case 3
       dst = dilate(erode(src,template,pos),template,pos);
    case 4
       dst = erode(dilate(src,template,pos),template,pos);
    case 5
       dst = src;
       while 1
       hit = erode(dst,template_hit,pos_hit);
       miss = erode(1-dst,template_miss,pos_miss);
       angle = hit & miss;
       A = find(angle ==1);
       if size(A,1)==0||size(A,2)==0
           break;
       end
       dst = xor(dst , angle); 
       %
       end
       %imshow(dst);
end
end

