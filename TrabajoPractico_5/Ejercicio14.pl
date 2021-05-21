/*
Una empresa tiene 5 gerentes, 23 empleados administrativos y 7 ordenanzas. 
Preparar un predicado que vincule el sueldo de cada categoría con el total que la 
empresa debe pagar a fin de mes.

*/

sueldo(gerente, 10).
sueldo(empleado, 5).
sueldo(ordenanza, 2).

cantidad(gerentes, 1).
cantidad(empleados, 2).
cantidad(ordenanzas, 5).


esTotalAPagar(X) :-
    sueldo(gerente, SueldoGerente),
    sueldo(empleado, SueldoEmpleado),
    sueldo(ordenanza, SueldoOrdenanza),
    cantidad(gerentes, CantidadGerentes),
    cantidad(empleados, CantidadEmpleados),
    cantidad(ordenanzas, CantidadOrdenanzas),
    X is CantidadGerentes * SueldoGerente +
         CantidadEmpleados * SueldoEmpleado + 
         CantidadOrdenanzas * SueldoOrdenanza.
    