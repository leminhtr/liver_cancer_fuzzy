irr9 = [];
SF9 = readfis([current_dir '\fis\SF9.fis']);
[sortie, irr9, orr, arr] = evalfis([anemie,hemorragie], SF9);
declenchementSF9 = min(irr9, [], 2);
nbruleSF9 = length(SF9.rule); % Nombre de regles
nbCsqSF9 = length(SF9.output.mf); % Nombre de classes de sortie
csqSF9 = zeros(1,nbCsqSF9);
for i = 1:nbruleSF9,
 csqSF9(SF9.rule(i).consequent) = max(csqSF9(SF9.rule(i).consequent),...
 declenchementSF9(i));
end;
% Affichage de la consequence finale de SF9
% Concatenation de texte
CsqSF9Txt = 'Consequence SF9 = {';
for i = 1:nbCsqSF9,
 CsqSF9Txt = [CsqSF9Txt, '(', SF9.output.mf(i).name, ';',...
 num2str(csqSF9(i)), '), '];
end;
CsqSF9Txt = [CsqSF9Txt(1:end-2), '}'];
disp(CsqSF9Txt);
