img = imread('number.bmp');
%gray = rgb2gray(img);
idx_b = img == 7;
idx_f = img ~=7;
bin_img = false(size(img));
bin_img(idx_b) = 0;
bin_img(idx_f) = 1;
%temp = morph(bin_img,'close',ones(3),[1,1]);
%A = [];
%while ~isempty(A)
%closed = morph(bin_img,'close',ones(3),[1,1]);
%A = closed == temp;
%temp = closed;
%end
%closed = bwmorph(bin_img,'close',Inf);
im = imread('word_bw.bmp');
thinned = image_thin(im);
%edges = edge(closed,'prewitt');
% ·Ö¸î³ö5¸öÍ¼Ïñ
imshow(thinned);