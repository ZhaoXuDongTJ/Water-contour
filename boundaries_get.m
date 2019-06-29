function [B,L] = boundaries_get(filepath)
%BOUNDARIES_GET 自动提取湖面边界范围，并生成湖面水域的二值图
%   自动提取湖面边界范围，并生成湖面水域的二值图
% 读取 tif 图片
X=imread(filepath);
% 均衡化
% X = histeq(X);
% 分离 R 通道
R = X(:,:,1);
% 获取通道的大小
sizes_R = size(R);
% 由于湖面的R值非常小，可以进行二值化 设置阈值为 22 
for i = 1:sizes_R(1)
    for j=1:sizes_R(2)
        if R(i,j)<= 5
            R(i,j)=255;
        else
            R(i,j)=0;
        end
    end
end
% 转化R通道为二值图
bw=im2bw(R);
% 开运算操作
bw = ~ bw;
se = strel('square',8);        
bw = imopen(bw,se);
bw = ~ bw;
% 去除噪声 设置噪声的面积为小于 20000
bw = bwareaopen(bw,20000);
% 小点去噪
bw = bwareaopen(~bw,9000);
bw = ~ bw;
% 求解得到湖面的边界和二值图
% B 湖面水域的二值图
% L 湖面的边界
[B,L] = bwboundaries(bw,'noholes');
end

