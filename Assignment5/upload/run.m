im = imread('lena_noise.bmp');
im = im2double(im);
im2 = imread('characters.bmp');
im2 = im2double(im2);
im3 = imread('lena.bmp');
im3 = im2double(im3);
%imshow(im2);
%��ͨ�˲���
D0 = 30;
im_l_ideal = myfilter(im,'l_ideal',D0);
im_l_butterworth = myfilter(im,'l_butterworth',D0);
im_l_exp = myfilter(im,'l_exponential',D0);
figure('NumberTitle','off','Name', '��ͨ�˲���'); 
subplot(2,2,1); imshow(im); title('Դͼ��');
subplot(2,2,2); imshow(im_l_ideal); title('����');
subplot(2,2,3); imshow(im_l_butterworth); title('������˹');
subplot(2,2,4); imshow(im_l_exp); title('ָ��');

% ��ͨ�˲���
D0 = 30;
im_h_ideal = myfilter(im2,'h_ideal',D0);
im_h_butterworth = myfilter(im2,'h_butterworth',D0);
im_h_exp = myfilter(im2,'h_exponential',D0);
figure('NumberTitle','off','Name', '��ͨ�˲���'); 
subplot(2,2,1); imshow(im2); title('Դͼ��');
subplot(2,2,2); imshow(im_h_ideal); title('����');
subplot(2,2,3); imshow(im_h_butterworth); title('������˹');
subplot(2,2,4); imshow(im_h_exp); title('ָ��');

%α��ɫ����
figure('NumberTitle','off','Name', 'α��ɫ����'); 
dst = psedoColor(im3);
subplot(1,2,1); imshow(im3); title('Դͼ��');
subplot(1,2,2); imshow(dst); title('α��ɫͼ��');
