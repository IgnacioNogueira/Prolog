transporte(roma,20).
transporte(londres,30).
transporte(tunez,10).

alojamiento(roma,hotel,50).
alojamiento(roma,hostal,30).
alojamiento(roma,camping,10).
alojamiento(londres,hotel,60).
alojamiento(londres,hostal,40).
alojamiento(londres,camping,20).
alojamiento(tunez,hotel,40).
alojamiento(tunez,hostal,20).
alojamiento(tunez,camping,5).

semanas(1).
semanas(2).
semanas(3).

/*Expresar la relación viaje(C,S,H,P) 
que se interpreta por: "el viaje a la ciudad C durante
S semanas con estancia en H cuesta P pesos"*/



viaje(C,S,H,P):-semanas(S),
    			transporte(C,P1),
    			alojamiento(C,H,P2),
    			P is (P1 + P2) * S.

%Completar con 

viajeeconomico(C,S,H,P,Pmax):- semanas(S),
                              transporte(C,P1),
                              alojamiento(C,H,P2),
                              P is (P1 + P2) * S, 
    						  Pmax > P.  					%que expresa que el costo P es menor que Pmax pesos.
    						 
   
