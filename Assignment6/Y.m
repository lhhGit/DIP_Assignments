function [ dst ] = Y( src,p,q )
%Y Summary of this function goes here
%   Detailed explanation goes here
Miupq = MiuMoment(src,p,q);
r = floor((p + q + 2) / 2); 
Miu00 = MiuMoment(src,0,0).^r;
dst = Miupq/Miu00;

end

