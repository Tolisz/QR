function [e] = eigs2(A)
% _________________________________________________________________________
%
% Autor: Anatolii Radionov
%
% [e] = eigs2(A)
%
% Funkcja oblicza wartości własne dla macierzy rozmiaru 2 na 2 korzystając 
% z jawnych wzorów.
%
% ____________________
% Argumenty wejściowe:
% 
%         A - macierz rozmiaru 2 na 2. W przypadku macierzy innego rozmiaru
%             zachowanie i wynik działania funkcji są nie zdefiniowane.
% ____________________
% Argumenty wyjściowe:
%
%         e - poziomy dwuelementowy wektor wartości własnych.
% _________________________________________________________________________

e = NaN(1, 2);

x = (A(1) + A(4)) / 2;
y = sqrt(((A(1) - A(4)) / 2)^2 + A(2)*A(3));

e(1) = x + y;
e(2) = x - y;
end
