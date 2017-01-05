% Score CHILD-Pugh (cirrhose)

function [classe]= ChildPugh(encephalopathie,ascite,bilirubineTot, albumine, prothrombine)

switch encephalopathie
    case 'absente'
        score = 1;
    case {'asterixis','confusion'} 
        score = 2;
    case 'coma'
        score = 3;
    otherwise
        disp('Les seules entrees valides sont : absente, asterixis/confusion ou coma')

end

% ascite

switch ascite
    case 'absente'
        score = score + 1;
    case 'minime'
        score = score + 2;
    case 'abondante'
        score = score + 3;
end

if bilirubineTot < 35
        score = score + 1;
elseif (bilirubineTot >= 35 && bilirubineTot <= 50)
        score = score + 2;
elseif bilirubineTot > 50
        score = score + 3;
end

if albumine>35
        score = score+1;
elseif (albumine>=28 && albumine<=35)
        score =score + 2;
elseif albumine<28
        score = score + 3;
end

if prothrombine > 50
        score = score + 1;
elseif (prothrombine >= 40 && prothrombine <= 50)
        score = score + 2;
elseif prothrombine < 40
        score = score + 3;
  
end


    if score == 5 || score == 6
        classe='A';
    elseif score == 7 || score == 8 || score == 9
        classe='B';
    elseif score == 10 || score ==11 || score ==12 || score ==13 ||score ==14 || score ==15
        classe='C';
    end

fprintf('\nLa classe de ChildPugh est de classe %s.\n', classe);

end

