clear all; close all; clc;

n=-10:20;
u_n=ones(1,length(n));
n_0=find(n==0);
u_n(1:n_0-1)=0;
x_n=((-0.5).^n).*u_n;

figure()
stem(n,x_n,'linewidth',3);
grid on; xlabel('n'); ylabel('x[n]');
ylim([min(x_n)-0.05, max(x_n)+0.05]);
