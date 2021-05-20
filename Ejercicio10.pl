/*
Una empresa de ventas paga a sus empleados un salario fijo de 800 pesos, 
más una comisión de $50 por cada venta realizada, más el 8% sobre el monto 
total de ventas. Escribir la regla de un predicado ternario que vincule la 
cantidad de ventas, con el monto total de ventas y el sueldo del vendedor.
*/
/*
% sueldoVendedor(CantidadVentas, MontoTotalVentas, SueldoVendedor) :-
%     ComisionPorVenta is 50 * CantidadVentas,
%     PorcentajePorVentas is (80 * MontoTotalVentas)/100,
%     SueldoVendedor is 800 + ComisionPorVenta + PorcentajePorVentas.
%      SueldoFijo + Comision por venta + 8% total ventas
% Un poco mas claro
*/

comisionPorVenta(500).
sueldoFijo(8000).
porcentajeDelTotalDeVentas(80).

esSueldoSegun(SueldoVendedor, CantidadVentas, MontoTotalVentas) :- 
    comisionPorVenta(ComisionPorVenta),
    sueldoFijo(SueldoFijo),
    porcentajeDelTotalDeVentas(PorcentajeDelTotalDeVentas),
    SueldoVendedor is 
        SueldoFijo +
        ComisionPorVenta * CantidadVentas +
        (PorcentajeDelTotalDeVentas * MontoTotalVentas) / 100.