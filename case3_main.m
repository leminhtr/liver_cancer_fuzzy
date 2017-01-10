%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath('SF.m');
addpath('fonctions');

name='Imhotep IMHOTEP';

%% Entree des valeurs : 

%SF1
Sexe=1; % femme=1 (femme moins atteinte par CHC)
Age = 20; % jeune
IDH = 0.944; % Norvege : Pays developpe

%SF2 
poids=57.8;	 % kg
taille=1.70; % m

IMC = IMC_func(taille,poids); % =20, normal
stress = 0; % pas stress
diabete = 0; % pas diabete

%SF3
duree = 0; % pas long terme 
alcool = 0 ; % faible
substance = 0; % faible

%SF4
hepathopatie= 0.5; % pas cirrhose
temps= 0; % courte duree
hemochromatose= 0; % non 

%SF5
confusion = 0; % faible
tremblements= 0; % faibles

%SF6
douleur = 0; % faible
regularite = 0; % pas de masse
durete = 0; % peu dur

%SF7
selles= 0; % pas gris
urine = 0; % claire

%SF8
nausees= 0; % faibles
amaigrissement= 0; % pas amaigrissement ou attendu

%SF9
anemie= 0; % faibles
hemorragie= 0; % faible

%SF10
buddchiari= 0; % peu present
paraneoplasique= 0; % peu present

%SF_var27 pour SF12
deficience_alpha= 0; % non 

%% SFCLIP pour SF13

% Score ChildPugh
encephalopathie='absente';
ascite='absente';
bilirubineTot=10;
albumine=40;
prothrombine=60;

ChildPugh_class=ChildPugh(encephalopathie,ascite,bilirubineTot,albumine,prothrombine);
% ='A'

% CLIP
tumeur='uninodulaire';
extension=0;
afp= 10;
thrombose=0;

CLIP=CLIP_func(ChildPugh_class,tumeur,extension,afp,thrombose); % =0

%SFVHBC pour SF17
VHBC=0; % 0 = non 
nodule= 0; % TX

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

fprintf('\nLe diagnostic du patient %s est %s avec un degre %f.\n', name, csq_final, deg_max);
