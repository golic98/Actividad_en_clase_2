estudiante(victor).
estudiante(rene).
estudiante(axel).
estudiante(sebastian).
estudiante(melisa).
estudiante(karla).
estudiante(grecia).

% 1. 
no_es_estudiante(X) :- \+ estudiante(X).

% 2. 
primer_nombre(X) :- estudiante(X), !.

% 3.
mostrar_estudiante :-
    estudiante(Nombre),
    write('Estudiante: '), write(Nombre), nl,
    fail.
mostrar_estudiante.

% 4.

verificar_nombre :-
    write('Ingrese nombre: '), read(Nom),
    (   estudiante(Nom)
    ->  write('Es estudiante '), write(Nom)
    ;   write('No es estudiante '), write(Nom)
    ).
verificar_nombre.