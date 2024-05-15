close all;
clear all;                                  %#ok<CLALL>
clc;
tests_passed=true;
for ID=0:1:1007
    [pss,sss]=SsGenerator.getSsSignalsByCellInfo(ID);
    pss_test=nrPSS(ID);
    sss_test=nrSSS(ID);
    if pss_test~=pss
        disp("PSS NOT ok with id=",ID)
        tests_passed=false;
    end
    if sss_test~=sss
        disp("SSS NOT ok with id=",ID) 
        tests_passed=false;
    end
end
if tests_passed
    disp('The tests were passed successfully.')
end
