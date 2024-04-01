%Ejercicio 03
%El árbol genealógico siguiente se describe con el programa Prolog:

hombre(ignacio).
hombre(daniel).
hombre(carlos).
hombre(carloshijo).
hombre(julian).
hombre(dante).
hombre(damian).
hombre(claudio).
hombre(jose).
hombre(blas).
hombre(flaco).


mujer(maria_angelica).
mujer(norma).
mujer(corona).
mujer(maribel).
mujer(evangelina).
mujer(uma).
mujer(susana).
mujer(ernestina).

padre(jose,flaco).
padre(daniel,ignacio).
padre(carlos, daniel).
padre(carlos, carloshijo).
padre(jose, norma).
padre(blas, susana).
padre(claudio, damian).
padre(claudio, julian).
padre(claudio, evangelina).
padre(damian, uma).
padre(julian, dante).

madre(corona,flaco).
madre(maria_angelica,daniel).
madre(norma,ignacio).
madre(norma,maribel).
madre(corona,norma).
madre(susana, evangelina).
madre(susana, julian).
madre(susana, damian).
madre(ernestina, susana).

%A partir de estas afirmaciones, formular las reglas generales de:
/*
niño(X,Y) % expresa que X es hijo o hija de Y.
hijo(X,Y) % expresa que X es un hijo varón de Y.
hija(x,y) % expresa que X es una hija de Y.
hermano-o-hermana(X,Y) % expresa que X es hermano o hermana de Y.
hermano(X,Y) % expresa que X es un hermano de Y.
hermana(X,Y) % expresa que X es una hermana de Y.
tio %hermano de mi padre/madre
tia %hermana de mi padre/madre
abuelo %padre de mi padre/madre
abuela $madre de mi padre/madre
primo_directo %hijo/hija de mi tio
primo_lejano %hijo del primo directo de mi padre
prima_directo
prima_lejano
padrastro %pareja de mi padre/madre hombre
madrastra %pareja de mi padre/madre mujer
consuegra %
consuegro
suegra %madre de mi pareja
suegro %padre de mi pareja
*/

padres(PROGENITOR,HIJO):-padre(PROGENITOR,HIJO);
    					 madre(PROGENITOR,HIJO).

%1
niño(HIJO,PROGENITOR):-padres(PROGENITOR,HIJO).

%2
hijo(PROGENITOR,HIJO):- niño(HIJO,PROGENITOR),
    				    \+mujer(HIJO).
%3

hija(PROGENITOR,HIJO):- niño(HIJO,PROGENITOR),
    				    \+hombre(HIJO).


%4
hermano-o-hermana(Hermano,Hermana):- padres(Padre,Hermano),
    					             padres(Padre,Hermana),
                                     Hermano \== Hermana.
%5
%6
hermano(X, Y) :-
    padre(Padre, X),
    padre(Padre, Y),
    hombre(Y),
    X \== Y.

/*
medio_hermano(X, Y):-
                    (padre(Padre, X),
                     padre(Padre, Y));
    				(madre(Madre, X),
                     madre(Madre, Y)),
   					hombre(Y),
   					X \== Y.
  */

%6
hermana(X, Y) :-
    padre(Padre, X),
    padre(Padre, Y),
    mujer(Y),
    X \== Y.



tio(X,Y):-(padre(MI_PADRE,X),
    	  hermano(MI_PADRE,Y));
    	  (madre(MI_MADRE,X),
           hermano(MI_MADRE,Y)).

tia(X,Y):-(padre(MI_PADRE,X),
    	  hermana(MI_PADRE,Y));
    	  (madre(MI_MADRE,X),
           hermana(MI_MADRE,Y)).


%padre de mi papá o mi mamá
abuelo(NIETO,ABUELO):-(padre(MI_PADRE,NIETO),
    				  padre(ABUELO,MI_PADRE));
   					  (madre(MI_MADRE,NIETO),
    				  padre(ABUELO,MI_MADRE)).
 
%madre de mi papá o mi mamá
abuela(NIETO,ABUELA):-(padre(MI_PADRE,NIETO),
    				  madre(ABUELA,MI_PADRE));
   					  (madre(MI_MADRE,NIETO),
    				  madre(ABUELA,MI_MADRE)).

%PRIMO 1: SOY YO
primo_directo(PRIMO1,PRIMO2):-(tio(PRIMO1,PADRE_PRIMO),
    						  padre(PADRE_PRIMO,PRIMO2));
    				          (tia(PRIMO1,MADRE_PRIMO),
    						  madre(MADRE_PRIMO,PRIMO2)).


pareja(X,Y):-padre(X,HIJO),
    		 madre(Y,HIJO). %arreglar

%%consuegra(PADRES,MADRE):-madre(MADRE,
