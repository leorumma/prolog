/*
*1. Escreva a função retira(ListaInicial, ListaFinal) que recebe uma lista em ListaInicial e retorne em ListaFinal a lista sem repetições 
* dos elementos.
* retira([1, 2, 1, 3, 2, 1, 3, 4], L).
* L = [1, 2, 3, 4]
*/

retira([], []).

retira([H|T], [H|L]):-
    \+ member(H, T),
    !,
    retira(T, L).

retira([_|T], L):-
    retira(T, L).

