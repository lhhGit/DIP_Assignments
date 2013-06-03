function [ digit ] = Digit_recog( src )
%UNTITLED hand-written digit recognition
%   Detailed explanation goes here
%  load digit dataset
filenames = dir('standard_digits');
imgset = zeros(12,10,3);
Huset = zeros(10,7);
for i=3 : length(filenames)
    fname = filenames(i).name;
    full_dir = strcat('standard_digits/',fname);
    A = imread(full_dir);
    B = 1 - im2double(A);
    imgset(:,:,i-2) = B;
    Huset(i-2,:) = Hu_moment(B);
    %fprintf(Hu_moment(S)+','+i-2);
end
src = 1 - im2double(src);
src_moment = Hu_moment(src)
min = sum(sum(abs(src_moment-Huset(1,:))));
digit = 1;
for i = 2:10
    differ = sum(sum(abs(src_moment-Huset(i,:))));
    if differ < min
        digit = i;
        min = differ;
    end
end
digit = digit - 1;        
%fprintf(src_moment);
end

