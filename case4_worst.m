%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath ('SF.m');
addpath ('fonctions');

name='Karadoc CROC';

%% Entree des valeurs : 

%SF1
Sexe=0; % homme
Age = 70; % Moins-Jeune
IDH = 0.1; % Nigeria

%SF2 
IMC = IMC_func(1.6,90); % 35.1562 donc obesite
stress = 10; % stress-important
diabete = 1; % oui

%SF3
duree = 1; % long terme
alcool = 10 ; % consommation importante d alcool
substance = 10; % prise de substances importante

%SF4
hepathopatie= 0; % cirrhose alcoolique
temps= 10; % longue duree
hemochromatose= 1; % oui 

%SF5
confusion = 10; % importante
tremblements= 10; % importants

%SF6
douleur = 10; % forte
regularite = 10; % irreguliere
durete = 10; % tres dur

%SF7
selles= 10; % gris
urine = 10; % foncee

%SF8
nausees= 10; % fortes
amaigrissement= 15; % soudain

%SF9
anemie= 10; % signes anemiques prononces
hemorragie= 10; % hemorragie interne liee au foie importante

%SF10
buddchiari= 10; % signes lies au syndrome de Budd-Chiari tres prononces
paraneoplasique= 10; % signes paraneoplasiques tres prononces

%SF_var27 pour SF12
deficience_alpha= 1; % oui

%SFCLIP pour SF13
encephalopathie='coma';
ascite='abondante';
bilirubineTot=100;
albumine=0;
prothrombine=0;
classe=ChildPugh(encephalopathie,ascite,bilirubineTot, albumine, prothrombine); % pire des cas : classe C

Tumeur ='diffuse';
Extension =100;
AFP=500;
Thrombose= 1 %oui
CLIP = CLIP_func(classe,Tumeur,Extension,AFP,Thrombose); % 6 : pire des cas

%SFVHBC pour SF17
VHBC=1; % hepatite B chronique oui
nodule=1; % T4=1 : la plus/tres grande taille de nodule

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