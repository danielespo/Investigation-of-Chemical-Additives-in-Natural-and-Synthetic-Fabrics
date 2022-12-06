clear all
masses = [1435 1428 1436 1424 1415 1449 1417 1420 1428 1423 1424 1414 1439 1446 1404 1425 1443 1415 1408 1447 1422 1448 1446 1433 1404 1440 1461 1439 1484];
masses(16) = 1460; % replace the 16th element with 5
%in grams, multiply all by 10e-3

masses = masses .* 10^-3;

p=[0.003999083413200,-0.011961276634530];
k = polyval(p,2);
p = poly2sym(p);

k = p;
syms x
solve(k==2)