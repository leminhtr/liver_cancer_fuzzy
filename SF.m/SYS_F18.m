irr18 = [];
SF18 = readfis([current_dir '\fis\SF18.fis']);
nbruleSF18 = length(SF18.rule); % Nombre de regles
nbCsqSF18 = length(SF18.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF18, % Boucle sur les regles
 irr18(i,1) = csqSF_var28(SF18.rule(i).antecedent(1));
 irr18(i,2) = csqSF17(SF18.rule(i).antecedent(2));

end;

declenchementSF18 = min(irr18, [], 2); 

csqSF18 = zeros(1,nbCsqSF18);
for i = 1:nbruleSF18,
 csqSF18(SF18.rule(i).consequent) = max(csqSF18(SF18.rule(i).consequent),...
 declenchementSF18(i));
end;

CsqSF18Txt = 'Consequence SF18 = {';
for i = 1:nbCsqSF18,
 CsqSF18Txt = [CsqSF18Txt, '(', SF18.output.mf(i).name, ';',...
 num2str(csqSF18(i)), '), '];
end;
CsqSF18Txt = [CsqSF18Txt(1:end-2), '}'];
disp(CsqSF18Txt);