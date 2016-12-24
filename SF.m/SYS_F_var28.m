irr_var28 = [];
SF_var28 = readfis([current_dir '\fis\SF_var28.fis']);
[sortie, irr_var28, orr, arr] = evalfis([nodule], SF_var28);
declenchementSF_var28 = min(irr_var28, [], 2);
nbruleSF_var28 = length(SF_var28.rule); % Nombre de regles
nbCsqSF_var28 = length(SF_var28.output.mf); % Nombre de classes de sortie
csqSF_var28 = zeros(1,nbCsqSF_var28);
for i = 1:nbruleSF_var28,
 csqSF_var28(SF_var28.rule(i).consequent) = max(csqSF_var28(SF_var28.rule(i).consequent),...
 declenchementSF_var28(i));
end;
% Affichage de la consequence finale de SF_var28
% Concatenation de texte
CsqSF_var28Txt = 'Consequence SF_var28 = {';
for i = 1:nbCsqSF_var28,
 CsqSF_var28Txt = [CsqSF_var28Txt, '(', SF_var28.output.mf(i).name, ';',...
 num2str(csqSF_var28(i)), '), '];
end;
CsqSF_var28Txt = [CsqSF_var28Txt(1:end-2), '}'];
disp(CsqSF_var28Txt);