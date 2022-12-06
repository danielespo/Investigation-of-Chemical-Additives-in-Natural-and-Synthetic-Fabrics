B = readmatrix('BPA_integration.xlsx');
%plot(B)

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

A = [B(1:5) B(8) B(10) B(12:13) B(15:17) B(20:29)];
C = [B(6:7) B(9)  B(11) B(14) ]

plot(C ,'ro')
title('DEHP Integrated Areas for Natural Fabrics')
xlabel('Sample')
ylabel('Value')

%xticks([1:30])
%xticklabels(tabs)

hold on 
