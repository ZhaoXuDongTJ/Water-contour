clc;clear;
% ͼ��������ַ
input_dir='Picture\New\';
% kml�������ַ
output_dir='Picture\kml\';
% ��ֵ��ͼ�����
binary_dir='Picture\binnary\';
% ��ȡ����Ŀ¼�������ļ���
list=dir(fullfile(input_dir));
fileNum=size(list,1)-2; 
% ת�� �� kml ��ֵ�� 
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
title('1984~2016 ��׿Ӻ���ˮ�����');