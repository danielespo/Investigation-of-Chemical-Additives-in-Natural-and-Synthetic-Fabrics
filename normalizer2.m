% Array of integrated data, get each
clear all
data_names = ['BPA_', "4NN_","2MR_","DEHP_","DII_","BBP_","ANT_"];
% DII = DINP
data_end = 'integration.xlsx';

C = 1; %Chemical being divided each time.
D = 7; %Anthracene being used (7)
memory = [];

run_helper = [data_names(C),data_end];
combined_str = strjoin(run_helper,"");

run_helper_2 = [data_names(D),data_end];
anthracene = strjoin(run_helper_2,"");
disp(anthracene)
A = readmatrix(combined_str);
B = readmatrix(anthracene);
A = A(:,3);
B = B(:,3);
output = A ./ B ; 
memory = [memory output];

lmk = strjoin(['Ratio of', data_names(C)]);
lmk = strjoin([lmk,'to their Anthracene Curve']);
lmk = strrep(lmk,'_',' ');
bar(1:29, memory);

title(lmk)
xlabel('Sample Name')
ylabel('Ratio')

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
a = strjoin([data_names(C) 'normalized_ratios.xlsx']);
a = strrep(a,' ','');

writematrix(memory, a)
