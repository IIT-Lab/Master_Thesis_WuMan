%���ڻ��ڶ����е��ŵ�ͼ
clear all;
close all;
clc;

%�����ŵ�ʱ������
load Channel.mat;
linewidth = 1.3;
%����ʱ��弤��Ӧͼ
N = 19;
plot((0:N)*5,h_power_norm,'-*','LineWidth',linewidth);
grid on;
xlabel('Propagation time (ns)');
ylabel('Normalized impluse response h(t) (s^{-1})');

%����Ƶ�ʳ弤��Ӧͼ
figure(2);
H = fft(h_power_norm,400);
plot(0:100,20*log10(abs(H(1:101))/max(abs(H))),'LineWidth',linewidth);
grid on;
set(gca,'xtick',(0:20:100))
xlabel('Frequency (MHz)');
ylabel('Normalized gain (dB)');

