% Ejercicio 7: Unificación de estructuras - Crear predicado es_hermano/2.
% Regla: Estructura familiar
persona(Hijo, padres(P, M)) :-
    padre(P, Hijo),
    madre(M, Hijo).

% es_hermano/2: son hermanos si tienen los mismos padres
es_hermano(X, Y) :-
    persona(X, padres(P, M)),
    persona(Y, padres(P, M)),
    X \= Y.

% Demostración con write/1
demos_hermanos :-
    (es_hermano(ana, pedro) ->
        write('Ana y Pedro son hermanos.'), nl ; 
        write('Ana y Pedro NO son hermanos.'), nl),
    (es_hermano(maria, ana) ->
        write('Maria y Ana son hermanos.'), nl ; 
        write('Maria y Ana NO son hermanos.'), nl),
    (es_hermano(carlos, maria) ->
        write('Carlos y Maria son hermanas.'), nl ; 
        write('Carlos y Maria NO son hermanas.'), nl).
