## 🔹 1. Simplificación simbólicza

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



## 🧠 5. Resolución simbólica sencilla

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