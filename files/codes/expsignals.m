clear all; close all; clc;

% exp(sigma*t)

ti=-10;
tf=10;
ts=1;
t=ti:ts:tf;

s1=3*exp(2*t);
s2=3*exp(0.4*t);
s3=3*exp(10*t);

figure()
stem(t,s2,'linewidth',2)
hold off
xlabel('t'); ylabel('s(t)=3e^{0.4*t}');
ylim([-10 50]);
grid on

