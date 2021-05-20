/*
Un millonario excéntrico tenía tres hijos Carlos, José y Marta. Al morir dejó el siguiente legado: 
"A José le dejó 4/3 de lo que le dejó a Carlos; a Carlos le dejó 1/3 de mi fortuna y a Marta le dejó 
la mitad de lo que le dejó a José". Preparar un predicado que vincule la suma a repartir con lo que 
le toca a cada uno.

*/

seDivideEn(MontoTotal, Carlos, Jose, Marta) :-
    Carlos is MontoTotal / 3,
    Jose is (Carlos * 4) / 3,
    Marta is Jose / 2.