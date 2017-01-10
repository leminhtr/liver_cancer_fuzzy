%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath('SF.m');
addpath('fonctions');


name='Louis Affute';
%% Entree des valeurs : 

%SF1
Sexe=0; % homme
Age = 65;	% moins jeune
IDH = 0.727; % pays developpe

%SF2 
poids=81;	 % kg
taille=1.80; % m

IMC = IMC_func(taille,poids); % =25 normal, surpoids
stress = 8; % stress important
diabete = 0; % pas diabete

%SF3
duree = 1; % long terme
alcool = 8 ; % importante
substance = 5; % moderee

%SF4
hepathopatie= 0; % cirrhose alcoolique
temps= 10; % longue duree
hemochromatose= 0; % non 

%SF5
confusion = 5; % moderee
tremblements= 6; % moderee

%SF6
douleur = 9; % forte
regularite = 8; % irreguliere
durete = 7; % tres dur

%SF7
selles= 5; % peu gris
urine = 8; % foncee

%SF8
nausees= 7; % forte
amaigrissement= 4; % peu soudain

%SF9
anemie= 8; % prononces
hemorragie= 4; % moyenne

%SF10
buddchiari= 8; % tres present
paraneoplasique= 5; % moyennement present

%SF_var27 pour SF12
deficience_alpha= 0; % non

%SFCLIP pour SF13
CLIP=2;

%% SFCLIP pour SF13

% Score ChildPugh
encephalopathie='absente';
ascite='minime';
bilirubineTot=20;
albumine=50;
prothrombine=55;

ChildPugh_class=ChildPugh(encephalopathie,ascite,bilirubineTot,albumine,prothrombine);
% ='A'

% CLIP
tumeur='multinodulaire';
extension=20;
afp= 619;
thrombose=0;

CLIP=CLIP_func(ChildPugh_class,tumeur,extension,afp,thrombose); % =2

%SFVHBC pour SF17
VHBC=1; % oui
nodule= 0.4; % T1

%SF_var29 pour SF19
antecedent = 1; % oui


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

fprintf('\nLe diagnostic du patient %s est %s avec un degre %f.\n', name, csq_final, deg_max);
