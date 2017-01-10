%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d inference floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
addpath ('SF.m');
addpath ('fonctions');

name='Blanquette';

%% Entree des valeurs : 

%SF1
Sexe=1; % femme
Age = 43;% Jeune et Moins jeune
IDH = 0.65; % Cap-Vert

%SF2 
IMC = IMC_func(1.6,87); % IMC de 33.9844 donc 
stress = 5; % stress moyen
diabete = 0; % pas de diabete

%SF3
duree = 0; % pas de consommation sur le long terme 
alcool = 3 ; % consommation moderee d alcool
substance = 4; % prise de substances moderee

%SF4
hepathopatie= 0.5; % pas de cirrhose/ d hepatopathie chronique
temps= 0; % courte duree
hemochromatose= 0; % non hematochromatose homozygote

%SF5
confusion = 5; % moderee
tremblements= 5; % moderes

%SF6
douleur = 5; % moderee
regularite = 5; % masse reguliere
durete = 5; % masse moyennement dure

%SF7
selles= 5; % peu grises
urine = 5; % couleur normale

%SF8
nausees= 5; % moderees
amaigrissement= 6; % peu soudain

%SF9
anemie= 5; % signes anemiques moyens
hemorragie= 4.5; % hemorragie liee au foie moyenne 

%SF10
buddchiari= 5; % signes lies au syndrome de Budd-Chiari moyennement pesents
paraneoplasique= 5; % signes paraneoplasiques moyennement pesents

%SF_var27 pour SF12
deficience_alpha= 0; % pas de deficience en alpha 1 antitripsine

%SFCLIP pour SF13

%Classe Child-Pugh
encephalopathie='absente';
ascite='minime';
bilirubineTot=40;
albumine=30;
prothrombine=45;
classe=ChildPugh(encephalopathie,ascite,bilirubineTot, albumine, prothrombine); % classe B

Tumeur ='multinodulaire';
Extension =50;
AFP=399;
Thrombose= 0; % non
CLIP=CLIP_func(classe,'multinodulaire',50,399,0); % 2
CLIP = CLIP_func(classe,Tumeur,Extension,AFP,Thrombose); % 2

%SFVHBC pour SF17
VHBC=0; % pas de virus hepatite B chronique
nodule=0; % TX tumeur non identifiable

%SF_var29 pour SF19
antecedent = 0; % pas d antecedents


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
%fprintf('\nLe diagnostic du patient %s est :\n', name);
SYS_F19;

fprintf('\nLe diagnostic du patient %s est %s avec un degre %f.\n', name, csq_final, deg_max);


