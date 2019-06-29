clc;clear;
X=geotiffread('2016.tif');
subplot(2,2,1);
imshow(X);
R = X(:,:,1);
subplot(2,2,2)
imshow(R);
bw=im2bw(R);
subplot(2,2,3);
imshow(bw);

contour = bwperim(bw);
subplot(2,2,4);
imshow(contour);