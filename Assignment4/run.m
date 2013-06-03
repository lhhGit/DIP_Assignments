%读入图像
image = imread('word_bw.bmp');

%定义结构单元
s_element = ones(3); pos =[2,2];

%膨胀
image_dilate = morph(image,'dilate',s_element,pos);

%腐蚀
image_erosion = morph(image,'erode',s_element,pos);

%开运算
image_open = morph(image,'open',s_element,pos);

%闭运算
image_close = morph(image,'close',s_element,pos);

%击中击不中运算
hit_element = [1,1;1,1]; pos_hit = [2,1];
miss_element = [1,0;1,1]; pos_miss = [1,2];
elememt=zeros(2,2,2); pos=zeros(1,2,2);
element(:,:,1)=hit_element; element(:,:,2)=miss_element;
pos(:,:,1)=pos_hit; pos(:,:,2)=pos_miss;
image_hitmiss = morph(image,'hit-miss',element,pos);

%图像细化
image = imread('closed.bmp');
image_thinned = image_thin(image);

figure('NumberTitle','off','Name', '图像形态学变换'); 
subplot(3,3,2); imshow(image); title('源图像');
subplot(3,3,4); imshow(image_dilate); title('膨胀');
subplot(3,3,5); imshow(image_erosion); title('腐蚀');
subplot(3,3,6); imshow(image_open); title('开运算');
subplot(3,3,7); imshow(image_close); title('闭运算');
subplot(3,3,8); imshow(image_hitmiss); title('击中击不中');
subplot(3,3,9); imshow(image_thinned); title('细化图像');