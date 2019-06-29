function [lonat] = geo_coord_trans(B,L)
%GEO_COORD_TRANS 此处显示有关此函数的摘要
%   此处显示详细说明
% 获取长度
L_size = size(L);
% 设计数组
boundary =[];
for k = 1:length(B)
    % 添加数据
   boundary = [boundary;B{k}];
end
% 获取宽度
boundary_size = size(boundary);
% 加载图片信息
[~,R]=geotiffread('Picture\New\2016.tif');
% 获取经纬度信息
A1 = R.LongitudeLimits(1);
B1 =  R.LatitudeLimits(1);
A2 = R.LongitudeLimits(2);
B2 = R.LatitudeLimits(2);
%  计算每一个小模块的长度
lon_unit = (A2-A1) / L_size(1);
lat_unit = (B2-B1) / L_size(2);
% 设一个数组
lonat = [];
for i = 1:boundary_size(1)
%     计算x坐标的经纬度
    temp_lon = A1 + boundary(i,1)*lon_unit;
%     计算y坐标的经纬度
    temp_lat = B2 - boundary(i,2)*lat_unit;
%     打包到一个数组里面
    lonat=[lonat;temp_lon temp_lat 0];
end
end

