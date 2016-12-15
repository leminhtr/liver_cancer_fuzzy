% Initialisation des variables
irr1 = [];

%% Initialisation des systemes flous
SF1 = readfis([current_dir '\fis\SF1.fis']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Inference floue symbolique SF1
% On utilise EvalFis
[sortie, irr1, orr, arr] = evalfis([Sexe, Age, IDH], SF1);
%% On utilise le irr de evalfis : matrice ou chaque ligne correspond
%% a une regle, les colonnes representant leurs premisses
% Le ET etant modelise par un min on calcul le degre de declenchement de
% chaque regle
declenchementSF1 = min(irr1, [], 2); % min de chaque ligne
%%%%%%%%%%
%% Consequence Finale : par max-union de toutes les consequences floues
%% partielles
% Initialisation de la consequence finale
nbruleSF1 = length(SF1.rule); % Nombre de regles
nbCsqSF1 = length(SF1.output.mf); % Nombre de classes de sortie
csqSF1 = zeros(1,nbCsqSF1);
for i = 1:nbruleSF1,
csqSF1(SF1.rule(i).consequent) = max(csqSF1(SF1.rule(i).consequent),...
declenchementSF1(i));
end;
% Affichage de la consequence finale de SF1
% Concatenation de texte
CsqSF1Txt = 'Consequence SF1 = {';
for i = 1:nbCsqSF1,
CsqSF1Txt = [CsqSF1Txt, '(', SF1.output.mf(i).name, ';',...
num2str(csqSF1(i)), '), '];
end;
CsqSF1Txt = [CsqSF1Txt(1:end-2), '}'];
disp(CsqSF1Txt);
