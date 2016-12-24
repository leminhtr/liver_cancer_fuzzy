irrCLIP = [];
SFCLIP = readfis([current_dir '\fis\SFCLIP.fis']);
[sortie, irrCLIP, orr, arr] = evalfis([CLIP], SFCLIP);
declenchementSFCLIP = min(irrCLIP, [], 2);
nbruleSFCLIP = length(SFCLIP.rule); % Nombre de regles
nbCsqSFCLIP = length(SFCLIP.output.mf); % Nombre de classes de sortie
csqSFCLIP = zeros(1,nbCsqSFCLIP);
for i = 1:nbruleSFCLIP,
 csqSFCLIP(SFCLIP.rule(i).consequent) = max(csqSFCLIP(SFCLIP.rule(i).consequent),...
 declenchementSFCLIP(i));
end;
% Affichage de la consequence finale de SF9
% Concatenation de texte
CsqSFCLIPTxt = 'Consequence SFCLIP = {';
for i = 1:nbCsqSFCLIP,
 CsqSFCLIPTxt = [CsqSFCLIPTxt, '(', SFCLIP.output.mf(i).name, ';',...
 num2str(csqSFCLIP(i)), '), '];
end;
CsqSFCLIPTxt = [CsqSFCLIPTxt(1:end-2), '}'];
disp(CsqSFCLIPTxt);
