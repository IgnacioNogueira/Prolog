% Parcial
/*Diseñar una base de conocimientos en Prolog con 
 * información sobre diferentes libros, incluyendo su título,
autor, género y cantidad de páginas*/

%libro(titulo,autor,género,cant_pág).
libro('Cien años de soledad', 'Gabriel García Márquez', novela, 432).
libro('Cien años de soledad 2', 'Gabriel García Márquez', novela, 434).
libro('Cien años de soledad 3', 'Gabriel García Márquez', novela, 434).

libro('El principito', 'Antoine de Saint-Exupéry', cuento, 96).
libro('1984', 'George Orwell', ciencia_ficción, 328).
libro('El alquimista', 'Paulo Coelho', novela, 208).
libro('Don Quijote de la Mancha', 'Miguel de Cervantes Saavedra', novela, 1040).
libro('La Odisea', 'Homero', poesía, 416).
libro('Harry Potter y la piedra filosofal', 'J.K. Rowling', fantasía, 336).

/*Luego, implementar reglas en Prolog que permitan al usuario
 *  realizar consultas y obtener información sobre
los libros, tales como

i. obtener_libros_autor(Autor, Libros): Obtiene libros escritos por el autor especificado.
ii. obtener_libros_con_casi_mas_largos(Libros): Obtiene libros que tienen tantas páginas como
	el segundo más largo.
*/

%i. obtener_libros_autor(Autor, Libros): Obtiene libros escritos por el autor especificado.


obtener_libros_autor(Autor, Libros):-
			libro(Libros,Autor,_,_).

%ii. obtener_libros_con_casi_mas_largos(Libros): Obtiene libros que tienen tantas páginas como
%	el segundo más largo.

cantidad_paginas_libro(Libros, CantPag) :-
    libro(Libros, _, _, CantPag).


producto_cartesiano(Libro1,Libro2,CantPagL1,CantPagL2):-
    			cantidad_paginas_libro(Libro1,CantPagL1),
        		cantidad_paginas_libro(Libro2,CantPagL2),
    			CantPagL1 < CantPagL2.
    
proy_mayor(X):-
    producto_cartesiano(_,_,X,_).

todos_menos_max_pag(X):-
    proy_mayor(X).

maximo_pag(CantPag):-
    libro(_, _, _, CantPag), \+todos_menos_max_pag(CantPag).


producto_cartesiano2(X,Y):-
    todos_menos_max_pag(X),
    todos_menos_max_pag(Y).
    
seleccion_menor_pag(X,Y):-
    producto_cartesiano2(X,Y),
    X < Y.

proyeccion_men_pag(X):-
    seleccion_menor_pag(X,_).

todos_menosseg_max(X):-
    proyeccion_men_pag(X).

seg_maximo_pag(CantPag):-
    libro(_, _, _, CantPag), 
    \+todos_menosseg_max(CantPag),
    \+maximo_pag(CantPag).


cant_paginas_likelibro_seg_mas_largo(Libros) :-
    libro(Libros, _, _, CantPag),
    seg_maximo_pag(CantPag).
    

