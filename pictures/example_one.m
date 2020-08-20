% EXAMPLE 1
clear all; close all; clc;

LENArgb=imread('Lenna.png');
imshow(LENArgb)

LENAgrey=rgb2gray(LENArgb);
imshow(LENAgrey)


LENAgrey_light=LENAgrey+50;
figure(2)
imshow(LENAgrey_light)


LENAgrey_dark=LENAgrey-50;
figure(3)
imshow(LENAgrey_dark)