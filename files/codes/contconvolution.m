clc; close all; clear all;

ti=-10;
tf=10;
ts=1e-3;
t=ti:ts:tf;

t_ini=0;
x=2*escalon(t_ini,t);
h=(t.^2).*ventana(0,2,t);

y=zeros(1,length(t))+...
    ((2/3)*t.^3).*ventana(0,2,t)+...
    (16/3).*escalon(2,t);

y_m=conv(x,h);

figure()
subplot(311)
plot(t,x,'linewidth',2);
hold on
plot(t,h,'linewidth',2);
hold off
grid minor
xlabel('t'); legend('x(t)','h(t)');
xlim([-2,6]); ylim([-0.3,4.3]);

subplot(312)
plot(t,y,'linewidth',2);
grid minor
xlabel('t'); ylabel('y(t)');
xlim([-2,5]); ylim([-0.3,6.3]);

subplot(313)
t_m=2*((1:length(y_m))*ts*0.5-10);
plot(t_m,ts*y_m,'linewidth',2);
grid minor
xlabel('t'); ylabel('y(t)');
xlim([-2,5]); 
ylim([-0.3,6.3]);
