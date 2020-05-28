clear all; close all; clc; % Clean board and memory
%% Default parametrs graphics
set(0,'DefaultTextInterpreter', 'latex');
%set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize',16);
%set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize',16);


fs=16e6;
ts=1/fs;

L=13;
tau=0.1e-3;
t_b=tau/13;

Nsamples=round(t_b/ts);
b_aux=ones(1,Nsamples);
t=linspace(0,tau,L*Nsamples);
S_Lbasic=[1*b_aux,1*b_aux,1*b_aux,1*b_aux,1*b_aux,-1*b_aux,-1*b_aux,1*b_aux,1*b_aux,-1*b_aux,1*b_aux,-1*b_aux,1*b_aux];

figure()
plot(t,S_Lbasic);
xlim([0,tau])
ylim([-1.3,1.3])
grid on

figure()
[phi_w, mlag]= xcorr(S_Lbasic,S_Lbasic);
plot(mlag, phi_w)
grid on