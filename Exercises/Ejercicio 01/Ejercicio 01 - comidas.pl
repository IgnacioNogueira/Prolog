entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

/* 1 ¿Cuáles son los menús que ofrece el restaurante?
¿Cuáles son los menús que tienen Consomé en las entradas?
¿Cuáles son los menús que no contienen flan como postre?*/

/* 1 ¿Cuáles son los menús que ofrece el restaurante? */
platoPrincipal(X):- carne(X);pescado(X).

menuSinEntrada(X,Y):- platoPrincipal(X),
                        postre(Y).

menuCompleto(X,Y,Z):- entrada(X),
    			      platoPrincipal(Y),
    			      postre(Z).
/*
soloEntrada(X,Y,Z):- entrada(X),
                  \+platoPrincipal(Y),
    			  \+postre(Z).
ESTO NO TIENE SENTIDO, YA QUE para buscar los postres, nomás usas: postre(X).

*/

%menuSinPostre(X,Y):- menuCompleto(X,Y,_). %Está mal ya que te ignora los valores y te lista varias veces los mismos platos con entradas
 
%menuSinPostre(X,Y):- menuCompleto(X,Y,Z);
 %   				 \+postre(Z). TAMPOCO ASÍ PORQUE TRAES LOS VALORES Y LUEGO NEGAS

%soloEntrada(X,Y,Z):- entrada(X),
%                   \+ platoPrincipal(Y),
    				

/* 2 ¿Cuáles son los menús que tienen Consomé en las entradas? */
menuConsome(X,Y,Z):- menuCompleto(X,Y,Z),
    			     X == consomé.

menuConsome2(consomé,Y,Z):- platoPrincipal(Y),postre(Z).

menuConsome3(Y,Z):- menuCompleto(consomé,Y,Z).

/* 3 ¿Cuáles son los menús que no contienen flan como postre? */

menu_sin_flan(X,Y,Z):-  menuCompleto(X,Y,Z),
    					Z \== flan.

