

arbol(
    odin, 
    arbol(
        frigg, 

        arbol(
            thor,
            arbol(
                baldur,
                arbol(
                    magni,
                    nil,
                    nil
                ),
                nil
            ),
            arbol(
                hods,
                arbol(
                    modi,
                    nil,
                    nil
                ),
                nil
            )
        ),
        
        nil
    ),

    nil
).

postorden(nil, []). 

postorden(arbol(X,Izq,Der), L) :-
    postorden(Izq, L1),
    postorden(Der, L2),
    append(L1, L2, L3), %Concatena listas
    append(L3, [X], L).