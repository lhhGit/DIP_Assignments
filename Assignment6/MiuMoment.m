function [ dst ] = MiuMoment( src,p,q )
%MIUMOMENT Summary of this function goes here
%   Detailed explanation goes here
X0 = Moment(src,0,0,1,0)/Moment(src,0,0,0,0);
Y0 = Moment(src,0,0,0,1)/Moment(src,0,0,0,0);
dst = Moment(src,X0,Y0,p,q);

end

