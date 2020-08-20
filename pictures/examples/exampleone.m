close all; clear all; clc;

LENArgb=imread('Lenna.png');
size(LENArgb)
imshow(LENArgb)

nbcl=512; mcol=[0:nbcl-1]'/(nbcl-1);
mypal=zeros(nbcl,3,3); mypal(:,1,1)=mcol;
mypal(:,2,2)=mcol; mypal(: ,3,3)=mcol;
for k=1:3
    figure(k+1), imagesc(LENArgb(:,:,k))
    colormap(mypal(:,:,k)); axis('image')
end

LENAgray=rgb2gray(LENArgb);
size(LENAgray)
figure(5)
imshow(LENAgray)

LENAgraylight=LENAgray+90;
figure(6)
imshow(LENAgraylight)

LENAgraydark=LENAgray-90;
figure(7)
imshow(LENAgraydark)

LENArgb_noised=imnoise(LENArgb,'gaussian',0,0.5);
figure(8)
imshow(LENArgb_noised)
