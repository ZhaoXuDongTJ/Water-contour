% ����ԭͼ��
X=imread('2016.tif');     
% ���� R ͨ��
R = X(:,:,1);
% ��ȡͨ���Ĵ�С
sizes_R = size(R);
% ���ں����Rֵ�ǳ�С�����Խ��ж�ֵ�� ������ֵΪ 5
for i = 1:sizes_R(1)
    for j=1:sizes_R(2)
        % С��5 �͸�ֵ155
        if R(i,j)<= 5
            R(i,j)=255;
        else
            %  �͸�ֵ0
            R(i,j)=0;
        end
    end
end

% % ת��Rͨ��Ϊ��ֵͼ
% bw=im2bw(R);
% ���������
bw = ~ bw;
se = strel('square',8);        
bw = imopen(bw,se);
bw = ~ bw;
% ��ͼ
subplot(1,2,1);
% չʾ R
imshow(R);
% ��ͼ
subplot(1,2,2);
% չʾ RͼƬ
imshow(bw);