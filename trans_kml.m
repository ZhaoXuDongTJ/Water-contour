clc;clear;
% 图像的输入地址
input_dir='Picture\New\';
% kml的输出地址
output_dir='Picture\kml\';
% 二值化图像输出
binary_dir='Picture\binnary\';
% 获取输入目录的所有文件名
list=dir(fullfile(input_dir));
fileNum=size(list,1)-2; 
% 转化 到 kml 二值化 
suma =[];
for k=3:fileNum+2
    input_file=strcat(input_dir,list(k).name);
%     output_file=strcat(output_dir,list(k).name(1:end-4),'.kml');
%     binary_file=strcat(binary_dir,list(k).name(1:end-4),'.jpg');
    [B,L] = boundaries_get(input_file);
%     lonat = geo_coord_trans(B,L);
%     gen_cover_kml(output_file, lonat);
%     imwrite(L,binary_file);
    suma=[suma,sum(sum(L))];
end

plot([1984:1:2016],suma);
title('1984~2016 羊卓雍措湖水域面积');