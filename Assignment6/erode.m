function [ dst ] = erode( src,template )
%ERODE ¼òÒ×¸¯Ê´ÔËËã 
%   src Ô´Í¼Ïñ
%   template ¸¯Ê´µ¥Ôª

[idx,idy] = find(src == 1);
dst = zeros(size(src));
n = size(template,1);
half = floor(n/2);
for i = 1:length(idx)
    x_range = idx(i)-half:idx(i)+half;
    y_range = idy(i)-half:idy(i)+half;
    for k = 1:length(x_range);
        for l = 1:length(y_range);
            x = x_range(k);
            y = y_range(l);
            if (x-half>0&&x+half<=size(src,1)...
                    &&y-half>0&&y+half<=size(src,2))
            region = src(x-half:x+half,y-half:y+half);           
            if region == template
               dst(x,y) = 1;
            end
            end
        end
    end
end
