irr16 = [];
SF16 = readfis([current_dir '\fis\SF16.fis']);
nbruleSF16 = length(SF16.rule); % Nombre de regles
nbCsqSF16 = length(SF16.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF16, % Boucle sur les regles
 irr16(i,1) = csqSF13(SF16.rule(i).antecedent(1));
 irr16(i,2) = csqSF15(SF16.rule(i).antecedent(2));

end;

declenchementSF16 = min(irr16, [], 2); 

csqSF16 = zeros(1,nbCsqSF16);
for i = 1:nbruleSF16,
 csqSF16(SF16.rule(i).consequent) = max(csqSF16(SF16.rule(i).consequent),...
 declenchementSF16(i));
end;

CsqSF16Txt = 'Consequence SF16 = {';
for i = 1:nbCsqSF16,
 CsqSF16Txt = [CsqSF16Txt, '(', SF16.output.mf(i).name, ';',...
 num2str(csqSF16(i)), '), '];
end;
CsqSF16Txt = [CsqSF16Txt(1:end-2), '}'];
disp(CsqSF16Txt);