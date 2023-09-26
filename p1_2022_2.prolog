/*
*1. Faça em prolog a função maiorsoma que, dadas duas listas L1 e L2 e um limite inferior S, 
* retorne as somas dos elementos que sejam maiores que S.
* Entrada: maiorsoma( [1, 2, 3], [6, 0, 1], 5, L ).
* Saida: L = [7, 8, 9]
*/

maiorsoma([], [], _, []).

maiorsoma([H1|T1], [H2|T2], S, [Soma|L]):-
    Soma is H1 + H2,
    Soma > S,
    !,
    maiorsoma(T1, T2, S, L).

maiorsoma([_|T1], [_|T2], S, L):-
    maiorsoma(T1, T2, S, L).