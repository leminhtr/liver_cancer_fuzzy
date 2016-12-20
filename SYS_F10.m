irr10 = [];
SF10 = readfis([current_dir '\fis\SF10.fis']);
[sortie, irr10, orr, arr] = evalfis([buddchiari,paraneoplasique], SF10);
declenchementSF10 = min(irr10, [], 2);
nbruleSF10 = length(SF10.rule); % Nombre de regles
nbCsqSF10 = length(SF10.output.mf); % Nombre de classes de sortie
csqSF10 = zeros(1,nbCsqSF10);
for i = 1:nbruleSF10,
 csqSF10(SF10.rule(i).consequent) = max(csqSF10(SF10.rule(i).consequent),...
 declenchementSF10(i));
end;
% Affichage de la consequence finale de SF10
% Concatenation de texte
CsqSF10Txt = 'Consequence SF10 = {';
for i = 1:nbCsqSF10,
 CsqSF10Txt = [CsqSF10Txt, '(', SF10.output.mf(i).name, ';',...
 num2str(csqSF10(i)), '), '];
end;
CsqSF10Txt = [CsqSF10Txt(1:end-2), '}'];
disp(CsqSF10Txt);