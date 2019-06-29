clc;clear;
X=geotiffread('2016.tif');
subplot(3,3,1);
imshow(X);
R = X(:,:,1);
subplot(3,3,2)
imshow(R);
sizes = size(R);
for i = 1:sizes(1)
    for j=1:sizes(2)
        if R(i,j)<= 4
            R(i,j)=255;
        else
            R(i,j)=0;
        end
    end
end
% subplot(2,2,3);
% imshow(R);

bw=im2bw(R);
subplot(3,3,3);
imshow(bw);

bw = ~ bw;
se = strel('square',8);        
% bw = imerode(bw,se);
bw = imopen(bw,se);
subplot(3,3,4);
bw = ~ bw;
imshow(bw);


% bw = ~ bw;
bw = bwareaopen(bw,10000);
% bw = ~ bw;
subplot(3,3,6);
imshow(bw);

% subplot(3,3,7);

% [B,L] = bwboundaries(bw,'noholes');
% imshow(label2rgb(L, @jet, [.5 .5 .5]))
% hold on
% for k = 1:length(B)
%    boundary = B{k};
%    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
% end
% boundary = B{1};
% plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2);
% subplot(3,3,7);
% imshow(B);
