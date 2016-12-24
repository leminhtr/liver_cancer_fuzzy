irr_var27 = [];
SF_var27 = readfis([current_dir '\fis\SF_var27.fis']);
[sortie, irr_var27, orr, arr] = evalfis([deficience_alpha], SF_var27);
declenchementSF_var27 = min(irr_var27, [], 2);
nbruleSF_var27 = length(SF_var27.rule); % Nombre de regles
nbCsqSF_var27 = length(SF_var27.output.mf); % Nombre de classes de sortie
csqSF_var27 = zeros(1,nbCsqSF_var27);
for i = 1:nbruleSF_var27,
 csqSF_var27(SF_var27.rule(i).consequent) = max(csqSF_var27(SF_var27.rule(i).consequent),...
 declenchementSF_var27(i));
end;
% Affichage de la consequence finale de SF_var27
% Concatenation de texte
CsqSF_var27Txt = 'Consequence SF_var27 = {';
for i = 1:nbCsqSF_var27,
 CsqSF_var27Txt = [CsqSF_var27Txt, '(', SF_var27.output.mf(i).name, ';',...
 num2str(csqSF_var27(i)), '), '];
end;
CsqSF_var27Txt = [CsqSF_var27Txt(1:end-2), '}'];
disp(CsqSF_var27Txt);