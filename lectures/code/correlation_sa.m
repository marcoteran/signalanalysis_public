clear all; close all; clc; % Clean board and memory
%% Default parametrs graphics
set(0,'DefaultTextInterpreter', 'latex');
%set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize',16);
%set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize',16);

%%
n=-20:20;
x=zeros(1,length(n));
index_zero=find(n==0);
x(index_zero:index_zero+5)=n(index_zero:index_zero+5);

index_ten=find(n==10);
y=zeros(1,length(n));
y(index_ten:index_ten+5)=n(index_ten:index_ten+5)-10;

figure()
subplot(2,1,1)
stem(n,x, 'lineWidth',2)
hold on
stem(n,y, 'lineWidth',2)
grid on
ylim([-1 10])
hold off
xlabel('n')
legend('x[n]','y[n]')

subplot(2,1,2)
l=-40:40;

rxx=zeros(1,length(l));
index_one=find(l==-5);
l_aux=l(index_one:index_one+5);
rxx(index_one:index_one+5)= ((l_aux+5).*(l_aux+6).*(2*l_aux+11))/6 + (l_aux.*(l_aux+5).*(l_aux+6))/2;

index_zero=find(l==0);
index_five=find(l==5);
l_aux=l(index_zero+1:index_five);
rxx(index_zero+1:index_five)= (-l_aux.^3+4*l_aux.^4+46*l_aux-154)/3;


stem(l,rxx, 'lineWidth',2)
ylim([-1 10])
xlabel('l')
legend('r_{xx}[l]')


