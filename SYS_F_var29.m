irr_var29 = [];
SF_var29 = readfis([current_dir '\fis\SF_var29.fis']);
[sortie, irr_var29, orr, arr] = evalfis([antecedent], SF_var29);
declenchementSF_var29 = min(irr_var29, [], 2);
nbruleSF_var29 = length(SF_var29.rule); % Nombre de regles
nbCsqSF_var29 = length(SF_var29.output.mf); % Nombre de classes de sortie
csqSF_var29 = zeros(1,nbCsqSF_var29);
for i = 1:nbruleSF_var29,
 csqSF_var29(SF_var29.rule(i).consequent) = max(csqSF_var29(SF_var29.rule(i).consequent),...
 declenchementSF_var29(i));
end;
% Affichage de la consequence finale de SF_var29
% Concatenation de texte
CsqSF_var29Txt = 'Consequence SF_var29 = {';
for i = 1:nbCsqSF_var29,
 CsqSF_var29Txt = [CsqSF_var29Txt, '(', SF_var29.output.mf(i).name, ';',...
 num2str(csqSF_var29(i)), '), '];
end;
CsqSF_var29Txt = [CsqSF_var29Txt(1:end-2), '}'];
disp(CsqSF_var29Txt);