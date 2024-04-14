close all;
clear all;                                  %#ok<CLALL>
clc;
ID=17                                       %#ok<NOPTS>
g=SsGenerator();
[pss,sss]=g.getSsSignalsByCellInfo(ID,1);
figure
stairs(pss)
hold on
stairs(sss)
ylim([-1.5,1.5]);
pss_test=nrPSS(ID);
sss_test=nrSSS(ID);
if pss_test~=pss
    disp("PSS NOT ok")
else
    disp("PSS ok") 
end
if sss_test~=sss
    disp("SSS NOT ok") 
else
    disp("SSS ok")
end
% pfft=fft(pss);
% sfft=fft(sss);

wvtool(pss)
wvtool(sss)

