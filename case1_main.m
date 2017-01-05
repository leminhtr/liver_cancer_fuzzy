%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath('SF.m');
addpath('fonctions');

%% Entree des valeurs : 

%SF1
Sexe=0; % homme
Age = 50;	% moins jeune
IDH = 0.888; % pays developpe

%SF2 
poids=71.05;	% kg
taille=1.75;	% m

IMC = IMC_func(taille,poids); % =23 normal
stress = 1; % pas stress
diabete = 0; % pas diabete

%SF3
duree = 1; % 1= long terme
alcool = 0.5 ; % faible
substance = 9; % importante

%SF4
hepathopatie= 0; % cirrhose-alcoolique
temps= 10; % longue duree
hematochromatose= 0; % non

%SF5
confusion = 1.2; % faible
tremblements= 0; % faibles

%SF6
douleur = 7.1; % forte
regularite = 6.7; % irreguliere
durete = 5.4; % moyennement dur

%SF7
selles= 8.1; % grise
urine = 9.9; % foncee

%SF8
nausees= 3.5; % faibles
amaigrissement= 3.3; % pas aimaigrissement ou attendu

%SF9
anemie= 6.6; % prononces
hemorragie= 0; % faible

%SF10
buddchiari= 8.7; % tres present
paraneoplasique= 0; % peu present

%SF_var27 pour SF12
deficience_alpha= 0; % non

%SFCLIP pour SF13

% Score ChildPugh
encephalopathie='coma';
ascite='abondante';
bilirubineTot=42;
albumine=29;
prothrombine=47;

ChildPugh_class=ChildPugh(encephalopathie,ascite,bilirubineTot,albumine,prothrombine);
% ='C'

% CLIP
tumeur='multinodulaire';
extension=20;
afp= 120;
thrombose=1;

CLIP=CLIP_func(ChildPugh_class,tumeur,extension,afp,thrombose); % =4

%SFVHBC pour SF17
VHBC=0; % non 
nodule= 0.8; % T3

%SF_var29 pour SF19
antecedent = 0; % non


%% Chargement des SFi.m
% total : 539 regles

% Acces sante, situation patient -> Etat du patient
SYS_F1;
SYS_F2;
SYS_F11;

% Risque associe, Deficience alpha-1-antitrypsine, Etat cirrhose  -> Risques primaires
SYS_F3;
SYS_F4;

% Signes invisibles, Caracterisation masse detectee, CLIP -> Symptomes primaires
SYS_F5;
SYS_F6;
SYS_FCLIP;
SYS_F13;

% Caracterisation des dechets metaboliques, Manifestation physique du patient -> Manifestations physiologiques du patient
SYS_F7;
SYS_F8;
SYS_F14;

% Autres signes lies aux fonctions hepatiques, Caracterisation des risques rares -> Smptome secondaire
SYS_F9;
SYS_F10;

% SF3,SF4, deficience alpha -> Risques primaires
SYS_F_var27;
SYS_F12;

% SF9, SF14, SF10 -> Symptome secondaire
SYS_F15;

% SF13, SF15 -> Evaluation des symptomes
SYS_F16;

% SF12, SF16, Virus hepatite B -> 1er bilan du foie
SYS_FVHBC;
SYS_F17;

% SF17, taille nodule -> bilan final du foie
SYS_F_var28;
SYS_F18;

% SF11, SF18, antecedent -> Risque CHC
SYS_F_var29;
SYS_F19;

fprintf('\nLe diagnostic du patient est %s avec un degre %f.\n', csq_final, deg_max);
