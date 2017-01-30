%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Systeme flou d evaluation du risque de developpement de CHC
				% DIAMPOVESA Sephora , LE Minh Tri
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath ('SF.m');
addpath ('fonctions');

prompt='Quel est le nom du patient ?\n';
name=input(prompt,'s');

%% Entree des valeurs : 

%SF1
Sexe=0; % homme=0, femme=1
Age = 50;
IDH = 0.888; % 0 a 1

%SF2 
poids=57.8;	 % kg
taille=1.70; % m
IMC = IMC_func(taille,poids); % =20, normal [15 40]

stress = 1; % 0 a 10
diabete = 0; % 0 ou 1

%SF3
duree = 1; % 0= pas long terme ou 1= long terme
alcool = 0.5 ; % 0 a 10
substance = 9; % 0 a 10

%SF4
hepathopatie= 0; % cirrhose-alcoolique=0 ; cirrhose-hepatique-B=0.25; cirrhose-hepatique-C=0.75 ; NASH=1; pas-cirrhose= 0.5
temps= 10; % 0 a 10
hemochromatose= 0; % 0= non ou 1 = oui

%SF5
confusion = 1.2; % 0 a 10
tremblements= 0; % 0 a 10

%SF6
douleur = 7.1; % 0 a 10
regularite = 6.7; % 0 a 10
durete = 5.4; % 0 a 10

%SF7
selles= 8.1; % 0 a 10
urine = 9.9; % 0 a 10

%SF8
nausees= 3.5; % 0 a 10
amaigrissement= 3.3; % 0 a 15

%SF9
anemie= 6.6; % 0 a 10
hemorragie= 0; % 0 a 10

%SF10
buddchiari= 8.7; % 0 a 10
paraneoplasique= 0; % 0 a 10

%SF_var27 pour SF12
deficience_alpha= 0; %0 = non ou 1= oui

%SFCLIP pour SF13

%Classe Child-Pugh
%encephalopathie='absente', 'asterixis','confusion', 'coma'
%ascite = 'absente','minime','abondante'
%bilirubineTot < 35, >= 35 & bilirubineTot <= 50, > 50
%albumine >35,>=28 & <=35 ,<28
%prothrombine > 50, >= 40 & <= 50, < 40
classe=ChildPugh('absente','minime',40,30,45); % A,B,C 

%Tumeur = 'uninodulaire', 'multinodulaire','diffuse'
%Extension <= 50 , >50
%AFP= <= 400, >400
%Thrombose= 0 =non, 1 =oui
CLIP=CLIP_func(classe,'multinodulaire',50,399,0); % 0-1-2-3-4-5-6

%SFVHBC pour SF17
VHBC=0; % 0 = non ou 1= oui
nodule= 0.8; % TX=0, T0=0.2, T1=0.4, T2=0.6, T3=0.8, T4=1

%SF_var29 pour SF19
antecedent = 0; % 0=non ou 1=oui


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

% Autres signes lies aux fonctions hepatiques, Caracterisation des risques rares -> Symptome secondaire
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

fprintf('\nLe diagnostic du patient %s est %s au degre %f.\n', name, csq_final, deg_max);


