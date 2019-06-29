function [lonat] = geo_coord_trans(B,L)
%GEO_COORD_TRANS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% ��ȡ����
L_size = size(L);
% �������
boundary =[];
for k = 1:length(B)
    % �������
   boundary = [boundary;B{k}];
end
% ��ȡ���
boundary_size = size(boundary);
% ����ͼƬ��Ϣ
[~,R]=geotiffread('Picture\New\2016.tif');
% ��ȡ��γ����Ϣ
A1 = R.LongitudeLimits(1);
B1 =  R.LatitudeLimits(1);
A2 = R.LongitudeLimits(2);
B2 = R.LatitudeLimits(2);
%  ����ÿһ��Сģ��ĳ���
lon_unit = (A2-A1) / L_size(1);
lat_unit = (B2-B1) / L_size(2);
% ��һ������
lonat = [];
for i = 1:boundary_size(1)
%     ����x����ľ�γ��
    temp_lon = A1 + boundary(i,1)*lon_unit;
%     ����y����ľ�γ��
    temp_lat = B2 - boundary(i,2)*lat_unit;
%     �����һ����������
    lonat=[lonat;temp_lon temp_lat 0];
end
end

