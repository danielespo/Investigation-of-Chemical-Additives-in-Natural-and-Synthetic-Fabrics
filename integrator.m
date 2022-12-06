function integrated_peaks = integrator(chemical_number, sample_number, start, end_time, plot_everything)
% Example integrator(4, 28, 10.73, 11.045)
% Finds Anthracene, for W2, peak times [10.73, 11.045]

names = {'BPA_' '4NN_', '2MR_', 'ANT_', 'DEHP_', 'DII_', 'BBP_'};
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

% BPA used 5, 7, and 9 as prefixes, changing that soon

magic = chemical_number ; %magic number for chemical of interest 
magic2 = sample_number ; %magic number for sample of choice
%peak_time= [18.745,20.105]; Prof. Tseng's Anthracene Times


name = cell2mat(names(magic));  
tab = cell2mat(tabs(magic2));
data_name = strcat(name, tab);

data = readmatrix(data_name);
time = data(:,1);
intensity = data(:,2);

% Times to integrate over
start_time_integration = start; %old 10.73
end_time_integration = end_time; %old 11.045

% Integrating
start_index = find(time==start_time_integration);
end_index = find(time==end_time_integration);

a = intensity(start_index);
b = intensity(end_index);
baseline_area = (a+b)/2*(end_time_integration-start_time_integration); 

%   The magic () replacement that Prof. Tseng uses for ANT is 
%   2*(10.9-10.595), issue is that is not the case for the other samples.

area_sum = sum(intensity(start_index:end_index))*0.005*(end_index-start_index);
area_final = area_sum-baseline_area;
area_memory = area_final;

% Plot the spectra for X and Y

if plot_everything == 1
    plot(time,intensity)
    ylabel('Absolute Intensity')
    xlabel('Time')
    title_str = strrep('Spectra for X in Y','X', name);
    title_str = strrep(title_str,'Y',tab);
    title(title_str)
end



hold on 

name = cell2mat(names(magic));  %magic number for sample used
name = strcat(name,'2_');
tab = cell2mat(tabs(magic2));
data_name = strcat(name, tab);

data = readmatrix(data_name);
time = data(:,1);
intensity = data(:,2);

if plot_everything == 1
    plot(time,intensity)
end

a = intensity(start_index);
b = intensity(end_index);
baseline_area = (a+b)/2*(end_time_integration-start_time_integration); 

area_sum = sum(intensity(start_index:end_index))*0.005*(end_index-start_index);
area_final = area_sum-baseline_area;
area_memory = [area_memory area_final];

name = cell2mat(names(magic));  %magic number for sample used
name = strcat(name,'3_');
tab = cell2mat(tabs(magic2));
data_name = strcat(name, tab);

data = readmatrix(data_name);
time = data(:,1);
intensity = data(:,2);

if plot_everything == 1
    plot(time,intensity)
end

a = intensity(start_index);
b = intensity(end_index);
baseline_area = (a+b)/2*(end_time_integration-start_time_integration); 

area_sum = sum(intensity(start_index:end_index))*0.005*(end_index-start_index);
area_final = area_sum-baseline_area;
area_memory = [area_memory area_final];

integrated_peaks = area_memory;



