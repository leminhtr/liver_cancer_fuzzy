irr15 = [];
SF15 = readfis([current_dir '\fis\SF15.fis']);
nbruleSF15 = length(SF15.rule); % Nombre de regles
nbCsqSF15 = length(SF15.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF15, % Boucle sur les regles
 irr15(i,1) = csqSF9(SF15.rule(i).antecedent(1));
 irr15(i,2) = csqSF10(SF15.rule(i).antecedent(2));
 irr15(i,3) = csqSF14(SF15.rule(i).antecedent(3));
end;
declenchementSF15 = min(irr15, [], 2); 
csqSF15 = zeros(1,nbCsqSF15);
for i = 1:nbruleSF15,
 csqSF15(SF15.rule(i).consequent) = max(csqSF15(SF15.rule(i).consequent),...
 declenchementSF15(i));
end;

CsqSF15Txt = 'Consequence SF15 = {';
for i = 1:nbCsqSF15,
 CsqSF15Txt = [CsqSF15Txt, '(', SF15.output.mf(i).name, ';',...
 num2str(csqSF15(i)), '), '];
end;
CsqSF15Txt = [CsqSF15Txt(1:end-2), '}'];
disp(CsqSF15Txt);