irr3 = [];
SF3 = readfis([current_dir '\fis\SF3.fis']);
[sortie, irr3, orr, arr] = evalfis([duree, alcool, substance], SF3);
declenchementSF3 = min(irr3, [], 2);
nbruleSF3 = length(SF3.rule); % Nombre de regles
nbCsqSF3 = length(SF3.output.mf); % Nombre de classes de sortie
csqSF3 = zeros(1,nbCsqSF3);
for i = 1:nbruleSF3,
 csqSF3(SF3.rule(i).consequent) = max(csqSF3(SF3.rule(i).consequent),...
 declenchementSF3(i));
end;
% Affichage de la consequence finale de SF3
% Concatenation de texte
CsqSF3Txt = 'Consequence SF3 = {';
for i = 1:nbCsqSF3,
 CsqSF3Txt = [CsqSF3Txt, '(', SF3.output.mf(i).name, ';',...
 num2str(csqSF3(i)), '), '];
end;
CsqSF3Txt = [CsqSF3Txt(1:end-2), '}'];
disp(CsqSF3Txt);