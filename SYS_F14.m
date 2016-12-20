irr14 = [];
SF14 = readfis([current_dir '\fis\SF14.fis']);
nbruleSF14 = length(SF14.rule); % Nombre de regles
nbCsqSF14 = length(SF14.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF14, % Boucle sur les regles
 irr14(i,1) = csqSF7(SF14.rule(i).antecedent(1));
 irr14(i,2) = csqSF8(SF14.rule(i).antecedent(2));
end;

declenchementSF14 = min(irr14, [], 2); 

csqSF14 = zeros(1,nbCsqSF14);
for i = 1:nbruleSF14,
 csqSF14(SF14.rule(i).consequent) = max(csqSF14(SF14.rule(i).consequent),...
 declenchementSF14(i));
end;

CsqSF14Txt = 'Consequence SF14 = {';
for i = 1:nbCsqSF14,
 CsqSF14Txt = [CsqSF14Txt, '(', SF14.output.mf(i).name, ';',...
 num2str(csqSF14(i)), '), '];
end;
CsqSF14Txt = [CsqSF14Txt(1:end-2), '}'];
disp(CsqSF14Txt);