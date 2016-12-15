%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemple d'inférence floue symbolique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialisation des variables

%Path
current_dir= pwd;
%addpath(genpath(pwd))
%savepath matlab/myfiles/pathdef.m

%% On récupère les données en entrée en utilisant la fonction inputdlg
prompt = {'Sexe : ',...
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

%% Chargement des SFi.m

SYS_F1;
SYS_F2;
SYS_F11;


















