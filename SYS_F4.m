irr4 = [];
SF4 = readfis([current_dir '\fis\SF4.fis']);
[sortie, irr4, orr, arr] = evalfis([hepathopatie, temps, hematochromatose], SF4);
declenchementSF4 = min(irr4, [], 2);
nbruleSF4 = length(SF4.rule); % Nombre de r?gles
nbCsqSF4 = length(SF4.output.mf); % Nombre de classes de sortie
csqSF4 = zeros(1,nbCsqSF4);
for i = 1:nbruleSF4,
 csqSF4(SF4.rule(i).consequent) = max(csqSF4(SF4.rule(i).consequent),...
 declenchementSF4(i));
end;
% Affichage de la cons?quence finale de SF4
% Concat?nation de texte
CsqSF4Txt = 'Consequence SF4 = {';
for i = 1:nbCsqSF4,
 CsqSF4Txt = [CsqSF4Txt, '(', SF4.output.mf(i).name, ';',...
 num2str(csqSF4(i)), '), '];
end;
CsqSF4Txt = [CsqSF4Txt(1:end-2), '}'];
disp(CsqSF4Txt);