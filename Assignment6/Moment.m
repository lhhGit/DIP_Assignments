function [ moment ] = Moment( src,X0,Y0,p,q )
%MOMENT calculate the p+q moment of the src image
%   Detailed explanation goes here
[m,n] = size(src);
r = (1:m)';
c = 1:n;
r = r - X0;
c = c - Y0;
%r = r.^p;
%c = c.^q;
R = (repmat(r,1,n) - X0).^p;
C = (repmat(c,m,1) - Y0).^q;
moment = sum(sum(R.*(C.*src)));

end

