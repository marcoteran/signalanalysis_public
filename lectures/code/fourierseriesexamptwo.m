clear all; close all; clc; % Clean board and memory
%% Default parametrs graphics
set(0,'DefaultTextInterpreter', 'latex');
%set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize',16);
%set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize',16);
%% Definitions
T=12;
ts=1e-2;
t=-3*T:ts:3*T;
omega=2*pi/T;
x_fs=zeros(1, length(t));

N_one=3;
N_two=10;
N_three=80;
N_four=1000;

x_fs_one=zeros(1, length(t));
x_fs_two=zeros(1, length(t));
x_fs_three=zeros(1, length(t));

for k=1:N_four
 b_k=(1/6)*((-24/(pi*k))*cos(pi*k) + (72/(pi*k)^2)*sin(pi*k/3));
 omega_k=omega*k;
 x_fs=x_fs+b_k*sin(omega_k*t);
 
 if k== N_one
     x_fs_one=x_fs;
 end
 if k== N_two
     x_fs_two=x_fs;
 end
 
 if k== N_three
     x_fs_three=x_fs;
 end
     
 
end

% Graphs
figure()
subplot(2,2,1)
plot(t,x_fs_one);
grid on
xlim([-3*T, 3*T])
ylim([-2.5, 2.5])
xlabel('t, s')
ylabel('$x(t)$')
title('N_max=3')

subplot(2,2,2)
plot(t,x_fs_two);
grid on
xlim([-3*T, 3*T])
ylim([-2.5, 2.5])
xlabel('t, s')
ylabel('$x(t)$')
title('N_max=10')

subplot(2,2,3)
plot(t,x_fs_three);
grid on
xlim([-3*T, 3*T])
ylim([-2.5, 2.5])
xlabel('t, s')
ylabel('$x(t)$')
title('N_max=80')

subplot(2,2,4)
plot(t,x_fs);
grid on
xlim([-3*T, 3*T])
ylim([-2.5, 2.5])
xlabel('t, s')
ylabel('$x(t)$')
title('N_max=1000')
