
function [IMC]=IMC(taille,poids)

IMC = poids/ (taille^2);

fprintf('\nIMC= %.3f', IMC);

% taille en m et utiliser un point dans le chiffre : 1.70 m
% poids en kg
