for i=1:size(dst_img,1)
           for j=1:size(dst_img,2);
               if(dst_img(i,j)<0)
                   surround = [i-1,j;i+1,j;i,j-1;i,j+1];
                   if(i==1)
                       surround(1,:)=[i,j];
                   end
                   if(i==size(dst_img,1))
                       surround(2,:)=[i,j];
                   end
                   if(j==1)
                       surround(3,:)=[i,j];
                   end
                   if(j==size(dst_img,2))
                       surround(4,:)=[i,j];
                   end
                   for k=1:size(surround,1)
                       if(dst(surround(k,:))<abs(dst_img(i,j)))
                           dst_img(surround(k,:))=255;
                       else
                           dst_img(i,j)=255;
                       end
                   end
               end
           end
       end