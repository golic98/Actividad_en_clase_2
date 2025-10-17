% Base de conocimientos

trabaja_en(ernesto, maestro).
vive_en(ernesto, valleverde).
casado_con(ernesto, teresa).

trabaja_en(teresa, enfermera).
vive_en(teresa, valleverde).
casado_con(teresa, ernesto).

padre(ernesto, carlos).
madre(teresa, carlos).
hijo(carlos, ernesto).
hijo(carlos, teresa).
padre(ernesto, lucia).
madre(teresa, lucia).
hijo(lucia, ernesto).
hijo(lucia, teresa).
padre(ernesto, lucia).
madre(teresa, lucia).
hijo(lucia, ernesto).
hijo(lucia, teresa).
padre(ernesto, ana).
madre(teresa, ana).
hijo(ana, ernesto).
hijo(ana, teresa).

vive_en(carlos, ciudad).
vive_en(lucia, valleverde).
vive_en(ana, valleverde).

trabaja_en(carlos, ingenierocivil).
casado_con(carlos, sofia).

casado_con(sofia, carlos).
trabaja_en(sofia, arquitecta).
vive_en(sofia, ciudad).

padre(carlos, mateo).
madre(sofia, mateo).
hijo(mateo, carlos).
hijo(mateo, sofia).
padre(carlos, valeria).
madre(sofia, valeria).
hijo(valeria, carlos).
hijo(valeria, sofia).

trabaja_en(mateo, estudiante).
vive_en(mateo, ciudad).
trabaja_en(valeria, estudiante).
vive_en(valeria, ciudad).

trabaja_en(ana, profesoramatematicas).
vive_en(ana, valleverde).
madre(ana, andres).

hijo(andres, ana).
vive_en(andres, valleverde).

trabaja_en(lucia, estudiantemedicina).
vive_en(lucia, capital).
primo(lucia, daniel).
primo(Daniel, lucia).

amigo(carlos, ricardo).
amigo(ricardo, carlos).

vive_en(ricardo, capital).
trabaja_en(ricardo, abogado).
casado_con(ricardo, laura).

casado_con(laura, ricardo).
vive_en(laura, capital).

padre(ricardo, daniel).
madre(laura, daniel).
hijo(daniel, ricardo).
hijo(daniel, laura).
amigo(daniel, mateo).
amigo(mateo, daniel).
vive_en(daniel, capital).

% Reglas prolog

hermano(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y.
hermana(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y.

abuelos(X, Y) :- padre(Z, X), padre(Y, Z).
abuelas(X, Y) :- madre(Z, X), madre(Y, Z).

tio(X, Y) :- hermano(X, Z), padre(Z, Y).
tia(X, Y) :- hermana(X, Z), padre(Z, Y).

primo(X, Y) :- tio(Z, X), padre(Z, Y).
prima(X, Y) :- tia(Z, X), padre(Z, Y).

amigo_de_primo(X, Y) :- primo(Z, X), amigo(Z, Y).

% Consultas

% ¿Quiénes son los hijos de Ernesto?
%?- padre(ernesto, X).

% ¿Quién es abuelo de Mateo?
%?- abuelos(X, mateo).

% ¿Existen dos personas que sean hermanos? (usar ;).
%?- hermano(X, Y); hermana(X, Y).

% Encontrar todas las madres de la base de conocimiento.
%?- madre(X).

% Consultar si Mateo y Daniel son amigoÑs.
%?- amigo(mateo, daniel).


pequena(valeria).

hombre(daniel).
hombre(mateo).
hombre(miguel).
hombre(ernesto).
hombre(felipe).
hombre(juaquin).
hombre(andres).

mujer(valeria).
mujer(laura).
mujer(rosa).
mujer(fernanda).
mujer(teresa).
mujer(isabel).
mujer(carmen).


amigo(valeria, daniel).
amigo(valeria, mateo).
amigo(valeria, laura).
amigo(carmen, teresa).
amigo(isabel, fernanda).

trabaja_en(laura, bibliotecaria).
trabaja_en(miguel, agricultor).
trabaja_en(rosa, administradora).
trabaja_en(carmen, partera).
trabaja_en(felipe, comerciante).

estudian(fernanda, biologia).
estudia(isabel, derecho).

hermano(miguel, ernesto).

casado_con(miguel, rosa).

hijo(fernanda, miguel).
hijo(fernanda, rosa).
hijo(juaquin, felipe).

interesada_en(fernanda, medio_ambiente).

primo(fernanda, andres).
primo(fernanda, mateo).
primo(fernanda, valeria).

jubilada(carmen).

nieta(isabel, carmen).

socio(felipe, miguel).

vive_en(felipe, ciudad).
vive_en(carmen, valle_verde).
vive_en(miguel, valle_verde).
vive_en(rosa, valle_verde).

companero(juaquin, andres).

participa_en(juaquin, banda).
participa_en(andres, banda).

amigo(X, Y) :-
    amigo(Y, X).

hermano(X, Y) :-
    hermano(Y, X).

casado_con(X, Y) :- 
    casado_con(Y, X).

amigo(X, Y) :-
    amigo(Y, X)

padre(Padre, Hijo) :-
    hijo(Hijo, Padre),
    hombre(Padre).

madre(Madre, Hijo) :-
    hijo(Hijo, Madre),
    mujer(Madre).

primo(X, Y) :-
    primo(Y, X).

abuela(Abuela, Nieta) :-
    nieta(Nieta, Abuela).

socio(X, Y) :-
    socio(Y, X).

companero(X, Y) :-
    companero(Y, X).