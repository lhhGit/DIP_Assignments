% ���ͼ��ֱ��ͼ
img=imread('lena.bmp');
figure('NumberTitle','off','Name', '���ͼ��ֱ��ͼ'); 
subplot(2,1,1); imshow(img); title('img');
subplot(2,1,2); outputHis(img); title('histogram');

% �Ҷ�����
a=1.5; b=20;
figure('NumberTitle','off','Name', '�Ҷ����� y=1.5x+20'); linearTransform(img,a,b);

% ֱ��ͼ���⻯
figure('NumberTitle','off','Name', 'ֱ��ͼ���⻯');  dst=hisequal(img); 
imwrite(dst/255.0,'lena_equalized.bmp');