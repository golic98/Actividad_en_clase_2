% 12. Sume siguientes fracciones simbolicas

frac(Numerador, Denominador).

suma(frac(A, X), frac(B, Y), frac(N, D)) :-
    N1 is A * Y + B * X,
    D1 is X * Y,
    simplificar(N1, D1, N, D).

simplificar(N1, D1, N, D):-
    Iter is 2,
    maxDivisor(N1, D1, R, Iter),
    N is N1 // R,
    D is D1 // R.

maxDivisor(N, D, N, I).
maxDivisor(N, D, D, I).

maxDivisor(N, D, R, Iterate) :-
    ((N mod Iterate) =:= 0 , (D mod Iterate) =:= 0 ->
        R is Iterate,
        true;
        maxDivisor(N, D, R, Iterate + 1)
    ).
