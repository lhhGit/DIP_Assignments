figure('NumberTitle','off','Name', 'ͼ�񼸺�У��'); 

target_src=imread('point_sp.bmp');
target_dst=imread('point.bmp');
input_img=imread('tiger_sp.bmp');
output_img=caliberate(input_img,target_dst,target_src);

subplot(2,2,1); imshow(target_src); title('���۰�');
subplot(2,2,2); imshow(target_dst); title('�����');
subplot(2,2,3); imshow(input_img); title('����ͼ��');
subplot(2,2,4); imshow(output_img); title('У��ͼ��');