irr6 = [];
SF6 = readfis([current_dir '\fis\SF6.fis']);
[sortie, irr6, orr, arr] = evalfis([douleur,regularite,durete], SF6);
declenchementSF6 = min(irr6, [], 2);
nbruleSF6 = length(SF6.rule); % Nombre de regles
nbCsqSF6 = length(SF6.output.mf); % Nombre de classes de sortie
csqSF6 = zeros(1,nbCsqSF6);
for i = 1:nbruleSF6,
 csqSF6(SF6.rule(i).consequent) = max(csqSF6(SF6.rule(i).consequent),...
 declenchementSF6(i));
end;
% Affichage de la consequence finale de SF6
% Concatenation de texte
CsqSF6Txt = 'Consequence SF6 = {';
for i = 1:nbCsqSF6,
 CsqSF6Txt = [CsqSF6Txt, '(', SF6.output.mf(i).name, ';',...
 num2str(csqSF6(i)), '), '];
end;
CsqSF6Txt = [CsqSF6Txt(1:end-2), '}'];
disp(CsqSF6Txt);
