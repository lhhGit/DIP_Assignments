% 测试2D离散傅里叶变换以及频谱的显示
im = imread('lena_noise.bmp');
im = im2double(im);

for i = 1:size(im,1)
    for j = 1:size(im,2)
        im(i,j) = (-1)^(i+j)*im(i,j);
    end
end
im_fre = fft2(im);
imshow(im_recon);

RR = real(im_fre);
II = imag(im_fre);

intensity = sqrt(RR.^2+II.^2);


K = 1;
D = log(1+K*intensity);
maxD = max(max(D));
imshow(D/maxD);