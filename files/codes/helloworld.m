I=imread('grayscale.png');
[n_rows, n_colums]=size(I);

imshow(I)

I(1:100,1:100)=0;
I(500,500)=255;

Irgb=imread('lena.png');
imshow(Irgb)

Ir=Irgb(:,:,1); %roja
Ig=Irgb(:,:,2); %verde
Ib=Irgb(:,:,3); %azul

figure()
subplot(221)
Irgb(:,:,3)=Irgb(:,:,3)+75;
imshow(Irgb)
subplot(222)
imshow(Ir)
subplot(223)
imshow(Ig)
subplot(224)
imshow(Irgb(:,:,3))







