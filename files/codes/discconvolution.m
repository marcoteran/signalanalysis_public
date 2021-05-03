clc; close all; clear all;

n=-10:1:30;

h=(exp(-2*n)+2*exp(-n)).*escalon(0,n);
x=ventana(0,3,n);

y=zeros(1,length(n))+...    
((1-exp(-2*(n+1)))/(1-exp(-2))+2*(1-exp(-(n+1)))/(1-exp(-1))).*ventana(0,2,n)+...    
((exp(-2*n)*(exp(4)-exp(-2)))/(1-exp(-2))+2*(exp(-n)*(exp(2)-exp(-1)))/(1-exp(-1))).*escalon(2,n);

figure()
subplot(311)
stem(n,h,'linewidth',2);
hold on
stem(n,x,'linewidth',2);
hold off
xlabel('n'), legend('h[n]','x[n]');
grid minor
xlim([-4 20]); ylim([-0.3 3.3]);

subplot(312)
stem(n,y,'linewidth',2);
xlabel('n'),
grid minor
%xlim([-4 20]); ylim([-0.3 3.3]);

