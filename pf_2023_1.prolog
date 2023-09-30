/*
* 1.Criar um predicado em prolog $multi(L1,L2)$ 
* que receba uma lista $L1$ de inteiros e retorne uma lista $L2$ com a quantidade desses números repetida de acordo com o seu valor:
*/

multi([H|T], L2):-
    repete(H, L2),
    multi(T, L2).


repete(0, _).

repete(K, L2):-
    Y is K - 1,
    append(Y, L2, L3),
    repete(Y, L3).

% Caso base: a lista vazia resulta em outra lista vazia.
multi([], []).

% Predicado auxiliar para criar uma lista com N cópias do elemento X.
repete(X, N, L) :- repete(X, N, [], L).

repete(_, 0, L, L).  % Quando N chega a 0, paramos a recursão.
repete(X, N, Acc, L) :-
    N > 0,
    N1 is N - 1,
    repete(X, N1, [X|Acc], L).

% Predicado principal para processar a lista.
multi([H|T], L2) :-
    repete(H, H, Reps),  % Chamamos o predicado auxiliar para criar uma lista com H cópias de H.
    multi(T, Resto),    % Chamamos a recursão para o restante da lista.
    append(Reps, Resto, L2).
