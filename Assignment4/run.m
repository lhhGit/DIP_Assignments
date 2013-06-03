%����ͼ��
image = imread('word_bw.bmp');

%����ṹ��Ԫ
s_element = ones(3); pos =[2,2];

%����
image_dilate = morph(image,'dilate',s_element,pos);

%��ʴ
image_erosion = morph(image,'erode',s_element,pos);

%������
image_open = morph(image,'open',s_element,pos);

%������
image_close = morph(image,'close',s_element,pos);

%���л���������
hit_element = [1,1;1,1]; pos_hit = [2,1];
miss_element = [1,0;1,1]; pos_miss = [1,2];
elememt=zeros(2,2,2); pos=zeros(1,2,2);
element(:,:,1)=hit_element; element(:,:,2)=miss_element;
pos(:,:,1)=pos_hit; pos(:,:,2)=pos_miss;
image_hitmiss = morph(image,'hit-miss',element,pos);

%ͼ��ϸ��
image = imread('closed.bmp');
image_thinned = image_thin(image);

figure('NumberTitle','off','Name', 'ͼ����̬ѧ�任'); 
subplot(3,3,2); imshow(image); title('Դͼ��');
subplot(3,3,4); imshow(image_dilate); title('����');
subplot(3,3,5); imshow(image_erosion); title('��ʴ');
subplot(3,3,6); imshow(image_open); title('������');
subplot(3,3,7); imshow(image_close); title('������');
subplot(3,3,8); imshow(image_hitmiss); title('���л�����');
subplot(3,3,9); imshow(image_thinned); title('ϸ��ͼ��');