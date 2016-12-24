% Initialisation des variables
irr2 = [];

%% Initialisation des systemes flous
SF2 = readfis([current_dir '\fis\SF2.fis']);

[sortie, irr2, orr, arr] = evalfis([IMC, stress, diabete], SF2);
%% On utilise le irr de evalfis : matrice où chaque ligne correspond
%% a une regle, les colonnes representant leurs premisses
% Le ET etant modelise par un min on calcul le degre de declenchement de
% chaque regle

declenchementSF2 = min(irr2, [], 2); % min de chaque ligne

%%%%%%%%%%
%% Consequence Finale : par max-union de toutes les consequences floues
%% partielles
% Initialisation de la consequence finale

nbruleSF2 = length(SF2.rule); % Nombre de regles
nbCsqSF2 = length(SF2.output.mf); % Nombre de classes de sortie
csqSF2 = zeros(1,nbCsqSF2);

for i = 1:nbruleSF2,
csqSF2(SF2.rule(i).consequent) = max(csqSF2(SF2.rule(i).consequent),...
declenchementSF2(i));
end;

% Affichage de la consequence finale de SF2
% Concatenation de texte
CsqSF2Txt = 'Consequence SF2 = {';
for i = 1:nbCsqSF2,
CsqSF2Txt = [CsqSF2Txt, '(', SF2.output.mf(i).name, ';',...
num2str(csqSF2(i)), '), '];
end;
CsqSF2Txt = [CsqSF2Txt(1:end-2), '}'];
disp(CsqSF2Txt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%