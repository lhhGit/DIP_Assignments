function [ Avg_p ] = setAvgP( img,X )
%SETAVGP Summary of this function goes here
%   Detailed explanation goes here

list=[X,0];
while(find(list==0))
p=find(list==0);
current_x=list(p(1,1),1);
current_y=list(p(1,1),2);
%find nearby black point
for i=p(1,1)-1:X(1,1)+1
   for j=X(1,2)-1:X(1,2)+1
       if(img(i,j)==0)
          list=[list;i,j,0];
       end
   end
end

end
end

