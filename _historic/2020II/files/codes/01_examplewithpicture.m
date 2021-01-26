close all; clear all; clc;

LENArgb=imread('./figures/Lenna.png');		% cargar la imagen
size(LENArgb)								% tamaño de la imagen
imshow(LENArgb)								% mostrar la imagen

% Rutina para mostrar los canales RGB de la imagen
nbcl=512; mcol=[0:nbcl-1]'/(nbcl-1);
mypal=zeros(nbcl,3,3); mypal(:,1,1)=mcol;
mypal(:,2,2)=mcol; mypal(: ,3,3)=mcol;
for k=1:3
    figure(k+1), imagesc(LENArgb(:,:,k))
    colormap(mypal(:,:,k)); axis('image')
end

% Imagen en escala de grises
LENAgray=rgb2gray(LENArgb);			% convertir a escala de grises
size(LENAgray)
figure(5)
imshow(LENAgray)

% Alteración del brillo de la imagen
LENAgraylight=LENAgray+90;
figure(6)
imshow(LENAgraylight)

LENAgraydark=LENAgray-90;
figure(7)
imshow(LENAgraydark)

% Agregar ruido del brillo de la imagen
LENArgb_noised=imnoise(LENArgb,'gaussian',0,0.5); % Adicionar ruido blanco gaussiano con media cero y varianza 0.5
figure(8)
imshow(LENArgb_noised)
