%Una agencia matrimonial de los años
%'80 tiene un fichero de candidatos 
%al matrimonio organizado según las declaraciones siguientes:

%Donde N es el nombre de un hombre o una mujer
%, A su altura (alta, media, baja),
%  C el color de su cabello (rubio, castaño, pelirrojo, negro) 
%  y E su edad (joven,adulta,vieja).

hombre('Daniel Nogueira',alta,gris,vieja).
hombre('Alejandro Cura',media,gris,adulta).
hombre('Pepito Juan',baja,gris,joven).
mujer('Norma Salas',media,pelirrojo,vieja).
mujer('Angelina Jolie',alta,castaño,adulta).
mujer('Angelina Jolie 2',alta,castaño,adulta).
mujer('Angelina Jolie 3',alta,castaño,adulta).
mujer('Pepita Juana',baja,rubio,joven).

% Que indica que a la persona N le gusta
% el género de música M (clásica, pop, jazz),
% el género de literatura L (aventura, ciencia-ficción, policíaca),
% y practica el deporte S (tenis, natación, jogging).

gusta('Daniel Nogueira',jazz, ciencia-ficción,natación).
gusta('Alejandro Cura',pop,aventura,natación).
gusta('Pepito Juan',clásica,ciencia-ficción,tenis).
gusta('Norma Salas',pop,aventura,jogging).
gusta('Angelina Jolie',jazz,ciencia-ficción,natación).
gusta('Angelina Jolie 2',jazz,ciencia-ficción,natación).
gusta('Angelina Jolie 3',jazz,ciencia-ficción,natación).
gusta('Pepita Juana',clásica,policíaca,jogging).
	

%Que expresa que la persona N busca una pareja de altura A
%, con cabello color C y edad E.

busca('Daniel Nogueira',alta,castaño,adulta).
busca('Alejandro Cura',media,pelirrojo,vieja).
busca('Pepito Juan',baja,rubio,joven).
busca('Norma Salas',media,gris,adulta).
busca('Angelina Jolie',alta,gris,vieja).
busca('Pepita Juana',alta,castaño,joven).

%Se considera que dos personas x e y
%de sexos diferentes son adecuadas si x conviene a y e
%y conviene a x.
%
%  Se dice que x conviene a y si x conviene físicamente
% a y (la altura, edad y color de cabello de y son los que busca x)
% y si, además, los gustos de x e y en música, literatura y deporte coinciden.
% si x !busca! a y por físico: descripción de persona
% si x !gusta! mismo que y en gustos

persona(N,A,C,E):-
    hombre(N,A,C,E);
	mujer(N,A,C,E).

matchean_fisicamente_y_algun_gusto(NE,A,C,E,M,L,D):-
				persona(NE,AltE,ColE,EdadE),
    			gusta(NE,ME,LE,DE),
  			    A == AltE, C == ColE, E == EdadE,
        		(M == ME ; L == LE; D == DE).

matchean_todas_cualidades(NE,A,C,E,M,L,D):-
    			persona(NE,AltE,ColE,EdadE),
    			gusta(NE,ME,LE,DE),
  			    A == AltE, C == ColE, E == EdadE,
        		M == ME, L == LE, D == DE.
    				

no_coincidir_sexo(N, NE) :-
  	(hombre(N,_,_,_),mujer(NE,_,_,_));
    (mujer(N,_,_,_),hombre(NE,_,_,_)),
    N \== NE.


encuentra_alguna_relacion(N,NE):-
    		busca(N,AltB,ColB,EdadB),
    	    gusta(N,GenmusG,GenlitG,DeptG),
    		matchean_fisicamente_y_algun_gusto(NE,AltB,ColB,EdadB,GenmusG,GenlitG,DeptG),
    		no_coincidir_sexo(N, NE),
    		N \== NE.
    		
encuentra_alma_gemela(N,NE):-
    		busca(N,AltB,ColB,EdadB),
    	    gusta(N,GenmusG,GenlitG,DeptG),
    		matchean_todas_cualidades(NE,AltB,ColB,EdadB,GenmusG,GenlitG,DeptG),
    		no_coincidir_sexo(N, NE),
    		N \== NE.

%es_un_match(P1,P2):-
