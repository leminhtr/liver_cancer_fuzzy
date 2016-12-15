%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d'inférence floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des variables
irr1 = [];
irr2 = [];
irr11 = [];
current_dir= pwd;
%% Initialisation des systèmes flous
SF1 = readfis([current_dir '\fis\SF1.fis']);
SF2 = readfis('C:\Users\MinhTri\liver_cancer_fuzzy\fis\SF2.fis');
SF11 = readfis('C:\Users\MinhTri\liver_cancer_fuzzy\fis\SF11.fis');

%% On récupère les données en entrée en utilisant la fonction inputdlg
prompt = {'Sexe : ',...5
'Age :',...
'IDH :',...
'IMC :',...
'stress :',...
'diabete : '};
%% Valeurs par défaut, titre…
def = {'1','30','0.7','23','2','0'};
dlgTitle = 'Exemple d’inférence floue symbolique';
lineNo = 1;
answer = inputdlg(prompt,dlgTitle,lineNo,def);
% si on a cliqué sur cancel answer est vide, il faut donc sortir du
% programme

if isempty(answer),
disp('Action annulée');
return;
end;
% Answer étant un tableau de caractères, on convertit chaque ligne en
% valeur numérique (fonction str2num)
Sexe = str2num(answer{1});
Age = str2num(answer{2});
IDH = str2num(answer{3});
IMC = str2num(answer{4});
stress = str2num(answer{5});
diabete = str2num(answer{6});

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