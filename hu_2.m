% 读入原图像
X=imread('2016.tif');     
% 分离 R 通道
R = X(:,:,1);
% 获取通道的大小
sizes_R = size(R);
% 由于湖面的R值非常小，可以进行二值化 设置阈值为 5
for i = 1:sizes_R(1)
    for j=1:sizes_R(2)
        % 小于5 就赋值155
        if R(i,j)<= 5
            R(i,j)=255;
        else
            %  就赋值0
            R(i,j)=0;
        end
    end
end
% 画图
subplot(1,2,1);
% 展示 X
imshow(X);
% 画图
subplot(1,2,2);
% 展示 R图片
imshow(R);