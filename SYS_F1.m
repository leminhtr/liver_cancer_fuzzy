% Initialisation des variables
irr1 = [];

%% Initialisation des systèmes flous
SF1 = readfis([current_dir '\fis\SF1.fis']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Inférence floue symbolique SF1
% On utilise EvalFis
[sortie, irr1, orr, arr] = evalfis([Sexe, Age, IDH], SF1);
%% On utilise le irr de evalfis : matrice où chaque ligne correspond
%% à une règle, les colonnes représentant leurs prémisses
% Le ET étant modélisé par un min on calcul le degré de déclenchement de
% chaque règle
declenchementSF1 = min(irr1, [], 2); % min de chaque ligne
%%%%%%%%%%
%% Conséquence Finale : par max-union de toutes les conséquences floues
%% partielles
% Initialisation de la conséquence finale
nbruleSF1 = length(SF1.rule); % Nombre de règles
nbCsqSF1 = length(SF1.output.mf); % Nombre de classes de sortie
csqSF1 = zeros(1,nbCsqSF1);
for i = 1:nbruleSF1,
csqSF1(SF1.rule(i).consequent) = max(csqSF1(SF1.rule(i).consequent),...
declenchementSF1(i));
end;
% Affichage de la conséquence finale de SF1
% Concaténation de texte
CsqSF1Txt = 'Conséquence SF1 = {';
for i = 1:nbCsqSF1,
CsqSF1Txt = [CsqSF1Txt, '(', SF1.output.mf(i).name, ';',...
num2str(csqSF1(i)), '), '];
end;
CsqSF1Txt = [CsqSF1Txt(1:end-2), '}'];
disp(CsqSF1Txt);
