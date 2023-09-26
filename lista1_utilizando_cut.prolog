/*
* 1. Dados dois inteiros A e B e uma lista de inteiros Li, retorna uma lista Lf com todos os inteiros X tais que X está na lista Li e A ≤ X ≤ B.
* Entrada: filtrar_listar_por_intervalado(2, 5, [1, 2, 3, 4, 5, 6, 7], Lf).
* Saida: Lf = [2, 3, 4, 5]
*/

entre(A, B, X) :-
    X >= A,
    X =< B.

filtrar_listar_por_intervalado(_, _, [], []).

filtrar_listar_por_intervalado(A, B, [H | T], [H | Lf]) :-
    entre(A, B, H),
    !,
    filtrar_listar_por_intervalado(A, B, T, Lf).

filtrar_listar_por_intervalado(A, B, [_ | T], Lf) :-
    filtrar_listar_por_intervalado(A, B, T, Lf).

/*
*2. Dado um número natural N ≥ 0, retorne o N-ésimo elemento da sequência de Fibonacci.
* Entrada: fibonacci(10, X).
* Saida: X = 55.
*/

fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, X):-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, XN1),
    fibonacci(N2, XN2),
    X is XN1 + XN2.


/*
*3. Apresenta todos os múltiplos de 3 menores ou iguais a um número dado X, onde X é maior ou igual a 0.
* Entrada: multiplo_de_3(10, Multiplos).
* Saida: Multiplos = [9, 6, 3, 0]
*/

multiplo_de_3(0, [0]).

multiplo_de_3(N, [N | Multiplos]) :-
    N > 0,
    Resto is N mod 3,
    Resto == 0,
    !,
    N1 is N - 3,
    multiplo_de_3(N1, Multiplos).

multiplo_de_3(N, Multiplos) :-
    N > 0,
    N1 is N - 1,
    multiplo_de_3(N1, Multiplos).

% Versão com append

multiplo_de_3(0, [0]).

multiplo_de_3(N, Multiplos) :-
    N > 0,
    Resto is N mod 3,
    Resto == 0,
    !,
    N1 is N - 3,
    multiplo_de_3(N1, Multiplos).

multiplo_de_3(N, Multiplos) :-
    N > 0,
    N1 is N - 1,
    multiplo_de_3(N1, Multiplos).


    
/*
*4. Para inserir um número em uma lista ordenada em ordem crescente, utilize um predicado com três argumentos: 
*    o primeiro argumento é o número a ser inserido, o segundo é a lista ordenada e o terceiro é a nova lista obtida.
* Entrada: adicionar_elemento_lista_ordenada(3, [1,2,4,5], ListaOrdenada).
* Saida: ListaOrdenada = [1, 2, 3, 4, 5]
*/

adicionar_elemento_lista_ordenada(N, [], [N]).

adicionar_elemento_lista_ordenada(N, [H|T], [N, H | T]):-
    N =< H,
    !.

adicionar_elemento_lista_ordenada(N, [H|T], [H|ListaResultante]):-
    adicionar_elemento_lista_ordenada(N, T, ListaResultante).


/*
*5. Dadas duas listas ordenadas L1 e L2, retorne a lista L3 que é a união ordenada de L1 e L2.
* 
*
*/

uniao_lista_ordenada(_, [], []).

uniao_lista_ordenada([], _, []).

uniao_lista_ordenada([H1|T1], [H2|T2], [H1|ListaResultante]):- 
    H1 =< H2,
    !,
    uniao_lista_ordenada(T1, [H2|T2], ListaResultante).

uniao_lista_ordenada([H1|T1], [H2|T2], [H2|ListaResultante]):- 
    uniao_lista_ordenada([H1|T1], T2, ListaRestante).


/*
*6. Dadas duas listas, L1 e L2, quero que você retorne a lista L3 que contenha todos os elementos de L1 que não estão em L2.
* Entrada: diferenca_lista([1,2,3,4,5], [1,2], L3).
* Saida: L3 = [3, 4, 5]
*/

diferenca_lista([], _, []).

diferenca_lista([H1|T1], L2, [H1|L3]):- 
    \+ member(H1, L2),
    !,
    diferenca_lista(T1, L2, L3).

diferenca_lista([_|T1], L2, L3):-
    diferenca_lista(T1, L2, L3).


/*
*7. Dadas duas listas, L1 e L2, retorne a lista L3 que é a união de L1 e L2. Certifique-se de que não haja elementos repetidos nesta união.
* Entrada: uniao_sem_repeticao_lista([1,2,3,4,5], [1,2,3,6,7,8], L3).
* Saida: L3 = [4, 5, 1, 2, 3, 6, 7, 8]
*/

uniao_sem_repeticao_lista([], L2, L2).

uniao_sem_repeticao_lista([H1|T1], L2, [H1|L3]):-
    \+ member(H1, L2),
    !,
    uniao_sem_repeticao_lista(T1, L2, L3).

uniao_sem_repeticao_lista([_|T1], L2, L3):-
    uniao_sem_repeticao_lista(T1, L2, L3).

/*
*8. Dadas duas listas L1 e L2, retorne a lista L3 que é a interseção de L1 e L2.
* Entrada: intersecao_lista([1,2,3,4,5], [1,4], L3).
* Saida: L3 = [1, 4]
*/

intersecao_lista([], _, []).

intersecao_lista([H1|T1], L2, [H1|L3]):-
    member(H1, L2),
    !,
    intersecao_lista(T1, L2, L3).

intersecao_lista([_|T1], L2, L3) :-
    intersecao_lista(T1, L2, L3).

/*
*9. Dada uma lista L1, retorne a lista L2 que é igual a L1, mas sem elementos repetidos.
* Entrada: remover_elementos_repetidos([1,1,2,3,4,2,5,6,7,8,4],L2).
* Saida: L2 = [1, 3, 2, 5, 6, 7, 8, 4]
*/

remover_elementos_repetidos([], []).

remover_elementos_repetidos([H1|T1], [H1|L2]):-
    \+ member(H1,T1),
    !,
    remover_elementos_repetidos(T1, L2).

remover_elementos_repetidos([_|T1], L2):-
    remover_elementos_repetidos(T1, L2).


/*
*10. Dada uma lista L, retorne verdadeiro (true) se L estiver ordenada.
* Entrada: is_ordenada([1,2,3,4,5]).
* Saida: true
*/

is_ordenada(L) :-
    is_ordenada_crescente(L),
    !.

is_ordenada(L) :-
    is_ordenada_decrescente(L).

is_ordenada_crescente([]).

is_ordenada_crescente([_]):-
    !.

is_ordenada_crescente([H1, H2|T1]) :-
    H1 =< H2,
    is_ordenada_crescente([H2|T1]).

is_ordenada_decrescente([]).

is_ordenada_decrescente([_]):-
    !.

is_ordenada_decrescente([H1, H2|T1]) :-
    H1 >= H2,
    is_ordenada_decrescente([H2|T1]).