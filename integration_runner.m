% Loop for integration

Peak_Start = 15.885; %15.883 BBP

Peak_End = 16.245; %16.247 bbp
memory_total = [];
chemical_number = 7;
% names = {'BPA_' '4NN_', '2MR_', 'ANT_', 'DEHP_', 'DII_', 'BBP_'};

for i=1:29
    c = integrator(chemical_number, i, Peak_Start, Peak_End, 0);
    memory_total = [memory_total ; c];
end

writematrix(memory_total, 'BBP_integration.xlsx')