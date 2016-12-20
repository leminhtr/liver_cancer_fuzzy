irr12 = [];
SF12 = readfis([current_dir '\fis\SF12.fis']);
nbruleSF12 = length(SF12.rule); % Nombre de regles
nbCsqSF12 = length(SF12.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF12, % Boucle sur les regles
 irr12(i,1) = csqSF3(SF12.rule(i).antecedent(1));
 irr12(i,2) = csqSF4(SF12.rule(i).antecedent(2));

end;

declenchementSF12 = min(irr12, [], 2); 

csqSF12 = zeros(1,nbCsqSF12);
for i = 1:nbruleSF12,
 csqSF12(SF12.rule(i).consequent) = max(csqSF12(SF12.rule(i).consequent),...
 declenchementSF12(i));
end;

CsqSF12Txt = 'Consequence SF12 = {';
for i = 1:nbCsqSF12,
 CsqSF12Txt = [CsqSF12Txt, '(', SF12.output.mf(i).name, ';',...
 num2str(csqSF12(i)), '), '];
end;
CsqSF12Txt = [CsqSF12Txt(1:end-2), '}'];
disp(CsqSF12Txt);