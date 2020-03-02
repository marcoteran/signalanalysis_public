clear all; close all; clc; % Clean board and memory
%% Default parametrs graphics
clear all; close all; clc
set(0,'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',12);
set(0,'DefaultTextFontSize',12);

%% Parametros de la señal
settings.fs=16e6;% sampling frequency;
settings.dF=0.5625e6; % channel spacing;
settings.ts=1/settings.fs;     % 1/fs;
settings.tm=1e-3;     % signal duration;
settings.L=round(settings.tm/settings.ts); % number of samples;
settings.dataType           = 'schar';
settings.fileType           = 1;

settings.IF                 = 2.42e6;      %[Hz]
settings.N=3;    %
settings.fc=settings.N.*settings.dF;    % intermediate freq;

settings.samplingFreq       = 16.000e6;     %[Hz]
settings.codeFreqBasis      = 1.023e6;      %[Hz]
settings.codeLength         = 1023;
settings.skipNumberOfBytes  = 1e6;

%% Generación de la señal y señal ruidosa
t=(0:settings.L-1)*settings.ts;           % time vector;
Carr=cos(2*pi*settings.IF.*t);   % carrier based on time vector;
%CA=makeCaTable(settings,4,0);
%save('CAcode.mat','CA')
load('CAcode.mat','CA')   % Cargando el codigo PRN satelital

CAmod=CA.*Carr;         % PSK-signal;
% Genreación de ruido
SNR=-15;                    % Signal-Noise Rate [dB]
snr_ratio=10^(SNR/10);      % given SNR (magnitud)
NoisePower=1/snr_ratio;     % Noise power (Signal power = 1 W)
Sigma = sqrt(NoisePower);   % Noise amplitude 
Noise = Sigma*randn(1,settings.L);%white noise with sigma; output only noise vector;
Signal_Noise =CAmod + Noise; % output signal+noise vector;

%% Graphics of the signal
figure(1)
subplot(3,1,1)
h1=plot(t./(1e-3),CAmod,'k','linewidth',1);
hold on
h2=plot(t./(1e-3),CA,'r','linewidth',2);
hold off
xlim([1.5e2*settings.ts/1e-3 8.5e2*settings.ts/1e-3]); ylim([-1.1 1.1]);% 
h = legend('Modulated signal','Code C/A');      % Leyenda
set(h,'Interpreter','latex', 'Location', 'NorthEast','FontSize',10)     % Parametros leyenda
grid(gca,'minor'); %Cuadricula menor %grid on
xlabel('t, [ms]','fontsize',12)
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gcf, 'signal.eps','epsc');
%saveas(gca, 'signal','png');

%% Correlation
figure(2)
[RxxPRN,lags]=xcorr(CA);
ti=settings.ts*length(CA);
LRxx=length(RxxPRN);
lags2=linspace(-ti,ti,LRxx);
subplot(211)
plot(lags2/(1e-3),RxxPRN/max(RxxPRN),'b','linewidth',1)
axis([-1e-3/(1e-3) 1e-3/(1e-3) min(RxxPRN/max(RxxPRN))-0.1 max(RxxPRN/max(RxxPRN))+0.1])
grid(gca,'minor'); %Cuadricula menor %grid on
xlabel('\tau, [ms]','fontsize',12)
ylabel('R_{xx}','fontsize',12)
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gca, 'correlation1.eps','epsc');
%saveas(gca, 'correlation1','png');

figure(3)
subplot(211)
plot(lags2/(1e-3),RxxPRN/max(RxxPRN),'b','linewidth',2.5)
axis([-0.03e-3/(1e-3) 0.03e-3/(1e-3) min(RxxPRN/max(RxxPRN))-0.1 max(RxxPRN/max(RxxPRN))+0.1])
grid(gca,'minor'); %Cuadricula menor %grid on
xlabel('\tau, [ms]','fontsize',12)
ylabel('R_{xx}','fontsize',12)
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gca, 'correlation2.eps','epsc');
%saveas(gca, 'correlation2','png');
%close all

%% FFT (Spectr)
Signal=CAmod;
if mod(settings.L,2)==0
    k=-settings.L/2:settings.L/2-1; % N even
else
    k=-(settings.L-1)/2:(settings.L-1)/2; % N odd
end
freq=k/settings.tm; %the frequency axis
xs=fftshift(Signal); %to avoid error in the phase
X=fft(xs)/settings.L; % normalize the data
X=abs(fftshift(X)); %shifts the fft data so that it is centered

figure(4)
subplot(211)
plot(freq,X,'b','linewidth',1)
axis([0 6e6 min(X)-0.001 max(X)+0.001])
grid(gca,'minor'); %Cuadricula menor %grid on
xlabel('Frequency, [Hz]','fontsize',12)
ylabel('Signal spectrum','fontsize',12)
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gca, 'spectr.eps','epsc');
%saveas(gca, 'spectr','png');


%% Acquisition for a Real Signal


load('realsignal.mat','signal')


settings.deltaFd=14;         % Doppler frequency range.
SPC=round(settings.fs/(settings.codeFreqBasis/settings.codeLength)); %íîìåð äèñêðåòîâ 

%-----Vectores Busqueda
phasePoints=(0:(SPC-1))*2*pi*settings.ts;       % Fase de la portadora
frecuPoints=round(2*settings.deltaFd)+1;        % Numero de intervalos de frecuencia Doppler
results=zeros(frecuPoints,16000);               % Vector resultado de busqueda Z
%CACode =makeCaTable(settings,4,0);              % Código local C/A (PRN = 4)
CACode = CA;              % Código local C/A (PRN = 4)
CACodeFreqDom=conj(fft(CACode));                % Conjugada de la FFT del codigo (remplaza correlación)
  
for fbIndex=1:frecuPoints  % Indices para busqueda de Frequencia Doppler 
    freqAcq(fbIndex)=settings.IF-(settings.deltaFd/2)*1000+0.5e3*(fbIndex-1); % Frecuencia actual del bucle 
    Carr=exp(i*freqAcq(fbIndex)*phasePoints);       % Portadora exponencial (cos real y sin imaginario - IQ demodulation)
    IQfdom1=fft(Carr.*signal);     % FFT de la señal demodulada (multiplicada por la portadora local)
    convCodeIQ1=IQfdom1.*CACodeFreqDom; % Correlacion en tiempo es multiplicacion en frecuencia
    acqRes1=abs(ifft(convCodeIQ1));   % Modulo de la FFT inversa
    results(fbIndex,:)=acqRes1;       % Guardando resultados de Z    
    end
figure(5)
colormap jet
mesh(t/(1e-3), freqAcq/1e3, results,'FaceColor','flat','FaceLighting','gouraud','LineWidth',0.3);
xlabel('t_{rec}, [ms]','fontsize',12)
ylabel('f_{d}, [MHz]','fontsize',12)
zlabel('Z','fontsize',12)
shading interp
axis tight
view(-50,30)
camlight left
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gca, 'acquisition.eps','epsc');
%saveas(gca, 'acquisition','png');

