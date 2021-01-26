close all; clear all; clc;
myimg=imread('peppers.png', 'PNG');
size(myimg)
nbcl=512; mcol=[0:nbcl-1]'/(nbcl-1);
mypal=zeros(nbcl,3,3); mypal(:,1,1)=mcol;
mypal(:,2,2)=mcol; mypal(: ,3,3)=mcol;
for k=1:3
    figure(k), imagesc(myimg(:,:,k))
    colormap(mypal(:,:,k)); axis('image')
end
