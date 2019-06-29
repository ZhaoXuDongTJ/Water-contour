function [B,L] = boundaries_get(filepath)
%BOUNDARIES_GET �Զ���ȡ����߽緶Χ�������ɺ���ˮ��Ķ�ֵͼ
%   �Զ���ȡ����߽緶Χ�������ɺ���ˮ��Ķ�ֵͼ
% ��ȡ tif ͼƬ
X=imread(filepath);
% ���⻯
% X = histeq(X);
% ���� R ͨ��
R = X(:,:,1);
% ��ȡͨ���Ĵ�С
sizes_R = size(R);
% ���ں����Rֵ�ǳ�С�����Խ��ж�ֵ�� ������ֵΪ 22 
for i = 1:sizes_R(1)
    for j=1:sizes_R(2)
        if R(i,j)<= 5
            R(i,j)=255;
        else
            R(i,j)=0;
        end
    end
end
% ת��Rͨ��Ϊ��ֵͼ
bw=im2bw(R);
% ���������
bw = ~ bw;
se = strel('square',8);        
bw = imopen(bw,se);
bw = ~ bw;
% ȥ������ �������������ΪС�� 20000
bw = bwareaopen(bw,20000);
% С��ȥ��
bw = bwareaopen(~bw,9000);
bw = ~ bw;
% ���õ�����ı߽�Ͷ�ֵͼ
% B ����ˮ��Ķ�ֵͼ
% L ����ı߽�
[B,L] = bwboundaries(bw,'noholes');
end

