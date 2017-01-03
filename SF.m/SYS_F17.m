irr17 = [];
SF17 = readfis([current_dir '\fis\SF17.fis']);
nbruleSF17 = length(SF17.rule); % Nombre de regles
nbCsqSF17 = length(SF17.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF17, % Boucle sur les regles
 irr17(i,1) = csqSFVHBC(SF17.rule(i).antecedent(1));
 irr17(i,2) = csqSF16(SF17.rule(i).antecedent(2));
 irr17(i,3) = csqSF12(SF17.rule(i).antecedent(3));
end;

declenchementSF17 = min(irr17, [], 2); 

csqSF17 = zeros(1,nbCsqSF17);
for i = 1:nbruleSF17,
 csqSF17(SF17.rule(i).consequent) = max(csqSF17(SF17.rule(i).consequent),...
 declenchementSF17(i));
end;

CsqSF17Txt = 'Consequence SF17 = {';
for i = 1:nbCsqSF17,
 CsqSF17Txt = [CsqSF17Txt, '(', SF17.output.mf(i).name, ';',...
 num2str(csqSF17(i)), '), '];
end;
CsqSF17Txt = [CsqSF17Txt(1:end-2), '}'];
disp(CsqSF17Txt);