
% Function to fit all the ratios of each sample in order
% Into the fitted lines of the standards for each we found earlier
% a and b are 1st degree polynomials we found by doing a linear fit
% of the standard data
% This returns the ppm per chemical per sample in our study.
% Note: nn is 4nn and mr is 2mr, DII is DINP
syms x
memory = [];
f1 = readmatrix("BPA_normalized_ratios.xlsx");
%bpa
for i=1:length(f1)
    a = [0.001516100237504,-5.203989507392787e-05]; %first
    b = [0.003999083413200,-0.011961276634530]; %second
    ap = poly2sym(a);
    ab = poly2sym(b);
    if f1(i) > 0.007 %if threshhold for 2 is true
        bpa = solve(ab==f1(i));
        memory = [memory bpa];
    else
        bpa = solve(ap==f1(i));
        memory = [memory bpa];
    end
end

memory_bpa = memory;

f1 = readmatrix("4NN_normalized_ratios.xlsx");
memory = []; 
%4nn
for i=1:length(f1)
    a = [0.006092307214545,-6.797710193967490e-05]; %first
    b = [0.017740157181830,-0.002942189633165]; %second
    ap = poly2sym(a);
    ab = poly2sym(b);
    if f1(i) > 0.004 %if threshhold for 2 is true
        bpa = solve(ab==f1(i));
        memory = [memory bpa];
    else 
        bpa = solve(ap==f1(i));
        memory = [memory bpa];
    end
end

memory_4nn = memory;

f1 = readmatrix("DII_normalized_ratios.xlsx");
memory = []; 
%dinp
for i=1:length(f1)
    a = [0.787596218701333,0.547304033108666]; %first
    b = [3.352246158443954,-2.573322527734326]; %second
    ap = poly2sym(a);
    ab = poly2sym(b);
    if f1(i) > 1.27 %if threshhold for 2 is true
        bpa = solve(ab==f1(i));
        memory = [memory bpa];
    else
        bpa = solve(ap==f1(i));
        memory = [memory bpa];
    end
end

memory_dinp = memory;

f1 = readmatrix("BBP_normalized_ratios.xlsx");
memory = []; 
%bbp
for i=1:length(f1)
    a = [0.238283062524922,0.017491852187728]; %first
    b = [0.848903705761044,-0.217122424473066]; %second
    ap = poly2sym(a);
    ab = poly2sym(b);
    if f1(i) > 0.095 %if threshhold for 2 is true
        bpa = solve(ab==f1(i));
        memory = [memory bpa];
    else
        bpa = solve(ap==f1(i));
        memory = [memory bpa];
    end
end

memory_bbp = memory;

f1 = readmatrix("DEHP_normalized_ratios.xlsx");
memory = []; 
%DEHP
for i=1:length(f1)
    a = [0.044622246590757,-0.002933098995246]; 
    ap = poly2sym(a);
    bpa = solve(ap==f1(i));
    memory = [memory bpa];
end
memory_dehp = memory;

f1 = readmatrix("2MR_normalized_ratios.xlsx");
memory = []; 
%2MR
for i=1:length(f1)
    a = [0.001714678903546,0.001310685740436]; 
    ap = poly2sym(a);
    bpa = solve(ap==f1(i));
    memory = [memory bpa];
end
memory_2mr = memory;

writematrix(double(memory_bpa),'BPA_ppm_all.xlsx')
writematrix(double(memory_4nn), '4NN_ppm_all.xlsx') 
writematrix(double(memory_dinp), 'DINP_ppm_all.xlsx') 
writematrix(double(memory_bbp), 'BBP_ppm_all.xlsx') 
writematrix(double(memory_dehp), 'DEHP_ppm_all.xlsx') 
writematrix(double(memory_2mr), '2MR_ppm_all.xlsx')  

