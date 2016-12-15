irr7 = [];
SF7 = readfis([current_dir '\fis\SF7.fis']);
[sortie, irr7, orr, arr] = evalfis([selles, urine], SF7);
declenchementSF7 = min(irr7, [], 2);
nbruleSF7 = length(SF7.rule); % Nombre de r?gles
nbCsqSF7 = length(SF7.output.mf); % Nombre de classes de sortie
csqSF7 = zeros(1,nbCsqSF7);
for i = 1:nbruleSF7,
 csqSF7(SF7.rule(i).consequent) = max(csqSF7(SF7.rule(i).consequent),...
 declenchementSF7(i));
end;
% Affichage de la cons?quence finale de SF7
% Concat?nation de texte
CsqSF7Txt = 'Consequence SF7 = {';
for i = 1:nbCsqSF7,
 CsqSF7Txt = [CsqSF7Txt, '(', SF7.output.mf(i).name, ';',...
 num2str(csqSF7(i)), '), '];
end;
CsqSF7Txt = [CsqSF7Txt(1:end-2), '}'];
disp(CsqSF7Txt);
