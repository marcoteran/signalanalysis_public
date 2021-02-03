I=imread('grayscale.png');
[n_rows, n_colums]=size(I);

imshow(I)

I(1:100,1:100)=0;

I(500,500)=255;