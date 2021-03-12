clear all; close all; clc;

% exp(sigma*t)

ti=-10;
tf=10;
ts=1e-2;
t=ti:ts:tf;
T=2;
x_t=sin((2*pi/T)*t);

figure()
plot(t,x_t,'linewidth',2);
grid on; xlabel('t'); ylabel('x(t)');