/*Ejercicio 02
 * 
 * Completar el programa "menú" de manera que una comida esté
 *  formada también por la elección de una bebida, 
 * a elegir entre vino, cerveza o agua mineral.
 * 
 */

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

bebida(vino).
bebida(cerveza).
bebida(agua_mineral).


platoPrincipal(X):- carne(X);pescado(X).

menuSinEntrada(X,Y):- platoPrincipal(X),
                        postre(Y).

menu_con_bebida(X,Y,Z,W):- 
                      entrada(X),
    			      platoPrincipal(Y),
    			      postre(Z),
    				  bebida(W).

