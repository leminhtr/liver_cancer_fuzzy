%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;

%% On recupere les donnees en entree en utilisant la fonction inputdlg
prompt = {'Sexe : ',...
'Age :',...
'IDH :',...
'IMC :',...
'stress :',...
'diabete : ',...
'Teinte de gris des selles : ',...
'Couleur urine :',...
'Nausees:',...
'Amaigrissement :'};
%% Valeurs par defaut, titre
def = {'1','30','0.7','23','2','0','4','6','2.9','5'};
dlgTitle = 'Exemple d inference floue symbolique';
lineNo = 1;
answer = inputdlg(prompt,dlgTitle,lineNo,def);
% si on a clique sur cancel answer est vide, il faut donc sortir du
% programme

if isempty(answer),
disp('Action annulee');
return;
end;
% Answer etant un tableau de caracteres, on convertit chaque ligne en
% valeur numerique (fonction str2num)
Sexe = str2num(answer{1});
Age = str2num(answer{2});
IDH = str2num(answer{3});
IMC = str2num(answer{4});
stress = str2num(answer{5});
diabete = str2num(answer{6});

selles= 7.99;
urine = str2num(answer{8});
nausees= str2num(answer{9});
amaigrissement= str2num(answer{10});

alcool = 2 ;
substance = 3;
duree = 0;

hepathopatie = 0 ;
temps = 3.33;
hematochromatose = 1;


%% Chargement des SFi.m

%Acces sante, situation patient -> Etat du patient
SYS_F1;
SYS_F2;
SYS_F11;

%Deficience alpha-1-antitrypsine, Risque associe, Etat cirrhose -> Risques primaires
SYS_F3;
SYS_F4;
%SYS_F12;


% Caracterisation des dechets metaboliques, Manifestation physique du patient -> Manifestations physiologiques du patient
SYS_F7;
SYS_F8;
SYS_F14;



















