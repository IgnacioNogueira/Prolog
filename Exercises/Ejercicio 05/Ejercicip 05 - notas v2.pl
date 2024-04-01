parcial1(ana,7).
parcial1(test,-5).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).

parcial2(ana,9).
parcial2(test,-5).
parcial2(juan,8).
parcial2(julio, 4).
parcial2(maria, 2).

/*
 * Se desea obtener: 1.

El listado de los alumnos que promocionan la materia
El mismo listado pero esta vez incluyendo la nota final (promedio de los dos parciales) para cada uno
El listado de los alumnos que recursan la materia.
El listado de los alumnos que obtendrán la cursada.

A fin de entregar la medalla al mérito, encontrar de aquellos que promocionan (1b),
el o los alumnos con mayor nota final (nombre y nota)
Ahora se desea obtener cuales fueron las dos notas más altas, considerando simplemente a la nota 
como el promedio de la nota de parcial1 y parcial2. Solo interesan los números. Un tip es pensar 
la resolución en dos etapas, la más alta, y después la más alta de lo restante
*/

%El listado de los alumnos que promocionan la materia

alumnos_promocionados1(ALUMNO):- parcial1(ALUMNO,NOTA1), 
    				            parcial2(ALUMNO,NOTA2),
    							NOTA1 >= 7,
    							NOTA2 >= 7.


alumnos_promocionados(ALUMNO,NF):- parcial1(ALUMNO,NOTA1), 
    				               parcial2(ALUMNO,NOTA2),
    							   NF is (NOTA1 + NOTA2)/2,
    							   NF >= 7.

listar_alumnos_prom(ALUMNO):- alumnos_promocionados(ALUMNO,_),writeln(ALUMNO),false.


%El listado de los alumnos que recursan la materia.

alumnos_recursados(ALUMNO,NF):- parcial1(ALUMNO,NOTA1), 
    				            parcial2(ALUMNO,NOTA2),
    							NF is (NOTA1 + NOTA2)/2,
    						    (NF >= 1, NF < 4).

%El listado de los alumnos que obtendrán la cursada.
obtuvieron_cursada(ALUMNO,NF):- parcial1(ALUMNO,NOTA1), 
    				            parcial2(ALUMNO,NOTA2),
    					        NF is (NOTA1 + NOTA2)/2,
    						    (NF > 3,NF < 7).
    						


/*A fin de entregar la medalla al mérito, encontrar de aquellos que promocionan (1b),
el o los alumnos con mayor nota final (nombre y nota)*/

%acá si se obtiene el máximo

% prod cartesiano
% seleccion menor
% proy menor
% todos menos max
% func

producto_cartesiano(NF1,NF2):-
           alumnos_promocionados(_,NF1),
           alumnos_promocionados(_,NF2).

seleccion_menor(NF1,NF2):-
    producto_cartesiano(NF1,NF2),
    NF1 < NF2.

proyeccion_menor(NF1):-
    seleccion_menor(NF1,_).

todos_menos_max(NF):-
    		proyeccion_menor(NF).

alumnos_mayor_nota(ALUMNO,NOTA):- alumnos_promocionados(ALUMNO,NOTA),
    							  \+todos_menos_max(NOTA).

