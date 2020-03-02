clear all; close all; clc
addpath include
addpath geoFunctions
addpath graphics

settings = initSettings();
%load('trackingResultsDET100ms.mat');
load('trackingResults.mat');

%trackResults=trackResultsDET;
[navSolutions, eph] = postNavigation(trackResults, settings);

%plotNavigation(navSolutions, settings);
figure
subplot(3,1,[1 2])
plot(navSolutions.X-mean(navSolutions.X),'-rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',6)
hold on
plot(navSolutions.Y-mean(navSolutions.Y),'-bd','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',6)
plot(navSolutions.Z-mean(navSolutions.Z),'-yo','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',6)
hold off
xlim([1 length(navSolutions.Z)]);
xlabel('эпоха, c','fontsize',18); ylabel('Ошибки измерения, м','fontsize',18);
hLegend=legend('$\varepsilon_{x}$', '$\varepsilon_{y}$','$\varepsilon_{z}$'); 
set(hLegend, 'Interpreter', 'Latex','FontSize',28);
grid(gca,'minor');
set(gca,'FontSize',14)
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gcf,'figure6-1.bmp','bmp');


figure
plot3 (navSolutions.X-mean(navSolutions.X), ...
                          navSolutions.Y-mean(navSolutions.Y), ... 
                          navSolutions.Z-mean(navSolutions.Z), 'bs', 'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',15)
hold  on
plot3 (0, 0, 0, 'rs','LineWidth',3,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',15)
hold  off
grid on%('minor'); 
set(gca,'FontSize',16)
xlabel('x, м','fontsize',24);    
ylabel('y, м','fontsize',24);
zlabel('z, м','fontsize',24);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gcf,'figure6-2.bmp','bmp');

channel=1;
figure
skyPlot2(    navSolutions.channel.az, ...
            navSolutions.channel.el, ...
            navSolutions.channel.PRN(:, 1));
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.       
saveas(gcf,'figure6-3.bmp','bmp');

%saveas(gcf,'figure6_1-3.bmp','bmp');

plotNavigationRus(navSolutions, settings);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
saveas(gcf,'figure7-4.bmp','bmp');
