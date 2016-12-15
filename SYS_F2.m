% Initialisation des variables
irr2 = [];

%% Initialisation des systèmes flous
SF2 = readfis([current_dir '\fis\SF2.fis']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Inférence floue symbolique SF2
%%%% même chose que précédemment
% On utilise EvalFis
[sortie, irr2, orr, arr] = evalfis([IMC, stress, diabete], SF2);
%% On utilise le irr de evalfis : matrice où chaque ligne correspond
%% à une règle, les colonnes représentant leurs prémisses
% Le ET étant modélisé par un min on calcul le degré de déclenchement de
% chaque règle
declenchementSF2 = min(irr2, [], 2); % min de chaque ligne
%%%%%%%%%%
%% Conséquence Finale : par max-union de toutes les conséquences floues
%% partielles
% Initialisation de la conséquence finale
nbruleSF2 = length(SF2.rule); % Nombre de règles
nbCsqSF2 = length(SF2.output.mf); % Nombre de classes de sortie
csqSF2 = zeros(1,nbCsqSF2);

for i = 1:nbruleSF2,
csqSF2(SF2.rule(i).consequent) = max(csqSF2(SF2.rule(i).consequent),...
declenchementSF2(i));
end;
% Affichage de la conséquence finale de SF2
% Concaténation de texte
CsqSF2Txt = 'Conséquence SF2 = {';
for i = 1:nbCsqSF2,
CsqSF2Txt = [CsqSF2Txt, '(', SF2.output.mf(i).name, ';',...
num2str(csqSF2(i)), '), '];
end;
CsqSF2Txt = [CsqSF2Txt(1:end-2), '}'];
disp(CsqSF2Txt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%