%Ejercicio 05
/*Se dispone de un listado con los resultados de los parciales de los
 *  alumnos del curso de Paradigmas de Programación,
 *  organizado de la siguiente manera:

Versión 1
Se dispone de las notas de ambos parciales para todos los alumnos.
*/

parcial1(ana,7).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).
 
parcial2(ana,9).
parcial2(juan,8).
parcial2(julio, 4).
parcial2(maria, 2).

promedio_notas(N1,N2,NF):- NF is (N1 + N2) / 2.

notas_alumno(ALUM,N1,N2):- parcial1(ALUM,N1),
    				       parcial2(ALUM,N2).

% Se desea obtener:

%   1. a. El listado de los alumnos que promocionan la materia
    				
promocionados(X):-  notas_alumno(X,NOTA1,NOTA2),
    				NOTA1 > 6,
    				NOTA2 > 6.
   

listar_promocionados(X):- promocionados(X), writeln(X),fail. 

%	b. El mismo listado pero esta vez incluyendo la nota final (promedio de los dos parciales) para cada uno 2.

promocionados_nf(ALUMNO,NF):- promocionados(ALUMNO),
    						  notas_alumno(ALUMNO, NOTA1,NOTA2),
                              promedio_notas(NOTA1, NOTA2, NF).
                                      
listar_promocionados_nf :- promocionados_nf(X, NF),
                           write(X),
                           write(' | Nota final: '),
                           writeln(NF),
                           fail.

%	2. El listado de los alumnos que recursan la materia

recursados(X):- notas_alumno(X,N1,N2),
    		    (N1 < 4;
        		 N2 < 4).


%3. El listado de los alumnos que obtendrán la cursada.

alumno(X):-notas_alumno(X,_,_).


obtuvieron_cursada(X):-
    alumno(X),
    \+ promocionados(X),
    \+ recursados(X).


% 4. A fin de entregar
% a medalla al mérito, encontrar de aquellos que promocionan (1b), el o los alumnos con mayor nota final (nombre y nota)
/*
alumnos(A):- parcial1(A,_),
    		 parcial2(A,_). %en este caso se hace intersección porque las letras son iguales



alumnos(A,Ax):-parcial1(A,_),
    		   parcial2(Ax,_). %en este caso se hace prod cartesiano (X), cuando las variables son distintas

alumnos(A,Ax):-parcial1(A,_);
    		   parcial2(Ax,_). %en este caso se hace union (+) cuando las variables son distintas
*/

nota2(Alumno,Nota):-
    parcial1(Alumno,P1),
    parcial2(Alumno,P2),
    Nota is (P1 + P2) /2.

producto_cartesiano(X,Y):-
    nota2(_,X),nota2(_,Y).

seleccion_menor(A,B):- 
    producto_cartesiano(A,B),
    A < B.

proyeccion_men(X):-
    seleccion_menor(X,_).

todos_menos_max(X):-
    proyeccion_men(X).

maximo(Promedio):-
     nota2(_,Promedio),\+todos_menos_max(Promedio).
    

maximo2(Alumno,Promedio):-
     nota2(Alumno,Promedio),\+todos_menos_max(Promedio).
	
seleccion_mayor(A,B):- 
    producto_cartesiano(A,B),
    A > B.


proyeccion_may(X):-
    seleccion_mayor(X,_).

todos_menos_min(X):-
    proyeccion_may(X).

minimo(Promedio):-
      nota2(_,Promedio),\+todos_menos_min(Promedio).

/*5. Ahora se desea obtener cuales fueron las dos notas más altas,
 *  considerando simplemente a la nota como el promedio de la nota de parcial1 y parcial2.
 *  Solo interesan los números. 
 * Un tip es pensar la resolución en dos etapas
 * , la más alta, y después la más alta de lo restante
*/






