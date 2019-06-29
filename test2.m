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
% title('Robert���ӱ�Ե���')
% 
% 
% BW2=edge(I0,'Sobel');
% subplot(233);
% imshow(BW2);
% title('Sobel���ӱ�Ե���')
% 
% BW3=edge(I0,'Prewitt');
% subplot(234);
% imshow(BW3);
% title('Prewitt���ӱ�Ե���');
% 
% BW4=edge(I0,'LOG');
% subplot(235);
% imshow(BW4);
% title('LOG���ӱ�Ե���')

BW5=edge(I0,'Canny');
% subplot(236);
% imshow(BW5);
% title('Canny���ӱ�Ե���')

src = X;

%��ʾԭʼͼ��
figure('name','myapp'),
subplot(2,2,1),imshow(src),title('src')

%��ostu������ȡ��ֵ����ֵ�����ж�ֵ����������ʾ
level=graythresh(src);
bw=im2bw(src,level);
subplot(2,2,2),imshow(bw),title('bw')

%���ÿ�������ȥ���
se = strel('disk',2);
openbw=imopen(bw,se);
subplot(2,2,3),imshow(openbw),title('open')

%��ȡ��ͨ���򣬲�������ʾ
L = bwlabel(openbw,4);
RGB = label2rgb(L);
subplot(2,2,4),imshow(RGB),title('rgb')

%��ȡ�����'basic'���ԣ� 'Area', 'Centroid', and 'BoundingBox' 
stats = regionprops(openbw, 'basic');
centroids = cat(1, stats.Centroid);
figure('name','regionprops'),
%���ƿ�����֮��Ķ�ֵ��ͼ��
imshow(openbw),title('centroids')  
hold on


