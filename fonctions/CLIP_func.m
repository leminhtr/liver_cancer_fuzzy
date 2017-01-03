% CLIP

function []=CLIP2(childPugh,Tumeur,Extension,AFP,Thrombose)
x=0

if childPugh == 'A'
    x=0;
    disp (x)
elseif childPugh == 'B'
    x=1;
    disp(x)
elseif childPugh == 'C'
    x=2;
    disp(x)
else 
    disp('Entrez une classe valide: A, B ou C')
end

if (strcmp(Tumeur,'uninodulaire') && Extension <= 50)
     disp(x)
elseif (strcmp(Tumeur,'multinodulaire') && Extension <= 50)
    x = x+1;
     disp(x)
elseif (strcmp(Tumeur,'diffuse') && Extension > 50)
    x = x+2;
     disp(x)
else 
    disp('Cette entree n est pas valide: entrez tumeur = uninodulaire, multinodulaire ou diffuse')
end

if AFP < 400
     disp(x);
elseif AFP >= 400
    x= x+1 ;
    disp(x);
end

if Thrombose == 0 % thrombose portale = non
    disp(x);
elseif Thrombose == 1
    x = x+1;
    disp(x);
end

x1=x
disp('Les score du CLIP est')
disp (x1)
end

    
    
