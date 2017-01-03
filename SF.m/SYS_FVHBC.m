irrVHBC = [];
SFVHBC = readfis([current_dir '\fis\SFVHBC.fis']);
[sortie, irrVHBC, orr, arr] = evalfis([VHBC], SFVHBC);
declenchementSFVHBC = min(irrVHBC, [], 2);
nbruleSFVHBC = length(SFVHBC.rule); % Nombre de regles
nbCsqSFVHBC = length(SFVHBC.output.mf); % Nombre de classes de sortie
csqSFVHBC = zeros(1,nbCsqSFVHBC);
for i = 1:nbruleSFVHBC,
 csqSFVHBC(SFVHBC.rule(i).consequent) = max(csqSFVHBC(SFVHBC.rule(i).consequent),...
 declenchementSFVHBC(i));
end;
% Affichage de la consequence finale de SFVHBC
% Concatenation de texte
CsqSFVHBCTxt = 'Consequence SFVHBC = {';
for i = 1:nbCsqSFVHBC,
 CsqSFVHBCTxt = [CsqSFVHBCTxt, '(', SFVHBC.output.mf(i).name, ';',...
 num2str(csqSFVHBC(i)), '), '];
end;
CsqSFVHBCTxt = [CsqSFVHBCTxt(1:end-2), '}'];
disp(CsqSFVHBCTxt);
