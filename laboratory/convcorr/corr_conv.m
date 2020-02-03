close all; clear all; clc;
N=128;
W=pi/16;
nn=0:N-1;
s= sin(W*nn);
w= 0.5*randn(1,N);
x=s+w;
subplot(321), plot(nn,w)
[phi_w,mlag]=xcorr(w,w);
subplot(322), plot(mlag,phi_w)
subplot(323), plot(nn,x, nn,s,'k')
[phi_x,mlag]=xcorr(x,x);
subplot(324), plot(mlag,phi_x)
[phi_x_coef,mlag]=xcorr(x,x,'coef');
subplot(325), plot(mlag,phi_x_coef)
[phi_x_biased,mlag]=xcorr(x,x,'biased');
hold on, plot(mlag,phi_x_biased,'r:')
[phi_x_unbiased,mlag]=xcorr(x,x,'unbiased');
subplot(326), plot(mlag,phi_x_unbiased),axis([mlag([1 end]) -1 1])