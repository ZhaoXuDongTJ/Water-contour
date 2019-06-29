clc;clear;
% 设置精度 经纬度坐标信息确保正确
format long e;
% 以2016的的作为标准 获取四个角的经纬度坐标范围
pic_2016 = 'Picture\New\2016.tif';
[C,R]=geotiffread(pic_2016);
size_2016=size(C);
% 获取经纬度的起点
A1_2016 =  R.LongitudeLimits(1);
B1_2016 =  R.LatitudeLimits(1);
% list=dir(path) 函数，返回的是path路径的内容，并且存放到list中，通过list，我们就可以知道path路径下的所有的文件名了。
PathRoot='Picture\Picture\';
OutPut_New = 'Picture\New\';
list=dir(fullfile(PathRoot));
% 而文件夹下文件的个数为.减去2,是因为list包含了. 和 .. 路径。
fileNum=size(list,1)-2; 
% 要遍历所有的文件，方法为：
for k=3:fileNum+2
	% 这就是文件名，如果有子文件夹，则也包含在里面。
     %matlab字符串拼接
    source_address=strcat(PathRoot,list(k).name);
    %matlab字符串拼接
    aim_address=strcat(OutPut_New,list(k).name);  
    %读取源图像
    [C,R] = geotiffread(source_address); 
%     获取图像的尺度信息
    size_new_c = size(C);
%     求得经纬度信息的范围
    A1 =  R.LongitudeLimits(1);
    B1 =  R.LatitudeLimits(1);
    A2 = R.LongitudeLimits(2);
    B2 = R.LatitudeLimits(2);
%     计算每一个小像素的精读
    lon_unit = (abs(A2-A1)) / size_new_c(2);
    lat_unit = (abs(B2-B1)) / size_new_c(1);
%     计算 剪裁图片的开始的位置
    start_lon = round((A1_2016-A1)/lon_unit);
    start_lat = round((B1_2016-B1)/lat_unit);
     %剪裁原图像
	I = imcrop(C,[start_lon,0,size_2016(2),size_2016(1)]);   
    %输出剪裁后的图像
	imwrite(I,aim_address);                       
end