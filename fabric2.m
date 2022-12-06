folder=cd;
filename=[folder,'\','ALL_STD.xlsx'];

% BPA, 4-nonyl, 2-mercato, Bis(2), Anthracene, Diison, Butylbenzyl
% They each have 3 masses, with different ranges

tabs={'BBP_2022_STD'};
  

for i=1:length(tabs)
    % Ranges of Masses: (only looking at big one)
    % BPA_ (119, 213, 228) A2041:C2370 done 
    % 4NN_, (77, 107, 220)  A14573:G15292 done
    % 2MR_, (69 108 135) A9477:C10196 done
    % ANT_2021, (80, 94, 188), A12389:C13108 done
    % ANT_2022, (80, 94, 188), A12389:C13108 done
    % DEHP_, (57 149 167),  A7419:C8468 done
    % DII_ , DINP, (43, 71, 149),  A7117:C7996 done
    % BBP_ , (65, 91, 149) A2553:C3052

    
    M = readmatrix(filename,'Sheet',tabs{i},'Range','A2553:C3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD.txt';
    writematrix(M,currentFile);

    M = readmatrix(filename,'Sheet',tabs{i},'Range','E2553:G3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_2.txt';
    writematrix(M,currentFile);

        M = readmatrix(filename,'Sheet',tabs{i},'Range','I2553:K3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_3.txt';
    writematrix(M,currentFile);

        M = readmatrix(filename,'Sheet',tabs{i},'Range','M2553:O3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_4.txt';
    writematrix(M,currentFile);

        M = readmatrix(filename,'Sheet',tabs{i},'Range','Q2553:S3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_5.txt';
    writematrix(M,currentFile);

        M = readmatrix(filename,'Sheet',tabs{i},'Range','U2553:W3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_6.txt';
    writematrix(M,currentFile);

    M = readmatrix(filename,'Sheet',tabs{i},'Range','Y2553:AA3052'); 
    name = tabs{i};
    currentFile = 'BBP_2022_STD_7.txt';
    writematrix(M,currentFile);

end


