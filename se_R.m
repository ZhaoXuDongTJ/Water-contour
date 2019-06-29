% 读入原图像
X=imread('2016.tif');     
% 分离 R 通道
R = X(:,:,1);
% 画图
subplot(1,2,1);
% 展示 X
imshow(X);
% 画图
subplot(1,2,2);
% 展示 R图片
imshow(R);