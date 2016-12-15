% Initialisation des variables
irr11 = [];

%% Initialisation des systèmes flous
SF11 = readfis([current_dir '\fis\SF11.fis']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Inference floue symbolique SF11
% les variables d'entree etant des e.f.d. (csqSF1 et csqSF2), il n'y a
% pas de phase de fuzzification. Il est inutile d'utiliser evalfis
% pour obtenir l'irr, il faut donc creer l'irr à la main :

nbruleSF11 = length(SF11.rule); % Nombre de regles
nbCsqSF11 = length(SF11.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF11, % Boucle sur les regles
irr11(i,1) = csqSF1(SF11.rule(i).antecedent(1));
irr11(i,2) = csqSF2(SF11.rule(i).antecedent(2));
end;

%% Avec l'irr cree nous pouvons effectuer les mêmes calculs que precedemment

declenchementSF11 = min(irr11, [], 2); % min de chaque ligne

%%%%%%%%%%
%% Consequence Finale : par max-union de toutes les consequences floues
%% partielles
% Initialisation de la consequence finale

csqSF11 = zeros(1,nbCsqSF11);
for i = 1:nbruleSF11,
csqSF11(SF11.rule(i).consequent) = max(csqSF11(SF11.rule(i).consequent),...
declenchementSF11(i));
end;

% Affichage de la consequence finale de SF11
% Concatenation de texte
CsqSF11Txt = 'Consequence SF11 = {';
for i = 1:nbCsqSF11,
CsqSF11Txt = [CsqSF11Txt, '(', SF11.output.mf(i).name, ';',...
num2str(csqSF11(i)), '), '];
end;
CsqSF11Txt = [CsqSF11Txt(1:end-2), '}'];
disp(CsqSF11Txt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%