% Initialisation des variables
irr11 = [];

%% Initialisation des systèmes flous
SF11 = readfis([current_dir '\fis\SF11.fis']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Inférence floue symbolique SF11
% les variables d'entrée étant des e.f.d. (csqSF1 et csqSF2), il n'y a
% pas de phase de fuzzification. Il est inutile d'utiliser evalfis
% pour obtenir l'irr, il faut donc créer l'irr à la main :
nbruleSF11 = length(SF11.rule); % Nombre de règles
nbCsqSF11 = length(SF11.output.mf); % Nombre de classes de sortie
for i = 1:nbruleSF11, % Boucle sur les règles
irr11(i,1) = csqSF1(SF11.rule(i).antecedent(1));
irr11(i,2) = csqSF2(SF11.rule(i).antecedent(2));

end;
%% Avec l'irr créé nous pouvons effectuer les mêmes calculs que précédemment
declenchementSF11 = min(irr11, [], 2); % min de chaque ligne
%%%%%%%%%%
%% Conséquence Finale : par max-union de toutes les conséquences floues
%% partielles
% Initialisation de la conséquence finale
csqSF11 = zeros(1,nbCsqSF11);
for i = 1:nbruleSF11,
csqSF11(SF11.rule(i).consequent) = max(csqSF11(SF11.rule(i).consequent),...
declenchementSF11(i));
end;
% Affichage de la conséquence finale de SF11
% Concaténation de texte
CsqSF11Txt = 'Conséquence SF11 = {';
for i = 1:nbCsqSF11,
CsqSF11Txt = [CsqSF11Txt, '(', SF11.output.mf(i).name, ';',...
num2str(csqSF11(i)), '), '];
end;
CsqSF11Txt = [CsqSF11Txt(1:end-2), '}'];
disp(CsqSF11Txt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%