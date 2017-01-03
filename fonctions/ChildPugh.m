% Score CHILD-Pugh (cirrhose)

function []= ChildPugh(encephalopathie,ascite,bilirubineTot, albumine, prothrombine)
score = 0;
score5=14;
classe = '';

%encephalopathie = 'coma' 
switch encephalopathie
    case 'abscente'
        score = 1;
        disp('score =');
        disp(score);
    case {'asterixis','confusion'} 
        score = 2;
        disp('score =');
        disp(score);
    case 'coma'
        score = 3;
        disp('score =');
        disp(score);
    otherwise
        disp('Les seules entrees valides sont : abscente, asterixis/confusion ou coma')

end

% ascite
%ascite = 'abondante'

switch ascite
    case 'absente'
        score2 = score + 1;
        disp('score =');
        disp(score2);
    case 'minime'
        score2 = score + 2;
        disp('score =');
        disp(score2);
    case 'abondante'
        score2 = score + 3;
        disp('score =');
        disp(score2);
end

%bilirubineTot = 0

if bilirubineTot < 35
        score3 = score2 + 1;
        disp('score =');
        disp(score3);
elseif (bilirubineTot >= 35 && bilirubineTot <= 50)
        score3 = score2 + 2;
        disp('score =');
        disp(score3)
elseif bilirubineTot > 50
        score3 = score2 + 3;
        disp('score =');
        disp(score3);
end

%albumine = 0

if albumine>35
        score4 = score3+1;
        disp('score =');
        disp(score4);
elseif (albumine>=28 && albumine<=35)
        score4 =score3 + 2;
        disp('score =');
        disp(score4);
elseif albumine<28
        score4 = score3 + 3;
        disp('score =');
        disp(score4);
end

%prothrombine = 0

if prothrombine > 50
        score5 = score4 + 1;
        disp('score =');
        disp(score5);
elseif (prothrombine >= 40 && prothrombine <= 50)
        score5 = score4 + 2;
        disp('score =');
        disp(score5);
elseif prothrombine < 40
        score5 = score4 + 3;
        disp('score =');
        disp(score5);
  
end

score = score5;

disp('Le score de ChildPugh est')
    if score5 == 5 || score5 == 6
        disp('Classe A')
    elseif score5 == 7 || score5 == 8 || score5 == 9
        disp('Classe B')
    elseif score5 == 10 || score5 ==11 || score5 ==12 || score5 ==13 ||score5 ==14 || score5 ==15
        disp('Classe C')
    end

end

