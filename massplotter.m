BPA_mass_ratio = readmatrix('BPA_mass_ratio_all.xlsx');
NN_mass_ratio = readmatrix('4NN_mass_ratio_all.xlsx') ;
DINP_mass_ratio = readmatrix('DINP_mass_ratio_all.xlsx');
BBP_mass_ratio =readmatrix('BBP_mass_ratio_all.xlsx');
DEHP_mass_ratio = readmatrix('DEHP_mass_ratio_all.xlsx');
MR_mass_ratio =readmatrix('2MR_mass_ratio_all.xlsx')  ;

% TODO: natural or not?
%Natural or not
Natural = [7  ] ;

C = 1; %matches data_name
data_names = ['BPA',"4NN","2MR","DEHP","DINP","BBP"];
bar(1:29,BPA_mass_ratio)
ylabel("Ratio in Sample (μg/g fabric)")
xlabel("Sample Name")

tabs={'F1'
'F2'
'F3'
'M1'
'M2'
'M3'
'M4'
'A1'
'N1'
'N2'
'N3'
'N4'
'N5'
'N6'
'N7'
'N8'
'N9'
'N10'
'N11'
'N12'
'S1'
'P1'
'H1'
'C1'
'C2'
'K1'
'W1'
'W2'
'B1'};

xticks(1:29)
xticklabels(tabs)

lmk = strjoin(['Mass of', data_names(C)]);
lmk = strjoin([lmk,'in each Sample divided by the Mass of the Sample']);
lmk = strrep(lmk,'_',' ');
title(lmk)