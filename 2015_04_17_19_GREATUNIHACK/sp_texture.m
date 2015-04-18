clear all
clc


I = imread('C:\DISE_C_100\Camera_Data 0088.jpg');
figure(1), imshow(I);

E = entropyfilt(I);
Eim = mat2gray(E);
%figure(2), imshow(Eim);

BW1 = im2bw(Eim, .8); % .9

figure(3); imshow(BW1);
% %figure, imshow(I);
% 
% BWao = bwareaopen(BW1,2000);
% %imshow(BWao);
% 
% nhood = true(9);
% closeBWao = imclose(BWao,nhood);
% %imshow(closeBWao)
% 
% roughMask = imfill(closeBWao,'holes');
% 
% I2 = I;
% I2(roughMask) = 0;
% %imshow(I2);
% 
% E2 = entropyfilt(I2);
% E2im = mat2gray(E2);
% %imshow(E2im);
% 
% BW2 = im2bw(E2im,graythresh(E2im));
% 
% %imshow(BW2)
% %figure, imshow(I);
% 
% mask2 = bwareaopen(BW2,1000);
% %imshow(mask2);
% 
% texture1 = I;
% texture1(~mask2) = 0;
% texture2 = I;
% texture2(mask2) = 0;
% 
% imshow(texture1);
% figure, imshow(texture2);
% 
% boundary = bwperim(mask2);
% segmentResults = I;
% segmentResults(boundary) = 155;
% imshow(segmentResults);





