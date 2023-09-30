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


/*
*4.Faça em prolog uma função paridade que, dada uma lista L e dois inteiros P e I, percorra a lista  uma vez
*  e retorne nas variáveis a quantidade de números pares e ímpares.
* Entrada: paridade([1,2,3,4,5], P, I).
* Saida: I = 3,P = 2
*/

paridade([], 0, 0).

paridade([H|T], P, I):-
    Resto is H mod 2,
    Resto == 0,
    !,
    paridade(T, P1, I),
    P is P1 + 1.

paridade([_|T], P, I):-
    paridade(T, P, I1),
    I is I1 + 1.

