/*
La sucesión de Leonardo de Pisa (Fibonacci) 
Resolver el problema de encontrar el enésimo 
término de la sucesión de Fibonacci.
*/

fibonacci(0, 1).
fibonacci(1, 1).

fibonacci(N, Resultado) :-
    NMenosUno is N - 1,
    NMenosDos is N - 2,
    fibonacci(NMenosUno, ResultadoNMenosUno),
    fibonacci(NMenosDos, ResultadoNMenosDos),
    Resultado is ResultadoNMenosUno + ResultadoNMenosDos.