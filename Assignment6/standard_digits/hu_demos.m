clear
clc
Nz=7;
Na=10;
Hu7=zeros(Na,Nz);

for i = 1:Na
     s=num2str(eval('-1+i'));
     fn=[s,'.bmp'];
     Ix=imread(fn);
     Ix=1-im2double(Ix);
     Ik=false(size(Ix));
     Ik(Ix == 1)=1;
     Hu7(i,:)=Hu_invariance(Ik,1,0);
end
%Hu7(4,:)
src = imread('hand_10.bmp');
src = 1 - im2double(src);
src_moment = Hu_invariance(src,1,0);
min = sum(sum(abs(1./src_moment-1./Hu7(1,:))));
digit = 1;
for i = 2:10
    differ = sum(sum(abs(1./src_moment-1./Hu7(i,:))));
    if differ < min
        digit = i;
        min = differ;
    end
end
digit = digit - 1        
