clc; close all; clear;

ti=-20;
tf=20;
ts=1e-3;
t=ti:ts:tf;

T=7;
x=t.*ventana(0,3,t)+3*ventana(3,7,t);

figure()
subplot(321)
plot(t,x,'linewidth',2);
grid minor
xlabel('t'); title('x(t)');
xlim([-3,10]); ylim([-0.3,3.2]);

%Sumatoria
x_f1=fourierserie(T,t,1);
x_f5=fourierserie(T,t,5);
x_f10=fourierserie(T,t,10);
x_f50=fourierserie(T,t,50);
x_f1000=fourierserie(T,t,1000);


subplot(322)
plot(t,x_f1,'linewidth',2);
grid minor
xlabel('t'); title('k = -1 a 1');
xlim([-14,14]); ylim([-0.3,3.5]);

subplot(323)
plot(t,x_f5,'linewidth',2);
grid minor
xlabel('t'); title('k = -5 a 5');
xlim([-14,14]); ylim([-0.3,3.5]);

subplot(324)
plot(t,x_f10,'linewidth',2);
grid minor
xlabel('t'); title('k = -10 a 10');
xlim([-14,14]); ylim([-0.3,3.5]);

subplot(325)
plot(t,x_f50,'linewidth',2);
grid minor
xlabel('t'); title('k = -50 a 50');
xlim([-14,14]); ylim([-0.3,3.5]);

subplot(326)
plot(t,x_f1000,'linewidth',2);
grid minor
xlabel('t'); title('k = -1000 a 1000');
xlim([-14,14]); ylim([-0.3,3.5]);





