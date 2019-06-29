clc;clear;
% ���þ��� ��γ��������Ϣȷ����ȷ
format long e;
% ��2016�ĵ���Ϊ��׼ ��ȡ�ĸ��ǵľ�γ�����귶Χ
pic_2016 = 'Picture\New\2016.tif';
[C,R]=geotiffread(pic_2016);
size_2016=size(C);
% ��ȡ��γ�ȵ����
A1_2016 =  R.LongitudeLimits(1);
B1_2016 =  R.LatitudeLimits(1);
% list=dir(path) ���������ص���path·�������ݣ����Ҵ�ŵ�list�У�ͨ��list�����ǾͿ���֪��path·���µ����е��ļ����ˡ�
PathRoot='Picture\Picture\';
OutPut_New = 'Picture\New\';
list=dir(fullfile(PathRoot));
% ���ļ������ļ��ĸ���Ϊ.��ȥ2,����Ϊlist������. �� .. ·����
fileNum=size(list,1)-2; 
% Ҫ�������е��ļ�������Ϊ��
for k=3:fileNum+2
	% ������ļ�������������ļ��У���Ҳ���������档
     %matlab�ַ���ƴ��
    source_address=strcat(PathRoot,list(k).name);
    %matlab�ַ���ƴ��
    aim_address=strcat(OutPut_New,list(k).name);  
    %��ȡԴͼ��
    [C,R] = geotiffread(source_address); 
%     ��ȡͼ��ĳ߶���Ϣ
    size_new_c = size(C);
%     ��þ�γ����Ϣ�ķ�Χ
    A1 =  R.LongitudeLimits(1);
    B1 =  R.LatitudeLimits(1);
    A2 = R.LongitudeLimits(2);
    B2 = R.LatitudeLimits(2);
%     ����ÿһ��С���صľ���
    lon_unit = (abs(A2-A1)) / size_new_c(2);
    lat_unit = (abs(B2-B1)) / size_new_c(1);
%     ���� ����ͼƬ�Ŀ�ʼ��λ��
    start_lon = round((A1_2016-A1)/lon_unit);
    start_lat = round((B1_2016-B1)/lat_unit);
     %����ԭͼ��
	I = imcrop(C,[start_lon,0,size_2016(2),size_2016(1)]);   
    %������ú��ͼ��
	imwrite(I,aim_address);                       
end