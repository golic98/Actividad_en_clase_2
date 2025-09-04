% Operadores Aritméticos
% -  Ejercicio 2: Número par o impar - Crear predicado par_impar/1.

par_impar(X) :- 
    integer(X), 
    (0 is X mod 2
    -> write('par')
    ;  write('impar')
    ).
