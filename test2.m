clc;clear;
X=geotiffread('2016.tif');
%X=imread('Putin.jpg');
X=rgb2gray(X);

%X=im2double(X);
%imshow(X);
w1=genlaplacian(5);
%K1=filter2(fspecial('average',3),X)/255;
%K1=histeq(K1);
%K1=conv2(K1,w1,'same');
%imshow(K1);
K1=X;
I=K1;
I0=K1;

% subplot(231);
% imshow(I);

% BW1=edge(I0,'Roberts');
% subplot(232);
% imshow(BW1);
% title('Robert算子边缘检测')
% 
% 
% BW2=edge(I0,'Sobel');
% subplot(233);
% imshow(BW2);
% title('Sobel算子边缘检测')
% 
% BW3=edge(I0,'Prewitt');
% subplot(234);
% imshow(BW3);
% title('Prewitt算子边缘检测');
% 
% BW4=edge(I0,'LOG');
% subplot(235);
% imshow(BW4);
% title('LOG算子边缘检测')

BW5=edge(I0,'Canny');
% subplot(236);
% imshow(BW5);
% title('Canny算子边缘检测')

src = X;

%显示原始图像
figure('name','myapp'),
subplot(2,2,1),imshow(src),title('src')

%用ostu方法获取二值化阈值，进行二值化并进行显示
level=graythresh(src);
bw=im2bw(src,level);
subplot(2,2,2),imshow(bw),title('bw')

%运用开操作消去噪点
se = strel('disk',2);
openbw=imopen(bw,se);
subplot(2,2,3),imshow(openbw),title('open')

%获取连通区域，并进行显示
L = bwlabel(openbw,4);
RGB = label2rgb(L);
subplot(2,2,4),imshow(RGB),title('rgb')

%获取区域的'basic'属性， 'Area', 'Centroid', and 'BoundingBox' 
stats = regionprops(openbw, 'basic');
centroids = cat(1, stats.Centroid);
figure('name','regionprops'),
%绘制开操作之后的二值化图像
imshow(openbw),title('centroids')  
hold on


