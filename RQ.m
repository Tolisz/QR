function [A] = RQ(c, s, R)
% _________________________________________________________________________
%
% Autor: Anatolii Radionov 317266
%
% [A] = RQ(c, s, R)
%
% Funkcja oblicza iloczyn RQ wiedząc rozkład QR.
%
% ____________________
% Argumenty wejściowe:
%
%      c, s - wektory kolejnych elementów macierzy obrotów Givensa.
%         R - macierz trójkątna górna rozkładu QR.
% ____________________
% Argumenty wyjściowe:
%      
%         A - macierz iloczynu RQ.
% _________________________________________________________________________
    
n = size(R, 1) - 1;
for i = 1:n
    R(:, i:i+1) = R(:, i:i+1)*[c(i), s(i); -conj(s(i)), c(i) ];
end
A = R;

end

