irr19 = [];
SF19 = readfis([current_dir '\fis\SF19.fis']);
nbruleSF19 = length(SF19.rule); % Nombre de regles
nbCsqSF19 = length(SF19.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF19, % Boucle sur les regles
 irr19(i,1) = csqSF11(SF19.rule(i).antecedent(1));
 irr19(i,2) = csqSF18(SF19.rule(i).antecedent(2));
 irr19(i,3) = csqSF_var29(SF19.rule(i).antecedent(3));

end;

declenchementSF19 = min(irr19, [], 2); 

csqSF19 = zeros(1,nbCsqSF19);
for i = 1:nbruleSF19,
 csqSF19(SF19.rule(i).consequent) = max(csqSF19(SF19.rule(i).consequent),...
 declenchementSF19(i));
end;

CsqSF19Txt = 'Consequence SF19 = {';
for i = 1:nbCsqSF19,
 CsqSF19Txt = [CsqSF19Txt, '(', SF19.output.mf(i).name, ';',...
 num2str(csqSF19(i)), '), '];
end;
CsqSF19Txt = [CsqSF19Txt(1:end-2), '}'];
disp(CsqSF19Txt);