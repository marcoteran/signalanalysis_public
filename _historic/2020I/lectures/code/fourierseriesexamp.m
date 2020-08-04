clear all; close all; clc; % Clean board and memory
%% Default parametrs graphics
set(0,'DefaultTextInterpreter', 'latex');
%set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize',16);
%set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize',16);
%% Definitions
ts=1e-2;
t=-5*pi:ts:5*pi;
%%%
x_suma=zeros(1,length(t));
x_total=zeros(1,length(t));
a_o=0;
Nmax=2;
for k=1:Nmax
    a_k=(2/(pi*k))^2*(1-(-1)^k);
    x_suma=x_suma+a_k*cos(k*t);
end       
x_total=a_o/2+x_suma;

figure()
plot(t,x_total)
grid on
xlabel('t'); ylabel('x(t)')
legend('Nmax=5')


