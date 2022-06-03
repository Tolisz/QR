function [c, s, R] = QR(H)
% _________________________________________________________________________
%
% Autor: Anatolii Radionov
%
% [c, s, R] = QR(H)
% 
% Funkcja dokonuje rozkładu QR macierzy Hessenberga H korzystając z obrotów
% Givensa.
%
% ____________________
% Argumenty wejściowe:
%
%         H - macierz w postaci Hessenberga o elementach zespolonych.
% ____________________
% Argumenty wyjściowe:
%
%      c, s - wektory kolejnych elementów macierzy obrotów Givensa.
%         R - macierz trójkątna górna rozkładu QR.
% _________________________________________________________________________

n = size(H, 1) - 1;
c = zeros(1, n);
s = zeros(1, n);

for i = 1:n
    [c(i), s(i)] = cs(H(i:i+1, i));
    H(i:i+1, i:end) = [c(i), -s(i); conj(s(i)), c(i)] * H(i:i+1, i:end); 
    H(i+1, i) = 0;
end
R = H;

% Ogólnie to jest nie potrzebne, ale ciekawe. Niestety działa długo.
% Chociaż z drugiej strony było to użyteczne w sprawdzeniu że rozkład
% rzeczywiście działa poprawnie, więc zostawię to jako przykład
% potrzebności niepotrzebnych rzeczy.

% Q = tril(ones(n+1), 1)';
% for i = 1:n
%     Q(1:i+1, i) = Q(1:i+1, i).*c(i);
%     Q(i+1, i) = -conj(s(i));
%     Q(i+1, i+1:end) = Q(i+1, i+1:end).*c(i);
%     Q(1:i, i+1:end) = Q(1:i, i+1:end).*s(i);
% end

end

