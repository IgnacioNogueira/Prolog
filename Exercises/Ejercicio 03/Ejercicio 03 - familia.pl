%Ejercicio 03
%El árbol genealógico siguiente se describe con el programa Prolog:

hombre(pedro).
hombre(manuel).
hombre(arturo).
mujer(maría).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maría).

%A partir de estas afirmaciones, formular las reglas generales de:
/*
niño(X,Y) % expresa que X es hijo o hija de Y.
hijo(X,Y) % expresa que X es un hijo varón de Y.
hija(x,y) % expresa que X es una hija de Y.
hermano-o-hermana(X,Y) % expresa que X es hermano o hermana de Y.
hermano(X,Y) % expresa que X es un hermano de Y.
hermana(X,Y) % expresa que X es una hermana de Y.
*/

%1
niño(X,Y):-padre(Y,X). % expresa que X es hijo o hija de Y.

%2
hijo(X,Y):- niño(X,Y),
    		\+mujer(X). % expresa que X es un hijo varón de Y.
%3

hija(X,Y):-niño(X,Y),
             mujer(X).

hija2(X,Y):-niño(X,Y),
    		\+hombre(X).

%4



hermano-o-hermana(Hermano,Hermana):- padre(Padre,Hermano),
    					             padre(Padre,Hermana),
                                     Hermano \== Hermana.
%5
hermano(X,Y):-padre(Padre,X),
    		  padre(Padre,Y),
    		  hombre(X),
    		  X \== Y.
           
%6
hermana(X,Y):-padre(Padre,X),
    		  padre(Padre,Y),
    		  mujer(X),
    		  X \== Y.