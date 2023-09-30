/*
*1. Escreva um programa Prolog que dada uma lista de números inteiros L1, 
* retorna o valor obtido pela soma dos elementos ímpares menos a soma dos elementos pares.
* O programa deve percorrer a lista L1 uma única vez. Exemplo: a consulta: “?- resposta( [5, 3, 2, 4], X ).” é “X = 2”.
* Entrada: subtrair_elementos_pela_paridade([5, 3, 2, 4], X).
* Saida: X = 2
*/

% Forma 1
subtrair_elementos_pela_paridade(L, X):-
    somar(L, SomaPar, SomaImpar),
    X is SomaImpar - SomaPar.

somar([], 0, 0).

somar([H|T], SomaPar1, SomaImpar):-
    Resto is H mod 2,
    Resto == 0,
    !,
    somar(T, SomaPar, SomaImpar),
    SomaPar1 is SomaPar + H.

somar([H|T], SomaPar, SomaImpar1):-
    somar(T, SomaPar, SomaImpar),
    SomaImpar1 is SomaImpar + H.

%Forma 2
resposta([], 0).
resposta([X|T], S):- 
    Y is X mod 2, 
    Y > 0, 
    !,
    resposta( T, Z ),
    S is Z + X.

resposta([X|T], S):- 
    resposta(T, Z), 
	S is Z - X.


/*
*2. Defina o predicado maiorsoma( L1, L2, S, L3 ) que recebe como entrada as listas de números L1 e L2 e um limite S, 
* e retorna a lista L3 formada por valores maiores que S obtidos pela soma de um elemento X de L1 com um elemento Y de L2.
*/
