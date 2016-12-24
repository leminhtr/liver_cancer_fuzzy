irr8 = [];
SF8 = readfis([current_dir '\fis\SF8.fis']);
[sortie, irr8, orr, arr] = evalfis([nausees, amaigrissement], SF8);

declenchementSF8 = min(irr8, [], 2); 

nbruleSF8 = length(SF8.rule); 
nbCsqSF8 = length(SF8.output.mf); 
csqSF8 = zeros(1,nbCsqSF8);
for i = 1:nbruleSF8,
 csqSF8(SF8.rule(i).consequent) = max(csqSF8(SF8.rule(i).consequent),...
 declenchementSF8(i));
end;

CsqSF8Txt = 'Consequence SF8 = {';
for i = 1:nbCsqSF8,
 CsqSF8Txt = [CsqSF8Txt, '(', SF8.output.mf(i).name, ';',...
num2str(csqSF8(i)), '), '];
end;
CsqSF8Txt = [CsqSF8Txt(1:end-2), '}'];
disp(CsqSF8Txt);