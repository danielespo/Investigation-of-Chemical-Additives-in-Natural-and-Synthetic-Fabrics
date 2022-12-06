folder=cd;
filename=[folder,'\','20221117_fabric_standards_IS_ANTd10.xlsx'];


% Chemicals in order of appearance:
% BPA, 4-nonyl, 2-mercato, Bis(2), Anthracene, Diison, Butylbenzyl
% They each have 3 masses, with different ranges

tabs={'DEHP'};

% 'ANT_2021713', 'ANT_2022027',,'BPA','4NN','MBT',
    %'DINP_20221027','BBP_20221027'

for i=1:length(tabs)
    % Ranges of Masses: 
    % BPA_ (119, 213, 228)
    % 4NN_, (77, 107, 220) E2925:G3644, E6565:G7284, E14573:G15292 done
    % 2MR_, (69 108 135) I2197:K2916, I7293:K8012, I9477:K10196 done
    % ANT_, (80, 94, 188), Q3653:S4372, Q5109:S5828, Q12389:S13108 done 
    % DEHP_, (57 149 167), U1789:W2668, U7117:W7996, U8005:W8884 done 
    % DII_ , (43, 71, 149), M13:O892, M3565:O4444, M7117:O7996 done
    % BBP_ , (65, 91, 149) Y521:AA1020, Y1537:AA2036, M7117:O7996 done

    
    M = readmatrix(filename,'Sheet',tabs{i},'Range','A7419:C8468'); 
    writematrix(M,'DEHP_STD.txt');
end

