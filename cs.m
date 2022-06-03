function [c, s] = cs(x)
% _________________________________________________________________________
%
% Autor: Anatolii Radionov
%
% [c, s] = cs(x)
%
% Funkcja oblicza odpowiednie elementy macierzy obrotu Givensa dla  
% wektora x.
% ____________________
% Argumenty wejściowe:
%       
%         x - dwuelementowy wektor.
% ____________________
% Argumenty wyjściowe:
%
%      c, s - odpowiednie elementy macierzy obrotu Givensa.
% _________________________________________________________________________

if x(1) ~= 0
    n = norm(x);
    c = abs(x(1)) / n;
    s = - ( x(1) / abs(x(1)) ) * ( conj(x(2)) / n);
    % b = ( x(1) / abs(x(1)) ) * n;
else 
    c = 0;
    s = - conj(x(2)) / abs(x(2));
    % b = abs(x(2));
end

end
