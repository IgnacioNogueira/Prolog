%Ejercicio 11: Recursividad

%Codifique en prolog las reglas necesarias para obtener el término N en la serie de Gauss

serie_gauss(1,1).
serie_gauss(N,R):-
    N > 1,
    N1 is N - 1,
    serie_gauss(N1,SUMA_ANT),
    R is (SUMA_ANT + N).


%Codifique en prolog las reglas necesarias para obtener el término N en la serie de Fibonacci (sin, y con mejora)

fibonacci_s(0,0).
fibonacci_s(1,1).
fibonacci_s(N,R):-
N > 1,
NA is N - 1,
NAA is N - 2,
fibonacci_s(NA,RA),
fibonacci_s(NAA,RAA),
R is RA + RAA. 

fibonacci_m(0,0,0).
fibonacci_m(1,1,0).
fibonacci_m(N,R,RA):-
    N > 1,
    NA is N - 1,
    fibonacci_m(NA, RA, RAA),
    R is RA + RAA.

fibonacci(N,R):-
    fibonacci_m(N,R,_).

%Codifique en prolog las reglas necesarias para obtener el factorial de un número natural N.

factorial(0,1).
factorial(N,R):-
    N > 0,
    N1 is N - 1,
    factorial(N1,RA),
    R is N * RA.

%Codifique en prolog las reglas necesarias para obtener el producto de dos numeros X e Y, aplicando sumas sucesivas.
prod_nros_sumas_sucesivas(0,_,0).
prod_nros_sumas_sucesivas(_,0,0). 
prod_nros_sumas_sucesivas(N1,N2,R):-
    N1 > 0,
    N2 > 0,
    X1 is N1 - 1,
    prod_nros_sumas_sucesivas(X1,N2,RA),
    R is RA + N2.

%Codifique en prolog las reglas necesarias para obtener la potencia N de un numero X aplicando multiplicaciones sucesivas.
potencia_nros_mult_sucesivas(_,0,1).
potencia_nros_mult_sucesivas(N,P,R):-
    N > 0,
    P1 is P - 1,
    potencia_nros_mult_sucesivas(N,P1,RA),
    R is N * RA.

%Idem 6, pero que permita obtener el cociente y el resto. 
%Definir la relación mcd(X,Y,Z) que se verifique si Z es el máximo común divisor entre X e Y. Por ejemplo:


mcd(X, 0, X) :- !. % El máximo común divisor entre X y 0 es X.
mcd(0, Y, Y) :- !. % El máximo común divisor entre 0 e Y es Y.
mcd(X, Y, Z) :- X >= Y, X1 is X mod Y, mcd(Y, X1, Z).
mcd(X, Y, Z) :- X < Y, Y1 is Y mod X, mcd(X, Y1, Z).
    

%Define un predicado mcm(X,Y,M) que signifique "M es el mínimo común múltiplo de X e Y"
mcm(X, Y, M) :-
    mcd(X, Y, GCD),
    M is (X * Y) // GCD.





