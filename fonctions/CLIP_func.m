% CLIP

function [x]=CLIP2(childPugh,Tumeur,Extension,AFP,Thrombose)

if childPugh == 'A'
    x=0;
elseif childPugh == 'B'
    x=1;
elseif childPugh == 'C'
    x=2;
else 
    disp('Entrez une classe valide: A, B ou C')
end

if (strcmp(Tumeur,'uninodulaire') && Extension <= 50)
elseif (strcmp(Tumeur,'multinodulaire') && Extension <= 50)
    x = x+1;
elseif (strcmp(Tumeur,'diffuse') && Extension > 50)
    x = x+2;
else 
    disp('Cette entree n est pas valide: entrez tumeur = uninodulaire, multinodulaire ou diffuse')
end

if AFP < 400
elseif AFP >= 400
    x= x+1 ;
end

if Thrombose == 0 % thrombose portale = non
elseif Thrombose == 1
    x = x+1;
end

fprintf('Le score du CLIP est : %d.\n', x);

end

    
    
