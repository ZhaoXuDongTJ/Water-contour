% ����ԭͼ��
X=imread('2016.tif');     
% ���� R ͨ��
R = X(:,:,1);
% ��ͼ
subplot(1,2,1);
% չʾ X
imshow(X);
% ��ͼ
subplot(1,2,2);
% չʾ RͼƬ
imshow(R);