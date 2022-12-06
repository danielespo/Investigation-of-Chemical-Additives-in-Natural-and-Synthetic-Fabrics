
% Function to find the masses by using the ratios found in
% ppm finder

BPA_ppm = readmatrix('BPA_ppm_all.xlsx');
NN_ppm = readmatrix('4NN_ppm_all.xlsx') ;
DINP_ppm = readmatrix('DINP_ppm_all.xlsx');
BBP_ppm =readmatrix('BBP_ppm_all.xlsx');
DEHP_ppm = readmatrix('DEHP_ppm_all.xlsx');
MR_ppm =readmatrix('2MR_ppm_all.xlsx')  ;

masses = [1435 1428 1436 1424 1415 1449 1417 1420 1428 1423 1424 1414 1439 1446 1404 1460 1443 1415 1408 1447 1422 1448 1446 1433 1404 1440 1461 1439 1484];
masses = masses .* 10^-3; % now in grams

%Choose 

masses_chemical = BPA_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ;
masses_chemical = chem_masses; %temporary for chem mass / sample mass
writematrix(masses_chemical,'BPA_mass_ratio_all.xlsx')
BPA_memory = masses_chemical;

masses_chemical = NN_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ; %ug / g = u units
masses_chemical = chem_masses; %temporary for chem mass / sample mass
writematrix(masses_chemical,'4NN_mass_ratio_all.xlsx')
NN_memory = masses_chemical;


masses_chemical = DINP_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ; %ug / g = u units
masses_chemical = chem_masses; %temporary for chem mass / sample mass
writematrix(masses_chemical,'DINP_mass_ratio_all.xlsx')
DINP_memory = masses_chemical;


masses_chemical = BBP_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ; %ug / g = u units
masses_chemical = chem_masses; %temporary for chem mass / sample mass
writematrix(masses_chemical,'BBP_mass_ratio_all.xlsx')
BBP_memory = masses_chemical;


masses_chemical = DEHP_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ; %ug / g = u units
masses_chemical = chem_masses; %temporary for chem  mass / sample mass
writematrix(masses_chemical,'DEHP_mass_ratio_all.xlsx')
DEHP_memory = masses_chemical;



masses_chemical = MR_ppm .* 2; %ppm * 2mL = microgram
chem_masses = masses_chemical./ masses ; %ug / g = u units
masses_chemical = chem_masses; %temporary for  chem mass / sample mass
writematrix(masses_chemical,'2MR_mass_ratio_all.xlsx')
MR_memory = masses_chemical;

