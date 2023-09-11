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

