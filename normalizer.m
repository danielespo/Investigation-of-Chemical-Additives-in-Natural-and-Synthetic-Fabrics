% Array of integrated data, get each
clear all
data_names = ['BPA_STD' "4NN_STD","2MR_STD","DEHP_STD","ANT_2021_STD", "ANT_2022_STD","DINP_2022_STD","BBP_2022_STD"];

data_end = '_int.xlsx';
data_middle = ["","_2","_3","_4","_5","_6","_7"];

C = 1; %Chemical being divided each time.
D = 5; %Anthracene being used, 5, or 6 for the last 2
memory = [];

for i=1:7
    run_helper = [data_names(C),data_middle(i),data_end];
    combined_str = strjoin(run_helper,"");

    run_helper_2 = [data_names(D),data_middle(i),data_end];
    anthracene = strjoin(run_helper_2,"");
    disp(anthracene)
    A = readmatrix(combined_str);
    B = readmatrix(anthracene);

    output = A ./ B ; 
    memory = [memory output];

end

start = [19.33, 1.9, 8, 2.83, 0, 0, 4, 1.33]; %in ppm
dilution = [1, .5, .25, .10, .05, .025, .01]; %step per dilution of STD
concentration = ones(7,1) .* start(C);
concentration = concentration*dilution;
concentration = concentration(1,:);


lmk = strjoin(['Ratio of', data_names(C)]);
lmk = strjoin([lmk,'to Standard Anthracene Curve']);
lmk = strrep(lmk,'_',' ');
plot(concentration, memory, 'ro')
title(lmk)
xlabel('Concentration (ppm)')
ylabel('Ratio')

hold on

%p = fit(concentration,memory,'poly1');
%plot(p)