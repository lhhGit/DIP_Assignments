im = imread('lena_noise.bmp');
im = im2double(im);
im2 = imread('characters.bmp');
im2 = im2double(im2);
im3 = imread('lena.bmp');
im3 = im2double(im3);
%imshow(im2);
%低通滤波器
D0 = 30;
im_l_ideal = myfilter(im,'l_ideal',D0);
im_l_butterworth = myfilter(im,'l_butterworth',D0);
im_l_exp = myfilter(im,'l_exponential',D0);
figure('NumberTitle','off','Name', '低通滤波器'); 
subplot(2,2,1); imshow(im); title('源图像');
subplot(2,2,2); imshow(im_l_ideal); title('理想');
subplot(2,2,3); imshow(im_l_butterworth); title('巴特沃斯');
subplot(2,2,4); imshow(im_l_exp); title('指数');

% 高通滤波器
D0 = 30;
im_h_ideal = myfilter(im2,'h_ideal',D0);
im_h_butterworth = myfilter(im2,'h_butterworth',D0);
im_h_exp = myfilter(im2,'h_exponential',D0);
figure('NumberTitle','off','Name', '高通滤波器'); 
subplot(2,2,1); imshow(im2); title('源图像');
subplot(2,2,2); imshow(im_h_ideal); title('理想');
subplot(2,2,3); imshow(im_h_butterworth); title('巴特沃斯');
subplot(2,2,4); imshow(im_h_exp); title('指数');

%伪彩色处理
figure('NumberTitle','off','Name', '伪彩色处理'); 
dst = psedoColor(im3);
subplot(1,2,1); imshow(im3); title('源图像');
subplot(1,2,2); imshow(dst); title('伪彩色图像');
