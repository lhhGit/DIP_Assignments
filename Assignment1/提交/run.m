% 输出图像直方图
img=imread('lena.bmp');
figure('NumberTitle','off','Name', '输出图像直方图'); 
subplot(2,1,1); imshow(img); title('img');
subplot(2,1,2); outputHis(img); title('histogram');

% 灰度拉伸
a=1.5; b=20;
figure('NumberTitle','off','Name', '灰度拉伸 y=1.5x+20'); dst2=linearTransform(img,a,b);
imwrite(dst2,'lena_transformed.bmp');

% 直方图均衡化
figure('NumberTitle','off','Name', '直方图均衡化');  dst=hisequal(img); 
imwrite(dst/255.0,'lena_equalized.bmp');