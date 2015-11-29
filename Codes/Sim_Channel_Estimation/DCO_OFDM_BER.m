clear all;
close all;
clc;

SNR = 20;
%BER
BER = zeros(length(SNR),1);
% M-QAM
M = 64; 
% �������һ������
NormNumber = sqrt(3/2/(M-1));
% ���ز���
SC = 128;
%������
hMod = comm.RectangularQAMModulator(M); 
%�����
hDemod = comm.RectangularQAMDemodulator(M); 

for i=1:length(SNR)
    snr = SNR(i);
    %ÿ��SNR�·����֡��
    NF = 2000;
    sumerrbit = 0;
    sumbit = log2(M)*SC*NF;
    for j = 1:NF
        % ÿ֡�ķ�����
        NS = 20;
        % ��Դ
        source = randi(M,SC,1)-1;
        % ��һ��������
        X = NormNumber * step(hMod,source);
        % ��������
        % Zsigma = sqrt(1/log2(M)/2/(10^(snr/10)));
        Zsigma = sqrt(1/2/(10^(snr/10)));
        % Ƶ������
        Z = Zsigma*(randn(SC,1)+randn(SC,1)*1i);
        
        % ���ŵ�
        Y = X+ Z;
        
        % ���
        y = step(hDemod,Y/NormNumber);
        % ͳ�ƴ��������
        [nerr,rerr] = biterr(source,y);
        sumerrbit = sumerrbit + nerr;
    end
    BER(i) = sumerrbit/sumbit;
end
semilogy(SNR,BER);
grid on;