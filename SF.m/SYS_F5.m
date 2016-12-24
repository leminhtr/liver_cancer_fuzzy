irr5 = [];

SF5 = readfis([current_dir '\fis\SF5.fis']);

[sortie, irr5, orr, arr] = evalfis([confusion,tremblements], SF5);

declenchementSF5 = min(irr5, [], 2);
nbruleSF5 = length(SF5.rule); % Nombre de regles
nbCsqSF5 = length(SF5.output.mf); % Nombre de classes de sortie
csqSF5 = zeros(1,nbCsqSF5);
for i = 1:nbruleSF5,
 csqSF5(SF5.rule(i).consequent) = max(csqSF5(SF5.rule(i).consequent),...
 declenchementSF5(i));
end;
% Affichage de la consequence finale de SF5
% Concatenation de texte
CsqSF5Txt = 'Consequence SF5 = {';
for i = 1:nbCsqSF5,
 CsqSF5Txt = [CsqSF5Txt, '(', SF5.output.mf(i).name, ';',...
 num2str(csqSF5(i)), '), '];
end;
CsqSF5Txt = [CsqSF5Txt(1:end-2), '}'];
disp(CsqSF5Txt);
