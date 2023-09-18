/* 
1. Dados dois inteiros A e B e uma lista de inteiros Li, retorna uma lista Lf com todos os inteiros X tais que X est ́a na lista Li e A ≤ X ≤ B. Verifica se um número X está entre A e B
 Entrada filtrar_intervalo(2, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], Lf).
 saida Lf = [2, 3, 4, 5, 6, 7, 8, 9]
*/

entre(A, B, X) :-
    X >= A,
    X =< B.

% Filtra os elementos da lista Li que estão entre A e B
filtrar_lista(_, _, [], []).

filtrar_lista(A, B, [H|T], [H|Lf]) :-
    entre(A, B, H),
    filtrar_lista(A, B, T, Lf).

filtrar_lista(A, B, [_|T], Lf) :-
    filtrar_lista(A, B, T, Lf).

/*
2. Dado um número natural N ≥ 0, retorne o N-esimo elemento da sequência de Fibonacci.
*/

fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, Resultado) :- 
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Termo1),
    fibonacci(N2, Termo2),
    Resultado is Termo1 + Termo2.


/*
3. Apresenta todos os m ́ultiplos de 3 menores ou iguais a um dado n ́umero X ≥ 0.
*/

multiplo_de_3(0).

multiplo_de_3(X) :-
    X > 0,
    Resto is X mod 3,
    Resto = 0,
    write(X), nl,
    X1 is X - 1,
    multiplo_de_3(X1).

multiplo_de_3(X) :- 
    X > 0,
    Resto is X mod 3,
    Resto =\= 0,
    X1 is X - 1,
    multiplo_de_3(X1).

% Exemplo de uso:
% Para encontrar todos os múltiplos de 3 menores ou iguais a 20:
% ?- multiplo_de_3(20).

/*
4. Para inserir um dado n ́umero em uma lista ordenada (crescente). Utilize um predicado com trˆes ar-
gumentos: o primeiro  ́e o n ́umero a ser inserido, o segundo a lista ordenada e o terceiro a nova lista obtida.
*/

% Caso base: inserir um número em uma lista vazia resulta na lista contendo apenas esse número.
inserir_ordenado(N, [], [N]).

% Caso 1: Inserir o número no início da lista (se for menor ou igual ao primeiro elemento).
inserir_ordenado(N, [H|T], [N, H|T]) :-
    N =< H.

% Caso 2: O número a ser inserido é maior que o primeiro elemento da lista.
% Recursivamente insira o número na cauda da lista.
inserir_ordenado(N, [H|T], [H|ListaRestante]) :-
    N > H,
    inserir_ordenado(N, T, ListaRestante).



/*
5. Dadas duas listas ordenadas L1 e L2, retorne a lista L3 que  ́e a uni ̃ao ordenada de L1 e L2.

Entrada: ?- uniao_ordenada([1,3,5,7,9], [2,4,6,8,10,11,12,13,14,15], L3).
L1 = [1, 3, 5, 7, 9],
L2 = [2, 4, 6, 8, 10, 11, 12, 13, 14, 15].

Saida:
L3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].

*/

uniao_ordenada([], L2, L2).

uniao_ordenada(L1, [], L1).

uniao_ordenada([H1|T1], [H2|T2], [H1|L3]) :-
    H1 =< H2,
    uniao_ordenada(T1, [H2|T2], L3).

uniao_ordenada([H1|T1], [H2|T2], [H2|L3]) :-
    H1 > H2,
    uniao_ordenada([H1|T1], T2, L3).


/*
6. Dadas duas listas L1 e L2, retorne a lista L3 que cont ́em todos os elementos de L1 que n ̃ao est ̃ao em L2.
*/

% Caso base: se a lista L1 estiver vazia, não há nada a subtrair.
subtract([], _, []).

% Caso em que a cabeça de L1 está em L2, não a incluímos em L3.
subtract([H|T1], L2, L3) :-
    member(H, L2),
    subtract(T1, L2, L3).

% Caso em que a cabeça de L1 não está em L2, a incluímos em L3.
subtract([H|T1], L2, [H|T3]) :-
    \+ member(H, L2),
    subtract(T1, L2, T3).

/*
7.
*/

% Caso base: Se ambas as listas estiverem vazias, a união é uma lista vazia.
union([], [], []).

% Caso em que a primeira lista está vazia, a união é a segunda lista.
union([], L2, L2).

% Caso em que a segunda lista está vazia, a união é a primeira lista.
union(L1, [], L1).

% Caso em que a cabeça da primeira lista já está na segunda lista, removemos a cabeça da primeira lista e continuamos a união.
union([H|T1], L2, L3) :-
    member(H, L2),
    union(T1, L2, L3).

% Caso em que a cabeça da primeira lista não está na segunda lista, incluímos a cabeça em L3 e continuamos a união.
union([H|T1], L2, [H|T3]) :-
    \+ member(H, L2),
    union(T1, L2, T3).

/*
8
*/

intersecao([], _, []).

intersecao([H1|T1], L2, [H1|L3]) :-
    member(H1, L2),
    intersecao(T1, L2, L3).

intersecao([H1|T1], L2, L3) :-
    \+ member(H1, L2),
    intersecao(T1, L2, L3).

/*
9
*/
listaParaConjunto([], []).

listaParaConjunto([H1|T1], L2) :-
    member(H1, T1),
    listaParaConjunto(T1, L2).

listaParaConjunto([H1|T1], [H1|L2]) :-
    \+ member(H1, T1),
    listaParaConjunto(T1, L2).


/*
10
*/

is_ordenada(L) :-
    is_ordenada_crescente(L),
    !.

is_ordenada(L) :-
    is_ordenada_decrescente(L).

is_ordenada_crescente([]).

is_ordenada_crescente([_]).

is_ordenada_crescente([H1, H2|T1]) :-
    H1 =< H2,
    is_ordenada_crescente([H2|T1]).

is_ordenada_decrescente([]).

is_ordenada_decrescente([_]).

is_ordenada_decrescente([H1, H2|T1]) :-
    H1 >= H2,
    is_ordenada_decrescente([H2|T1]).

/*
11
*/

unificavel([], _, []).

unificavel([H|T], Termo, [H|L2]) :-
    \+ H == Termo
    !,
    unificavel(T, Termo, L2).

unificavel([_|T], Termo, L2) :-

    unificavel(T, Termo, L2).
