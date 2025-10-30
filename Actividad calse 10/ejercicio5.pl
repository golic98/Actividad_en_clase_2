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