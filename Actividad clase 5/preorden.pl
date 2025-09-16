% Árbol binario como término:
%arbol(Valor, Izquierdo, Derecho).

% Ejemplo:
arbol(crono,
             arbol(rea,
                   arbol(zeus,arbol(hades,arbol(ares,nil,nil),nil),
                         arbol(poseidon,nil,arbol(hefesto,nil,nil)))),nil).

% verificar si es un arbol

es_arbol(nil).
es_arbol(arbol(_,Izq,Der)) :-
    es_arbol(Izq),
    es_arbol(Der).

      %Recorridos

      % Preorden (Raíz – Izq – Der)
      preorden(nil, []).
      preorden(arbol(X,Izq,Der), L) :-
      preorden(Izq, L1),
      preorden(Der, L2),
      append([X|L1], L2, L).


% busqueda de una arbol
buscar(X, arbol(X,_,_)).
buscar(X, arbol(_,Izq,_)) :- buscar(X,Izq).
buscar(X, arbol(_,_,Der)) :- buscar(X,Der).

%buscar(e, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).

%consulta
?- preorden(arbol(crono,arbol(rea,arbol(zeus,arbol(hades,arbol(ares,nil,nil),nil),arbol(poseidon,nil,arbol(hefesto,nil,nil)))),nil),L).