function [ Hu ] = Hu_moment( src )
%HU_MOMENT calculate the Hu moment of a binary image
%   Detailed explanation goes here
Hu = zeros(1,7);
y = zeros(4,4);
for i = 0:3
    for j = 0:3
        y(i+1,j+1) = Y(src,i,j);
    end
end
Hu(1) = y(3,1) + y(1,3);
Hu(2) = (y(3,1) - y(1,3))^2 + 4*y(2,2)^2;
Hu(3) = (y(4,1) - 3*y(2,3))^2 + (3*y(3,2) - y(1,4))^2;
Hu(4) = (y(4,1) + y(2,3))^2 + (y(3,2) + y(1,4))^2;
Hu(5) = (y(4,1)-3*y(2,3))*(y(4,1)+y(2,3))*((y(4,1)+y(2,3))^2 - 3*(y(3,2) ...
    - y(1,4))^2) + (3*y(3,2) - y(1,4))*(y(3,2) +y(1,4))*(3*(3*y(3,2)+y(1,4))^2 ...
    - (y(3,2)+y(1,4))^2);
Hu(6) = (y(3,1)-y(1,3))*((y(4,1)+y(2,3))^2 - (y(3,2)+y(1,4))^2) + 4*y(2,2)* ...
    (y(4,1)+y(2,3))*(y(3,2)+y(1,4));
Hu(7) = (3*y(3,2) - y(1,4))*(y(3,2) + y(1,4))*(3*(y(4,1) + y(3,3))^2 - (y(3,2) ...
    + y(1,4))^2) - (y(4,1) - y(2,3))*(y(3,2)+y(1,4))*(3*(y(4,1)+y(2,3))^2 ...
    - (y(3,2) + y(1,4))^2);




end

