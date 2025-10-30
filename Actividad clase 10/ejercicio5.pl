% ## 🔹 1. Simplificación simbólicza
% --- Simplificador que acepta términos escritos con +(A,B) y *(A,B) ---

% Variables y atómicos quedan igual
simplifica(T, T) :- var(T), !.
simplifica(T, T) :- atomic(T), !.

% Si es una suma o producto (se descompone con =..), simplificamos recursivamente
simplifica(T, R) :-
    T =.. [Op, A, B],
    (Op == '+' ; Op == '*'), !,
    simplifica(A, A1),
    simplifica(B, B1),
    simplify_op(Op, A1, B1, R).

% Caso por defecto: no sabido cómo simplificar más
simplifica(T, T).

% --- reglas específicas para + ---
simplify_op('+', 0, B, B) :- !.
simplify_op('+', A, 0, A) :- !.
simplify_op('+', A, B, R) :-
    R =.. ['+', A, B].

% --- reglas específicas para * ---
simplify_op('*', 0, _, 0) :- !.
simplify_op('*', _, 0, 0) :- !.
simplify_op('*', 1, B, B) :- !.
simplify_op('*', A, 1, A) :- !.
simplify_op('*', A, B, R) :-
    R =.. ['*', A, B].

% --------------------------Víctor-------------------------------------------------
evalua(X, X, V, V).


evalua(N, _, _, N) :- number(N).


evalua(E1 + E2, X, V, R) :-
    evalua(E1, X, V, R1),
    evalua(E2, X, V, R2),
    R is R1 + R2.


evalua(E1 - E2, X, V, R) :-
    evalua(E1, X, V, R1),
    evalua(E2, X, V, R2),
    R is R1 - R2.


evalua(E1 * E2, X, V, R) :-
    evalua(E1, X, V, R1),
    evalua(E2, X, V, R2),
    R is R1 * R2.


evalua(E1 / E2, X, V, R) :-
    evalua(E1, X, V, R1),
    evalua(E2, X, V, R2),
    R is R1 / R2.


evalua(E1 ** E2, X, V, R) :-
    evalua(E1, X, V, R1),
    evalua(E2, X, V, R2),
    R is R1 ** R2.

%consulta: evalua(x*x + 3*x + 2, x, 3, R).
%R=20
%consulta: evalua(x*x - 4*x + 4, x, 2, R).
%R=0




derivada(C, _, 0) :- number(C).
derivada(X, X, 1).
derivada(Y, _, 0) :- atom(Y).

derivada(E1 + E2, X, D1 + D2) :-
    derivada(E1, X, D1),
    derivada(E2, X, D2).

derivada(E1 - E2, X, D1 - D2) :-
    derivada(E1, X, D1),
    derivada(E2, X, D2).

derivada(E1 * E2, X, D) :-
    derivada(E1, X, D1),
    derivada(E2, X, D2),
    D = D1 * E2 + E1 * D2.

derivada(E1 / E2, X, D) :-
    derivada(E1, X, D1),
    derivada(E2, X, D2),
    D = (D1 * E2 - E1 * D2) / (E2 * E2).

derivada(E1 ** N, X, D) :-
    number(N),
    N1 is N - 1,
    D = N * (E1 ** N1) * 1.

%consulta: derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).
%respuesta: D = 1*x+x*1+(0*x+3*1)+0, R = 7
% -------------------------------------Víctor----------------------------------------------

% ## 🧠 5. Resolución simbólica sencilla

**15.** Resuelva la ecuación:  
% Caso donde la variable aparece primero: X + N = M.
variable_primero(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.
% ```prolog
% ?- resuelve(x + 3 = 7, x, V).
% V = 4.
% ```

**16.** Pruebe el caso donde la variable aparece al final: 
% Caso donde la variable aparece como segundo sumando: N + X = M.
segundo_sumando(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N. 
% ```prolog
% ?- resuelve(5 + x = 10, x, V).
% V = 5.
% ```

**17.** Cree una ecuación nueva y resuélvala simbólicamente (de la forma `x + N = M` o `N + x = M`).
resuelve(Ecuacion, X, V) :-
    (   Ecuacion = (N + X = M)
    ;   Ecuacion = (X + N = M)
    ),
    number(N), number(M),
    V is M - N.
% ```prolog
% ?- resuelve(3 + X = 10, X, V).
% V = 7.

% ?- resuelve(X + 5 = 9, X, V).
% V = 4.
% ```
