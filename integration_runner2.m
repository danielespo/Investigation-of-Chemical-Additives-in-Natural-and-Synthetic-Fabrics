% Loop for integration

% Data names:     
% BPA_STD (119, 213, 228) A2041:C2370 done
% 4NN_STD, (77, 107, 220)  A14573:G15292 done
% 2MR_STD, (69 108 135) A9477:C10196 done
% ANT_2021_STD, (80, 94, 188), A12389:C13108 done
% ANT_2022_STD, (80, 94, 188), A12389:C13108 done
% DEHP_STD, (57 149 167),  A7419:C8468 done
% DINP_2022_STD , DINP, (43, 71, 149),  A7117:C7996 == DII done
% BBP_2022_STD , (65, 91, 149) A2553:C3052 done

Peak_Start =  15.85 ; %10.73; 
Peak_End = 16.04 ; %11.045; 


data = 'BBP_2022_STD_7.txt';
c = integrator_2(data, Peak_Start, Peak_End, 1);
writematrix(c, 'BBP_2022_STD_7_int.xlsx')

% DINP == DII