clear all; close all; clc;

% vector tiempo
n_i=-12; n_f=12;
n=n_i:n_f;

% señal arbitraria
x_n=zeros(1,length(n));
n_0=find(n==0);
x_n(n_0:n_0+4)=1;
x_n(n_0+5:n_0+5+4)=[2,3,4,5,6];
x_n(n_0-6:n_0-1)=[-6,-5,-4,-3,-2,-1];

refl_x_n=x_n(end:-1:1);

x_even=(x_n+refl_x_n)/2;
x_odd=(x_n-refl_x_n)/2;

% Dibujar
figure()
subplot(321)
stem(n,x_n,'linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x[n]');

subplot(323)
stem(n,refl_x_n,'r','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x[-n]');

subplot(325)
stem(n,x_even,'o','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x_e[n]');


subplot(322)
stem(n,x_n,'linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x[n]');

subplot(324)
stem(n,refl_x_n,'r','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x[-n]');

subplot(326)
stem(n,x_odd,'o','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x_o[n]');


% prueba
x_recons=x_even+x_odd;
figure()
subplot(211)
stem(n,x_n,'r','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x_o[n]');

subplot(212)
stem(n,x_recons,'k','linewidth',2.5);
grid on; xlim([-12 12]); ylim([min(x_n)-1 max(x_n)+1]);
xlabel('n'); ylabel('x_o[n]');


