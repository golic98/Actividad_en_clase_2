% Animales domésticos
domestico(perro).
1
domestico(gato).
domestico(conejo).

% Qué come cada uno
come(perro, carne).
come(gato, carne).
come(conejo, zanahoria).
% Regla
comida(X) :- domestico(X), X \= gato.

