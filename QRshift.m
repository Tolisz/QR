function [eigs, success] = QRshift(H, tol)
% _________________________________________________________________________
%
% Autor: Anatolii Radionov
%
% [eigs, success] = QRshift(H, tol)
%
% Funkcja oblicza wszystkie wartości własne macierzy Hessenberga H wymiaru
% n o elementach zespolonych korzystając z metody QR z przesunięciem.
%               
% ____________________
% Argumenty wejściowe:
% 
%         H - macierz w postaci Hessenberga o elementach zespolonych.
%             W przypadku macierzy innej postaci zachowanie i wynik 
%             funkcji są niezdefiniowane.
%       tol - tolerancja na błąd przybliżenia.
% ____________________
% Argumenty wyjściowe:
%
%      eigs - poziomy wektor wszystkich wartości własnych długości n. 
%             Wielokrotne wartości własne H (jeśli istnieją) zostaną 
%             odpowiednio powtórzone w wynikowym wektorze.
%   success - liczba nie znalezionych wartości własnych. Jeśli jest różna 
%             od zera to znalezione wartości własne znajdują się na końcu
%             wektora eigs, a pozostałe wartości mają wartośc NaN.
% _________________________________________________________________________

n = size(H, 1);
eigs = NaN(n, 1);

% T - maksymalny czas spewnienia co najmniej jednego warunku na znalezienie
%     wartości własnych.
T = 1;
t = tic;

% i - licznik nie znalezionych wartości własnych. 
i = n;
while true
    
    % Przypadki dla macierzy 1x1 i 2x2 
    if (size(H, 1) == 1)
        eigs(1) = H(1);
        i = i - 1;
        break;  
    elseif (size(H, 2) == 2)
        eigs(1:2) = eigs2(H);
        i = i - 2;
        break;
    end
    
    % Jedna iteracja metody QR z przesunięciem
    z = H(end);
    
    if (mod(abs(H(end, end)), 1) == 0 || ... 
        mod(abs(H(end-1, end-1) - z), 1) == 0)
        z = -tol;
    end
    
    [c, s, R] = QR(H - z*eye(size(H, 1)));
    H = RQ(c, s, R) + z*eye(size(H,1));
    % Sprawdzenie dwóch warunków na znalezienie wartości własnej oraz
    % warunku zakończenia czasu na obliczenia.
    if abs(H(end, end-1)) < tol
        eigs(i) = H(end, end);
        i = i - 1;
        H = H(1:end-1, 1:end-1);
        t = tic;
    elseif abs(H(end - 1, end - 2)) < tol
        eigs(i-1:i) = eigs2(H(end-1:end, end-1:end));
        i = i - 2;
        H = H(1:end-2, 1:end-2);
        t = tic;
    elseif T < toc(t)
        break;
    end
    
end

success = i;

end