clear all;close all;clc;

ReadInitialFile;
load ./resTarget_4/Result_Hughers_Hartogs_SNR_24dB.mat;
load ./resTarget_4/Result_Chow_SNR_24dB.mat;
load ./resTarget_4/Result_Fischer_SNR_24dB.mat;


figure(1)
plot(nIdleLF:nSC-nIdleHF-1,...
loadedBit_IDEAL_Hughers_Hartogs_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-*');
hold on;
plot(nIdleLF:nSC-nIdleHF-1,...
loadedBit_IDEAL_Chow_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-ks');
plot(nIdleLF:nSC-nIdleHF-1,...
loadedBit_IDEAL_Fischer_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-r+');
legend('Hughers-Hartogs','P.S.Chow','Fischer');
grid on;
xlabel('SubCarrier Number');
ylabel('Bit Allocation');

figure(2)
plot(nIdleLF:nSC-nIdleHF-1,...
loadedPower_IDEAL_Hughers_Hartogs_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-*');
hold on;
plot(nIdleLF:nSC-nIdleHF-1,...
loadedPower_IDEAL_Chow_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-ks');
plot(nIdleLF:nSC-nIdleHF-1,...
loadedPower_IDEAL_Fischer_SNR_24dB(nIdleLF+1:nSC-nIdleHF),'-r+');
legend('Hughers-Hartogs','P.S.Chow','Fischer');
grid on;
xlabel('SubCarrier Number');
ylabel('Power Allocation');

load ./resTarget_4/BER_Total.mat;
SNR = 10:2:30;
figure(3);
semilogy(SNR,BER_Total_avg(:,4),'--m');
hold on;
semilogy(SNR,BER_Total_avg(:,1),'-*');
semilogy(SNR,BER_Total_avg(:,2),'-sk');
semilogy(SNR,BER_Total_avg(:,3),'-r+');
a = [0.250749320652174;0.210554347826087;0.170151494565217;0.131927989130435;0.0971759510869565;0.0676603260869565;0.0430618206521739;0.0236800271739130;0.0107466032608696;0.00362092391304348;0.000764266304347826];
%run table3.2 outside,gain the result and write to BER_Total_avg
% BER_Total_avg(:,4) = a;
% save('./resTarget_4/BER_Total','BER_Total_avg');
grid on;
xlabel('SNR (dB)');
ylabel('BER');
legend('Allocation in Table 3.2','Hughers-Hartogs','P.S.Chow','Fischer');
