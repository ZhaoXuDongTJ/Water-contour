clc;clear;
X=geotiffread('2016.tif');
subplot(2,3,1);
imshow(X);
X=histeq(X);
subplot(2,3,2);
imshow(X);
X=rgb2gray(X);
X=histeq(X);
X = X-30;
subplot(2,3,3);
imshow(X);
sizes = size(X);
for i = 1:sizes(1)
    for j=1:sizes(2)
        if X(i,j)<=1
            X(i,j)=255;
        else
            X(i,j)=0;
        end
    end
end
subplot(2,3,4);
imshow(X);
X=filter2(fspecial('average',3),X)/255;
subplot(2,3,5);
imshow(X);