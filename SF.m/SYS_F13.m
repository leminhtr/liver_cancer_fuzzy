irr13 = [];
SF13 = readfis([current_dir '\fis\SF13.fis']);
nbruleSF13 = length(SF13.rule); % Nombre de regles
nbCsqSF13 = length(SF13.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF13, % Boucle sur les regles
 irr13(i,1) = csqSF5(SF13.rule(i).antecedent(1));
 irr13(i,2) = csqSF6(SF13.rule(i).antecedent(2));
 irr13(i,3) = csqSFCLIP(SF13.rule(i).antecedent(3));
 
end;
% rajouter variable CLIP

declenchementSF13 = min(irr13, [], 2); 

csqSF13 = zeros(1,nbCsqSF13);
for i = 1:nbruleSF13,
 csqSF13(SF13.rule(i).consequent) = max(csqSF13(SF13.rule(i).consequent),...
 declenchementSF13(i));
end;

CsqSF13Txt = 'Consequence SF13 = {';
for i = 1:nbCsqSF13,
 CsqSF13Txt = [CsqSF13Txt, '(', SF13.output.mf(i).name, ';',...
 num2str(csqSF13(i)), '), '];
end;
CsqSF13Txt = [CsqSF13Txt(1:end-2), '}'];
disp(CsqSF13Txt);