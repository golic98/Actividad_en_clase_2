% ==========================================
% SISTEMA DE EMPLEADOS EN PROLOG
% ==========================================

:- dynamic empleado/3.

% Base de hechos inicial
empleado('Ana', 'contabilidad', 900).
empleado('Luis', 'sistemas', 1200).
empleado('Sofia', 'marketing', 1100).

% ==========================================
% Predicados principales
% ==========================================

% Mostrar todos los empleados
listar_empleados :-
    writeln('--- LISTA DE EMPLEADOS ---'),
    empleado(Nombre, Depto, Salario),
    format(
            'Nombre: ~w | Depto: ~w | Salario: $~w~n', [Nombre, Depto, Salario]),
    fail.
listar_empleados :-
    writeln('----------------------------').

% Agregar un nuevo empleado
agregar_empleado(Nombre, Depto, Salario) :-
    asserta(empleado(Nombre, Depto, Salario)),
    format('Se agrego a ~w en el departamento ~w con salario $~w.~n', [Nombre, Depto, Salario]),
    !.

% Eliminar un empleado
eliminar_empleado(Nombre) :-
    retract(empleado(Nombre, Depto, Salario)),
    format('Se elimino a ~w del departamento ~w (salario $~w).~n', [Nombre, Depto, Salario]),
    !.
eliminar_empleado(_) :-
    writeln('No se encontro al empleado.').

% Actualizar los datos de un empleado
actualizar_empleado(Nombre, NuevoDepto, NuevoSalario) :-
    retract(empleado(Nombre, _, _)),
    asserta(empleado(Nombre, NuevoDepto, NuevoSalario)),
    format('Datos actualizados: ~w | Depto: ~w | Salario: $~w~n', [Nombre, NuevoDepto, NuevoSalario]),
    !.
actualizar_empleado(_, _, _) :-
    writeln('No se encontro al empleado para actualizar.').

% Agregar con validación
agregar_unico(Nombre, Depto, Salario) :-
    (   empleado(Nombre, _, _)
    ->  format('El empleado ~w ya existe en la base.~n', [Nombre])
    ;   asserta(empleado(Nombre, Depto, Salario)),
        format('Se agrega a ~w en el departamento ~w con salario $~w.~n', [Nombre, Depto, Salario])
    ).

% Eliminar todos los empleados
eliminar_todos :-
    retractall(empleado(_, _, _)),
    writeln('Todos los empleados han sido eliminados.').

% ==========================================
% Menú principal
% ==========================================

menu :-
    writeln('========= MENU ========='),
    writeln('1. Listar empleados'),
    writeln('2. Agregar empleado'),
    writeln('3. Eliminar empleado'),
    writeln('4. Actualizar empleado'),
    writeln('5. Agregar con validacion'),
    writeln('6. Eliminar todos'),
    writeln('0. Salir'),
    writeln('========================'),
    write('Seleccione una opcion: '),
    read(Opcion),
    ejecutar(Opcion).

% ==========================================
% Ejecución de opciones del menú
% ==========================================

ejecutar(1) :-
    listar_empleados, nl, menu.

ejecutar(2) :-
    write('Nombre (entre comillas. Ej: ''Juan''): '), read(Nombre),
    write('Departamento: (entre comillas. Ej: ''contabilidad''): '), read(Depto),
    write('Salario: '), read(Salario),
    agregar_empleado(Nombre, Depto, Salario), nl, menu.

ejecutar(3) :-
    write('Nombre a eliminar (entre comillas. Ej: ''Juan''): '), read(Nombre),
    eliminar_empleado(Nombre), nl, menu.

ejecutar(4) :-
    write('Nombre: (entre comillas. Ej: ''Juan'')'), read(Nombre),
    write('Nuevo departamento: (entre comillas. Ej: ''contabilidad''): '), read(NuevoDepto),
    write('Nuevo salario: '), read(NuevoSalario),
    actualizar_empleado(Nombre, NuevoDepto, NuevoSalario), nl, menu.

ejecutar(5) :-
    write('Nombre: (entre comillas. Ej: ''Juan'')'), read(Nombre),
    write('Departamento: (entre comillas. Ej: ''contabilidad''): '), read(Depto),
    write('Salario: '), read(Salario),
    agregar_unico(Nombre, Depto, Salario), nl, menu.

ejecutar(6) :-
    eliminar_todos, nl, menu.

ejecutar(0) :-
    writeln(' Saliendo...').

ejecutar(_) :-
    writeln(' Opcion no válida.'), nl, menu.

% ==========================================
% Inicio del sistema
% ==========================================

main :-
    writeln('SISTEMA DE EMPLEADOS INICIADO'),
    menu.
