function integrated_peaks = integrator_2(data, start, end_time, plot_everything)
% Example integrator(4, 28, 10.73, 11.045)
% Finds Anthracene, for W2, peak times [10.73, 11.045]

% BPA used 5, 7, and 9 as prefixes

area_memory = [];
data = readmatrix(data);
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

area_sum = sum(intensity(start_index:end_index))*0.005*(end_index-start_index);
area_final = area_sum-baseline_area;
area_memory = [area_memory area_final];

% Plot the spectra for X and Y

if plot_everything == 1
    plot(time,intensity)
    ylabel('Absolute Intensity')
    xlabel('Time')
    title('Spectra for X in Y')
end

hold on 


integrated_peaks = area_memory;



