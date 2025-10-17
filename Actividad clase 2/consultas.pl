% 1. Identificar sospechosos
sospechoso(X) :- persona(X).

% 2. Analizar motivos
tiene_motivo(X) :- motivo(X, _).

% 3. Verificar oportunidad
quien_estuvo(X) :- estuvo(X, biblioteca).

% 4. Cruzar información
posible_asesino(X) :- tiene_motivo(X), quien_estuvo(X).

% 5. Analizar el arma
analizar(X) :- acceso(X, cuerda).

% 6. Descubrir al culpable
asesino(X) :- tiene_motivo(X), quien_estuvo(X), analizar(X).